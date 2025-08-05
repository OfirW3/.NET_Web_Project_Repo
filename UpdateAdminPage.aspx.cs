using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectNew
{
    public partial class UpdateAdminPage : System.Web.UI.Page
    {
        private DataSet dataSet = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["category"] != "admin")
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
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string commandUserString = "SELECT * FROM UsersTbl WHERE Username = '" + Session["updateuser"] + "'";

            using (SqlConnection connection = new SqlConnection(connectionString)) // אם הצליח לפתוח את הקשר למסד הנתונים תמשיך הלאה
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(commandUserString, connection); // פעולה שמקבלת את השאילתא והחיבור למסד הנתונים
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand); // מבטא את המתאם בין מסד הנתונים 
                adapter.Fill(dataSet); // ממלא את הטבלה - נותן לה ערכים
            }
            ShowUserData();
        }
        public void ShowUserData()
        {
            foreach (DataRow row in dataSet.Tables[0].Rows)
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

            string commandUpdateStr = "UPDATE UsersTbl SET Password='" + password + "', Firstname='" + firstname + "', Lastname='" + lastname + "', Email='" + email + "', YearOfBirth='" + birthyear + "', Address = '" + Address + "' WHERE Username='" + Session["updateuser"] + "';";
            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(commandUpdateStr, connection); // פעולה שמקבלת את השאילתא והחיבור למסד הנתונים
                sqlCommand.ExecuteNonQuery(); // גם מבצע את הפעולה וגם שולח מספר של איזה שורה זה קרה
            }
            Response.Redirect("AdminPage.aspx");
        }
        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateAdminPage.aspx");
        }
        protected bool isConfirmed = false;

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("DeleteUser.aspx");
     
        }
    }
}
