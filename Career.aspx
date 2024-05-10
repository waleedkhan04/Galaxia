<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Career.aspx.cs" Inherits="Database_Project.Career" %>

<!DOCTYPE html>


<style>
.careerbody {
    background-image: url("./Data/6.png");
    background-repeat: no-repeat;
    background-size: 100%;
    background-color: black;
    position: relative;
    top: -40px;
}
.listing {
    width: 950px;
    position: absolute;
    left: 250px;
    top: 650px;
    list-style-type: none;
}
.listitem {
    box-shadow: rgb(32, 32, 32) 10px 10px inset;
    background-color: rgb(32, 32, 32);
    border-radius: 50px;
}
.applybutton {
    color: black;
    width: 130px;
    border-radius: 20px;
    background-color: white;
    border-color: transparent;
    font: lighter 25px Gilroy;
    position: relative;
    bottom: 20px;
    left: 800px;
}
.applybutton:hover {
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}
.jobtitle {
    position: relative;
    top: 23px;
    left: 40px;
    color: white;
    background-color: transparent;
    border-color: transparent;
    font: lighter 20px Gilroy;
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
    <title>Career</title>
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
</head>

<body class="careerbody">
    <form runat="server">
        <header id="header">
            <a href="HomePage.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/main logo transparent.png" class ="imghomebutton" /></a>
            <a href="HomePage.aspx" style="color:transparent"><input id="home" type="button" value="GALAXIA" class="homebutton";/></a>
            <div style="position:absolute; right:0" >
                <asp:Button ID="logout" runat="server" Text="LOGOUT" CssClass="headerbutton" OnClick="gologout" formnovalidate="formnovalidate" />
                <asp:Button ID="main" runat="server" Text="MAIN MENU" CssClass="headerbutton" OnClick="gomain" formnovalidate="formnovalidate" />
                <asp:Button ID="login" runat="server" Text="LOGIN" CssClass="headerbutton" OnClick="gologin" formnovalidate="formnovalidate" />
                <asp:Button ID="signup" runat="server" Text="SIGNUP" CssClass="headerbutton" OnClick="gosignup" formnovalidate="formnovalidate" />
                <asp:Button ID="career" runat="server" Text="CAREER" CssClass="headerbutton" OnClick="gocareer" formnovalidate="formnovalidate" />
                <asp:Button ID="gallery" runat="server" Text="GALLERY" CssClass="headerbutton" OnClick="gogallery" formnovalidate="formnovalidate" />
                <asp:Button ID="about" runat="server" Text="ABOUT US" CssClass="headerbutton" OnClick="goabout" formnovalidate="formnovalidate" />
                <asp:Button ID="contact" runat="server" Text="CONTACT US" CssClass="headerbutton" OnClick="gocontact" formnovalidate="formnovalidate" />
            </div>
        </header>

        <h1 class ="titletext"> JOIN THE TEAM OF GALAXIA </h1>
        <h1 style=" color: white; background-color:transparent; border-color:transparent; position:relative; top: 410px; font: lighter 40px Gilroy; text-align: center;" > OPEN VACANCIES </h1>
        <ul class ="listing">

            <asp:Repeater ID="jobs" runat="server" OnItemCommand="jobs_ItemCommand" >
                <ItemTemplate>
                    <li class="listitem">
                        <h1 class="jobtitle"><%# Eval("JName") %></h1>
                        <asp:Button ID="button1" runat="server" Text="APPLY" CssClass="applybutton" CommandName="Apply" CommandArgument='<%# Eval("JID") %>'/>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </form>
</body>
</html>