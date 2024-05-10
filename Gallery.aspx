<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Database_Project.Gallery" %>

<!DOCTYPE html>

<style>
.gallerybody {
    background-image: url("./Data/9.png");
    background-repeat: no-repeat;
    background-size: 100%;
    background-color: black;
    position: relative;
    top: -40px;
}
.imageitem {
    background-size: cover;
    background-color: black;
    width: 1400px;
    height: 300px;
    border: 2px solid grey;
    border-radius: 50px;
    margin:30px;
    box-shadow: rgb(100,100,100) 0px 0px 50px;
}
.imageitem:hover {
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}
.listing {
    width: 950px;
    position: absolute;
    left: 250px;
    top: 650px;
    list-style-type: none;
}
.imagetitle {
    position: relative;
    top: 23px;
    left: 40px;
    color: white;
    background-color: transparent;
    border-color: transparent;
    font: lighter 20px Gilroy;
}
.gallerylist{
    position:absolute;
    top:750px;
    list-style-type:none;
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
    <title>Gallary</title>
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
</head>
<body class="gallerybody">
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

        <h1 class ="titletext"> EXPLORE THE DEEP SPACE WITH US </h1>
        <h1 style=" color: white; background-color:transparent; border-color:transparent; position:relative; top: 410px; font: lighter 40px Gilroy; text-align: center;" > OUR JOURNEY </h1>

        <ul class="gallerylist">
            <asp:Repeater ID="images" runat="server">
                <ItemTemplate>
                    <a href="<%# Eval("IImagelink") %>" style="color:transparent" target="_blank"> <li class="imageitem" style="background-image: url('<%# Eval("IImagelink") %>');" >
                        <h1 class="imagetitle"><%# Eval("IImageName") %></h1>
                    </li> </a>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </form>
</body>
</html>