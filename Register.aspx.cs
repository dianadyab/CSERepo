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
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection conn1;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void create_Click(object sender, EventArgs e)
        {
            try
            {
                conn1 = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Bisan Co\Desktop\final web project\CSERepo\CSERepo\App_Data\CSErebo.mdf;Integrated Security=True");
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandType = CommandType.Text;


                cmd1.CommandText = "insert into [Student](Firstname,Lastname,Email,Major,Password) values('" + firstname.Text + "','" + lastname.Text + "','" + email.Text + "','" + DropDownList1.SelectedValue + "','" + password.Text + "')";
                cmd1.Connection = conn1;
                conn1.Open();
                cmd1.ExecuteNonQuery();
                
                Label1.Text = "Done Successfully!!";
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