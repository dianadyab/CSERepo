using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace CSERepo
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            DropDownList1.Visible = true;
            FileUpload1.Visible = true;

            btnUpload.Visible = true;
            DropDownList2.Visible = false;
            GridView1.Visible = false;
            lblMessage.Visible = true;

        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            DropDownList1.Visible = false;
            FileUpload1.Visible = false;

            btnUpload.Visible = false; ;
            DropDownList2.Visible = true;
            GridView1.Visible = true;
            lblMessage.Visible = false;

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            try
            {
                // Read the file and convert it to Byte Array

                string filePath = FileUpload1.PostedFile.FileName;

                string filename = Path.GetFileName(filePath);

                string ext = Path.GetExtension(filename);

                string contenttype = String.Empty;

                switch (ext)
                {

                    case ".doc":

                        contenttype = "application/vnd.ms-word";

                        break;

                    case ".docx":

                        contenttype = "application/vnd.ms-word";

                        break;

                    case ".xls":

                        contenttype = "application/vnd.ms-excel";

                        break;

                    case ".xlsx":

                        contenttype = "application/vnd.ms-excel";

                        break;

                    case ".jpg":

                        contenttype = "image/jpg";

                        break;

                    case ".png":

                        contenttype = "image/png";

                        break;

                    case ".gif":

                        contenttype = "image/gif";

                        break;

                    case ".pdf":

                        contenttype = "application/pdf";

                        break;

                }

                if (contenttype != String.Empty)
                {



                    Stream fs = FileUpload1.PostedFile.InputStream;

                    BinaryReader br = new BinaryReader(fs);

                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);



                    //insert the file into database

                    string strQuery = "insert into [File](Name, ContentType, Data,courseId)" +

                       " values (@Name, @ContentType, @Data,@courseId)";

                    SqlCommand cmd = new SqlCommand(strQuery);

                    cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename;

                    cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value

                      = contenttype;

                    cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;
                    cmd.Parameters.AddWithValue("@courseId", DropDownList1.SelectedValue);

                    InsertUpdateData(cmd);

                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    lblMessage.Text = "File Uploaded Successfully";

                }

                else
                {

                    lblMessage.ForeColor = System.Drawing.Color.Red;

                    lblMessage.Text = "File format not recognised." +

                      " Upload Image/Word/PDF/Excel formats";

                }
            }
            catch (SqlException ee)
            {
                lblMessage.Text = ee.ToString();
            }
        }
        private Boolean InsertUpdateData(SqlCommand cmd)
        {

            
            string strConnString = ConfigurationManager.ConnectionStrings["StudentConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);

            cmd.CommandType = CommandType.Text;

            cmd.Connection = con;

            try
            {

                con.Open();

                cmd.ExecuteNonQuery();

                return true;

            }

            catch (Exception ex)
            {

                Response.Write(ex.Message);

                return false;

            }

            finally
            {

                con.Close();

                con.Dispose();

            }

        }


        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["StudentConnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("select FileId,Name,courseName,instructor,[desc],year,Data from Course inner join [File] on Course.courseId=[File].courseId where [File].courseId= @cid"))
                    {
                        cmd.Parameters.AddWithValue("cid", DropDownList2.SelectedValue);
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            cmd.Connection = con;
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                        }

                    }
                }




                GridView1.DataBind();
            }
            catch (SqlException ee)
            {
               lblMessage.Text = ee.Message.ToString();
            }
        }

       
         protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
    int id = int.Parse((sender as LinkButton).CommandArgument);
    byte[] bytes;
    string fileName, contentType;
    string constr = ConfigurationManager.ConnectionStrings["StudentConnection"].ConnectionString;
    using (SqlConnection con = new SqlConnection(constr))
    {
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.CommandText = "select Name, Data, ContentType from [File] where FileId=@Id";

            cmd.Parameters.AddWithValue("@Id", id);
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                sdr.Read();
                bytes = (byte[])sdr["Data"];
                contentType = sdr["ContentType"].ToString();
                fileName = sdr["Name"].ToString();
            }
            con.Close();
        }
    }
    Response.Clear();
    Response.Buffer = true;
    Response.Charset = "";
    Response.Cache.SetCacheability(HttpCacheability.NoCache);
    Response.ContentType = contentType;
    Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
    Response.BinaryWrite(bytes);
    Response.Flush();
    Response.End();
}


        }

        }

        
    