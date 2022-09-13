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
    public partial class OrderSuccess : System.Web.UI.Page
    {
        int custID = 0;
        int orderID;
        Object objdelDate;
        Object objdelTime;
        Object objdelAddress;
        Object objcustFName;
        Object objcustLname;
        Object objpayType;
        protected void Page_Load(object sender, EventArgs e)
        {
            //TEMPORARY
            //custID = 1;
            //orderID = 6;
            //Session["orderID"] = orderID;
            //Session["CustID"] = custID;
            //Session["CustFName"] = "Muhamad";
            //Session["CustLName"] = "Ashraff";
            //Session["CustEmail"] = "ashraff@email.com";

            if (Session["CustID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            custID = Convert.ToInt32(Session["CustID"]);
            orderID = Convert.ToInt32(Session["orderID"].ToString());

            lblorderID.Text = orderID.ToString();
            
            getCustomerOrder();
            getReceiptTotal();
        }

        private void getCustomerOrder() {
            String sql = @"SELECT tblCustomer.custFirstName, tblCustomer.custLastName, tblOrder.deliveryDate, tblOrder.deliveryTime, tblOrder.deliveryAddress, tblOrder.paymentType
                            FROM tblOrder
                            INNER JOIN tblCustomer ON tblCustomer.custID=tblOrder.custID
                            WHERE orderID= @orderID;";

            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@orderID", orderID);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Items Found
                    objdelDate = dt.Rows[0]["deliveryDate"];
                    objdelTime= dt.Rows[0]["deliveryTime"];
                    objdelAddress = dt.Rows[0]["deliveryAddress"];
                    objcustFName = dt.Rows[0]["custFirstName"];
                    objcustLname = dt.Rows[0]["custLastName"];
                    objpayType = dt.Rows[0]["paymentType"];

                lblAddress.Text = objdelAddress.ToString();
                lblName.Text = lblCustName.Text = objcustFName.ToString() + " " + objcustLname.ToString();
                lblPayMethod.Text = objpayType.ToString();
                lblTime.Text = objdelDate.ToString() + "<br>" + objdelTime.ToString();
                lblorderDate.Text = objdelDate.ToString();
            }
            else
            {
                //Items Not Found
                lblAddress.Text = "Error";
                lblName.Text = "Error";
                lblTime.Text = "Error";

            }

        }

        protected void btnReceipt_Click(object sender, EventArgs e)
        {
            
            lblOrderNo2.Text = lblOrderNo.Text = orderID.ToString();
            
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "receiptModal();", true);
        }

        protected void getReceiptTotal()
        {
            String sql = @"SELECT SUM(tblProduct.prodPrice * tblOrderDetails.prodQty) AS SubTotal FROM tblOrderDetails
            INNER JOIN tblProduct ON tblProduct.prodID = tblOrderDetails.prodID
            WHERE orderID = @orderID";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@orderID", orderID);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Items Found
                Object objsubTotal = dt.Rows[0]["SubTotal"];
                //lblSubTotal.Text = objsubTotal.ToString();
                calculateSummary(Convert.ToDouble(objsubTotal.ToString()));
            }
            else
            {
                //Items Not Found

            }
        }

        private void calculateSummary(double subTotalAmount)
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

            lblSubTOtalAmount.Text = "RM" + subTotalAmount.ToString("n2");
            lblProcessFee.Text = "RM" + processFee.ToString("n2");
            lblServiceTax.Text = "RM" + serviceTax.ToString("n2");
            lblRounding.Text = "RM" + rounding.ToString("n2");
            lblTotalPrice.Text = "RM" + rounded.ToString("n2");
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyOrder.aspx");
        }
    }
}