using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace OnlineOrderWebApplication
{
    public partial class Login : System.Web.UI.Page
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String sql = @"SELECT * FROM tblCustomer WHERE custEmail = @email OR custUsername = @email";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Username found
                Object objCustID = dt.Rows[0]["custID"];
                Object objCustFName = dt.Rows[0]["custFirstName"];
                Object objCustLName = dt.Rows[0]["custLastName"];
                Object objCustEmail = dt.Rows[0]["custEmail"];
                Object objPasswordHash = dt.Rows[0]["custPass"];
                string password = txtPassword.Text;
                string storedPasswordHash = objPasswordHash.ToString();

                PBKDF2Hash hash = new PBKDF2Hash(password, storedPasswordHash);
                bool check = hash.PasswordCheck;
                if (check == true)
                {
                    //Password correct
                    Session["CustID"] = objCustID;
                    Session["CustFName"] = objCustFName;
                    Session["CustLName"] = objCustLName;
                    Session["CustEmail"] = objCustEmail;

                    Label1.Text = " <b>Login successful.</b> Redirecting to menu page...";
                    Label2.Text = Label1.Text;
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "showAlertSuccess();", true);
                    txtEmail.Enabled = false;
                    txtPassword.Enabled = false;
                    btnLogin.Enabled = false;
                    Response.AddHeader("REFRESH", "3;URL=Menu.aspx");

                }
                else
                {
                    //Password incorrect
                    Label1.Text = "Username or password incorrect. Please try again !";
                    Label2.Text = Label1.Text;
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "showAlert();", true);
                }

                
            }
            else{

                if (adminLogin()) {
                    Response.Redirect("Admin/Dashboard.aspx");
                }
                else
                {
                    //Username not found
                    Label1.Text = "No registered account found ! <a class=\"text-danger\" href=\"Register.aspx\"><u>Register new account ?</u></a>";
                    Label2.Text = Label1.Text;
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "showAlert();", true);

                }




            }//END IF

        }//END METHOD



        private Boolean adminLogin() {

            String sql = @"SELECT * FROM tblAdmin
            WHERE adminUser = @email";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Object objadminID = dt.Rows[0]["Id"];
                Object objadminName = dt.Rows[0]["adminName"];
                Object objPasswordHash = dt.Rows[0]["adminPass"];
                string password = txtPassword.Text;
                string storedPasswordHash = objPasswordHash.ToString();
                PBKDF2Hash hash = new PBKDF2Hash(password, storedPasswordHash);
                bool check = hash.PasswordCheck;
                if (check == true)
                {
                    Session["AdminID"] = objadminID.ToString();
                    Session["AdminName"] = objadminName.ToString();
                    Response.Redirect("Admin/Dashboard.aspx");
                    return true;
                    
                }
                else
                {
                    //Password incorrect
                    return false;
                }

                
            }
            else {
                return false;
            }




        }



    }
}