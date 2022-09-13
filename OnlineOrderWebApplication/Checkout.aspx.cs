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
    public partial class Checkout : System.Web.UI.Page
    {
        int custID = 0;
        String paymentSelect = null;

        Object objprodID;
        Object obprodQty;
        int orderID;

        static double subTotalAmount;
        protected void Page_Load(object sender, EventArgs e)
        {
            //TEMPORARY
            //custID = 1;
            //Session["CustID"] = custID;
            //Session["CustFName"] = "Muhamad";
            //Session["CustLName"] = "Ashraff";
            //Session["CustEmail"] = "ashraff@email.com";


            if (Session["CustID"] == null)
            {
                Response.Redirect("Login.aspx");
            }


            custID = Convert.ToInt32(Session["CustID"]);

            lblDate.Text = DateTime.Now.ToString("dd MMM yyyy");
            GetSubTotalAmount();
            getAddress();
            getcustDetails();




            if (!isItemAvailable())
            {
                Response.Redirect("Menu.aspx");
            }
            if (!Page.IsPostBack)
            {
                BindTime();
                
            }
        }

        private bool isItemAvailable()
        {
            String sql = @"SELECT * FROM tblCart WHERE custID = @custID";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@custID", custID);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Items Found
                return true;
            }
            else
            {
                //Items Not Found
                return false;
            }
        }

        private void BindTime()
        {
            int hrNow = int.Parse(DateTime.Now.ToString("HH"));
            int minNow = int.Parse(DateTime.Now.ToString("mm"));

            hrNow = hrNow + 1;

            String myHr = "00:00";

            if (hrNow < 10)
            {
                myHr = "0" + hrNow.ToString() + ":00";
            }
            else if (hrNow >= 10)
            {
                myHr = hrNow.ToString() + ":00";
            }



            // Set the start time (00:00 means 12:00 AM)
            DateTime StartTime = DateTime.ParseExact(myHr, "HH:mm", null);
            // Set the end time (23:55 means 11:55 PM)
            DateTime EndTime = DateTime.ParseExact("23:55", "HH:mm", null);
            //To set 1 hour interval
            TimeSpan Interval = new TimeSpan(0, 30, 0);           
            ddlTime.Items.Clear();
            while (StartTime <= EndTime)
            {
                ddlTime.Items.Add(StartTime.ToString("HH:mm"));
                StartTime = StartTime.Add(Interval);
            }
            ddlTime.Items.Insert(0, new ListItem("--Select--", "NoTime"));
        }


        private void GetSubTotalAmount()
        {
            //Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);

            //Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spGetSubTotalAmount", conn);

            //Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@customerid", custID);
            try
            {
                // Open connection
                conn.Open();

                var test = cmd.ExecuteScalar();
                subTotalAmount = Double.Parse(test.ToString());
                lblSubTotal.Text = "RM" + subTotalAmount.ToString("n2");
                calculateSummary();
            }
            catch (SqlException ex)
            {
                lblSubTotal.Text = "RM0.00";
                
            }
            catch (System.FormatException ex)
            {
                subTotalAmount = 0;
                lblSubTotal.Text = "RM" + subTotalAmount.ToString("n2");
                calculateSummary();
            }
            finally
            {
                conn.Close();
            }//END TRY-CATCH
        }

        private void getAddress()
        {

            String sql = @"SELECT * FROM tblAddress WHERE custID = @custID";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@custID", custID);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Items Found
                Object objhouseno = dt.Rows[0]["houseNo"];
                Object objstreet = dt.Rows[0]["streetName"];
                Object city = dt.Rows[0]["city"];
                Object postcode = dt.Rows[0]["postcode"];
                Object state = dt.Rows[0]["state"];
                lblAddress.Text = objhouseno.ToString() + ", " + objstreet.ToString() + "\n"
                    + city.ToString() + ", " + postcode.ToString() + "\n"
                    + state.ToString();
            }
            else
            {
                //Items Not Found
                lblAddress.Text = "Address not found";
                

            }
        }

        private void getcustDetails() {

            String sql = @"SELECT * FROM tblCustomer WHERE custID = @custID";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@custID", custID);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Items Found
                Object objfname = dt.Rows[0]["custFirstName"];
                Object objlname = dt.Rows[0]["custLastName"];
                Object objphone = dt.Rows[0]["custPhone"];

                lblName.Text = objfname.ToString() + " " + objlname.ToString();
                lblPhoneNo.Text = objphone.ToString();

            }
            else
            {
                //Items Not Found
                lblName.Text = "Not found";
                lblPhoneNo.Text = "Not found";

            }


        }



            private void calculateSummary()
        {
            double processFee, serviceTax, rounding, rounded, totalAmount;
            processFee = serviceTax = rounding = rounded = totalAmount = 0;


            if (subTotalAmount == 0)
            {
                processFee = 0.00;
            }
            else
            {
                processFee = 2.50;
            }
            serviceTax = subTotalAmount * 0.06;
            rounded = Math.Round((subTotalAmount + serviceTax + processFee) / 0.05) * 0.05;
            rounding = rounded - (subTotalAmount + serviceTax + processFee);

            lblProcessFee.Text = "RM" + processFee.ToString("n2");
            lblServiceTax.Text = "RM" + serviceTax.ToString("n2");
            lblRounding.Text = "RM" + rounding.ToString("n2");
            lblTotalPrice.Text = "RM" + rounded.ToString("n2");
        }

        protected void rblPaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            paymentSelect = rblPaymentMethod.SelectedValue.ToString();
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {

            if (ddlTime.SelectedValue == "NoTime") {

                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "modalNoTime();", true);
            }
            else
            {
                insertOrder();
                loadCart();
                DeleteFromCart();
                Session["orderID"] = orderID;
                Response.Redirect("OrderSuccess.aspx");

            }

        }

        private void loadCart()
        {

            String sql = @"SELECT * FROM tblCart WHERE custID = @custID";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@custID", custID);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {

                //Items Found
                //Object objhouseno = dt.Rows[0]["houseNo"];

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    objprodID = dt.Rows[i]["prodID"];
                    obprodQty = dt.Rows[i]["prodQty"];
                    insertOrderDetails(Convert.ToInt32(objprodID.ToString()), Convert.ToInt32(obprodQty.ToString()));
                }
                
                

            }
            else
            {
                //Items Not Found


            }
        }

        private void DeleteFromCart() {
            //Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);

            //Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spDeleteCartOrderSuccess", conn);

            //Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@custID", custID);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {


            }
            catch (System.FormatException ex)
            {

            }
            finally
            {
                conn.Close();
            }//END TRY-CATCH
        }

        private void insertOrderDetails(int prodID, int prodQty) {
            //Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);

            //Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spAddOrderDetails", conn);

            //Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@orderID", orderID);
            cmd.Parameters.AddWithValue("@prodID", prodID);
            cmd.Parameters.AddWithValue("@prodQty", prodQty);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                

            }
            catch (System.FormatException ex)
            {

            }
            finally
            {
                conn.Close();
            }//END TRY-CATCH

        }

        private void insertOrder()
        {
            String sql = @"INSERT INTO tblOrder (custID, orderDate, orderNote, deliveryDate, deliveryTime, deliveryAddress, paymentType, dateCreated)
                            VALUES(@custID, @orderDate, @orderNote, @deliveryDate, @deliveryTime, @deliveryAddress, @paymentType, @dateCreated) SELECT SCOPE_IDENTITY()";
            //SqlConnection conn = new SqlConnection(ConfigurationManager.
                //ConnectionStrings["ConnectionString"].ConnectionString);
            //SqlCommand cmd = new SqlCommand(sql, conn);


            using (SqlConnection conn= new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@custID", custID);
                cmd.Parameters.AddWithValue("@orderDate", lblDate.Text);
                cmd.Parameters.AddWithValue("@orderNote", orderRemarks.Text);
                cmd.Parameters.AddWithValue("@deliveryDate", lblDate.Text);
                cmd.Parameters.AddWithValue("@deliveryTime", ddlTime.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@deliveryAddress", lblAddress.Text);
                cmd.Parameters.AddWithValue("@paymentType", rblPaymentMethod.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@dateCreated", SqlDbType.DateTime).Value = DateTime.Now;

                orderID = Convert.ToInt32(cmd.ExecuteScalar());

                conn.Close();
            }


            

        }
    }
}