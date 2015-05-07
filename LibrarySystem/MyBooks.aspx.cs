using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class MyBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Context.User.Identity.Name);
            using(LibraryEntities db = new LibraryEntities()){
                List<CheckedOut> checkOuts = db.CheckedOuts.Include("Copy").Include("Copy.Medium").Where(co => co.CustomerId == userId).Select(co => co).ToList();
                List<Resevation> reservations = db.Resevations.Include("Copy").Include("Copy.Medium").Where(r => r.CustomerId == userId).Select(r => r).ToList();

                CheckedOutBooksGridView.DataSource = checkOuts;
                CheckedOutBooksGridView.DataBind();

                ReservedBooksGridView.DataSource = reservations;
                ReservedBooksGridView.DataBind();
            }
        }
    }
}