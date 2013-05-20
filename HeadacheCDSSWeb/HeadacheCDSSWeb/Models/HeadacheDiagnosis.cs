using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeadacheCDSSWeb.Models
{
    public class HeadacheDiagnosis
    {
        public List<string> GetDiagnosis(VisitData vData)
        {  
            List<string> result = new List<string>();
            if (vData.visitrecord.SecondaryHeadacheSymptom.Count!=0)
           {
                //继发性头痛
            }
            else
            {
                //原发性头痛
            }
          
            return result;
        }
    }
}