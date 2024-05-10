<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveRequest.aspx.cs" Inherits="Database_Project.LeaveRequest" %>

<!DOCTYPE html>

<style>
.leavesbody {
    background-image: url("./Data/1.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-color: black;
    position: relative;
    top: -40px;
}
.listing {
    width: 950px;
    left: 250px;
    list-style-type: none;
    padding:0;
    
}
.listitem {
    box-shadow: rgb(32, 32, 32) 10px 10px inset;
    background-color: rgb(32, 32, 32);
    border-radius: 25px;
    margin:10px;
    padding:10px
}
.buttons {
    margin:10px;
    color: black;
    width: 130px;
    border-radius: 20px;
    background-color: white;
    border-color: transparent;
    font: lighter 25px Gilroy;
    position: relative;
}
.buttons:hover {
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}
.missionstitle {
    position: relative;
    top: 0px;
    color: white;
    background-color: transparent;
    border-color: transparent;
    font: lighter 20px Gilroy;
}
</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
    <title>Leave Requests</title>
</head>
<body class="leavesbody">
    <form runat="server">



        <%--<div style="display:flex;justify-content:center">
        <%--addig the form into the repeater--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="detailspanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            
        </ContentTemplate>
    </asp:UpdatePanel>


    <header id="header">
        <a href="Home.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/backarrow.png" class ="imghomebutton" /></a>
        <a href="Home.aspx" style="color:transparent"><input id="home" type="button" value="GALAXIA" class="homebutton";/></a>
    </header>
    <h1 class="titletext" style="top:50px">LEAVE REQUESTS</h1>
    <div style="justify-content:center;display:flex">
        <ul class ="listing">
            <li class="listitem">
                <div style="height:50px;display:flex;justify-content:space-around;flex-direction: row;">
                    <h1 class="missionstitle" style="font:lighter 20px gilroy">Name</h1>
                    <h1 class="missionstitle" style="font:lighter 20px gilroy">Email</h1>
                    <h1 class="missionstitle" style="font:lighter 20px gilroy">Type</h1>
                    <h1 class="missionstitle" style="font:lighter 20px gilroy">Duration</h1>
                    <h1 class="missionstitle" style="font:lighter 20px gilroy">Reason</h1>
                </div>
            </li>

            <asp:Repeater ID="leaves" runat="server" OnItemCommand="thisleave" >
                <ItemTemplate>
                    <li class="listitem">
                        <div style="display:flex;justify-content:space-around;flex-direction: row;">
                            <h1 class="missionstitle"><%# Eval("RName") %></h1>
                            <h1 class="missionstitle"><%# Eval("REmail") %></h1>
                            <h1 class="missionstitle"><%# Eval("LeaveType") %></h1>
                            <h1 class="missionstitle"><%# Eval("LDays") %></h1>
                            <h1 class="missionstitle"><%# Eval("Reason") %></h1>
                        </div>
                        <div style="display:flex;justify-content:space-around;flex-direction: row;background-color: rgb(15,15,15);border-radius: 25px;">
                            <asp:Button CssClass="buttons" ID="accept" runat="server" Text="ACCEPT" CommandName="accept" CommandArgument='<%# Eval("LID") %>' />
                            <asp:Button CssClass="buttons" ID="decline" runat="server" Text="DECLINE" CommandName="decline" CommandArgument='<%# Eval("LID") %>' />
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    </form>
</body>
</html>