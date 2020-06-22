<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style/tabs.css" rel="stylesheet" />
    <link href="style/tabstyles.css" rel="stylesheet" />
    <link href="style/StyleSheet.css" rel="stylesheet" />
    <script src="jsScript/jquery-1.12.0.min.js"></script>
    <script src="jsScript/JavaScript.js"></script>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" EnablePageMethods="true" />
        <div>
            <div class="tabs tabs-style-shape">
                <svg class="hidden" style="height: 0px">
                    <defs>
                        <path id="tabshape" d="M80,60C34,53.5,64.417,0,0,0v60H80z" />
                    </defs>
                </svg>
                <nav>
                    <ul>
                        <li class="notthistab"><a href="Default.aspx">
                            <svg viewBox="0 0 80 60" preserveAspectRatio="none">
                                <use xlink:href="#tabshape"></use></svg>
                            <span>המשחקים שלי</span>
                        </a></li>
                        <li class="notthistab">
                            <a href="newGame.aspx">
                                <svg viewBox="0 0 80 60" preserveAspectRatio="none">
                                    <use xlink:href="#tabshape"></use></svg>
                                <svg viewBox="0 0 80 60" preserveAspectRatio="none">
                                    <use xlink:href="#tabshape"></use></svg>
                                <span>יצירת משחק חדש</span>
                            </a>
                        </li>

                        <li class="thistab"><a>
                            <svg viewBox="0 0 80 60" preserveAspectRatio="none">
                                <use xlink:href="#tabshape"></use></svg>
                            <svg viewBox="0 0 80 60" preserveAspectRatio="none">
                                <use xlink:href="#tabshape"></use></svg>
                            <span>
                                <asp:Label ID="GameSubjectLbl" runat="server" Text="Label"></asp:Label></span>
                        </a></li>
                    </ul>
                </nav>

            </div>
            <div id="maingamepage">
                <section id="topeditsec">
                    <asp:TextBox ID="GameSubjectTB" runat="server"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
                    <asp:RadioButtonList ID="RadioButtonListtime" runat="server" RepeatDirection="Horizontal" Width="320px" AutoPostBack="True" OnDataBound="RadioButtonListtime_CheckedChanged" OnSelectedIndexChanged="RadioButtonListtime_CheckedChanged">
                        <asp:ListItem Value="unlimited">ללא הגבלה</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Selected="True" Value="30">30</asp:ListItem>
                        <asp:ListItem Value="60">60</asp:ListItem>
                        <asp:ListItem Value="90">90</asp:ListItem>
                    </asp:RadioButtonList>
                </section>

                <section id="manineditsec">
                    <asp:Button ID="Button5" runat="server" Text="שאלה חדשה" OnClick="Button5_Click" AutoPostBack="True" />
                    <asp:GridView ID="GridView1edit" class="Gridviewedit" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource2" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="שאלה">
                                <ItemTemplate>
                                    <asp:Button CommandName="editRow" ID="GameSubjectLbl5" class="qbutton" runat="server" Text='<%#Server.UrlDecode(XPathBinder.Eval(Container.DataItem, "questionText").ToString())%>' theItemId='<%#XPathBinder.Eval(Container.DataItem,"@id").ToString()%>'></asp:Button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="מחיקה">
                                <ItemTemplate>
                                    <input id="Button1" type="button" class="delebtnmain" onclick="showmodel(this)" />
                                    <div id="id01" onclick="document.getElementById('id01').style.display='none'">
                                        <div class="modal">
                                                <div class="container">
                                                    <h1>האם ברצונך למחוק את השאלה? <span id="gamename"></span>?</h1>
                                                    <p>לא קיימת אפשרות לביטול מחיקת המשחק</p>

                                                    <div class="clearfix">
                                                        <asp:Button ID="deleteIMG" runat="server" class="deletebtn" Text="מחק" CommandName="deleteRow" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@id").ToString()%>'></asp:Button>
                                                        <button type="button" onclick="hidemodel(this)" class="cancelbtn">אל תמחק את המשחק</button>
                                                    </div>
                                                </div> 
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/tree/game.xml" XPath="/RootTree/game[@GameCode=]//question"></asp:XmlDataSource>
                    <section id="editqsec" class="Gridviewedit">
                        <div>
                            <asp:TextBox ID="mainqtb" runat="server" TextMode="MultiLine" Width="78%" Height="54px"></asp:TextBox>
                            <asp:FileUpload ID="FileUpload1" Class="FileUploadgrid" runat="server" />
                            <asp:ImageButton ID="ImageforUpload1" runat="server" ImageUrl="~/Images/ImagePlaceholder.png" OnClientClick="openFileUploader1(); return false;" />
                            <input id="IButton1" class="notdel" type="button" value="X" onclick="return false;"/>                                    
                            <asp:HiddenField ID="hdnfldVariable1" runat="server" />
                        </div>
                        <asp:Table ID="Table1" runat="server">
                            <asp:TableRow>
                                <asp:TableHeaderCell>דור</asp:TableHeaderCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:CheckBox ID="ACheckBox1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="ATextBox1" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    או
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:FileUpload ID="FileUpload2" Class="FileUploadgrid" runat="server" />
                                    <asp:ImageButton ID="ImageforUpload2" Class="ImageButtongrid" runat="server" ImageUrl="~/Images/ImagePlaceholder.png" OnClientClick="openFileUploader2(); return false;" />
                                    <input id="IButton2" class="del" type="button" value="X" onclick="return false;"/>                                    
                                    <asp:HiddenField ID="hdnfldVariable2" runat="server" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:CheckBox ID="ACheckBox2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="ATextBox2" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                                                <asp:TableCell>
                                    או
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:FileUpload ID="FileUpload3" Class="FileUploadgrid" runat="server" />
                                    <asp:ImageButton ID="ImageforUpload3" Class="ImageButtongrid" runat="server" ImageUrl="~/Images/ImagePlaceholder.png" OnClientClick="openFileUploader3(); return false;" />
                                    <input id="IButton3" class="del" type="button" value="X" onclick="return false;"/>                                    
                                    <asp:HiddenField ID="hdnfldVariable3" runat="server" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:CheckBox ID="ACheckBox3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="ATextBox3" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                                                <asp:TableCell>
                                    או
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:FileUpload ID="FileUpload4" Class="FileUploadgrid" runat="server" />
                                    <asp:ImageButton ID="ImageforUpload4" Class="ImageButtongrid" runat="server" ImageUrl="~/Images/ImagePlaceholder.png" OnClientClick="openFileUploader4(); return false;" />
                                    <input id="IButton4" class="del" type="button" value="X" onclick="return false;"/>                                    
                                    <asp:HiddenField ID="hdnfldVariable4" runat="server" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:CheckBox ID="ACheckBox4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="ATextBox4" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                                                <asp:TableCell>
                                    או
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:FileUpload ID="FileUpload5" Class="FileUploadgrid" runat="server" />
                                    <asp:ImageButton ID="ImageforUpload5" Class="ImageButtongrid" runat="server" ImageUrl="~/Images/ImagePlaceholder.png" OnClientClick="openFileUploader5(); return false;" />
                                    <input id="IButton5" class="del" type="button" value="X" onclick="return false;"/>                                    
                                    <asp:HiddenField ID="hdnfldVariable5" runat="server" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:CheckBox ID="ACheckBox5" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="ATextBox5" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                                                <asp:TableCell>
                                    או
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:FileUpload ID="FileUpload6" Class="FileUploadgrid" runat="server" />
                                    <asp:ImageButton ID="ImageforUpload6" Class="ImageButtongrid" runat="server" ImageUrl="~/Images/ImagePlaceholder.png" OnClientClick="openFileUploader6(); return false;" />
                                    <input id="IButton6" class="del" type="button" value="X" onclick="return false;"/>
                                    <asp:HiddenField ID="hdnfldVariable6" runat="server" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:CheckBox ID="ACheckBox6" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="ATextBox6" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                                                <asp:TableCell>
                                    או
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:FileUpload ID="FileUpload7" Class="FileUploadgrid" runat="server" />
                                    <asp:ImageButton ID="ImageforUpload7" Class="ImageButtongrid" runat="server" ImageUrl="~/Images/ImagePlaceholder.png" OnClientClick="openFileUploader7(); return false;" />
                                    <input id="IButton7" class="del" type="button" value="X" onclick="return false;"/>
                                    <asp:HiddenField ID="hdnfldVariable7" runat="server" />
                                 </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:CheckBox ID="ACheckBox7" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="ATextBox7" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                                                <asp:TableCell>
                                    או
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:FileUpload ID="FileUpload8" Class="FileUploadgrid" runat="server" />
                                    <asp:ImageButton ID="ImageforUpload8" Class="ImageButtongrid" runat="server" ImageUrl="~/Images/ImagePlaceholder.png" OnClientClick="openFileUploader8(); return false;" />
                                    <input id="IButton8" class="del" type="button" value="X" onclick="return false;"/>                                    
                                    <asp:HiddenField ID="hdnfldVariable8" runat="server" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <asp:Button ID="Button3" runat="server" Text="הוספה למאגר השאלות" OnClick="Button3_Click" />
                    </section>
                    <asp:Button ID="Button4" runat="server" Text="סיים עריכה" OnClick="Button4_Click" />
                </section>
            </div>
            <%--</div>--%>
            <div id="nonvisibleforbtn">
            </div>
    </form>
</body>
</html>
