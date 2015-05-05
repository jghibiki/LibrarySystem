using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class Search : System.Web.UI.Page
    {
        LibraryEntities db = new LibraryEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue.Equals("Title"))
            {
                var selectItem = from item in db.Media.Local
                                 where item.Title.Equals(TextBox1.Text)
                                 select item;

                GridView1.DataSource = selectItem;
                GridView1.DataBind();
            }
        }
    }
}