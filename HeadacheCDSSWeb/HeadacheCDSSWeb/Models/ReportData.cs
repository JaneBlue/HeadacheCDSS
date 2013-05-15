using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadacheCDSSWeb.Models
{
    public class ReportData
    {
         public ReportData()
        {
            this.hp = new List<HeadachePlace>();
        }
        public string Id { get; set; }
        public string Name { get; set; }
        public string Sex { get; set; }
        public string Age { get; set; }
        public string Education { get; set; }
        public string Job { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Identity { get; set; }
        public string ChiefDoctor { get; set; }
        public List<bool> SimilarFamily { get; set; }
        public List<HeadacheFamilyMember> Hfamilymember;
        public List<OtherFamilyDisease> Ofamilydisease;
      
        public string OutpatientID { get; set; }
        public string ChiefComplaint { get; set; }
        public System.DateTime VisitDate { get; set; }
        public string PatBasicInforId { get; set; }
        public string CDSSDiagnosis1 { get; set; }
        public string CDSSDiagnosis2 { get; set; }
        public string CDSSDiagnosis3 { get; set; }
        public string DiagnosisResult1 { get; set; }
        public string DiagnosisResult2 { get; set; }
        public string DiagnosisResult3 { get; set; }
        public string Prescription { get; set; }
       public List<HeadachePlace> hp{get;set;}
    }
}