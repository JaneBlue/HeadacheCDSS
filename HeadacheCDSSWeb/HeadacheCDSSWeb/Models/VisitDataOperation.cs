﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
        public bool SaveRecord(string PatID,VisitData VData)
        {
            try
            {
                PatBasicInfor pt = context.PatBasicInforSet.Find(PatID);
                //VisitRecord vr = new VisitRecord();
                //vr.VisitDate = DateTime.Now;
                //vr.PatBasicInforId = PatID;
                //pt.VisitRecord.Add(vr);
                context.SaveChanges();
                return true;
            }
            catch (System.Exception ex)
            {
                return false;
            }

        }
        public bool UpdateRecord(string PatID, VisitData VData)
        {
            try
            {
                PatBasicInfor pt = context.PatBasicInforSet.Find(PatID);
                //VisitRecord vr = new VisitRecord();
                //vr.VisitDate = DateTime.Now;
                //vr.PatBasicInforId = PatID;
                //pt.VisitRecord.Add(vr);
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
    }
}