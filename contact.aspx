<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="CSERepo.contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="stylesheets/navbar.css" rel="stylesheet" />
    <link href="stylesheets/StyleSheet1.css" rel="stylesheet" />
</head>
<body>
     <ul>
         <li><a class="active"href="contact.aspx">CONTACT</a></li>
        <li><a  href="Home.aspx">HOME</a></li>
        <li><a href="Changepassword.aspx">CHANGE MY PASSWORD</a></li>
         <li><a href="privphoto.aspx">PHOTOES</a></li>
        <li><a href="Courses.aspx">COURSES</a></li>
        <li><a href="projects.aspx">PROJECTS</a></li>
        

        
        
        
        

       
        <li><a href="Logout.aspx">SIGN OUT</a></li>
   </ul>
      <div class="login-page">
  <div class="form">
    <form class="login-form" runat="server" visible="True">
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Message is required" ForeColor="#4CAF50" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="input" TextMode="MultiLine" Font-Italic="True" Font-Size="Large" placeholder="Enter your message" ForeColor="#4CAF50"></asp:TextBox>
      
      <asp:Button ID="button" runat="server" Text="Send Message" BackColor="#4CAF50" CssClass="input" OnClick="button_Click" ForeColor="White" />
     
        <asp:Label ID="Label1" runat="server" ForeColor="#4CAF50"></asp:Label>
    </form>
  </div>
</div>
</body>
</html>
