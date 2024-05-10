<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Missions.aspx.cs" Inherits="Database_Project.Missions" %>

<!DOCTYPE html>

<style>
.missionsbody {
    background-image: url("./Data/5.png");
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
    text-align:center;
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
.imghomebutton {
    color: white;
    background-color: transparent;
    border-color: transparent;
    position: absolute;
    height: 40px;
}
</style>

<script>
    function showadd() {
        document.getElementById("delform").classList.remove("visible");
        document.getElementById("addform").classList.add("visible");
    }
    function hideboth() {
        document.getElementById("addform").classList.remove("visible");
        document.getElementById("delform").classList.remove("visible");
    }
    function showdel() {
        document.getElementById("addform").classList.remove("visible");
        document.getElementById("delform").classList.add("visible");
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
    <title>Missions</title>
</head>
<body class="missionsbody">


    <div style="display:flex;justify-content:center;z-index:1;position:relative">
        <form id="bothform" runat="server" style="display: flex;justify-content: center;">

            <div class="addform" style="top:10%" id="addform">
                <label for="aname">Mission Name</label>
                <input type="text" id="aname" name="aname">
                <label for="astart">Mission Start</label>
                <input type="text" id="astart" name="astart">
                <label for="aend">Mission End</label>
                <input type="text" id="aend" name="aend">
                <label for="acost">Mission Expense</label>
                <input type="text" id="acost" name="acost">
                <div>
                    <asp:Button ID="submitadd" CssClass="buttons" runat="server" Text="ADD" OnClientClick="hideboth()" OnClick="add_mission" />
                </div>
                <div>
                    <input type="button" class="buttons" value="CANCEL" onclick="hideboth()"/>
                </div>
            </div>

            <div class="addform" style="top:20%" id="delform">
                <label for="dis">Deleting a Mission will delete all of its data!</label>
                <label for="dmid">Mission ID</label>
                <input type="text" id="dmid" name="dmid">

                <div>
                    <asp:Button ID="submitdel" CssClass="buttons" runat="server" Text="DELETE" OnClientClick="hideboth()" OnClick="del_mission" />
                </div>
                <div>
                    <input type="button" class="buttons" value="CANCEL" onclick="hideboth()"/>
                </div>
            </div>

        </form>
    </div>


    <header id="header" style="top:40px;position:relative">
        <a href="Home.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/backarrow.png" class ="imghomebutton" /></a>
        <a href="Home.aspx" style="color:transparent"><input id="home" type="button" value="GALAXIA" class="homebutton";/></a>
    </header>
    <h1 class="titletext" style="top:50px">MISSIONS</h1>
    <div style="justify-content:center;display:flex">
   
    <ul class ="listing">

        <li class="listitem" style="display:flex;justify-content:space-between;align-items:center;">
            <h1 style="font: lighter 15px Gilroy" class="missionstitle">Mission ID</h1>
            <h1 style="font: lighter 15px Gilroy" class="missionstitle">Location</h1>
            <h1 style="font: lighter 15px Gilroy" class="missionstitle">Start</h1>
            <h1 style="font: lighter 15px Gilroy" class="missionstitle">End</h1>
            <h1 style="font: lighter 15px Gilroy" class="missionstitle">Expense</h1>
        </li> 


        <asp:Repeater ID="allmissions" runat="server">
            <ItemTemplate>
                <li class="listitem" style="display:flex;justify-content:space-between;align-items:center;">
                    <h1 style="font: lighter 30px Gilroy" class="missionstitle"><%# Eval("MID") %></h1>
                    <h1 style="font: lighter 30px Gilroy" class="missionstitle"><%# Eval("MLocation") %></h1>
                    <h1 class="missionstitle"><%# Eval("MLaunchDate","{0:dd-MM-yyyy}") %></h1>
                    <h1 class="missionstitle"><%# Eval("MEndDate","{0:dd-MM-yyyy}") %></h1>
                    <h1 class="missionstitle"><%# Eval("MExpense").ToString() %></h1>
                </li>        
            </ItemTemplate>
        </asp:Repeater>

    </ul>
    </div>
    <div>
        <input type="button" value="START A NEW MISSION" class="buttons" onclick="showadd()"/>
    </div>
    <div>
        <input type="button" value="DELETE A MISSION" class="buttons" onclick="showdel()"/>
    </div>
</body>
</html>
