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
    public partial class MyOrder : System.Web.UI.Page
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

            if (Session["CustID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            custID = Convert.ToInt32(Session["CustID"]);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = "Details for Order #" + GridView1.SelectedRow.Cells[1].Text; ;
            getReceiptTotal(Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text));
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "viewModal();", true);
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