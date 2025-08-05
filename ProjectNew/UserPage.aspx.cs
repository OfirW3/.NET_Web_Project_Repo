using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectNew
{
    public partial class UserPage : System.Web.UI.Page
    {
        private DataSet dataSet = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["category"] != "user")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    for (int i = 2012; i >= 1914; i--)
                    {
                        DdlYear.Items.Add(i.ToString());
                    }
                    UserStr();
                }
            }

        }
        public void UserStr()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; // Makes a string which contains addresses which are needed to create connection with the DB
            string commandUserString = "SELECT * FROM UsersTbl WHERE Username = '" + Session["username"] + "'";

            using (SqlConnection connection = new SqlConnection(connectionString)) // אם הצליח לפתוח את הקשר למסד הנתונים תמשיך הלאה
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(commandUserString, connection); // פעולה שמקבלת את השאילתא והחיבור למסד הנתונים
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand); // Bridges with the Database and Dataset 
                adapter.Fill(dataSet); // Fills the dataset according the query
            }
            ShowUserData();
        }

        public void ShowUserData()
        {
            foreach (DataRow row in dataSet.Tables[0].Rows) // Takes the elements from the database and Texts it visually
            {
                TxtPassword.Text = row["Password"].ToString();
                TxtFirstName.Text = row["FirstName"].ToString();
                TxtLastName.Text = row["LastName"].ToString();
                TxtEmail.Text = row["Email"].ToString();
                TxtAddress.Text = row["Address"].ToString();
                DdlYear.SelectedValue = row["YearOfBirth"].ToString();
            }
        }
        protected void BtnUserUpdate_Click(object sender, EventArgs e)
        {
            string password = TxtPassword.Text;
            string firstname = TxtFirstName.Text;
            string lastname = TxtLastName.Text;
            string email = TxtEmail.Text;
            string Address = TxtAddress.Text;
            int birthyear = int.Parse(DdlYear.SelectedValue);

            string commandUpdateStr = "UPDATE UsersTbl SET Password='" + password + "', Firstname='" + firstname + "', Lastname='" + lastname + "', Email='" + email + "', YearOfBirth='" + birthyear + "', Address = '" + Address + "' WHERE Username='" + Session["username"] + "';";
            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString; // Makes a string which contains addresses which are needed to create connection with the DB

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(commandUpdateStr, connection); // פעולה שמקבלת את השאילתא והחיבור למסד הנתונים
                sqlCommand.ExecuteNonQuery(); // גם מבצע את הפעולה וגם שולח מספר של איזה שורה זה קרה
            }
            Response.Redirect("Lavnon.aspx");
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserPage.aspx");
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteUser.aspx");
        }

    }
}
