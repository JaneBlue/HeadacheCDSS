using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Diagnostics;
using System.Data.Entity.Validation;
namespace HeadacheCDSSWeb.Models
{
    public class VisitDataOperation
    {
        HeadacheModelContainer context = new HeadacheModelContainer();
        public List<PatBasicInfor> GetPat(List<string> Condition)
        {

            List<PatBasicInfor> pat = new List<PatBasicInfor>();
            List<PatBasicInfor> Unormalpat = new List<PatBasicInfor>();
            var pats = from p in context.PatBasicInforSet.ToList()
                       where (string.IsNullOrEmpty(Condition[0]) ? true : p.Name == Condition[0])
                      && (string.IsNullOrEmpty(Condition[1]) ? true : p.Sex == Condition[1])
                      && (string.IsNullOrEmpty(Condition[2]) ? true : p.VisitRecord.Last().VisitDate == DateTime.Parse(Condition[2]))
                       // && (string.IsNullOrEmpty(Condition[3]) ? true : p.VisitRecord.Last().CDSSDiagnosis== Condition[3])
                       select p;

            try
            {

                foreach (PatBasicInfor pt in pats)
                {
                    if (pt.VisitRecord != null && pt.VisitRecord.Count != 0)
                    {
                        pat.Add(pt);
                    }
                    else
                    {
                        Unormalpat.Add(pt);
                    }
                }
                if (string.IsNullOrEmpty(Condition[2]))
                {
                    InsertSort(pat);
                }
                pat.AddRange(Unormalpat);
            }
            catch (Exception e)
            {
                string error = e.Message;

            }
            return pat;
        }
        public static void InsertSort(List<PatBasicInfor> data)
        {
            var count = data.Count;
            for (int i = 1; i < count; i++)
            {
                var t = data[i].VisitRecord.Last().VisitDate;
                var d = data[i];
                var j = i;
                while (j > 0 && data[j - 1].VisitRecord.Last().VisitDate < t)
                {
                    data[j] = data[j - 1];
                    --j;
                }
                data[j] = d;
            }
        }
        public bool SaveRecord(string PatID, VisitData VData)
        {
            try
            {
                int num1=VData.HFamilyMember.Count-1;
                //对于空字符串进行处理
                for (int i = num1; i >=0; i--)
                {
                    if (VData.HFamilyMember[i].Person == "")
                    {
                        VData.HFamilyMember.RemoveAt(i);
                    }
                }
                int num2=VData.OFamilyDisease.Count-1;
                for(int j=num2;j>=0;j--)
                {
                    if(VData.OFamilyDisease[j].DiseaseName==""){
                        VData.OFamilyDisease.RemoveAt(j);
                    }
                }
                int num3 = VData.PDrug.Count-1;
                for (int m = num3; m >=0; m--)
                {
                    if (VData.PDrug[m].DrugCategory == "")
                    {
                        VData.PDrug.RemoveAt(m);
                    }
                }
                int num4= VData.PExam.Count-1;
                for (int n = num4; n>=0; n--)
                {
                    if (VData.PExam[n].ExamName == "")
                    {
                        VData.PExam.RemoveAt(n);
                    }
                }
                PatBasicInfor pt = context.PatBasicInforSet.Find(PatID);
                pt.HeadacheFamilyMember = VData.HFamilyMember;//个人信息相关保存
                pt.OtherFamilyDisease = VData.OFamilyDisease;
                pt.Lifestyle = VData.lifestyle;
                pt.PreviousDrug = VData.PDrug;
                pt.PreviousExam = VData.PExam;
                if (VData.visitrecord != null)
                {
                    VisitRecord vr = new VisitRecord();//问诊记录信息保存
                    vr = VData.visitrecord;
                    vr.PrimaryHeadachaOverView = VData.PHeadacheOverview;
                    int count1 = VData.PHeadacheOverview.HeadacheAccompany.Count-1;
                    for (int n = 0; n <=count1 ; n++)
                    {
                        HeadacheAccompany ha = VData.PHeadacheOverview.HeadacheAccompany.ElementAt(n);
                        if (ha.Symptom == "")
                        {
                            VData.PHeadacheOverview.HeadacheAccompany.Remove(ha);
                        }
                    }
                    int  count2=VData.PHeadacheOverview.HeadacheProdrome.Count-1;
                    for (int n =count2; n >=0 ; n--)
                    {
                        HeadacheProdrome ha = VData.PHeadacheOverview.HeadacheProdrome.ElementAt(n);
                        if (ha.Prodrome == "")
                        {
                            VData.PHeadacheOverview.HeadacheProdrome.Remove(ha);
                        }
                    }
                    int count3=VData.PHeadacheOverview.HeadachePlace.Count-1;
                    for (int n = count3; n >=0 ; n--)
                    {
                        HeadachePlace ha = VData.PHeadacheOverview.HeadachePlace.ElementAt(n);
                        if (ha.Position == "")
                        {
                            VData.PHeadacheOverview.HeadachePlace.Remove(ha);
                        }
                    }
                    vr.PatBasicInforId = PatID;
                    pt.VisitRecord.Add(vr);
                }
                int count4=VData.PHeadacheOverview.MitigatingFactors.Count-1;
                for (int n =count4 ; n >=0 ; n++)
                {
                    MitigatingFactors ha = VData.PHeadacheOverview.MitigatingFactors.ElementAt(n);
                    if (ha.FactorName == "")
                    {
                        VData.PHeadacheOverview.MitigatingFactors.Remove(ha);
                    }
                }
                int count5 = VData.PHeadacheOverview.PrecipitatingFactor.Count-1;
                for (int n = count5; n >=0 ; n++)
                {
                    PrecipitatingFactor ha = VData.PHeadacheOverview.PrecipitatingFactor.ElementAt(n);
                    if (ha.FactorName == "")
                    {
                        VData.PHeadacheOverview.PrecipitatingFactor.Remove(ha);
                    }
                }
                context.SaveChanges();
                return true;
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        Trace.TraceInformation("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
                return false;
            }

        }
        public bool UpdateRecord(string PatID, string VisitID, VisitData VData)
        {
            try
            {

                PatBasicInfor pt = context.PatBasicInforSet.Find(PatID);
                pt.HeadacheFamilyMember = VData.HFamilyMember;//个人信息相关保存
                pt.OtherFamilyDisease = VData.OFamilyDisease;
                pt.Lifestyle = VData.lifestyle;
                pt.PreviousDrug = VData.PDrug;
                pt.PreviousExam = VData.PExam;
                if (VData.visitrecord != null)
                {
                    var record = from p in context.VisitRecordSet.ToList()
                                 where (p.PatBasicInfor.Id == PatID) && (p.Id == int.Parse(VisitID))
                                 select p;
                    VisitRecord vr = record.First();
                    vr = VData.visitrecord;
                    vr.PrimaryHeadachaOverView = VData.PHeadacheOverview;
                    vr.PatBasicInforId = PatID;
                }
                context.SaveChanges();
                return true;
            }
            catch (System.Exception ex)
            {
                return false;
            }

        }
        public List<VisitRecord> GetVistRecord(string PatID)
        {
            PatBasicInfor pt = context.PatBasicInforSet.Find(PatID);
            List<VisitRecord> visit = new List<VisitRecord>();
            foreach (VisitRecord vr in pt.VisitRecord)
            {
                visit.Add(vr);
            }
            visit.Reverse();
            return visit;
        }
        public bool DeleteRecord(string PatID, string RecordID)
        {
            try
            {

                var record = from p in context.VisitRecordSet.ToList()
                             where (p.PatBasicInfor.Id == PatID) && (p.Id == int.Parse(RecordID))
                             select p;
                VisitRecord r = record.First();
                if (r.PrimaryHeadachaOverView != null)
                {
                    while (r.PrimaryHeadachaOverView.HeadachePlace.Count != 0)
                    {
                        context.HeadachePlaceSet.Remove(r.PrimaryHeadachaOverView.HeadachePlace.First());
                    }
                    while (r.PrimaryHeadachaOverView.HeadacheAccompany.Count != 0)
                    {
                        context.HeadacheAccompanySet.Remove(r.PrimaryHeadachaOverView.HeadacheAccompany.First());
                    }
                    while (r.PrimaryHeadachaOverView.HeadacheProdrome.Count != 0)
                    {
                        context.HeadacheProdromeSet.Remove(r.PrimaryHeadachaOverView.HeadacheProdrome.First());
                    }
                    while (r.PrimaryHeadachaOverView.PrecipitatingFactor.Count != 0)
                    {
                        context.PrecipitatingFactorSet.Remove(r.PrimaryHeadachaOverView.PrecipitatingFactor.First());
                    }
                    while (r.PrimaryHeadachaOverView.MitigatingFactors.Count != 0)
                    {
                        context.MitigatingFactorsSet.Remove(r.PrimaryHeadachaOverView.MitigatingFactors.First());
                    }
                    context.PrimaryHeadacheOverViewSet.Remove(r.PrimaryHeadachaOverView);
                }


                while (r.MecicationAdvice.Count != 0)
                {
                    context.MedicationAdviceSet.Remove(r.MecicationAdvice.FirstOrDefault());
                }

                while (r.SecondaryHeadacheSymptom.Count != 0)
                {
                    context.SecondaryHeadacheSymptomSet.Remove(r.SecondaryHeadacheSymptom.FirstOrDefault());
                }
                // visitrecord 内容删除
                context.VisitRecordSet.Remove(r);
                context.SaveChanges();
                return true;
            }
            catch (System.Exception e)
            {
                return false;

            }
        }
        public ReportData ViewDetail(string PatID, string RecordID)
        {
            ReportData rdata = new ReportData();
            PatBasicInfor pt = context.PatBasicInforSet.Find(PatID);
            rdata.Name = pt.Name;
            rdata.Age = pt.Age;
            rdata.Sex = pt.Sex;
            rdata.Address = pt.Address;
            rdata.Education = pt.Education;
            rdata.Job = pt.Job;
            rdata.Phone = pt.Phone;

            //if (pt.SimilarFamily!=null)
            //{
            //    rdata.SimilarFamily = pt.SimilarFamily;
            //}
            foreach (HeadacheFamilyMember hfmember in pt.HeadacheFamilyMember)
            {
                rdata.Hfamilymember.Add(hfmember.Person);
            }
            foreach (OtherFamilyDisease ofdisease in pt.OtherFamilyDisease)
            {
                rdata.Ofamilydisease.Add(ofdisease.DiseaseName);
            }
            var record = from p in context.VisitRecordSet.ToList()
                         where (p.PatBasicInfor.Id == PatID) && (p.Id == int.Parse(RecordID))
                         select p;
            VisitRecord vr = record.First();
            if (vr != null)
            {

                rdata.VisitDate = vr.VisitDate;
                rdata.CDSSDiagnosis1 = vr.CDSSDiagnosis1;
                rdata.CDSSDiagnosis2 = vr.CDSSDiagnosis2;
                rdata.CDSSDiagnosis3 = vr.CDSSDiagnosis3;
                rdata.DiagnosisResult1 = vr.DiagnosisResult1;
                rdata.DiagnosisResult2 = vr.DiagnosisResult2;
                rdata.DiagnosisResult3 = vr.DiagnosisResult3;
                rdata.Prescription = vr.Prescription;
                rdata.ChiefComplaint = vr.ChiefComplaint;
                foreach (MedicationAdvice madvice in vr.MecicationAdvice)
                {
                    HMedicine hmedicine = new HMedicine();
                    hmedicine.DrugApplication = madvice.DrugApplication;
                    hmedicine.DrugCategory = madvice.DrugCategory;
                    hmedicine.DrugName = madvice.DrugName;
                    hmedicine.DrugDose = madvice.DrugDose;
                    rdata.medicationadvice.Add(hmedicine);
                }
                if (vr.PrimaryHeadachaOverView != null)
                {
                    rdata.headacheoverview.HeadacheType = vr.PrimaryHeadachaOverView.HeadacheType;
                    rdata.headacheoverview.HeadacheDegree = vr.PrimaryHeadachaOverView.HeadacheDegree;
                    rdata.headacheoverview.HeadcheTime = vr.PrimaryHeadachaOverView.HeadcheTime;
                    rdata.headacheoverview.HeacheTimeUnit = vr.PrimaryHeadachaOverView.HeacheTimeUnit;
                    rdata.headacheoverview.FrequencyPerDay = vr.PrimaryHeadachaOverView.FrequencyPerDay;
                    rdata.headacheoverview.FrequencyPerMonth = vr.PrimaryHeadachaOverView.FrequencyPerMonth;
                    rdata.headacheoverview.OnsetFixedDay = vr.PrimaryHeadachaOverView.OnsetFixedDay;
                    rdata.headacheoverview.OnsetFixedYear = vr.PrimaryHeadachaOverView.OnsetFixedYear;
                    rdata.headacheoverview.OnsetDate = vr.PrimaryHeadachaOverView.OnsetDate;
                    rdata.headacheoverview.OnsetAmount = vr.PrimaryHeadachaOverView.OnsetAmount;
                    rdata.headacheoverview.DailyAggravation = vr.PrimaryHeadachaOverView.DailyAggravation;
                    rdata.headacheoverview.FirstOnsetContinue = vr.PrimaryHeadachaOverView.FirstOnsetContinue;

                    foreach (HeadachePlace hp in vr.PrimaryHeadachaOverView.HeadachePlace)
                    {
                        string strPlace = hp.Position + hp.SpecificPlace;
                        rdata.headacheplace.Add(strPlace);
                    }
                    foreach (HeadacheProdrome hprodrome in vr.PrimaryHeadachaOverView.HeadacheProdrome)
                    {
                        rdata.headacheprodrome.Add(hprodrome.Prodrome);
                    }
                    foreach (MitigatingFactors mfactors in vr.PrimaryHeadachaOverView.MitigatingFactors)
                    {
                        rdata.mitigatingfactors.Add(mfactors.FactorName);
                    }
                    foreach (HeadacheAccompany haccompay in vr.PrimaryHeadachaOverView.HeadacheAccompany)
                    {
                        rdata.headacheaccompany.Add(haccompay.Symptom);
                    }
                    foreach (PrecipitatingFactor pfactor in vr.PrimaryHeadachaOverView.PrecipitatingFactor)
                    {
                        rdata.precipitatingfactor.Add(pfactor.FactorName);
                    }
                }
            }
            return rdata;
        }

    }
}