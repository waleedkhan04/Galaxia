<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="Database_Project.Request" %>

<!DOCTYPE html>

<style>    
.requestbody {
    background-image: url("./Data/7.png");
    background-repeat: no-repeat;
    background-size: 100%;
    background-color: black;
    position: relative;
}
h1 {
    text-align: center;
    margin-top: 150px;
    margin-bottom: 50px;
    color: white;
    font: lighter 80px Gilroy;
    background-color: transparent;
    border-color: transparent;
}
.container {
    display: flex;
    justify-content: center;
}
.requestform {
    width:40%;
    padding: 30px;
    border-radius: 50px;
    display: flex;
    background: rgba(0,0,0,0.5);
    flex-direction: column;
     backdrop-filter:blur(10px);
}
input[type="text"], input[type="email"], input[type="password"], input[type="date"], textarea, select {
    padding: 10px;
    border: 1px solid grey;
    border-radius: 20px;
    font-size: 16px;
    width: 100%;
    margin-bottom: 20px;
    box-sizing: border-box;
    background-color: rgb(180,180,180);
}
input[type="submit"] {
    width: 40%;
    background-color: white;
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 30px;
    font:lighter 18px Gilroy;
}
input[type="submit"]:hover {
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}
.submitbutton{
    width: 40%;
    left: 30%;
    position: relative;
    margin-top: 20px;

}
input[type="date"]:hover, textarea:hover, select:hover {
    border-color: rgb(200,200,200);
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


</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
    <title>Request Leave</title>
</head>

<body class="requestbody" onload="showLogin()">
    <header id="header" style="height:20px">
        <a href="Home.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/backarrow.png" class ="imghomebutton" /></a>
        <a href="Home.aspx" style="color:transparent"><input id="home" type="button" value="GALAXIA" class="homebutton";/></a>
    </header>
    <h1>REQUEST A LEAVE</h1>
        <div class="container">
            <form runat="server" class="requestform">
                <div>
                 <label for="end">Duration:</label>
                 <input type="text" id="days" name="days">
                 <label for="type">Leave Type:</label>
                 <select id="type" name="type">
                    <option value="paid">Paid</option>
                    <option value="unpaid">Unpaid</option>
                 </select>
                 <label for="reason">Reason:</label>
                 <select id="reason" name="reason">
                    <option value="Medical">Medical</option>
                    <option value="vacation">Vacation</option>
                    <option value="personal">Personal</option>
                    <option value="domestic">Domestic</option>
                    <option value="other">Others</option>
                 </select>
                 </div>
    
                <div style="text-align:center;">
                    <asp:Button ID="submit" runat="server" Text="SUBMIT" OnClick="request" />
                </div>
            </form>
        </div>
    </body>
</html>