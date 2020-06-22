<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newGame.aspx.cs" Inherits="Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
				<path id="tabshape" d="M80,60C34,53.5,64.417,0,0,0v60H80z"/>
			</defs>
		</svg>
                <nav>
                    <ul>
                        <li class="notthistab"><a href="Default.aspx">
	 		<svg viewBox="0 0 80 60" preserveAspectRatio="none"><use xlink:href="#tabshape"></use></svg>
			<span>המשחקים שלי</span>
            </a></li>

               <li class="thistab"><a>
			<svg viewBox="0 0 80 60" preserveAspectRatio="none"><use xlink:href="#tabshape"></use></svg>
            <svg viewBox="0 0 80 60" preserveAspectRatio="none"><use xlink:href="#tabshape"></use></svg>
			<span>יצירת משחק חדש</span>
            </a></li> 
                    </ul>
                </nav>
            
            </div>
                    <div id="maingamepage">
            



        </div>




        </div>




    </form>
</body>
</html>
