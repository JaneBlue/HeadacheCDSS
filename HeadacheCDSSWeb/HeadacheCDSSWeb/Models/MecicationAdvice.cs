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
    public partial class MecicationAdvice
    {
        public int Id { get; set; }
        public int PrescriptionId { get; set; }
        public string DrugApplication { get; set; }
        public string DrugCategory { get; set; }
        public string DrugName { get; set; }
        public string Therapy { get; set; }
        public string DrugDose { get; set; }
    
        public virtual Prescription Prescription { get; set; }
    }
    
}
