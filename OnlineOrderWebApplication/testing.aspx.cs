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
    public partial class testing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadData();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fisrtname = "FirstName";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "key", "showAlert('" + fisrtname + "');", true);
        }

        private void loadData() {

            String sql = @"SELECT * FROM tblCustomer";
            SqlConnection conn = new SqlConnection(ConfigurationManager.
               ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@custID", 1);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            Label1.Text = dt.Rows.Count.ToString();

            if (dt.Rows.Count > 0)
            {
                //Items Found
                
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Object objfname = dt.Rows[i]["custEmail"];
                    Label1.Text += objfname.ToString() + "<br>";
                }

            }
            else
            {
                //Items Not Found


            }
        }
    }
}