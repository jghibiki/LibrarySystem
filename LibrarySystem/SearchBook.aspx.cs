using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (var db = new LibraryEntities())
            {
                if (DropDownList1.SelectedValue.Equals("Title"))
                {
                    var selectItems = db.Media.Where(x => x.Title.Contains(TextBox1.Text)).ToList();

                    GridView1.DataSource = selectItems;
                    GridView1.DataBind();
                }
            }
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (Context.User != null && Context.User.Identity.IsAuthenticated)
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                if (e.CommandName == "Reserve")
                {
                    Reserve(row);
                }
                else if (e.CommandName == "Checkout")
                {
                    Checkout(row);
                }
            }
            else
            {
                status.Text = "Must be logged in to reserve or checkout books.";
            }
        }

        protected void Reserve(GridViewRow row)
        {
            var copy = GetAvailableCopy(row);

            if (copy == null)
            {
                status.Text = "No Copies Available to be reserved.";
            }
            else
            {
                using (var db = new LibraryEntities())
                {
                    int id = int.Parse(Context.User.Identity.Name);
                    Customer customer = db.Customers.First(x => x.Id == id);
                    Resevation reservation = new Resevation()
                    {
                        ReservationDate = DateTime.UtcNow,
                        CustomerId = customer.Id,
                        Copy = copy
                    };

                    db.Resevations.Add(reservation);
                    db.SaveChanges();
                }
            }
        }

        protected void Checkout(GridViewRow row)
        {
            var copy = GetAvailableCopy(row);

            if (copy == null)
            {
                status.Text = "No Copies Available to be checked out.";
            }



        }

        protected Copy GetAvailableCopy(GridViewRow row)
        {
            using (var db = new LibraryEntities())
            {
                try
                {
                    int index = int.Parse(row.Cells[1].Text);
                    var allCopies = db.Copies.Where(x => x.Medium.Id == index).ToList();

                    foreach (var copy in allCopies)
                    {
                        bool notReserved = false;
                        bool notCheckedOut = false;

                        var reservation = db.Resevations.Count(x => x.Id == copy.Id);
                        if (reservation == 0)
                        {
                            notReserved = true;
                        }

                        var checkedOut = db.CheckedOuts.Count(x => x.Id == copy.Id);
                        if (checkedOut == 0)
                        {
                            notCheckedOut = true;
                        }
                        if (notReserved && notCheckedOut)
                        {
                            return copy;
                        }
                    }
                }
                catch (Exception e){}
                return null;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}