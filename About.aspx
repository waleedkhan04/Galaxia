<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Database_Project.About" %>

<!DOCTYPE html>



<style draggable="2">
title{
    color:black;
}
body {
    background-image: url("./Data/0.png");
    background-color:black;
    background-repeat: no-repeat;
    background-size: 100%
}
p {
    max-width: 800px;
    margin: 0 auto;
}   
#play-pause:hover {
    filter: drop-shadow(0px 0px 20px rgb(200,200,200));
}
#play-pause {
    background: transparent;
    border: none;
    outline: none;
    cursor: pointer;
    position: absolute;
}
#play-image {
    display: block;
    width: 90px;
    height: 90px;
}
#pause-image {
    display: none;
    width: 90px;
    height: 90px;
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
    <title>About Us</title>
</head>
<body>
    <form runat="server" style="position:relative;top:-40px">
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
    </form>




    <h1 class="titletext" style="top:590px;right:50px">
        WHO WE ARE -
        <button id="play-pause">
            <img id="play-image" src="./Data/unmute1.png" alt="Play">
            <img id="pause-image" src="./Data/mute.gif" alt="Pause">
        </button>
        
    </h1>
    <p style="color:white;font:lighter 20px Gilroy;position:relative;top:590px;text-align:center">Welcome to our innovative space exploration agency! We are a team of passionate individuals who are dedicated to pushing the boundaries of space exploration and expanding humanity's understanding of the universe.
    Our agency was founded with a simple goal in mind: to explore the unknown and pave the way for future generations to venture further into space. Our team of scientists, engineers, and space enthusiasts is committed to developing new technologies, conducting groundbreaking research, and executing ambitious missions that advance our understanding of the cosmos.
    We believe that space exploration is essential for the future of humanity, and we are dedicated to making it accessible to everyone. Whether we're launching new spacecraft, studying the cosmos with powerful telescopes, or collaborating with other space agencies around the world, we're always pushing the limits of what's possible.
    Our agency is also committed to education and outreach, and we work tirelessly to inspire the next generation of space explorers. We offer educational programs, internships, and other opportunities for young people to learn about space science and engineering, and we're always looking for new ways to engage with the public and share our passion for space exploration.
    At our innovative space exploration agency, we are constantly striving to push the boundaries of what we know about the universe. Join us on our journey as we explore new worlds, study the cosmos, and unlock the secrets of the universe. Together, we can inspire a new generation of space explorers and continue to push the limits of human knowledge and understanding.</p>

    <audio id="sound" src="./Data/sound2.ogg"></audio>

    <div id="footer" class="footer" style="top:750px; height:125px; position:relative;">
       <a href="Homepage.aspx" style="color:transparent"><img alt="Galaxia" src="./Data/main logo transparent.png" style="position: relative; left:40px; height:120px"/> </a>
       <h1 style="position: relative; width:1000px; bottom:130px; left: 200px; font:lighter 28px Gilroy; color: white">ABOUT US</h1>
       <div style="position: relative; width:1000px; bottom:133px ; left: 200px; font: lighter 12px Gilroy; color: white">We travel through stars and galaxies because we can!</div>
    </div>


    <script>
        var sound = document.getElementById("sound");
        sound.volume = 1;
        var playPauseButton = document.getElementById("play-pause");
        var playImage = document.getElementById("play-image");
        var pauseImage = document.getElementById("pause-image");

        // play pause button
        playPauseButton.addEventListener("click", function () {
            if (sound.paused) {
                sound.play();
                playImage.style.display = "none";
                pauseImage.style.display = "block";
            } else {
                sound.pause();
                playImage.style.display = "block";
                pauseImage.style.display = "none";
            }
        });
    </script>
</body>
</html>