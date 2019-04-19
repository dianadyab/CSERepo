<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CSERepo.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="stylesheets/navbar.css" rel="stylesheet" />
    <link href="stylesheets/StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <ul>
        <li><a class="active" href="Register.aspx">SIGN UP</a></li>
  <li><a href="photoes.aspx">PHOTOES</a></li>
        
        

 
          <li><a href="about.aspx">ABOUT</a></li>
        
        <li><a href="Login.aspx">SIGN IN</a></li>
      
   </ul>
    <div class="login-page">
  <div class="form">
    <form class="register-form">
      <p class="message">&nbsp;</p>
    </form>
    <form class="login-form" runat="server">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Firstname is required" ControlToValidate="firstname" ForeColor="#4CAF50"></asp:RequiredFieldValidator>
        <asp:TextBox ID="firstname" runat="server" type="text" placeholder="Firstname" CssClass="input"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Lastname is required" ControlToValidate="lastname" ForeColor="#4CAF50"></asp:RequiredFieldValidator>
        <asp:TextBox ID="lastname" runat="server" type="text" placeholder="Lasttname" CssClass="input"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is required" ControlToValidate="email" ForeColor="#4CAF50"></asp:RequiredFieldValidator>
        <asp:TextBox ID="email" type="text" placeholder="Email" CssClass="input" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Major is required" ControlToValidate="DropDownList1" ForeColor="#4CAF50"></asp:RequiredFieldValidator>
        <asp:DropDownList ID="DropDownList1" CssClass="input" runat="server">
            <asp:ListItem>CSE</asp:ListItem>
            <asp:ListItem Value="TCE">TCE</asp:ListItem>
            <asp:ListItem>MMT</asp:ListItem>
            <asp:ListItem>CIT</asp:ListItem>
            <asp:ListItem>CS</asp:ListItem>
            <asp:ListItem>GIS</asp:ListItem>
        </asp:DropDownList>
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password is required" ControlToValidate="password" ForeColor="#4CAF50"></asp:RequiredFieldValidator>
        <asp:TextBox ID="password" runat="server" type="password" placeholder="Password" CssClass="input"></asp:TextBox>
      
      <asp:Button ID="create" runat="server" Text="Sign up" CssClass="input" BackColor="#4CAF50" OnClick="create_Click" ForeColor="White" />
      <p class="message">Already registered <a href="Login.aspx">sign in</a></p>
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </form>
  </div>
</div>
</body>
</html>
