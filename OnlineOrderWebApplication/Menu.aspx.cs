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

    public partial class Menu : System.Web.UI.Page
    {
        int prodID = 0;
        int custID = 0;

        static double subTotalAmount;
        protected void Page_Load(object sender, EventArgs e)
        {
            //TEMPORARY
            //custID = 1;
            //Session["CustID"] = custID;
            //Session["CustFName"] = "Muhamad";
            //Session["CustLName"] = "Ashraff";
            //Session["CustEmail"] = "ashraff@email.com";



            custID = Convert.ToInt32(Session["CustID"]);
            GetSubTotalAmount();
            showhideOrderSummary();
            


            if (!IsPostBack)
            {
                DataList1.DataBind();
                DataList2.DataBind();

            }

            if (IsPostBack)
            {

            }

            if (custID != 0)
            {
                if (checkAddress())
                {
                    btnCheckout.Visible = true;
                }
                else
                {
                    btnCheckout.Visible = false;
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "modalNoAddress();", true);
                }


            }



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

        private void showhideOrderSummary()
        {
            if (DataList2.Items.Count == 0)
            {
                summaryOrder.Visible = false;
                labelItem.Visible = false;
                buttonCheckout.Visible = false;
                noOrder.Visible = true;

            }
            else
            {
                summaryOrder.Visible = true;
                labelItem.Visible = true;
                buttonCheckout.Visible = true;
                noOrder.Visible = false;
            }

            if (IsPostBack)
            {
                content.Attributes["class"] = "container";
            }
            else
            {
                content.Attributes["class"] = "container animate__animated animate__fadeIn animate__slow";
            }

            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            prodID = int.Parse(((Label)DataList1.SelectedItem.FindControl("lblProdID")).Text);
            Label2.Text = prodID.ToString();
            if (!isAlreadyInCart())
            {
                GetItemstoAdd();
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "addModal();", true);
            }
            else
            {
                GetItemstoEdit();
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "editModal();", true);
            }
            

        }

        protected void DataList2_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            DataList2.SelectedIndex = e.Item.ItemIndex;
            prodID = int.Parse(((Label)DataList2.SelectedItem.FindControl("prodIDLabel")).Text);
            Label2.Text = prodID.ToString();
            DeleteFromCart();
            DataList2.DataBind();
            GetSubTotalAmount();
            showhideOrderSummary();
            

        }


        private void AddtoCart(int productquantity) {

            //Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);

            //Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spAddItems2", conn);

            //Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@productid", prodID);
            cmd.Parameters.AddWithValue("@customerid", custID);
            cmd.Parameters.AddWithValue("@productqty", productquantity);

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

        public void UpdateQuantity(int productquantity)
        {
            //Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);

            //Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spUpdateItemFromCart", conn);

            //Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@productid", prodID);
            cmd.Parameters.AddWithValue("@customerid", custID);
            cmd.Parameters.AddWithValue("@productqty", productquantity);

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

        private void DeleteFromCart()
        {
            //Create connection
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);

            //Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spDeleteFromCart", conn);

            //Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@productid", prodID);

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

        private void GetItemstoAdd()
        {
            String sql = @"SELECT * FROM tblProduct WHERE prodID = @prodID";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@prodID", prodID);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Items Found
                Object objprodName = dt.Rows[0]["prodName"];
                Object objprodPrice = dt.Rows[0]["prodPrice"];
                Object objprodImg = dt.Rows[0]["prodImg"];
                lblProdNameAdd.Text = objprodName.ToString();
                lblProdPriceAdd.Text = objprodPrice.ToString();
                imgProdAdd.ImageUrl = "~/Images/Menu/" + objprodImg.ToString() + ".png";
                string price = objprodPrice.ToString();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "key", "setAddPrice('" + price + "');", true);
            }
            else
            {
                //Items Not Found
                lblProdNameAdd.Text = "Not Found";
                lblProdPriceAdd.Text = "Not Found";
            }

        }

        private bool isAlreadyInCart()
        {
            String sql = @"SELECT * FROM tblCart WHERE prodID = @prodID AND custID = @custID";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@prodID", prodID);
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

        private void GetItemstoEdit()
        {
            String sql = @"SELECT tblProduct.prodName, tblProduct.prodPrice, tblCart.prodQty, tblProduct.prodImg, tblCart.prodID,
                        tblProduct.prodPrice * tblCart.prodQty AS SubTotal
                        FROM tblCart
                        INNER JOIN tblProduct ON tblProduct.prodID = tblCart.prodID
                        WHERE tblCart.custID = @custID AND tblCart.prodID = @prodID";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@prodID", prodID);
            cmd.Parameters.AddWithValue("@custID", custID);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                //Items Found
                Object objprodName = dt.Rows[0]["prodName"];
                Object objprodPrice = dt.Rows[0]["prodPrice"];
                Object objprodImg = dt.Rows[0]["prodImg"];
                Object objprodQty = dt.Rows[0]["prodQty"];
                lblProdName.Text = objprodName.ToString();
                lblProdPrice.Text = objprodPrice.ToString();
                imgProd.ImageUrl = "~/Images/Menu/"+ objprodImg.ToString() + ".png";
                string price = objprodPrice.ToString();
                string quantity = objprodQty.ToString();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "key", "showPrice('" + price + "','" + quantity + "');", true);


            }
            else
            {
                //Items Not Found
                lblProdName.Text = "Not Found";
                lblProdPrice.Text = "Not Found";
            }

        }

        private void CalculateItemQty()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.
                ConnectionStrings["ConnectionString"].ConnectionString);

            //Create command object with Stored Procedure name
            SqlCommand cmd = new SqlCommand("spGetItemQty", conn);

            //Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@custID", custID);

            try
            {
                // Open connection
                conn.Open();

                var item = cmd.ExecuteScalar();
                lblItemQty.Text = item.ToString() + " Item(s)";

            }
            catch (SqlException ex)
            {
                lblItemQty.Text = "Error Item(s)";
            }
            catch (System.FormatException ex)
            {
                lblItemQty.Text = "Error Item(s)";
            }
            finally
            {
                conn.Close();
            }//END TRY-CATCH

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
                CalculateItemQty();
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

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["CustID"] == null)
            {
                (e.Item.FindControl("btnaddtoCart") as LinkButton).Visible = false;
                lblNoOrder.Text = "Please <a class=\"text-danger\" href=\"Login.aspx\"><b><u>Login</u></b></a> or <a class=\"text-danger\" href=\"Register.aspx\"><b><u>Register</u></b></a> to start your order.";
            }
            else {
                (e.Item.FindControl("btnaddtoCart") as LinkButton).Visible = true;
                lblNoOrder.Text = "Please select an item to begin your order.";
            }//END IF
        }

        protected void DataList2_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataList2.SelectedIndex = e.Item.ItemIndex;
            prodID = int.Parse(((Label)DataList2.SelectedItem.FindControl("prodIDLabel")).Text);
            Label2.Text = prodID.ToString();
            GetItemstoEdit();
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "editModal();", true);

        }


        protected void btnUpdateQuantity_Click(object sender, EventArgs e)
        {
            prodID = int.Parse(Label2.Text.ToString());
            int quantity = int.Parse(Request.Form["QuantityUpdate"]);
            UpdateQuantity(quantity);
            DataList2.DataBind();
            GetSubTotalAmount();
            showhideOrderSummary();
        }

        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {
            prodID = int.Parse(Label2.Text.ToString());
            int quantity = int.Parse(Request.Form["QuantityAdd"]);
            AddtoCart(quantity);
            DataList2.DataBind();
            GetSubTotalAmount();
            showhideOrderSummary();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
    }
}