<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view.aspx.cs" Inherits="Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style/tabs.css" rel="stylesheet" />
    <link href="style/tabstyles.css" rel="stylesheet" />
    <link href="style/StyleSheet.css" rel="stylesheet" />
    <script src="jsScript/jquery-1.12.0.min.js"></script>
    <script src="jsScript/JavaScript.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
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
                <input id="Button1" type="button" onclick="expand()" value="הרחב הכל" />
                <input id="Button2" type="button" onclick="Shrink()" value="כווץ הכל" />
                <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </div>
            <div id="blackwithimg">
                <span><i class='fas fa-times'></i></span>
                <img id="theimg" alt="" src="" />
            </div>
            </div>
    </form>
</body>
</html>
