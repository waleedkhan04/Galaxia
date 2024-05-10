<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobApply.aspx.cs" Inherits="Database_Project.JobApply" %>

<!DOCTYPE html>


<style>
.jobbody {
    background-color: black;
    background-image: url("./Data/10.png");
    background-repeat: no-repeat;
    background-size: 100%;
}
.card-container {
    display: flex;
    justify-content: center;
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
    flex-wrap: wrap;
}
.card {
    box-shadow: rgb(32,32,32) 0px 0px 30px;
    width: 45%;
    margin: 10px;
    margin-bottom: 20px;
    text-align: center;
    background-color: rgb(32, 32, 32);
    border-radius: 20px;
    overflow: hidden;
    padding: 5px;
}
.profilepic{
    border-radius:100px;
    background-color:white;
    height: 160px;
    object-fit: scale-down;
    object-position: center;
}
.datafont{
    color:white;
    margin: 5px;
}

.buttons {
    width:400px;
    color: black;
    border-radius: 20px;
    background-color: white;
    border-color: transparent;
    font: lighter 25px Gilroy;
    margin:5px;
}
.buttons:hover {
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}

</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
    <title>Job Applicants</title>
</head>


<body class="jobbody">
    <header id="header" style="position:relative;top:-40px">
        <a href="Home.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/backarrow.png" class ="imghomebutton" /></a>
        <a href="Home.aspx" style="color:transparent"><input id="home" type="button" value="GALAXIA" class="homebutton";/></a>
    </header>

    <h1 class="titletext" style="top:0">APPLICANTS</h1>
    <form class="card-container" runat="server">
        <asp:Repeater ID="jobs" runat="server" OnItemCommand="apply_ItemCommand" >
            <ItemTemplate>
                <div class="card">
                    <img src="./Data/ProfilepicW.png" alt="Profile Image" class="profilepic"/>
                    <div class="info">
                        <div class="datafont" style="font: lighter 50px Gilroy;"><%# Eval("RName") %></div>
                        <div class="datafont" style="font: lighter 30px Gilroy;"><%# Eval("JName") %></div>
                        <asp:Button ID="linkedin" runat="server" Text="LinkedIn" CssClass="buttons" CommandName="openlink" CommandArgument='<%# Eval("RLink") %>' />
                        <asp:Button CssClass="buttons" ID="accept" runat="server" Text="ACCEPT" CommandName="accept" CommandArgument='<%# Eval("JAID")  + "," + Eval("JAJobID") %>' />
                        <asp:Button CssClass="buttons" ID="decline" runat="server" Text="DECLINE" CommandName="decline" CommandArgument='<%# Eval("JAID")  + "," + Eval("JAJobID") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </form>

</body>
</html>