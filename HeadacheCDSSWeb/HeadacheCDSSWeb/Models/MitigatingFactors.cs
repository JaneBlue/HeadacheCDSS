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
    public partial class MitigatingFactors
    {
        public int Id { get; set; }
        public string FactorName { get; set; }
        public int HeadachaOverViewId { get; set; }
    
        public virtual PrimaryHeadachaOverView HeadachaOverView { get; set; }
    }
    
}
