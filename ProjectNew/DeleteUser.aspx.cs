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
    public partial class DeleteUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string commandDeleteStr = $"DELETE FROM UsersTbl WHERE Username='{Session["updateuser"]}'";
            if (Session["category"] != "user" && Session["category"] != "admin")
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["category"] == "user")
            {
                Application.Lock();
                if (Application["Singedin"] == null)
                {
                    Application["Singedin"] = 0;
                }
                int curr = (int)Application["Singedin"];
                curr--;
                Application["Singedin"] = curr;
                Application.UnLock();
                commandDeleteStr = $"DELETE FROM UsersTbl WHERE Username='{Session["username"]}'";
                 Session.Abandon();
            }
            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(commandDeleteStr, connection);
                sqlCommand.ExecuteNonQuery();
            }
            Response.Redirect("AdminPage.aspx");
        }
    }
}