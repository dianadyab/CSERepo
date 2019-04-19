<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CSERepo.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="stylesheets/StyleSheet1.css" rel="stylesheet" />
    <link href="stylesheets/navbar.css" rel="stylesheet" />
</head>
<body>
    <ul>
        <li><a class="active" href="Login.aspx">SIGN IN</a></li>
  <li><a href="photoes.aspx">PHOTOES</a></li>
        
       
       
       <li><a href="about.aspx">ABOUT</a></li>
  
       <li><a href="Register.aspx">SIGN UP</a></li>
      
        
       
   </ul>
    <div class="login-page">
  <div class="form">
    <form class="login-form" runat="server">
        <a href="#"><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>" SelectCommand="SELECT [StudentId], [Firstname], [Lastname], [Email], [Password], [Major] FROM [Student]"></asp:SqlDataSource>
          </a>
      <p class="message">
         
        </p>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage="Email is Required" ForeColor="#4CAF50"></asp:RequiredFieldValidator>
        <asp:TextBox ID="email" runat="server" type="text" placeholder="Email" CssClass="input"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required" ControlToValidate="password" ForeColor="#4CAF50"></asp:RequiredFieldValidator>
        <asp:TextBox ID="password" runat="server" type="password" placeholder="Password" CssClass="input"></asp:TextBox>
      
      <asp:Button ID="button" runat="server" Text="Sign in" BackColor="#4CAF50" CssClass="input" OnClick="button_Click" ForeColor="White" />
      <p class="message">Not registered? <a href="Register.aspx">Create an account</a></p>
        <asp:Label ID="Label1" runat="server" ForeColor="#4CAF50"></asp:Label>
    </form>
  </div>
</div>
</body>
</html>
