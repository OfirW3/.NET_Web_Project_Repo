using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectNew
{
    public partial class AdminPage : System.Web.UI.Page
    {
        DataSet dataset = new DataSet(); // in-memory collection of data
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["category"] != "admin")
            {
                Response.Redirect("Login.aspx");
            }
            string commandUsrString = "Select * From UsersTbl";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand(commandUsrString, connection); // .מחלקה שעובדת על ביצוע פעולות על מסד הנתונים. היא צריכה את השאילתה והחיבור למסד הנתונים
                SqlDataAdapter adapter = new SqlDataAdapter(commandUsrString, connection);
                adapter.Fill(dataset);
                if (!IsPostBack)
                { 
                    ShowUserData(dataset);
                    DDlFilter.Items.Add("Username");
                    DDlFilter.Items.Add("Password");
                    DDlFilter.Items.Add("Firstname");
                    DDlFilter.Items.Add("Lastname");
                    DDlFilter.Items.Add("Email");
                    DDlFilter.Items.Add("YearOfBirth");
                    DDlFilter.Items.Add("Address");
                }

            }
        }
        public void ShowUserData(DataSet dataset)
        {
            LblShowUsers.Text = "<table style border = 1>";
            LblShowUsers.Text += "<tr> <th> Username </th> <th> Password </th> <th> FirstName </th> <th> LastName </th> <th> Email </th> <th> Year Of Birth </th> <th> Address </th> </tr>";
            foreach (DataRow row in dataset.Tables[0].Rows)
            {
                LblShowUsers.Text += "<tr>";
                LblShowUsers.Text += "<td>" + row["Username"].ToString() + "</td>";
                LblShowUsers.Text += "<td>" + row["Password"].ToString() + "</td>";
                LblShowUsers.Text += "<td>" + row["Firstname"].ToString() + "</td>";
                LblShowUsers.Text += "<td>" + row["Lastname"].ToString() + "</td>";
                LblShowUsers.Text += "<td>" + row["Email"].ToString() + "</td>";
                LblShowUsers.Text += "<td>" + row["YearOfBirth"].ToString() + "</td>";
                LblShowUsers.Text += "<td>" + row["Address"].ToString() + "</td>";
                LblShowUsers.Text += "</tr>";
                DDlUserUpdate.Items.Add(row["Username"].ToString());
            }
            LblShowUsers.Text += "</table>";
        }
        public void BtnFilter_Click(object sender, EventArgs e)
        {
            dataset.Clear();
            string SelectedFilter = DDlFilter.SelectedValue;
            string SelectedSearch = TxtFilter.Text;
            string commandUsrString;
            
            commandUsrString = $"SELECT * FROM UsersTbl Where {SelectedFilter}='{SelectedSearch}' ORDER BY {SelectedFilter}";


            using (SqlConnection connection = new SqlConnection(connectionString)) // יוצר חיבור למסד התנונים
            {
                connection.Open(); // הקשר פתוח
                SqlCommand sqlCommand = new SqlCommand(commandUsrString, connection); // פעולה שמקבלת את השאילתא והחיבור למסד הנתונים
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand); // מבטא את המתאם בין מסד הנתונים 
                adapter.Fill(dataset); // ממלא את הטבלה - נותן לה ערכים
                ShowUserData(dataset);
            }

        }
    
        public void SortBy()
        {
            string choice = DDlFilter.SelectedValue;
            string commandUserString = "SELECT * FROM UsersTbl ORDER BY '" + choice + "'";

            using (SqlConnection connection = new SqlConnection(connectionString)) // יוצר חיבור למסד התנונים
            {
                connection.Open(); // הקשר פתוח
                SqlCommand sqlCommand = new SqlCommand(commandUserString, connection); // פעולה שמקבלת את השאילתא והחיבור למסד הנתונים
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand); // מבטא את המתאם בין מסד הנתונים 
                adapter.Fill(dataset); // ממלא את הטבלה - נותן לה ערכים
                ShowUserData(dataset);
            }
        }
        protected void DDlSort_SelectedIndexChanged(object sender, EventArgs e) // Called when pressing sort button
        {
            dataset.Clear();
            SortBy();
        }
        public void Btn_Update(object sender, EventArgs e)
        {
            string choice = DDlUserUpdate.SelectedValue;
            Session["updateuser"] = choice;
            Response.Redirect("UpdateAdminPage.aspx");
        }


    }

}