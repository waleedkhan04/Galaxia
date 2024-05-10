<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Database_Project.Profile" %>

<!DOCTYPE html>
<style>
.profilebody {
    background-color: black;
}
.profileback{
    background-image: url("./Data/Profile background.jpg");
    background-size: cover;
    background-repeat: no-repeat;
}
.profilepic{
    border-radius:100px;
    background-color:white;
    height: 400px;
    object-fit: scale-down;
    object-position: center;
    box-shadow: rgb(10,10,10) 0 0 100px;
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
.listitem {
    box-shadow: rgb(10, 10, 10) 0px 0px 50px;
    background-color: rgb(50, 50, 50);
    border-radius: 50px;
    display:flex;
    justify-content:center;
    padding:15px;
    margin-bottom:40px;
}


.container {
    display: flex;
    justify-content: center;
}
.updateform {
    display:none;
    position: fixed;
    background-color: rgb(0, 0, 0, 0.50);
    border-radius: 30px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    padding: 30px;
    width: 500px;
    backdrop-filter:blur(10px);
    z-index:1;
}
select, option, input[type="text"], input[type="email"], input[type="password"], input[type="tel"] {
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
select, option, input[type="password"]:hover, input[type="email"]:hover, input[type="text"]:hover , input[type="tel"]:hover {
    border-color: rgb(200,200,200);
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}
label {
    font:lighter 18px Gilroy;
    display: block;
    margin-bottom: 10px;
    color: white;
}
#updateform.visible{
    display: block;
}
</style>


<script>
    function showupdate() {
        document.getElementById("updateform").classList.add("visible");
    }
    function hideupdate() {
        document.getElementById("updateform").classList.remove("visible");
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
    <title>Profile</title>
</head>
<body class="profilebody">

    <div style="display:flex;justify-content:center;">
        <form class="updateform" id="updateform"  method="post" runat="server">
            <label for="name">Name</label>
            <input type="text" id="newname" name="newname">

            <label for="email">Email</label>
            <input type="email" id="newemail" name="newemail">

            <label for="num">Phone Number</label>
            <input type="text" id="newnumber" name="newnumber">

            <label for="pas">Password</label>
            <input type="text" id="newpass" name="newpass">

            <div>
                <asp:Button ID="sumbit" runat="server" Text="SUBMIT" CssClass="buttons1" OnClientClick="hideupdate()" OnClick="sumbit_Click" />     
            </div>
            <div>
                <input type="button" class="buttons1" value="CANCEL" onclick="hideupdate()"/>
            </div>
        </form>
    </div>

    <header id="header" style="height:20px">
        <a href="Home.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/backarrow.png" class ="imghomebutton" /></a>
        <a href="Home.aspx" style="color:transparent"><input id="home" type="button" value="GALAXIA" class="homebutton";/></a>
    </header>


    <div class="profileback" style="padding:20px;justify-content:center;background-color:rgb(32,32,32);border-color:transparent;border-radius:40px;margin:30px;">
        <div style="justify-content:center;display:flex">
            <img src="./Data/ProfilepicW.png" alt="Profile Image" class="profilepic"/>
        </div>
        <asp:Repeater ID="userdata" runat="server">
            <ItemTemplate>
                
                    <h1 class="titletext" style="top:0;margin:0px;background-color:rgb(32,32,32);border-radius:50px;margin-top:20px;margin-bottom:20px;box-shadow: rgb(10,10,10) 0 0 30px;"><%# Eval("RName") %></h1>
                    <h1 class="titletext" style="top:0;margin:0px;background-color:rgb(32,32,32);border-radius:50px;box-shadow: rgb(10,10,10) 0 0 30px;"><%# Eval("Jname") %></h1>
               
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div style="padding:20px;background-color:rgb(32,32,32);border-color:transparent;border-radius:40px;margin:30px">
        <h1 class="titletext" style="top:0;margin:0px;font:lighter 30px Gilroy">Details</h1>
        <asp:Repeater ID="useremail" runat="server">
            <ItemTemplate>
                    <h1 class="titletext" style="top:0;margin:10px;font:lighter 20px Gilroy">Email: <%# Eval("REmail") %></h1>   
                    <h1 class="titletext" style="top:0;margin:10px;font:lighter 20px Gilroy">Number: <%# Eval("RNumber") %></h1>  
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <div runat="server" id="allmissions" style="padding:20px;background-color:rgb(32,32,32);border-color:transparent;border-radius:40px;margin:30px">
        <h1 class="titletext" style="top:0;margin:0px;font:lighter 30px Gilroy">Missions History</h1>
        <ul style="list-style-type:none;padding:0;margin:50px">
            <asp:Repeater ID="missiondata" runat="server">
                <ItemTemplate>
                    <li class="listitem">
                        <h1 class ="titletext" style="top:4px;font:lighter 35px Gilroy;margin:0;"><%# Eval("MLocation") %></h1>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>


    <div style="justify-content:center;display:flex">
        <input type="button" value="UPDATE PROFILE" class="buttons" onclick="showupdate()"/>
    </div>
</body>
</html> 
