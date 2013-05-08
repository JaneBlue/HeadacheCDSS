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

        public ActionResult Index(string ID)
        {
            VisitDataOperation visitop = new VisitDataOperation();
            List<VisitRecord> Lvisit = visitop.GetVistRecord(ID);

            return View(Lvisit);
        }
        public ActionResult ViewVisitRecordDetail()
        {
            return View();
        }

    }
}
