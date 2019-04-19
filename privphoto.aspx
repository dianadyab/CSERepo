<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="privphoto.aspx.cs" Inherits="CSERepo.privphoto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="stylesheets/StyleSheet1.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link href="stylesheets/navbar.css" rel="stylesheet" />
   
</head>
<body>
     <ul>
         <li><a class="active" href="privphoto.aspx">PHOTOES</a></li>
        <li><a  href="Home.aspx">HOME</a></li>
        <li><a href="Changepassword.aspx">CHANGE MY PASSWORD</a></li>
         
        <li><a href="Courses.aspx">COURSES</a></li>
        <li><a href="projects.aspx">PROJECTS</a></li>
        

        <li><a href="contact.aspx">CONTACT</a></li>
        
        
        

       
        <li><a href="Logout.aspx">SIGN OUT</a></li>
   </ul>
    <form id="form1" runat="server">
  <h2 class="w3-center">&nbsp;</h2>

<div class="w3-content w3-section" style="max-width:500px">
  <img class="mySlides" src="showimage/p3.jpg" style="width:100%"/>
  <img class="mySlides" src="showimage/p4.jpg" style="width:100%"/>
  <img class="mySlides" src="showimage/p5.jpg" style="width:100%"/>
    <img class="mySlides" src="showimage/p6.jpg" style="width:100%"/>
     <img class="mySlides" src="showimage/p7.jpg" style="width:100%"/>
</div>

<script>
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) { myIndex = 1 }
        x[myIndex - 1].style.display = "block";
        setTimeout(carousel, 2000); // Change image every 2 seconds
    }
</script>
    </form>
</body>
</html>
