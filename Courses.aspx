<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="CSERepo.Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="stylesheets/navbar.css" rel="stylesheet" />
    <link href="stylesheets/StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <ul>
        <li><a class="active" href="Courses">COURSES</a></li>
        <li><a href="Home.aspx">HOME</a></li>
        <li><a href="changepassword.aspx">CHANGE MY PASSWORD</a></li>
        <li><a href="privphoto.aspx">PHOTOES</a></li>
        
        <li><a href="projects.aspx">PROJECTS</a></li>
        

        <li><a href="contact.aspx">CONTACT</a></li>
        
        
        

       
        <li><a href="Logout.aspx">SIGN OUT</a></li>
   </ul>
    <div class="login-page">
  <div class="form">
    <form class="login-form" runat="server">
        
       
        <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="courseName" DataValueField="courseId" CssClass="input" BackColor="#4CAF50" ForeColor="White"></asp:DropDownList>
         
        
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="input" Height="96px" Width="275px">
<Columns>
    
    <asp:BoundField DataField="courseName" HeaderText="Course name" />
    <asp:BoundField DataField="instructor" HeaderText="instructor" />
   
    <asp:BoundField DataField="year" HeaderText="year" />
    
    <asp:TemplateField ItemStyle-HorizontalAlign = "Center">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="GridView1_SelectedIndexChanged"
                    CommandArgument='<%# Eval("FileId") %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
                
           
</Columns>
</asp:GridView>
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>

  </div>
</div>
        
  
 
        


     




        
     
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentConnection %>" SelectCommand="SELECT [courseId], [courseName], [instructor], [desc], [year] FROM [Course]"></asp:SqlDataSource>
       
        
       
      
        </form>
</body>
</html>
