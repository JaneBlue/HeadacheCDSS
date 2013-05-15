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
        VisitDataOperation visitop = new VisitDataOperation();
        public ActionResult Index(string ID)
        {
            this.TempData["PatID"] = ID;
            this.ViewBag.patId = ID;
            List<VisitRecord> Lvisit = visitop.GetVistRecord(ID);
            this.TempData["recordID"] = Lvisit.First().Id;
            return View(Lvisit);
        }
        public ActionResult ViewVisitRecordDetail(string ID)
        {
            this.TempData["recordID"] = ID.ToString();
            return this.Json(new { OK = true, Message = ""});
        }
        public ActionResult GoToDiagnosis(string ID)
        {
            return RedirectToAction("Index", "Diagnosis", new { ID = ID });
        }
        public ActionResult DeleteRecord(string ID)
        {


            string PatID = ID;
            string RecordID = this.TempData["recordID"].ToString();
            try
            {
                visitop.DeleteRecord(PatID, RecordID);
            }
            catch (Exception e)
            {
                return this.Json(new { OK = false, Message = "删除失败" });
            }

            return this.Json(new { OK = true, Message = RecordID });
        }
        public ActionResult ViewDiary()
        {
            return PartialView("HeadacheDiaryView");
        }
        public ActionResult ContinueDiagnosis(string ID)
        {
            string identity = ID + "%";
            identity = identity + this.TempData["recordID"].ToString();
            return RedirectToAction("VisitContinue", "Diagnosis", new { identity = identity });
        }
    }
}
