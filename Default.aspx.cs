using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        XmlDocument xmlDoc = XmlDataSource1.GetXmlDocument(); //טעינת הקובץ אקסמל בצורה חדשה כדי לראות את הסורס. 

        //--הקפצה של ה- ID--//
        int myId = Convert.ToInt16(xmlDoc.SelectSingleNode("//idCounter").InnerXml);
        myId++;
        string myNewId = myId.ToString(); //אם אני רוצה ליצור קוד של 106, נוסיף את 10 ידנית ואז את שם המשתנה
        xmlDoc.SelectSingleNode("//idCounter").InnerText = myNewId;

        // יצירת ענף משחק     
        XmlElement myNewStudentNode = xmlDoc.CreateElement("game");
        myNewStudentNode.SetAttribute("GameCode", myNewId);
        myNewStudentNode.SetAttribute("timePerQuest", "30");
        myNewStudentNode.SetAttribute("isPublish", "false");
        myNewStudentNode.SetAttribute("protected", "false");

        // יצירת ענף שם הסטודנט
        // במשחק שלנו לא להוסיף תוכן אלא רקליצור את התשתית עצמה
        XmlElement myNewNameNode = xmlDoc.CreateElement("GameSubject");
        //הוספת טקסט עם יכולת קידוד
        myNewNameNode.InnerXml = Server.UrlEncode(addNameTB.Text);        //לא להוסיף את זה בהתחלה
        myNewStudentNode.AppendChild(myNewNameNode);

        // יצירת ענף ציונים ללא הציונים עצמם
        XmlElement myGradesNode = xmlDoc.CreateElement("questions");
        myGradesNode.SetAttribute("Quantity", "0");
        myNewStudentNode.AppendChild(myGradesNode);

        // הוספת ענף התלמיד לעץ כתלמיד הראשון
        XmlNode FirstStudent = xmlDoc.SelectNodes("/RootTree/game").Item(0);
        xmlDoc.SelectSingleNode("/RootTree").InsertBefore(myNewStudentNode, FirstStudent);
        XmlDataSource1.Save();
        GridView1.DataBind();

        // ניקוי תיבת הטקסט
        addNameTB.Text = "";
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string theId = "000";
        if (e.CommandSource is ImageButton)
        {
            // תחילה אנו מבררים מהו ה -אי די- של הפריט בעץ ה אקס אם אל
            ImageButton i = (ImageButton)e.CommandSource; //הכנסת האימג' בטון לתוך משתנה ובירור על מי לחצנו
            theId = i.Attributes["theItemId"];
        }
        if (e.CommandSource is Button)
        {
            Button i = (Button)e.CommandSource;
            theId = i.Attributes["theItemId"];
        }

        Session["gameIDSession"] = theId;
        // עלינו לברר איזו פקודה צריכה להתבצע - הפקודה רשומה בכל כפתור             
        switch (e.CommandName)
        {
            //אם נלחץ על כפתור מחיקה יקרא לפונקציה של מחיקה                    
            case "deleteRow":
                deleteRow();
                break;
            
            case "viewRow":
                Response.Redirect("view.aspx");
                break;

            //אם נלחץ על כפתור עריכה (העפרון) נעבור לדף עריכה                    
            case "editRow":
                Response.Redirect("Edit.aspx");
                break;
        }
    }

    protected void deleteRow()
    {
        //הסרת ענף של משחק קיים באמצעות זיהוי האיי דיי שניתן לו על ידי לחיצה עליו מתוך הטבלה
        //שמירה ועדכון לתוך העץ ולגריד ויו
        //במחיקה לא נוגעים באיי די קאונטר כדי שלא ייוצר כפילות 
        string gameIdToDelete = Session["gameIDSession"].ToString();

        //לקיחת הקובץ 
        XmlDocument Document = XmlDataSource1.GetXmlDocument();

        //בדיקה אם הענף מוגן
            XmlNode node = Document.SelectSingleNode("/RootTree/game[@GameCode='" + gameIdToDelete + "']");
            //פקודת המחיקה
            node.ParentNode.RemoveChild(node);
            //שמירה
            XmlDataSource1.Save();
            GridView1.DataBind();

    }

    protected void isPublish_CheckedChanged(object sender, EventArgs e)
    {
        //בדיקה האם הסטודנט עבר או לא/ המשחק פורסם או לא. 
        //לוקח את הערך העדכני של מה שיש בגריד. אם זה לא מסומן אז הוא פולס ואם לוחצים עליו ניתן לראות בעץ שהערך ישתנה לטרו
        //אם הערך מסומן ואני לוחצת כדי לבטל את הסימון אנצ'קט אז הערך העץ ישתנה לפולס
        // טעינה של העץ
        XmlDocument xmlDoc = XmlDataSource1.GetXmlDocument();

        // תחילה אנו מבררים מהו ה -אי די- של הפריט בעץ ה אקס אם אל
        CheckBox myCheckBox = (CheckBox)sender;

        // מושכים את האי די של הפריט באמצעות המאפיין שהוספנו באופן ידני לתיבה
        string theId = myCheckBox.Attributes["theItemId"];

        //שאילתא למציאת הסטודנט שברצוננו לעדכן
        XmlNode theStudents = xmlDoc.SelectSingleNode("/RootTree/game[@GameCode='" + theId + "']");

        //קבלת הערך החדש של התיבה לאחר הלחיצה
        bool NewIsPass = myCheckBox.Checked;

        //עדכון של המאפיין בעץ
        theStudents.Attributes["isPublish"].InnerText = NewIsPass.ToString();

        //שמירה בעץ והצגה
        XmlDataSource1.Save();
        GridView1.DataBind();

    }
}