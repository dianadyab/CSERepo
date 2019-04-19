<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CSERepo.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="stylesheets/navbar.css" rel="stylesheet" />
    <link href="stylesheets/StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <ul>
        <li><a class="active" href="Home.aspx">HOME</a></li>
        <li><a href="Changepassword.aspx">CHANGE MY PASSWORD</a></li>
         <li><a href="privphoto.aspx">PHOTOES</a></li>
        <li><a href="Courses.aspx">COURSES</a></li>
        <li><a href="projects.aspx">PROJECTS</a></li>
        

        <li><a href="contact.aspx">CONTACT</a></li>
        
        
        

       
        <li><a href="Logout.aspx">SIGN OUT</a></li>
   </ul>
   <div class="login-page">
  <div class="form">
    <form class="login-form" runat="server">
        <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" GroupName="choice" OnCheckedChanged="RadioButton1_CheckedChanged" CssClass="input" BackColor="White" /><i class="message" style="color: #008000; font-size: large; font-weight: bold;">UPLOAD</i>
        <br />
     <br />
         <br />
        <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" GroupName="choice" OnCheckedChanged="RadioButton2_CheckedChanged" CssClass="input" ForeColor="White" BackColor="White"/><i class="message" style="color: #008000; font-size: large; font-weight: bold;">SEARCH</i>
   
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="courseName" DataValueField="courseId" Visible="False" CssClass="input" BackColor="#4CAF50" ForeColor="White" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        <br />
         <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" CssClass="input" BackColor="#4CAF50" />
        <br />         <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" Visible="False" CssClass="input" BackColor="#4CAF50" ForeColor="White"/>
        <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="courseName" DataValueField="courseId" Visible="False" CssClass="input" BackColor="#4CAF50" ForeColor="White"></asp:DropDownList>
         
        
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
