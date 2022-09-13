using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineOrderWebApplication.UserControls
{
    public partial class LoginHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["CustID"] != null)
            {
                LoginNavItem.Visible = false;

            }
            else
            {
                LoginNavItem.Visible = true;
            }

        }
    }
}