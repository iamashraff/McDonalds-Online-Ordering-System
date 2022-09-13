using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineOrderWebApplication.UserControls
{
    public partial class LoginBtn : System.Web.UI.UserControl
    {
        static double subTotalAmount;
        protected void Page_Load(object sender, EventArgs e)
        {

                if (Session["CustID"] != null)
                {
                    LoginButton.Visible = false;
                    LoginMenu.Visible = true;
                    saluteMsg.Text ="Hi, " + Session["CustFName"].ToString() + " " + Session["CustLName"].ToString();
                    
                }
                else
                {
                    LoginButton.Visible = true;
                    LoginMenu.Visible = false;
                }

        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect(Request.RawUrl);
   
        }










    }
}