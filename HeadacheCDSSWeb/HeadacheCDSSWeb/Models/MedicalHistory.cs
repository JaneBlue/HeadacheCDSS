//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace HeadacheCDSSWeb.Models
{
    public partial class MedicalHistory
    {
        public MedicalHistory()
        {
            this.PreviousDrug = new HashSet<PreviousDrug>();
            this.PreviousExam = new HashSet<PreviousExam>();
        }
    
        public int Id { get; set; }
    
        public virtual VisitRecord VisitRecord { get; set; }
        public virtual ICollection<PreviousDrug> PreviousDrug { get; set; }
        public virtual ICollection<PreviousExam> PreviousExam { get; set; }
    }
    
}
