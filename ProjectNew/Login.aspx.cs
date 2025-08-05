
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectNew
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["category"] != null)
            {
                Response.Redirect("Lavnon.aspx");
            }

        }
        protected void BtnLogin_Click(object sender, EventArgs e)
        {

            string username = TxtUsername.Text;
            string password = TxtPassword.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string strCheckUsernameAndPassword = $"SELECT count(*) FROM UsersTbl WHERE username = '{username}'and password = '{password}'";

            //create the connection
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(strCheckUsernameAndPassword, connection); // .מחלקה שעובדת על ביצוע פעולות על מסד הנתונים. היא צריכה את השאילתה והחיבור למסד הנתונים

                //check if username exists
                if ((int)sqlCommand.ExecuteScalar() == 1)
                {
                    Response.Write("<script>alert('Seccessful Login!')</script>");
                    Session["username"] = username;
                    Session["category"] = "user";
                    Application.Lock();
                    if (Application["Singedin"] == null)
                    {
                        Application["Singedin"] = 0;
                    }
                    int curr = (int)Application["Singedin"];
                    curr++;
                    Application["Singedin"] = curr;
                    Application.UnLock();
                    Response.Redirect("Lavnon.aspx");
                }

                else if (username == "" || password == "")
                {
                    lblMessage.Text = "Please fill both fields!";
                }
                else
                {
                    lblMessage.Text = "Username or password are incorrct!";
                }
                if (username == "Ofir1" && password == "12345")
                {
                    //סשן הוא משתנה גלובלי פר משתמש כי משתמש רגיל רק לדף אחד וסשן לכל הדפים הוא נמחק אחרי 20 דקות
                    Session["category"] = "admin";
                    Application.Lock();
                    if (Application["Singedin"] == null)
                    {
                        Application["Singedin"] = 0;
                    }
                    int curr = (int)Application["Singedin"];
                    curr++;
                    Application["Singedin"] = curr;
                    Application.UnLock();
                    Response.Redirect("AdminPage.aspx");
                }
            }
        }
    }
}

