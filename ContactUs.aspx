<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Database_Project.ContactUs" %>

<!DOCTYPE html>


<style>
.requestbody {
    background-image: url("./Data/3.png");
    background-repeat: no-repeat;
    background-size: contain;
    background-color: black;
    position: relative;
    top: -40px;
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
.loginform {
    background-color: rgb(0, 0, 0, 0.50);
    border-radius: 30px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    padding: 30px;
    width: 500px;
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
.submitbutton:hover {
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}
.submitbutton{
    width: 40%;
    margin: 20px;
    position: relative;
    background-color: white;
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 30px;
    font:lighter 18px Gilroy;
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
.headerbutton {
    color: white;
    background-color: transparent;
    border-color: transparent;
    font: lighter 25px Gilroy;
}
</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
    <title>Contact Us</title>
</head>
	<body class="requestbody">
        <form runat="server" method ="post">
        <div style="position:relative;top:-95px">
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
        </div>
	
        <h1>CONTACT US</h1>

            <div class="container">
            <div style=" width:40%;background-color :rgba(0,0,0,0.5);border-radius:50px;padding:50px;justify-content:center;backdrop-filter:blur(10px);">
                 <div style="display:table;width:100%">
                 <label for="name">Name:</label>
                 <input type="text" id="name" name="name" required/>
                 <label for="email">Email:</label>
                 <input type="text" id="mail" name="mail"/ required>
                 <label for="reason">Message:</label>
                 <textarea id="data" name="data" required></textarea>
                 
                 </div>
                 <div style="text-align:center;">
                     <asp:Button CssClass="submitbutton" ID="submit" runat="server" Text="SUBMIT" OnClick="sendfeedback" />
                 </div>
                <b style="text-align:center; margin-top:50px"><label style="margin-top: 20px;"><b>Reach out to us</b></label>
                <label><b>Email: info@galaxia.org</b></label>
                <label><b>Phone: +92-123-4567</b></label>
                <label><b>Address: D24E, Silicon Valley, Chungi Amar Sadhu, California</b></label></b>
            </div>
        </div>
        </form>
	</body>
</html>