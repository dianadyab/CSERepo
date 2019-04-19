using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace CSERepo
{
    public partial class Login : System.Web.UI.Page
    {
        Student s;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void button_Click(object sender, EventArgs e)
        {
            try
            {
                string em = email.Text;
                string pass = password.Text;
                DataView view = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                view.RowFilter = "Email= '" + em + "'and Password= '" + pass + "'";
                if (view.Count > 0)
                {
                    DataRowView row = view[0];
                    Student s = new Student();
                    s.Id = Convert.ToInt32(row["StudentId"]);
                    s.Firstname = row["Firstname"].ToString();
                    s.Lastname = row["Lastname"].ToString();
                    s.Password = row["Password"].ToString();
                    s.Email = row["Email"].ToString();
                    s.Major = row["Major"].ToString();
                    Session["student"] = s;

                    Response.Redirect("Home.aspx");

                }
                else
                {
                   
                    Label1.Text = "Incorrect Email/Password";

                }


            }
            catch (SqlException ee)
            {
                
                Label1.Text = ee.Message;
            }
        }
    }
}