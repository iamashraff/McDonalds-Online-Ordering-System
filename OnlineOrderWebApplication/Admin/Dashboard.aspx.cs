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
    public partial class Dashboard : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null || Session["AdminName"] == null)
            {

                Response.Redirect("../Login.aspx");

            }


            loadTotalCustomer();
            loadTotalEarnings();
            loadTotalOrder();
            loadTotalProduct();
            getLast1Week();
            lbllastUpdate.Text = DateTime.Now.ToString("dd MMMM yyyy hh:mm:sstt");
        }


        private void getLast1Week()
        {

            String[] myarray = new String[8];
            int[] orderarray = new int[8];

            myarray[0] = DateTime.Now.ToString("dd-MM-yyyy");
            orderarray[0] = getTodaySales(DateTime.Now.ToString("yyyy-MM-dd"));


            for (int i = 1; i < 7; i++) {
                int negInt = -System.Math.Abs(i);

                myarray[i] = DateTime.Now.AddDays(negInt).ToString("dd-MM-yyyy");


                String sql = @"SELECT COUNT(*) As OrderNo
                FROM tblOrder
                 WHERE dateCreated= @dateCreated";

                SqlConnection conn = new SqlConnection(ConfigurationManager.
                   ConnectionStrings["ConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@dateCreated", DateTime.Now.AddDays(negInt).ToString("yyyy-MM-dd"));

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);


                if (dt.Rows.Count > 0)
                {
                    Object objOrderNo = dt.Rows[0]["OrderNo"];
                    orderarray[i] = Convert.ToInt32(objOrderNo);

                }
                else
                {

                    Object objOrderNo = dt.Rows[0]["OrderNo"];
                    orderarray[i] = Convert.ToInt32(objOrderNo);

                }


            }


            HiddenField1.Value = string.Join(",", myarray);
            HiddenField2.Value = string.Join(",", orderarray);



        }

        public int getTodaySales(String dateCreated)
        {
            String sql = @"SELECT COUNT(*) As OrderNo
                FROM tblOrder
                 WHERE dateCreated= @dateCreated";

            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@dateCreated", dateCreated);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                Object objOrderNo = dt.Rows[0]["OrderNo"];
                return Convert.ToInt32(objOrderNo);

            }
            else
            {

                Object objOrderNo = dt.Rows[0]["OrderNo"];
                return Convert.ToInt32(objOrderNo);

            }


        }

        private void loadSales1Week(String dateCreated)
        {
            String sql = @"SELECT COUNT(*) As OrderNo
            FROM tblOrder
            WHERE dateCreated= @dateCreated";

            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@dateCreated", dateCreated);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            //Label1.Text = dt.Rows.Count.ToString();
            

            if (dt.Rows.Count > 0)
            {
                Object objOrderNo = dt.Rows[0]["OrderNo"];
                

            }
            else
            {

                //Label1.Text = "0";

            }





        }


        private void loadTotalCustomer() {
            String sql = @"SELECT * FROM tblCustomer;";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            lblTotalCust.Text = dt.Rows.Count.ToString();
        }

        private void loadTotalEarnings() {
            String sql = @"SELECT SUM(tblOrderDetails.prodQty * tblProduct.prodPrice) AS Total FROM tblOrderDetails
            INNER JOIN tblProduct ON tblProduct.prodID = tblOrderDetails.prodID";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Items Found
                Object objTotalEarnings = dt.Rows[0]["Total"];
                lblTotalEarnings.Text = "RM " + objTotalEarnings.ToString();

            }
            else
            {
                lblTotalEarnings.Text = "";

            }
        }

        private void loadTotalOrder() {
            String sql = @"SELECT COUNT(orderID) AS TotalOrder FROM tblOrder";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
              ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Items Found
                Object objTotalOrder = dt.Rows[0]["TotalOrder"];
                lblTotalOrder.Text = objTotalOrder.ToString();

            }
            else
            {
                lblTotalOrder.Text = "";

            }

        }

        private void loadTotalProduct()
        {
            String sql = @"SELECT COUNT(prodID) AS TotalProduct FROM tblProduct";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
              ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Items Found
                Object objTotalProduct = dt.Rows[0]["TotalProduct"];
                lblTotalProduct.Text = objTotalProduct.ToString();

            }
            else
            {
                lblTotalProduct.Text = "";

            }

        }


    }
}