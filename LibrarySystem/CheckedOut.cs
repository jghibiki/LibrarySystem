//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LibrarySystem
{
    using System;
    using System.Collections.Generic;
    
    public partial class CheckedOut
    {
        public int Id { get; set; }
        public System.DateTime IssuedDate { get; set; }
        public System.DateTime DueDate { get; set; }
        public int CustomerId { get; set; }
        public int LibrarianId { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Librarian Librarian { get; set; }
        public virtual OverDue OverDue { get; set; }
        public virtual Copy Copy { get; set; }
    }
}
