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
            List<PatBasicInfor> Pats = new List<PatBasicInfor>();
            List<PatBasicInfor> SelectedPats = new List<PatBasicInfor>();
            List<PatBasicInfor> Unormalpat = new List<PatBasicInfor>();
            try
            {

                var pats = from p in context.PatBasicInforSet.ToList()
                           where (string.IsNullOrEmpty(Condition[0]) ? true : p.Name == Condition[0])
                          && (string.IsNullOrEmpty(Condition[1]) ? true : p.Sex == Condition[1])
                         // && (string.IsNullOrEmpty(Condition[2]) ? true : p.VisitRecord.Last().VisitDate == DateTime.Parse(Condition[2]))
                           // && (string.IsNullOrEmpty(Condition[3]) ? true : p.VisitRecord.Last().CDSSDiagnosis== Condition[3])
                           select p;
                if (pats != null)
                {

                    foreach (PatBasicInfor pt in pats)
                    {
                        if (pt.VisitRecord != null && pt.VisitRecord.Count != 0)
                        {
                            SelectedPats.Add(pt);
                        }
                        else
                        {
                            Unormalpat.Add(pt);
                        }
                    }
                    if (!string.IsNullOrEmpty(Condition[2]))
                    {
                        for (int i = SelectedPats.Count - 1; i >= 0; i--)
                        {
                            bool flag = false;
                            foreach (VisitRecord vr in SelectedPats[i].VisitRecord)
                            {
                                if (vr.VisitDate == DateTime.Parse(Condition[2]))
                                {
                                    flag = true;
                                    break;
                                }
                            }
                            if (!flag)
                            {
                                SelectedPats.RemoveAt(i);
                            }
                        }
                    }
                    if (!string.IsNullOrEmpty(Condition[3]))
                    {
                        for (int i = SelectedPats.Count - 1; i >= 0; i--)
                        {
                            bool flag = false;
                            foreach (VisitRecord vr in SelectedPats[i].VisitRecord)
                            {
                                if (vr.DiagnosisResult1 == Condition[3] || vr.DiagnosisResult2 == Condition[3] || vr.DiagnosisResult3 == Condition[3])
                                {
                                    flag = true;
                                    break;
                                }
                            }
                            if (!flag)
                            {
                                SelectedPats.RemoveAt(i);
                            }
                        }
                    }
                    if (string.IsNullOrEmpty(Condition[2]))
                    {
                        InsertSort(SelectedPats);
                        SelectedPats.AddRange(Unormalpat);
                    }

                }
            }
            catch (Exception e)
            {
                string error = e.Message;

            }
            return SelectedPats;
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
                VisitData vdata = DataPreprocess(VData);
                PatBasicInfor pt = context.PatBasicInforSet.Find(PatID);
                pt.HeadacheFamilyMember = vdata.HFamilyMember;//个人信息相关保存
                pt.OtherFamilyDisease = vdata.OFamilyDisease;
                ObjectMapper.CopyProperties(vdata.lifestyle, pt.Lifestyle);
                pt.PreviousDrug = vdata.PDrug;
                if (vdata.Similarfamily == "有")
                {
                    pt.SimilarFamily = true;
                }
                else
                {
                    pt.SimilarFamily = false;
                }

                pt.PreviousExam = vdata.PExam;
                if (vdata.visitrecord != null)
                {

                    VisitRecord vr = new VisitRecord();//问诊记录信息保存
                    vr = vdata.visitrecord;
                    vr.VisitDate = DateTime.Now.Date;
                    vr.PrimaryHeadachaOverView = vdata.PHeadacheOverview;
                    vr.PatBasicInforId = PatID;
                    pt.VisitRecord.Add(vr);
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
                VisitData vdata = DataPreprocess(VData);
                PatBasicInfor pt = context.PatBasicInforSet.Find(PatID);
                pt.HeadacheFamilyMember = vdata.HFamilyMember;//个人信息相关保存
                pt.OtherFamilyDisease = vdata.OFamilyDisease;
                ObjectMapper.CopyProperties(vdata.lifestyle, pt.Lifestyle);
                pt.PreviousDrug = vdata.PDrug;
                pt.PreviousExam = vdata.PExam;
                if (vdata.Similarfamily == "有")
                {
                    pt.SimilarFamily = true;
                }
                else
                {
                    pt.SimilarFamily = false;
                }
                if (vdata.visitrecord != null)
                {
                    IEnumerable<VisitRecord> record = from p in context.VisitRecordSet.ToList()
                                                      where (p.PatBasicInfor.Id == PatID) && (p.Id == int.Parse(VisitID))
                                                      select p;
                    VisitRecord vr = record.First();

                    ObjectMapper.CopyProperties(vdata.visitrecord, vr);
                    ObjectMapper.CopyProperties(vdata.PHeadacheOverview, vr.PrimaryHeadachaOverView);
                    vr.PrimaryHeadachaOverView.VisitRecord = vr;
                    //  vr = vdata.visitrecord;
                    //vr.PrimaryHeadachaOverView = vdata.PHeadacheOverview;
                    vr.PatBasicInforId = PatID;
                    vr.VisitDate = DateTime.Now.Date;
                    context.Entry(vr).State = System.Data.EntityState.Modified;
                }
                context.SaveChanges();
                return true;
            }
            catch (System.Exception e)
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
            rdata.ChiefDoctor = pt.ChiefDoctor;
            if (pt.SimilarFamily != null)
            {
                if (pt.SimilarFamily == true)
                {
                    rdata.SimilarFamily = true;
                }
                else
                {
                    rdata.SimilarFamily = false;
                }

            }

            if (pt.Lifestyle != null)
            {
                rdata.patlifestyle.SmokeState = pt.Lifestyle.SmokeState;
                rdata.patlifestyle.SmokeYear = pt.Lifestyle.SmokeYear;
                rdata.patlifestyle.SmokeStartAge = pt.Lifestyle.SmokeStartAge;
                rdata.patlifestyle.SmokeQuitYear = pt.Lifestyle.SmokeQuitYear;
                rdata.patlifestyle.CigarettesPerDay = pt.Lifestyle.CigarettesPerDay;
                rdata.patlifestyle.DrinkState = pt.Lifestyle.DrinkState;
                rdata.patlifestyle.DrinkStartAge = pt.Lifestyle.DrinkStartAge;
                rdata.patlifestyle.DrinkYear = pt.Lifestyle.DrinkYear;
                rdata.patlifestyle.DrinkQuitYear = pt.Lifestyle.DrinkQuitYear;
                rdata.patlifestyle.DrinkPerDay = pt.Lifestyle.DrinkPerDay;
                rdata.patlifestyle.DrinkCategory = pt.Lifestyle.DrinkCategory;
                rdata.patlifestyle.TeaPerDay = pt.Lifestyle.TeaPerDay;
                rdata.patlifestyle.CoffePerDay = pt.Lifestyle.CoffePerDay;
                rdata.patlifestyle.ExercisePerWeek = pt.Lifestyle.ExercisePerWeek;
                rdata.patlifestyle.ExerciseTime = pt.Lifestyle.ExerciseTime;
                rdata.patlifestyle.ExerciseDescription = pt.Lifestyle.ExerciseDescription;
                rdata.patlifestyle.WeightChange = pt.Lifestyle.WeightChange;
                rdata.patlifestyle.WeightChangeNote = pt.Lifestyle.WeightChangeNote;
                foreach (SpecialDiet d in pt.Lifestyle.SpecialDiet)
                {
                    rdata.patlifestyle.specialDiet.Add(d.Kind);
                }
            }

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
            foreach (PreviousDrug pdrug in pt.PreviousDrug)
            {
                PDrug pd = new PDrug();
                ObjectMapper.CopyProperties(pdrug, pd);
                rdata.previousdrug.Add(pd);
            }
            foreach (PreviousExam pexam in pt.PreviousExam)
            {
                Exam exam = new Exam();
                ObjectMapper.CopyProperties(pexam, exam);
                rdata.previousexam.Add(exam);
            }
            if (RecordID != "")
            {

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
                    foreach (SecondaryHeadacheSymptom ss in vr.SecondaryHeadacheSymptom)
                    {
                        rdata.secondaryheadachesymptom.Add(ss.Symptom);
                    }
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
                        rdata.headacheoverview.OnsetFixedPeriod = vr.PrimaryHeadachaOverView.OnsetFixedPeriod;

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
                            Factor f = new Factor();
                            f.FName = pfactor.FactorName;
                            f.FDetail = pfactor.FactorDetail;
                            rdata.precipitatingfactor.Add(f);
                        }
                    }
                }

            }
            else
            {
                rdata.VisitDate = DateTime.Now.Date;
                rdata.headacheoverview.OnsetDate = DateTime.Now.Date;
            }
            return rdata;
        }
        public VisitData DataPreprocess(VisitData VData)
        {
            try
            {
                int num1 = VData.HFamilyMember.Count - 1;
                //对于空字符串进行处理
                for (int i = num1; i >= 0; i--)
                {
                    if (VData.HFamilyMember[i].Person == "")
                    {
                        VData.HFamilyMember.RemoveAt(i);
                    }
                }
                int num2 = VData.OFamilyDisease.Count - 1;
                for (int j = num2; j >= 0; j--)
                {
                    if (VData.OFamilyDisease[j].DiseaseName == "")
                    {
                        VData.OFamilyDisease.RemoveAt(j);
                    }
                }
                int num3 = VData.PDrug.Count - 1;
                for (int m = num3; m >= 0; m--)
                {
                    if (VData.PDrug[m].DrugCategory == "")
                    {
                        VData.PDrug.RemoveAt(m);
                    }
                }
                int num4 = VData.PExam.Count - 1;
                for (int n = num4; n >= 0; n--)
                {
                    if (VData.PExam[n].ExamName == "")
                    {
                        VData.PExam.RemoveAt(n);
                    }
                }
                int num5 = VData.lifestyle.SpecialDiet.Count - 1;
                for (int n = num5; n >= 0; n--)
                {
                    SpecialDiet dt = VData.lifestyle.SpecialDiet.ElementAt(n);
                    if (dt.Kind == "")
                    {
                        VData.lifestyle.SpecialDiet.Remove(dt);
                    }
                }

                int count1 = VData.PHeadacheOverview.HeadacheAccompany.Count - 1;
                for (int n = count1; n >= 0; n--)
                {
                    HeadacheAccompany ha = VData.PHeadacheOverview.HeadacheAccompany.ElementAt(n);
                    if (ha.Symptom == "")
                    {
                        VData.PHeadacheOverview.HeadacheAccompany.Remove(ha);
                    }
                }
                int count2 = VData.PHeadacheOverview.HeadacheProdrome.Count - 1;
                for (int n = count2; n >= 0; n--)
                {
                    HeadacheProdrome ha = VData.PHeadacheOverview.HeadacheProdrome.ElementAt(n);
                    if (ha.Prodrome == "")
                    {
                        VData.PHeadacheOverview.HeadacheProdrome.Remove(ha);
                    }
                }
                int count3 = VData.PHeadacheOverview.HeadachePlace.Count - 1;
                for (int n = count3; n >= 0; n--)
                {
                    HeadachePlace ha = VData.PHeadacheOverview.HeadachePlace.ElementAt(n);
                    if (ha.SpecificPlace == "")
                    {
                        VData.PHeadacheOverview.HeadachePlace.Remove(ha);
                    }
                }


                int count4 = VData.PHeadacheOverview.MitigatingFactors.Count - 1;
                for (int n = count4; n >= 0; n--)
                {
                    MitigatingFactors ha = VData.PHeadacheOverview.MitigatingFactors.ElementAt(n);
                    if (ha.FactorName == "")
                    {
                        VData.PHeadacheOverview.MitigatingFactors.Remove(ha);
                    }
                }
                int count5 = VData.PHeadacheOverview.PrecipitatingFactor.Count - 1;
                for (int n = count5; n >= 0; n--)
                {
                    PrecipitatingFactor ha = VData.PHeadacheOverview.PrecipitatingFactor.ElementAt(n);
                    if (ha.FactorName == "")
                    {
                        VData.PHeadacheOverview.PrecipitatingFactor.Remove(ha);
                    }
                }
                int count6 = VData.visitrecord.SecondaryHeadacheSymptom.Count - 1;
                for (int n = count6; n >= 0; n--)
                {
                    SecondaryHeadacheSymptom ha = VData.visitrecord.SecondaryHeadacheSymptom.ElementAt(n);
                    if (ha.Symptom == "")
                    {
                        VData.visitrecord.SecondaryHeadacheSymptom.Remove(ha);
                    }
                }

                return VData;
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}