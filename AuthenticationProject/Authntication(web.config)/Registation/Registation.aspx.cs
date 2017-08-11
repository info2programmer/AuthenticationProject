using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;

namespace AuthenticationProject.Authntication_web.config_.Registation
{
    public partial class Registation : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["cnnstring"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
    
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                SqlConnection con = new SqlConnection(ConnectionString);
                if (checkEmail() != true)
                {
                    lblMessage.Text = "Email Alrady Exisit";
                }
                else
                {
                    string EncPasword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");
                    SqlCommand cmd = new SqlCommand("INSERT INTO tbl_Users (Name, Email, Password) VALUES('"+txtEmail.Text+"','"+txtEmail.Text+"','"+EncPasword+"')",con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Registation Sucessfully');</script>");
                }
                
            }
        }

        private bool checkEmail()
        {
            int Count = 0;
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT Email FROM tbl_Users WHERE Email='"+txtEmail.Text+"'",con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Count++;
            }
            con.Close();
            if (Count == 0)
            {
                return true;
            }

            else
            {
                return false;
            }

        }

    }
}