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
    public partial class PreviousExam
    {
        public int Id { get; set; }
        public int MedicalHistoryId { get; set; }
        public string ExamName { get; set; }
        public string Result { get; set; }
        public string Date { get; set; }
        public string PatBasicInforId { get; set; }
    
        public virtual PatBasicInfor PatBasicInfor { get; set; }
    }
    
}
