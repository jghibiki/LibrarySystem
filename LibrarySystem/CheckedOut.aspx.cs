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

                List<CheckedOut> checkedOutBooks = new List<CheckedOut>();
                List<CheckedOut> checkedOutAudio = new List<CheckedOut>();
                List<CheckedOut> checkedOutVideo = new List<CheckedOut>();

                foreach (CheckedOut checkedOut in checkOuts)
                {
                    if (checkedOut.Copy.Medium is Book)
                    {
                        checkedOutBooks.Add(checkedOut);
                    }
                    else if (checkedOut.Copy.Medium is Audio)
                    {
                        checkedOutAudio.Add(checkedOut);
                    }
                    else if (checkedOut.Copy.Medium is Video)
                    {
                        checkedOutVideo.Add(checkedOut);
                    }
                }

                CheckedOutBooksGridView.DataSource = checkedOutBooks;
                CheckedOutBooksGridView.DataBind();

                CheckedOutAudioGridView.DataSource = checkedOutAudio;
                CheckedOutAudioGridView.DataBind();

                CheckedOutVideoGridView.DataSource = checkedOutVideo;
                CheckedOutVideoGridView.DataBind();

                List<Resevation> reservedBooks = new List<Resevation>();
                List<Resevation> reservedAudio = new List<Resevation>();
                List<Resevation> reservedVideo = new List<Resevation>();

                foreach (Resevation reserved in reservations)
                {
                    if (reserved.Copy.Medium is Book)
                    {
                        reservedBooks.Add(reserved);
                    }
                    else if (reserved.Copy.Medium is Audio)
                    {
                        reservedAudio.Add(reserved);
                    }
                    else if (reserved.Copy.Medium is Video)
                    {
                        reservedVideo.Add(reserved);
                    }
                }

                
                ReservedBooksGridView.DataSource = reservedBooks;
                ReservedBooksGridView.DataBind();

                ReservedAudioGridView.DataSource = reservedAudio;
                ReservedAudioGridView.DataBind();

                ReservedVideoGridView.DataSource = reservedVideo;
                ReservedVideoGridView.DataBind();
            }
        }
    }
}