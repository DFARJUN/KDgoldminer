<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jsScript/JavaScript.js"></script>
    <link href="style/StyleSheet.css" rel="stylesheet" />
    <link href="style/tabs.css" rel="stylesheet" />
    <link href="style/tabstyles.css" rel="stylesheet" />
</head>
<body dir="rtl">
    <form id="form1" runat="server">
        <div>

            <div class="tabs tabs-style-shape">
                <svg class="hidden" style="height: 0px">
                    <defs>
                        <path id="tabshape" d="M80,60C34,53.5,64.417,0,0,0v60H80z" />
                    </defs>
                </svg>
                <nav>
                    <ul>
                        <li class="thistab"><a>
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
                    </ul>
                </nav>

            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" BackColor="White" CellPadding="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="שם המשחק">
                        <ItemTemplate>
                            <asp:Button Text='<%#Server.UrlDecode(XPathBinder.Eval(Container.DataItem, "GameSubject").ToString())%>' ToolTip="הצגת המשחק" class="qbutton" CommandName="viewRow" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@GameCode").ToString()%>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="GameCode" HeaderText="קוד המשחק" SortExpression="GameCode" />
                    <asp:TemplateField HeaderText="מספר שאלות">
                        <ItemTemplate>
                            <asp:Label ID="GameQnumLbl" runat="server" Text='<%#XPathBinder.Eval(Container.DataItem, "questions/@Quantity").ToString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="עריכה">
                        <ItemTemplate>
                            <asp:ImageButton ID="EditIMG" runat="server" ImageUrl="~/images/edit.png" CommandName="editRow" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@GameCode").ToString()%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="מחיקה">
                        <ItemTemplate>
                            <input id="Button1" type="button" class="delebtnmain" onclick="showmodel(this)" />
                            <div id="id01" onclick="document.getElementById('id01').style.display='none'">
                                <div class="modal">
                                        <div class="container">
                                            <h1>האם ברצונך למחוק את המשחק <span id="gamename"></span>?</h1>
                                            <p>לא קיימת אפשרות לביטול מחיקת המשחק</p>

                                            <div class="clearfix">
                                                        <asp:Button ID="deleteIMG" runat="server" class="deletebtn" Text="מחק" CommandName="deleteRow" theItemId='<%#XPathBinder.Eval(Container.DataItem,"@GameCode").ToString()%>'></asp:Button>
                                                        <button type="button" onclick="hidemodel(this)" class="cancelbtn">אל תמחק את המשחק</button>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="המשחק פורסם?">
                        <ItemTemplate>
                            <asp:CheckBox ID="ISpassCheckBox1" runat="server" CommandName="publishRow" Checked='<%#Convert.ToBoolean(XPathBinder.Eval(Container.DataItem,"@isPublish"))%>' theItemId='<%#XPathBinder.Eval(Container.DataItem,"@GameCode")%>'
                                AutoPostBack="true" OnCheckedChanged="isPublish_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#99CCCC" />
                <HeaderStyle />
                <PagerStyle BackColor="#99CCCC" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>

            <asp:Label ID="Label1" runat="server" Text="שם התלמיד"></asp:Label>
            &nbsp;<asp:TextBox ID="addNameTB" runat="server"></asp:TextBox>
            &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/add.png" OnClick="ImageButton1_Click" />
            <br />
            <br />


            <br />
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/tree/game.xml" XPath="/RootTree/game"></asp:XmlDataSource>
        </div>
    </form>
</body>
</html>
