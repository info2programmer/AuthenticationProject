using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AuthenticationProject
{
    public partial class LoginDB : System.Web.UI.Page
    {

        int attempts;
        string ConnectionString = ConfigurationManager.ConnectionStrings["cnnstring"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //This Section Is Check RetryAttemps Set    
                if (ViewState["attempts"] != null)
                {
                    attempts = (int)ViewState["attempts"] + 1;
                    ViewState["attempts"] = attempts;
                }
                else
                {
                    ViewState["attempts"] = 1;
                }
            }
            else
            {
                ViewState["attempts"] = 1;
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            
            if (IsValid)
            {
                int count = 0;                
                string EncPass = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");
                SqlConnection con = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand("SELECT Name, Email, Password FROM tbl_Users WHERE Email='"+txtEmail.Text+"' AND Password='"+EncPass+"'",con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    count++;

                }
                con.Close();
                if (count > 1 || count==0)//This if block use to user is not valid
                {
                        if (userExist() == true)//This Section is use to Update Attempts in database
                        {
                            if ((int)ViewState["attempts"] <= 5)//this section lock account
                            {
                                attempts = 5 - (int)ViewState["attempts"];
                                lblMessage.Text = "You Have " + attempts.ToString() + " More Attempts";
                                if ((int)ViewState["attempts"] == 5)
                                {
                                    SqlCommand cmdLockUser = new SqlCommand("UPDATE tbl_Users SET IsLocked =1, LockedDatetime =" + DateTime.Now.ToShortDateString() + ", RetryAttemps = " + (int)ViewState["attempts"] + " WHERE (Email ='" + txtEmail.Text + "')", con);
                                    con.Open();
                                    cmdLockUser.ExecuteNonQuery();
                                    con.Close();
                                    lblMessage.Text = "Your Account Lock";
                                }

                            }
                        }
                        else
                        {
                            lblMessage.Text = "Enter Valid Email/Username And Password";
                        }
                }
                else//this section is use the username and password both are valid
                {
                    if (chreckUSerLock(txtEmail.Text) == 1)//use for check account is alrady lock or not
                    {
                        lblMessage.Text = "Your Account Is Locked,Pleace Contact Your Admin";
                    }
                    else
                    {
                        ViewState["attempts"] = 0;
                        FormsAuthentication.RedirectFromLoginPage(txtEmail.Text, chkRemember.Checked);
                    }
                }
            }
        }

        private int chreckUSerLock(string username)//this methord is use to check user alrady lock or not
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT IsLocked FROM  tbl_Users WHERE (Email ='"+username+"')", con);
            con.Open();
            int number =Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return number;
        }

        private bool userExist()//this methord is check user alrady exist or not
        {
            int count = 0;
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT Email FROM  tbl_Users WHERE (Email ='" + txtEmail.Text + "')", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                count++;
            }
            con.Close();
            if (count == 1)
                return true;
            else
                return false;
        }
    }
}