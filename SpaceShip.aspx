<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpaceShip.aspx.cs" Inherits="Database_Project.SpaceShip" %>

<!DOCTYPE html>


<style>
.spaceshipsbody {
    background-image: url("./Data/2.png");
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
.shiplist{
    list-style-type:none;
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
    z-index:1;
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
    <title>SpaceShips</title>
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
</head>
<body class="spaceshipsbody">

    <div style="display:flex;justify-content:center">
        <form id="bothform" runat="server" style="display: flex;justify-content: center;">
            <div class="addform" id="addform">
                <label for="aname">Ship Name</label>
                <input type="text" id="aname" name="aname">
                <label for="alink">Data Link</label>
                <input type="text" id="alink" name="alink">
                <label for="asid">Scientist ID</label>
                <input type="text" id="asid" name="asid">

                <div>
                    <asp:Button ID="submitadd" CssClass="buttons" runat="server" Text="ADD" OnClientClick="hideboth()" OnClick="add_ship" />
                </div>
                <div>
                    <input type="button" class="buttons" value="CANCEL" onclick="hideboth()"/>
                </div>
            </div>

            <div class="addform" id="delform">
                <label for="dname">Ship Name</label>
                <input type="text" id="dname" name="dname">

                <div>
                    <asp:Button ID="submitdel" CssClass="buttons" runat="server" Text="DELETE" OnClientClick="hideboth()" OnClick="del_ship" />
                </div>
                <div>
                    <input type="button" class="buttons" value="CANCEL" onclick="hideboth()"/>
                </div>
            </div>

        </form>
    </div>

    <header id="header" style="top: 40px;position: relative;">
        <a href="Home.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/backarrow.png" class ="imghomebutton" /></a>
        <a href="Home.aspx" style="color:transparent"><input id="home" type="button" value="GALAXIA" class="homebutton";/></a>
    </header>

    <form>

        <h1 class ="titletext" style="top:50px">SPACESHIPS</h1>
        <ul class="shiplist">
            <asp:Repeater ID="allships" runat="server">
                <ItemTemplate>
                    <a href="<%# Eval("SImagelink") %>" style="color:transparent" target="_blank"> <li class="imageitem" style="background-image: url('<%# Eval("SImagelink") %>');" >
                        <h1 class ="titletext" style="top: 190px;background-color: rgba(32,32,32,0.5);border-radius: 50px;margin: 10px;"><%# Eval("SName") %></h1>
                    </li></a>
                </ItemTemplate>
            </asp:Repeater>
        </ul>

        <div>
            <input type="button" value="ADD A NEW SPACECRAFT" class="buttons" onclick="showadd()"/>
        </div>
        <div>
            <input type="button" value="DELETE A SPACECRAFT" class="buttons" onclick="showdel()"/>
        </div>
    </form>

</body>
</html>
