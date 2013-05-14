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

            List<VisitRecord> Lvisit = visitop.GetVistRecord(ID);

            return View(Lvisit);
        }
        public ActionResult ViewVisitRecordDetail(string ID)
        {
            return PartialView("VisitContentView");
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
    }
}
