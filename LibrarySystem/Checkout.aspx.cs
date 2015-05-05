using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (LibraryEntities db = new LibraryEntities())
            {
                var BookCopies = db.Media.ToList();
                BookCopiesGridView.DataSource = BookCopies;
                BookCopiesGridView.DataBind();
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {

        }
    }
}