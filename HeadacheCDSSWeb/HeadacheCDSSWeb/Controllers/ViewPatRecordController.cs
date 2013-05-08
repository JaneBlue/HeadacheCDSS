using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HeadacheCDSSWeb.Models;
namespace HeadacheCDSSWeb.Controllers
{
    public class ViewPatRecordController : Controller
    {
        //
        // GET: /ViewPatRecord/

        public ActionResult Index()
        {
            List<VisitRecord> Lvisit = new List<VisitRecord>();
            VisitRecord vr = new VisitRecord();
            vr.VisitDate = DateTime.Now.Date;
            for(int i=0;i<29;i++){
                Lvisit.Add(vr);
            }
           
            return View(Lvisit);
        }

    }
}
