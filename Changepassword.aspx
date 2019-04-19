<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Changepassword.aspx.cs" Inherits="CSERepo.Changepassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="stylesheets/navbar.css" rel="stylesheet" />
    <link href="stylesheets/StyleSheet1.css" rel="stylesheet" />
</head>
<body>
     <ul>
        
        <li><a class="active" href="Changepassword.aspx">CHANGE MY PASSWORD</a></li>
         <li><a  href="Home.aspx">HOME</a></li>
         <li><a href="privphoto.aspx">PHOTOES</a></li>
        <li><a href="Courses.aspx">COURSES</a></li>
        <li><a href="projects.aspx">PROJECTS</a></li>
        

        <li><a href="contact.aspx">CONTACT</a></li>
        
        
        

       
        <li><a href="Logout.aspx">SIGN OUT</a></li>
   </ul>
    <div>
    <div class="login-page">
  <div class="form">
    <form class="register-form">
      <p class="message"></p>
    </form>
    <form class="login-form" runat="server">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="New Password is required" ControlToValidate="newpassword" ForeColor="#4CAF50"></asp:RequiredFieldValidator>
        <asp:TextBox ID="newpassword" type="password" placeholder="New Password" CssClass="input" runat="server"></asp:TextBox> 
        <asp:Button ID="change" runat="server" Text="Change" CssClass="input" BackColor="#4CAF50" OnClick="change_Click" ForeColor="White"/>
        <asp:Label ID="Label1" runat="server" ForeColor="#4CAF50"></asp:Label>
    </form>
  </div>
</div>
    </div>
</body>
</html>
