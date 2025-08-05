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
                DdlYear.Items.Add(i.ToString()); // Adding years to the DDLYear - YearOfBirth
            }
        }
        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            //Each representing the text or selected value of the lables or DDLs in the registration page
            string username = TxtUsername.Text;
            string password = TxtPassword.Text;
            string firstname = TxtFirstName.Text;
            string lastname = TxtLastName.Text;
            string email = TxtEmail.Text;
            string address = TxtAddress.Text;
            int year = int.Parse(DdlYear.SelectedValue);

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; // Makes a string which contains addresses which are needed to create connection with the DB
            string strCheckUsername = $"SELECT count(*) FROM UsersTbl WHERE username='{username}'";

            // Creates an object of SqlConnection which makes the connection with the DB more easy
            using (SqlConnection connection = new SqlConnection(connectionString)) 
            {
                connection.Open(); // Establishing the connection with the DB
                SqlCommand sqlCommand = new SqlCommand(strCheckUsername, connection); // Prepares the database for an execution and tells the database what query will be applied and where it will

                // Executes the query and checks if the username already exists
                if ((int)sqlCommand.ExecuteScalar() > 0) 
                {
                    lblMessage.Text = "The username already exists";
                    return;
                }
            }
            string cmdInsertString = $"INSERT INTO UsersTbl values ('{ username}','{password}','{firstname}','{lastname}','{email}', {year},'{address}')";

            // Creates an object of SqlConnection which makes the connection with the DB more easy
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open(); // Establishing the connection with the DB
                SqlCommand sqlCommand = new SqlCommand(cmdInsertString, connection); // Prepares the database for an execution and tells the database what query will be applied and where it will
                // Executes the query and also return the number of changed rows
                sqlCommand.ExecuteNonQuery();


            }
            Response.Redirect("Lavnon.aspx");
            

        }
    }
}
