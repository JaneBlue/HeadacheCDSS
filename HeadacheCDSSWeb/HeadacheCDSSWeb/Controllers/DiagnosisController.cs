using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HeadacheCDSSWeb.Controllers
{
    public class DiagnosisController : Controller
    {
        //
        // GET: /Diagnosis/

        public ActionResult Index(string ID)
        {
            this.TempData["PatID"] = ID;
            return View();
        }
        public ActionResult ContinueVisit(string ID)
        {
            this.TempData["PatID"] = ID;
            return View();
        }
    }
}
