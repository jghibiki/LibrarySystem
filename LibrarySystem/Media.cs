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
    
    public partial class Media
    {
        public Media()
        {
            this.Copies = new HashSet<Copy>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public string Year { get; set; }
        public string Description { get; set; }
        public string Publisher { get; set; }
        public string Genre { get; set; }
        public string Author1 { get; set; }
        public string ISBN1 { get; set; }
    
        public virtual ICollection<Copy> Copies { get; set; }
    }
}
