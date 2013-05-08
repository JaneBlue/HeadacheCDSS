using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity.Validation;
using System.Diagnostics;
namespace HeadacheCDSSWeb.Models
{
    public class PatOperation
    {
       HeadacheModelContainer context = new HeadacheModelContainer();
       
        public void InsertPat(PatBasicInfor pat, string PID, string User)
        {

            try
            {
                pat.Id = System.Guid.NewGuid().ToString().Replace("-", "");
                RelateInfor rInfor = new RelateInfor();
                Lifestyle lstyle = new Lifestyle();
                rInfor.Lifestyle=lstyle;
                pat.RelateInfor = rInfor;
               
               
                var users = from s in context.DoctorAccountSet.ToList() select s;
                DoctorAccount user = users.Where(s => s.UserName == User).FirstOrDefault();
                user.PatBasicInfor.Add(pat);

                context.SaveChanges();
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
            }
        }
    }
}