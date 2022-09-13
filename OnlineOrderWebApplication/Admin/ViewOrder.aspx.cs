using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineOrderWebApplication.Admin
{
    public partial class ViewOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null || Session["AdminName"] == null)
            {

                Response.Redirect("../Login.aspx");

            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
           lblUserID.Text = GridView1.SelectedRow.Cells[0].Text;
            getReceiptTotal(Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text));
            getCustomerDetails(Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text));
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "vieworderModal();", true);
           
        }


        private void getCustomerDetails(int orderID) {

            String sql = @"SELECT * FROM tblOrder
            INNER JOIN tblCustomer ON tblOrder.custID = tblCustomer.custID
            WHERE tblOrder.orderID = @orderID";
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
                Object objFname = dt.Rows[0]["custFirstName"];
                Object objLname = dt.Rows[0]["custLastName"];
                Object objEmail = dt.Rows[0]["custEmail"];
                Object objDate = dt.Rows[0]["dateCreated"];
                Object objAdd = dt.Rows[0]["deliveryAddress"];
                Object objPay = dt.Rows[0]["paymentType"];

                lblName.Text = objFname.ToString() + " " + objLname.ToString();
                lblEmail.Text = objEmail.ToString();
                DateTime mydate = DateTime.Parse(objDate.ToString());
                lblDate.Text = mydate.ToString("dd-MM-yyyy");
                lblPay.Text = objPay.ToString();
                lblAddress.Text = objAdd.ToString();
            }
            else
            {
                //Items Not Found

            }
        }


        protected void getReceiptTotal(int orderID)
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





    }
}