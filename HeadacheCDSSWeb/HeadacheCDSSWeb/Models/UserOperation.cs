using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity.Validation;
using System.Diagnostics;
namespace HeadacheCDSSWeb.Models
{
    public class UserOperation
    {
        HeadacheModelContainer DataContainer = new HeadacheModelContainer();
        public bool ValidateUser(String User, String Password)
        {
            try
            {
                var Users = from s in DataContainer.DoctorAccountSet.ToList() select s;
                var user = Users.Where(s => s.UserName == User && s.PassWord == Password).FirstOrDefault();
                if (user == null)
                {
                    return false;
                }
                return true;
            }
            catch (System.Exception ex)
            {
                return false;
            }

        }
    }
}