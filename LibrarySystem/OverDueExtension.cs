using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibrarySystem
{
    public partial class OverDue
    {
        public int OverdueDays {
            get {
                var dueDate = this.CheckedOut.DueDate;
                var daysLate = DateTime.UtcNow - dueDate;
                return daysLate.Days;
            }
        }

        public decimal ChargeFee
        {
            get
            {
                return (decimal)(this.OverdueDays * 0.30);
            }
        }
    }
}