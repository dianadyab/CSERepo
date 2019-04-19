using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace CSERepo
{
    public partial class Changepassword : System.Web.UI.Page
    {
        SqlConnection conn1;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["student"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void change_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["StudentConnection"].ConnectionString;
                conn1 = new SqlConnection(connStr);
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandType = CommandType.Text;
                Student s = (Student)Session["student"];

                cmd1.CommandText = "update [Student] set Password = '" + newpassword.Text + "' where Email ='" + s.Email + "'";
                cmd1.Connection = conn1;
                conn1.Open();
                int y = cmd1.ExecuteNonQuery();
                if (y == 1)
                {
                    
                    Label1.Text = "password has been changed successfully";
                }
                else
                {
                   
                    Label1.Text = "error changing password";
                }

            }
            catch (SqlException ee)
            {
                
                Label1.Text = ee.Message;
            }
            finally
            {
                conn1.Close();
            }
        }
    }
}