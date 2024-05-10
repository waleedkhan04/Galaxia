<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Samples.aspx.cs" Inherits="Database_Project.Samples" %>

<!DOCTYPE html>

<style>
.samplesbody {
    background-color: black;
    background-image: url("./Data/4.png");
    background-repeat: no-repeat;
    background-size: 100%;
}
.card-container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
}
.card {
    box-shadow: rgb(32,32,32) 0px 0px 30px;
    width: 45%;
    margin-bottom: 20px;
    text-align: center;
    background-color: rgb(32, 32, 32);
    border-radius: 20px;
    overflow: hidden;
    padding: 5px;
    margin: 10px;
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
.buttons1{
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
.buttons1:hover {
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

</style>


<script>
    function showadd() {
        document.getElementById("addform").classList.add("visible");
    }
    function hideadd() {
        document.getElementById("addform").classList.remove("visible");
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
    <title>Samples</title>
</head>
<body class="samplesbody">
    <form runat="server">

    <div style="display:flex;justify-content:center">
        <div class="addform" id="addform" method="post">
            <label for="smname">Sample Name</label>
            <input type="text" id="smname" name="smname">
            <label for="smsize">Sample Size</label>
            <input type="text" id="smsize" name="smsize">
            <label for="smmid">Mission ID</label>
            <input type="text" id="smmid" name="smmid">
            <div>
                <asp:Button ID="add" runat="server" Text="ADD" CssClass="buttons1" OnClick="add_sample" OnClientClick="hideadd()"/>
            </div>
            <div>
                <input type="button" class="buttons1" value="CANCEL" onclick="hideadd()"/>
            </div>
        </div>
    </div>

    <header id="header">
        <a href="Home.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/backarrow.png" class ="imghomebutton" /></a>
        <a href="Home.aspx" style="color:transparent"><input id="home" type="button" value="GALAXIA" class="homebutton";/></a>
    </header>

    <h1 class="titletext" style="top:0">SAMPLES</h1>
    <div class="card-container" runat="server" >
        <asp:Repeater ID="samples" runat="server" OnItemCommand="samples_ItemCommand" >
            <ItemTemplate>
                <div class="card">
                    <div class="info">
                        <div class="datafont" style="font: lighter 50px Gilroy;"><%# Eval("SmName") %></div>
                        <div class="datafont" style="font: lighter 30px Gilroy;"><%# Eval("SmSize").ToString() %></div>
                        <div class="datafont" style="font: lighter 30px Gilroy;"><%# Eval("MLocation").ToString() %></div>
                        <asp:Button CssClass="buttons" ID="descard" runat="server" Text="DESCARD" CommandName="descard" CommandArgument='<%#Eval("SmID")%>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div style="justify-content:center;display:flex">
        <input type="button" value="ADD A NEW SAMPLE" class="buttons" onclick="showadd()"/>
    </div>
        </form>
</body>
</html>
