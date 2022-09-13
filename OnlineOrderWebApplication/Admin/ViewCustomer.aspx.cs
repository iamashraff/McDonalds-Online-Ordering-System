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
    public partial class ViewCustomer : System.Web.UI.Page
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
            txtUsername.Text = GridView1.SelectedRow.Cells[1].Text;
            txtEmail.Text = GridView1.SelectedRow.Cells[2].Text;
            txtFName.Text = GridView1.SelectedRow.Cells[3].Text;
            txtLName.Text = GridView1.SelectedRow.Cells[4].Text;
            txtPhone.Text = GridView1.SelectedRow.Cells[5].Text;
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "viewcustModal();", true);
        }

        private void saveCustomer()
        {
            String sql = @"UPDATE tblCustomer
            SET custUsername = @custUsername, custEmail = @custEmail, custFirstName = @custFName, custLastName = @custLName, custPhone = @custPhone
            WHERE custID = @custID";

            SqlConnection conn = new SqlConnection(ConfigurationManager.
              ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@custUsername", txtUsername.Text);
            cmd.Parameters.AddWithValue("@custEmail", txtEmail.Text);
            cmd.Parameters.AddWithValue("@custFName", txtFName.Text);
            cmd.Parameters.AddWithValue("@custLName", txtLName.Text);
            cmd.Parameters.AddWithValue("@custPhone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@custID", lblUserID.Text);

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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            saveCustomer();
            
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "showAlertSuccess();", true);
            Response.AddHeader("REFRESH", "4;URL=ViewCustomer.aspx");
        }
    }
}