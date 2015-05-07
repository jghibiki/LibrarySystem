using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class AddLibrarian : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Submit(object sender, EventArgs e)
        {
            Librarian newCustomer = new Librarian()
            {
                FirstName = firstName.Text,
                LastName = lastName.Text,
                Email = email.Text,
                Phone = phone.Text,
            };

            try
            {
                using (LibraryEntities db = new LibraryEntities())
                {
                    db.Librarians.Add(newCustomer);
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