using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit(object sender, EventArgs e)
        {
            Media newMedia = new Media()
            {
                Title = title.Text,
                Author1 = author.Text,
                ISBN1 = isbn.Text,
                Year = year.Text,
                Publisher = publisher.Text,
                Genre = genre.Text,
                Description = description.Text,
            };

            try
            {
                using (LibraryEntities db = new LibraryEntities())
                {
                    db.Media.Add(newMedia);
                    db.SaveChanges();

                    title.Text = "";
                    author.Text = "";
                    isbn.Text = "";
                    year.Text = "";
                    publisher.Text = "";
                    genre.Text = "";
                    description.Text = "";

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