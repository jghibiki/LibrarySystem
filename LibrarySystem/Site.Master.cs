using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace LibrarySystem
{
    public partial class SiteMaster : MasterPage
    {
        protected System.Web.UI.HtmlControls.HtmlGenericControl CheckoutLink;
        protected System.Web.UI.HtmlControls.HtmlGenericControl MyBooksLink;
 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User != null && Context.User.Identity.IsAuthenticated)
            {
                CheckoutLink.Visible = true;
                MyBooksLink.Visible = true;

                login.NavigateUrl = "~/Signout.aspx";
                login.Text = "Signout";
            }
            else
            {
                CheckoutLink.Visible = false;
                MyBooksLink.Visible = false;
            }
        }
    }
}