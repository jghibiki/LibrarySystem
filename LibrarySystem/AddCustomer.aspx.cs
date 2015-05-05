using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit(object sender, EventArgs e)
        {
            Customer newCustomer = new Customer(){
              FirstName = firstName.Text,
              LastName = lastName.Text,
              Email = email.Text,
              Phone = phone.Text,
              JoinDate = DateTime.UtcNow
            };
            
            try
            {
                using (LibraryEntities db = new LibraryEntities())
                {
                    db.Customers.Add(newCustomer);
                    db.SaveChanges();

                    firstName.Text = "";
                    lastName.Text = "";
                    email.Text = "";
                    phone.Text = "";

                    status.Text = "Successfully added!";
                }
            }
            catch (IndexOutOfRangeException)
            {
                status.Text = "Additional unsucessful, please try again!";
            }
        }
    }
}