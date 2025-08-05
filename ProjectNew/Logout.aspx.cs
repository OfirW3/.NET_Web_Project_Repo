using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectNew
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["category"] != "user" || Session["category"] != "admin")
            {
                Response.Redirect("Login.aspx");
            }
            Application.Lock();
            if (Application["Singedin"] == null)
            {
                Application["Singedin"] = 0;
            }
            int curr = (int)Application["Singedin"];
            curr--;
            Application["Singedin"] = curr;
            Application.UnLock();
            Session.Abandon();
            Response.Redirect("Lavnon.aspx");
            // Difference between Application and Session: Application stores data that needs to be avilable to all users. Session stores data that only avilable per user and specific per user. And session is active for only 20 mintues after the user disconnects and Application is active until the web shuts down
        }
    }
}