<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Database_Project.Signup" %>

<!DOCTYPE html>
<style>    
.signupbody {
    background-image: url("./Data/11.png");
    background-repeat: no-repeat;
    background-size: 100%;
    background-position-x:center;
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
.submitbutton:hover {
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}
.submitbutton{
    width: 40%;
    left: 30%;
    position: relative;
    margin-top: 20px;
    background-color: white;
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 30px;
    font:lighter 18px Gilroy;
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
#loginform{
    margin: 5px;

}

#signupform {
    margin: 5px;

}
.headerbutton {
    color: white;
    background-color: transparent;
    border-color: transparent;
    font: lighter 25px Gilroy;
}
</style>

<html>
<head runat="server">
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
    <title>Sign Up</title>
</head>


<body class="signupbody">
    <form runat="server" method="post">
    <div style="position:relative;top:-95px">
        <header id="header">
            <a href="HomePage.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/main logo transparent.png" class ="imghomebutton" /></a>
            <a href="HomePage.aspx" style="color:transparent"><input id="home" type="button" value="GALAXIA" class="homebutton";/></a>
            <div style="position:absolute; right:0" >
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
    <h1>GALAXIA</h1>
        <div class="container" >
            <div class="loginform" id="signupform">
                <label for="signup-name">Name</label>
                <input type="text" id="signupname" name="signupname">
                <label for="signup-email">Email</label>
                <input type="email" id="signupemail" name="signupemail">
                <label for="signup-password">Password</label>
                <input type="password" id="signuppassword" name="signuppassword">
                <label for="signup-number">Number</label>
                <input type="text" id="signupnumber" name="signupnumber">
                <label for="signup-number">LinkedIn</label>
                <input type="text" id="signuplink" name="signuplink">
                
                <asp:Button ID="Button1" runat="server" Text="SIGN UP" CssClass="submitbutton" OnClick="reguser"/>
                <div  style="font: lighter 18px Gilroy;color: white;text-align: center;margin-top: 20px;"> Already have an account? <a href="Login.aspx" onclick="showLogin()" style="color:white;font-weight:bold">Login</a></div>
            </div>
            
        </div>
        </form>
    </body>
</html>
