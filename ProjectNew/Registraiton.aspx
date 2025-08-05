using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDB
{
    public partial class Registraiton : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 2014; i > 1910; i--)
            {
                DdlYear.Items.Add(i.ToString());
            }
        }
        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            string username = TxtUsername.Text;
            string password = TxtPassword.Text;
            string firstname = TxtFirstName.Text;
            string lastname = TxtLastName.Text;
            string email = TxtEmail.Text;
            string address = TxtAddress.Text;
            int year = int.Parse(DdlYear.SelectedValue);


            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string strCheckUsername = $"SELECT count(*) FROM UsersTbl WHERE username='{username}'";

            //create the connection
            using (SqlConnection connection = new SqlConnection(connectionString)) 
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(strCheckUsername, connection);

                //check if username exists
                if ((int)sqlCommand.ExecuteScalar() > 0)
                {
                    lblMessage.Text = "The username already exists";
                    return;
                }
            }
            string cmdInsertString = $"INSERT INTO UsersTbl values ('{ username}','{password}','{email}','{firstname}','{lastname}', {year},'{address}')";

            //create the connection
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(cmdInsertString, connection);
                //execute query
                sqlCommand.ExecuteNonQuery();


            }
            Response.Redirect("TevaGallery.aspx");
            

        }
    }
}
