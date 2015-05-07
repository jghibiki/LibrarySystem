using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibrarySystem
{
    public partial class SearchCustomer : System.Web.UI.Page
    {
        List<String> validColumns = new List<String>()
        { "Id", "FirstName", "LastName", "Email", "Phone"
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            using (LibraryEntities db = new LibraryEntities())
            {
                CustomersGridView.DataSource = db.Customers.ToList();
                CustomersGridView.DataBind();
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            String searchBy = searchOption.SelectedValue;
            String searchKeyword = searchValue.Text;

            if (!validColumns.Contains(searchBy) || searchBy == "")
            {
                return; // Prevent sql injection
            }

            // Perform search
            using (LibraryEntities db = new LibraryEntities())
            {
                List<Customer> resultList;
                if (searchBy == "Id")
                {
                    resultList = db.Customers.SqlQuery("SELECT * FROM dbo.Customers WHERE Id = @keyword", new SqlParameter("keyword", searchKeyword)).ToList();

                }
                else
                {
                    resultList = db.Customers.SqlQuery("SELECT * FROM dbo.Customers WHERE " + searchBy + " LIKE '%'+@keyword+'%'",
                        new SqlParameter("keyword", searchKeyword)).ToList();
                }

                CustomersGridView.DataSource = resultList;
                CustomersGridView.DataBind();
            }
        }
    }
}