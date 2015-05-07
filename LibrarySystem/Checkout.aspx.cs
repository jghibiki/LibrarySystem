using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlGenericControl alert; 
        private List<Media> Books;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (LibraryEntities db = new LibraryEntities())
            {
                Books = db.Media.Include("Copies").Where( m => m.Copies.Count > 0).Select(m => m).OrderBy(m => m.Title).ToList();
                BookCopiesGridView.DataSource = Books;
                BookCopiesGridView.DataBind();
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {

        }

        protected void BookCopies_Checkout(object sender, EventArgs e)
        {
            Media book = Books.ElementAt(BookCopiesGridView.SelectedIndex);
            Copy copy = book.Copies.Where( c => c.Availability == 1 ).First();


            int userId = Convert.ToInt32(Context.User.Identity.Name);

            CheckedOut checkOut = new CheckedOut
            {
                Copy = copy,
                CustomerId = userId,
                LibrarianId = 1,
                IssuedDate = DateTime.Now,
                DueDate = DateTime.Now.AddDays(30)
            };

            try
            {
                using (LibraryEntities db = new LibraryEntities())
                {
                    // Add new checkout
                    db.CheckedOuts.Add(checkOut);

                    // Invalid original copy
                    copy.Availability = 0;
                    // db.Attach(copy); !TODO : Need to save the copy with the availability set to 0, unfortunately, EF doesnt like this

                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                alert.Attributes.Add("class", "alert alert-dismissible alert-error");
                alert.InnerText = "An error occurred with your checkout.";
                throw ex;
            }

            alert.Attributes.Add("class", "alert alert-dismissible alert-success");
            alert.InnerText = "Successfully checked out book.";
        }

        protected void BookCopies_Reserve(object sender, GridViewUpdateEventArgs e)
        {
            Media book = Books.ElementAt(e.RowIndex);
            Copy copy = book.Copies.Where(c => c.Availability == 1).First();
            int userId = Convert.ToInt32(Context.User.Identity.Name);
            DateTime now = DateTime.Now;
            DateTime reserved = now.AddDays(10);

            Resevation reservation = new Resevation()
            {
                Copy = copy,
                CustomerId = userId,
                Date = now,
                ReservationDate = reserved.ToShortDateString()
            };

            try
            {
                using (LibraryEntities db = new LibraryEntities())
                {
                    // Reserve book
                    db.Resevations.Add(reservation);

                    // Invalid original copy
                    copy.Availability = 0;
                    // db.Attach(copy); !TODO : Need to save the copy with the availability set to 0, unfortunately, EF doesnt like this

                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                alert.Attributes.Add("class", "alert alert-dismissible alert-error");
                alert.InnerText = "An error occurred with your reservation.";
                throw ex;
            }

            alert.Attributes.Add("class", "alert alert-dismissible alert-success");
            alert.InnerText = "Successfully reserved book.";
        }
    }
}