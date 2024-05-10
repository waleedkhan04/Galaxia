<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Database_Project.HomePage" %>

<!DOCTYPE html>


<style>
.homebody {
    background-image: url("./Data/0.png");
    background-repeat: no-repeat;
    background-size: 100%;
    background-color: black;
    position: relative;
}
.headerbutton {
    color: white;
    background-color: transparent;
    border-color: transparent;
    font: lighter 25px Gilroy;
}
</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Galaxia</title>
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
</head>

<body class="homebody">
   <form runat="server">
        <header id="header">
            <a href="HomePage.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/main logo transparent.png" class ="imghomebutton" /></a>
            <a href="HomePage.aspx" style="color:transparent"><input id="home" type="button" value="GALAXIA" class="homebutton";/></a>
            <div style="position:absolute; right:0" >
                <asp:Button ID="logout" runat="server" Text="LOGOUT" CssClass="headerbutton" OnClick="gologout" formnovalidate="formnovalidate" />
                <asp:Button ID="main" runat="server" Text="MAIN MENU" CssClass="headerbutton" OnClick="gomain"  formnovalidate="formnovalidate" />
                <asp:Button ID="login" runat="server" Text="LOGIN" CssClass="headerbutton" OnClick="gologin"  formnovalidate="formnovalidate" />
                <asp:Button ID="signup" runat="server" Text="SIGNUP" CssClass="headerbutton" OnClick="gosignup" formnovalidate="formnovalidate" />
                <asp:Button ID="career" runat="server" Text="CAREER" CssClass="headerbutton" OnClick="gocareer"  formnovalidate="formnovalidate" />
                <asp:Button ID="gallery" runat="server" Text="GALLERY" CssClass="headerbutton" OnClick="gogallery"  formnovalidate="formnovalidate" />
                <asp:Button ID="about" runat="server" Text="ABOUT US" CssClass="headerbutton" OnClick="goabout"  formnovalidate="formnovalidate" />
                <asp:Button ID="contact" runat="server" Text="CONTACT US" CssClass="headerbutton" OnClick="gocontact"  formnovalidate="formnovalidate" />
            </div>
        </header>

        <div id="maindata" style="text-align:center">
            <h1 style="color: white; background-color: transparent; border-color: transparent; font: lighter 20px Gilroy; position: relative; top: 650px;">View our amazing gallery, or register to apply for a Job</h1>
        </div>
        <div id="footer" class="footer" style="top: 750px;display: flex;position: relative;flex-direction: row;">
           <a href="Homepage.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/main logo transparent.png" style="position: relative;height: 120px;margin: 10px;padding-left:50px"/> </a>
            <div style="margin:10px">
                <h1 style=" font:lighter 28px Gilroy; color: white">ABOUT US</h1>
                <div style=" font: lighter 12px Gilroy; color: white">We travel through stars and galaxies because we can!</div>
            </div>
        </div>
    </form>
</body>
</html>