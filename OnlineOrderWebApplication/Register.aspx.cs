using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace OnlineOrderWebApplication
{
    public partial class Register : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustID"] != null)
            {
                Response.Redirect("Menu.aspx");
            }

            if (Session["AdminID"] != null)
            {
                Response.Redirect("Admin/Dashboard.aspx");
            }

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            checkexistingAccount();

        }//END METHOD

        public void checkexistingAccount()
        {
            String sql = @"SELECT * FROM tblCustomer WHERE custEmail = @email OR custUsername = @username";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0){

                //Email found
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "showAlert();", true);
                lblMessage.Text = "Email or username already exist in the system. <a class=\"text-danger\" href=\"Login.aspx\"><u>Log in ?</u></a>";

               
             }else{
                //Email not found
                registerAccount();


            }//END IF

            }

        public void registerAccount() {

            String password = txtConfirmPassword.Text;
            PBKDF2Hash hash = new PBKDF2Hash(password);
            String passwordHash = hash.HashedPassword;

            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);
            String sql = @"INSERT INTO tblCustomer (custUsername, custPass, custEmail, custFirstName, custLastName, custPhone )
            VALUES (@username, @password, @email, @firstname, @lastname, @phone)";
            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@password", passwordHash);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@firstname", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@lastname", txtLastName.Text);
            cmd.Parameters.AddWithValue("@phone", txtPhoneNumber.Text);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);
                ClientScript.RegisterStartupScript(this.GetType(), "downloadnewwin", "countdown();", true);
                Response.AddHeader("REFRESH", "5;URL=Login.aspx");

            }
            catch (SqlException ex)
            {
                Label1.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }//END TRY-CATCH


        }//END METHOD


    }
}