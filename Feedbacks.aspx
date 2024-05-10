<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedbacks.aspx.cs" Inherits="Database_Project.Feedbacks" %>

<!DOCTYPE html>

<style>
.missionsbody {
    background-image: url("./Data/2.png");
    background-repeat: no-repeat;
    background-size: 100%;
    background-color: black;
    position: relative;
    top: -40px;
}
.listing {
    width: 950px;
    left: 250px;
    list-style-type: none;
}
.listitem {
    box-shadow: rgb(32, 32, 32) 10px 10px inset;
    background-color: rgb(32, 32, 32);
    border-radius: 50px;
    margin:20px;
}
.detailbutton {
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
.applybutton:hover, .detailbutton:hover {
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}
.missionstitle {
    flex: 1;
    position: relative;
    color: white;
    background-color: transparent;
    border-color: transparent;
    font: lighter 20px Gilroy;
}


.container {
    display: flex;
    justify-content: center;
}
.addform {
    display:none;
    position: fixed;
    background-color: rgb(0, 0, 0, 0.50);
    border-radius: 30px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    padding: 30px;
    width: 500px;
    backdrop-filter:blur(10px);
    top:30%;
}
input[type="text"], input[type="email"], input[type="password"] {
    padding: 10px;
    border: 1px solid grey;
    border-radius: 20px;
    font-size: 16px;
    width: 100%;
    margin-bottom: 20px;
    box-sizing: border-box;
    background-color: rgb(180,180,180);
}
.buttons{
    background-color: white;
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 30px;
    font:lighter 18px Gilroy;
    width: 40%;
    left: 30%;
    position: relative;
    margin-top: 20px;
}
.buttons:hover {
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}

input[type="text"]:hover {
    border-color: rgb(200,200,200);
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}
input[type="email"]:hover {
    border-color: rgb(200,200,200);
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}
input[type="password"]:hover {
    border-color: rgb(200,200,200);
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}
label {
    font:lighter 18px Gilroy;
    display: block;
    margin-bottom: 10px;
    color: white;
}
#addform.visible{
    display: block;
}
#delform.visible{
    display: block;
}
</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
    <title>Messages</title>
</head>
<body class="missionsbody">
    <header runat="server" id="header" style="position:relative">
        <a href="Home.aspx" style="color:transparent"> <img alt="Galaxia" src="./Data/backarrow.png" class ="imghomebutton"/> </a>
        <a href="Home.aspx" style="color:transparent"> <input id="home" type="button" value="GALAXIA" class="homebutton";/> </a>
    </header>
    <h1 class="titletext" style="top:50px">MESSAGES</h1>
    <div style="justify-content:center;display:flex">
   
    <ul class ="listing">

        <asp:Repeater ID="allmissions" runat="server">
            <ItemTemplate>
                <li class="listitem" style="display:flex;justify-content:space-between;align-items:center;">
                    <div style="display: flex;flex-direction: row;align-items: center;">
                        <div style="margin:20px" >
                            <h1 style="font: lighter 20px Gilroy; margin-bottom:0px;" class="missionstitle">Name:</h1>
                            <h1 style="font: lighter 30px Gilroy; margin-top:0px;" class="missionstitle"><%# Eval("CName") %></h1>
                            <h1 style="font: lighter 20px Gilroy; margin-bottom:0px;" class="missionstitle">Email:</h1>
                            <h1 style="font: lighter 30px Gilroy; margin-top:0px;" class="missionstitle"><%# Eval("CEmail") %></h1>
                        </div>
                        <div style="margin:20px" >
                            <h1 class="missionstitle"><%# Eval("CData") %></h1>
                        </div>
                    </div>
                </li>        
            </ItemTemplate>
        </asp:Repeater>

    </ul>
    </div>
</body>
</html>

