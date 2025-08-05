using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectNew
{
    public partial class TikTakToe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["category"] != "user" && Session["category"] != "admin")
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}