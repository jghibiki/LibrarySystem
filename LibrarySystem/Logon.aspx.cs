using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class Logon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Logon_Click(object sender, EventArgs e)
        {
            String username = UserEmail.Text;
            String password = Password.Text;

            using (LibraryEntities db = new LibraryEntities())
            {
                var user = (from c in db.Customers
                            where c.Email.Equals(username, StringComparison.CurrentCultureIgnoreCase)
                            select c).FirstOrDefault();

                if (user != null)
                {
                    FormsAuthentication.RedirectFromLoginPage(user.Id.ToString(), true);
                }
                else
                {
                    Msg.Text = "Invalid username/password combination.";
                }
            }
        }
    }
}