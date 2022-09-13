using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineOrderWebApplication
{
    public partial class MyAccount : System.Web.UI.Page
    {
        int custID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //TEMPORARY
            //custID = 1;
            //Session["CustID"] = custID;
            //Session["CustFName"] = "Muhamad";
            //Session["CustLName"] = "Ashraff";
            //Session["CustEmail"] = "ashraff@email.com";

            if(Session["CustID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            custID = Convert.ToInt32(Session["CustID"]);
            Label1.Text = Session["CustID"].ToString();

            Label1.Text = Session["CustID"].ToString();

            if (!IsPostBack)
            {
                LoadTextBoxInfo();
            }
        }

        private void LoadTextBoxInfo()
        {
            String sql = @"SELECT tblAddress.houseNo, tblAddress.streetName, tblAddress.city, tblAddress.postcode, tblAddress.state, 
            tblCustomer.custFirstName, tblCustomer.custLastName, tblCustomer.custPhone, tblCustomer.custEmail, tblCustomer.custUsername
            FROM tblAddress
            INNER JOIN tblCustomer ON tblCustomer.custID = tblAddress.custID
            WHERE tblAddress.custID = @custID";

            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@custID", custID);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {//Items Found
                Object objhouseNo = dt.Rows[0]["houseNo"];
                Object objstreet = dt.Rows[0]["streetName"];
                Object objcity = dt.Rows[0]["city"];
                Object objpostcode = dt.Rows[0]["postcode"];
                Object objstate = dt.Rows[0]["state"];
                Object objFname = dt.Rows[0]["custFirstName"];
                Object objLname = dt.Rows[0]["custLastName"];
                Object objPhone = dt.Rows[0]["custPhone"];
                Object objEmail = dt.Rows[0]["custEmail"];
                Object objUsername = dt.Rows[0]["custUsername"];

                txtFname.Text = objFname.ToString();
                txtLname.Text = objLname.ToString();
                txtEmail.Text = objEmail.ToString();
                txtPhone.Text = objPhone.ToString();
                txtHouseno.Text = objhouseNo.ToString();
                txtStreet.Text = objstreet.ToString();
                txtCity.Text = objcity.ToString();
                txtPostcode.Text = objpostcode.ToString();
                txtState.Text = objstate.ToString();

            }
            else
            {
                txtFname.Text = "";
                txtLname.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtHouseno.Text = "";
                txtStreet.Text = "";
                txtCity.Text = "";
                txtPostcode.Text = "";
                txtState.Text = "";
                getCustomer();
            }
        }


        private void getCustomer() {
            String sql = @"SELECT * FROM tblCustomer
             WHERE custID = @custID";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@custID", custID);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {//Items Found
                Object objFname = dt.Rows[0]["custFirstName"];
                Object objLname = dt.Rows[0]["custLastName"];
                Object objPhone = dt.Rows[0]["custPhone"];
                Object objEmail = dt.Rows[0]["custEmail"];

                txtFname.Text = objFname.ToString();
                txtLname.Text = objLname.ToString();
                txtEmail.Text = objEmail.ToString();
                txtPhone.Text = objPhone.ToString();


            }
            else
            {
                txtFname.Text = "";
                txtLname.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";

            }





        }

        private void updateCustomer() {
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);

            String sql = @"UPDATE tblCustomer
                        SET custFirstName = @custFname, custLastName = @custLname, custEmail = @custEmail, custPhone = @custPhone
                        WHERE custID = @custID";

            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@custID", custID);
            cmd.Parameters.AddWithValue("@custFname", txtFname.Text);
            cmd.Parameters.AddWithValue("@custLname", txtLname.Text);
            cmd.Parameters.AddWithValue("@custEmail", txtEmail.Text);
            cmd.Parameters.AddWithValue("@custPhone", txtPhone.Text);


            try
            {
                // Open connection
                conn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {

            }
            finally
            {
                conn.Close();
            }//END TRY-CATCH


        }

        private Boolean checkAddress() {

            String sql = @"SELECT * FROM tblAddress
            WHERE custID = @custID";

            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@custID", custID);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {//Items Found
                return true;
            }
            else
            {
                return false;
            }

        }


        private void updateAddress()
        {
            String sql = @"UPDATE tblAddress
            SET  houseNo = @houseNo, streetName = @street, city = @city, postcode = @postcode, state = @state
            WHERE custID = @custID";

            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@custID", custID);
            cmd.Parameters.AddWithValue("@houseNo", txtHouseno.Text);
            cmd.Parameters.AddWithValue("@street", txtStreet.Text);
            cmd.Parameters.AddWithValue("@city", txtCity.Text);
            cmd.Parameters.AddWithValue("@postcode", txtPostcode.Text);
            cmd.Parameters.AddWithValue("@state", txtState.Text);

            try
            {
                // Open connection
                conn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {

            }
            finally
            {
                conn.Close();
            }//END TRY-CATCH

        }

        private void insertAddress()
        {
            String sql = @"INSERT INTO tblAddress (custID, houseNo, streetName, city, postcode, state)
                           VALUES (@custID, @houseNo, @streetName, @city, @postcode, @state)";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@custID", custID);
            cmd.Parameters.AddWithValue("@houseNo", txtHouseno.Text);
            cmd.Parameters.AddWithValue("@streetName", txtStreet.Text);
            cmd.Parameters.AddWithValue("@city", txtCity.Text);
            cmd.Parameters.AddWithValue("@postcode", txtPostcode.Text);
            cmd.Parameters.AddWithValue("@state", txtState.Text);

            try
            {
                // Open connection
                conn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {

            }
            finally
            {
                conn.Close();
            }//END TRY-CATCH


        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            updateCustomer();

            if (checkAddress()) {
                //Address found in database, update address
                updateAddress();
            }
            else
            {
                //Insert new address
                insertAddress();
            }

            
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "saveModal();", true);
        }
    }
}