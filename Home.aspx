<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Database_Project.Home" %>

<!DOCTYPE html>


<style>

.homebody{
    background-image: url("./Data/8.png");
    background-repeat: no-repeat;
    background-size: 100%;
    background-color: black;
}

.buttons {
    width:400px;
    color: black;
    border-radius: 20px;
    background-color: white;
    border-color: transparent;
    font: lighter 25px Gilroy;
    margin:30px;
}
.buttons:hover {
    box-shadow: rgb(200,200,200) 0px 0px 30px;
}

</style>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Galaxia</title>
    <link rel="icon" type="images/png" href="./Data/main logo transparent.png" />
    <link rel="stylesheet" href="AllStyle.css"/>
</head>

<body class="homebody">
    <form runat="server" style="text-align:center">
        <h1 style="color: white; background-color:transparent; border-color:transparent; position:relative; font: lighter 80px Gilroy;" > WELCOME </h1>
        <ul style="padding:0px; list-style-type:none">
            <li>
                <asp:Button ID="profile" runat="server" Text="VIEW PROFILE" CssClass="buttons" OnClick="gotoprofile" />
            </li>          
            <li>
                <asp:Button ID="samples" runat="server" Text="SAMPLES" CssClass="buttons" OnClick="gotosamples" />
            </li>
            <li>
                <asp:Button ID="spaceships" runat="server" Text="SPACESHIPS" CssClass="buttons" OnClick="gotoships" />
            </li>
            <li>
                <asp:Button ID="missions" runat="server" Text="MISSIONS" CssClass="buttons" OnClick="gotomissions" />
            </li>
            <li>
                <asp:Button ID="viewship" runat="server" Text="MY SPACESHIPS" CssClass="buttons" OnClick="gotomyships" />
            </li>
            <li>
                <asp:Button ID="reqleave" runat="server" Text="REQUEST LEAVE" CssClass="buttons" OnClick="gotorequest" />
            </li>
            <li>
                <asp:Button ID="leavereq" runat="server" Text="LEAVE REQUESTS" CssClass="buttons" OnClick="gotoleaves" />
            </li>
            <li>
                <asp:Button ID="jobapply" runat="server" Text="JOB APPLICANTS" CssClass="buttons" OnClick="gotojobapply" />
            </li>
            <li>
                <asp:Button ID="feedbacks" runat="server" Text="MESSAGES" CssClass="buttons" OnClick="gotofeedbacks" />
            </li>
            <li>
                <asp:Button ID="home" runat="server" Text="HOME" CssClass="buttons" OnClick="gotohome" />
            </li>
            <li>
                <asp:Button ID="logout" runat="server" Text="LOGOUT" CssClass="buttons" OnClick="log_out" />
            </li>
        </ul>
    </form>
</body>
</html>