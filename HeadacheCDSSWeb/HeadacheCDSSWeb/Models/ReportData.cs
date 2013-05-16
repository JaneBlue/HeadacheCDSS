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
            this.Hfamilymember = new List<string>();
            this.Ofamilydisease = new List<string>();
            this.previousdrug = new List<PDrug>();
            this.headacheplace = new List<string>();
            this.precipitatingfactor = new List<string>();
            this.mitigatingfactors = new List<string>();
            this.headacheaccompany = new List<string>();
            this.headacheprodrome = new List<string>();
            this.medicationadvice = new List<HMedicine>();
            this.headacheoverview = new HeadacheOverview();
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
        public bool SimilarFamily { get; set; }
        public List<string> Hfamilymember;
        public List<string> Ofamilydisease;
        public List<PDrug>previousdrug{get;set;}
        public List<Exam>previousexam{get;set;}

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
        public List<string> headacheplace{get;set;}
        public List<string> precipitatingfactor{get;set;}
        public List<string> mitigatingfactors{get;set;}
        public List<string> headacheaccompany{get;set;}
        public List<string> headacheprodrome{get;set;}
        public List<HMedicine> medicationadvice{get;set;}
        public HeadacheOverview headacheoverview{get;set;}
    }
   public class HMedicine
    {
        public string DrugApplication { get; set; }
        public string DrugCategory { get; set; }
        public string DrugName { get; set; }
        public string Therapy { get; set; }
        public string DrugDose { get; set; }
    }
   public class PDrug{
        public string DrugCategory { get; set; }
        public string DrugName { get; set; }
        public string DayAmoutnPerM { get; set; }
        public string MonthTotalAmount { get; set; }
     }
   public class Exam
    {
        public string ExamName { get; set; }
        public string Result { get; set; }
        public string Date { get; set; }
    }
    public class HeadacheOverview
    {
        public string HeadacheType { get; set; }
        public string HeadacheDegree { get; set; }
        public string HeadcheTime { get; set; }
        public string HeacheTimeUnit { get; set; }
        public string FrequencyPerDay { get; set; }
        public string FrequencyPerMonth { get; set; }
        public string OnsetFixedDay { get; set; }
        public string OnsetFixedYear { get; set; }
        public string OnsetDate { get; set; }
        public string OnsetAmount { get; set; }
        public string DailyAggravation { get; set; }
        public string FirstOnsetContinue { get; set; }
    }
}