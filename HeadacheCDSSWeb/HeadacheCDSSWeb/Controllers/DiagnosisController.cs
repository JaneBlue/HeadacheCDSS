using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HeadacheCDSSWeb.Models;
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
        [HttpPost]
        public JsonResult Save()
        {
            VisitDataOperation vr = new VisitDataOperation();
            string jsonStr = Request.Params["postjson"];
            string PatID = this.TempData["PatID"].ToString();

            try
            {
                VisitData obj = JsonHelper.JsonDeserialize<VisitData>(jsonStr);//jsonStr.FromJsonTo<VisitData>();
                if (this.TempData["ContinueVisitID"] != null)
                {
                    vr.SaveRecord(PatID, obj);
                }
                else
                {
                    vr.UpdateRecord(PatID, obj);
                }
            }
            catch (Exception e)
            {
                return this.Json(new { OK = false, Message = "保存失败" });
            }

            return this.Json(new { OK = true, Message = "保存成功" });
        }
        [HttpPost]
        public JsonResult CDSSdiagnosis()
        {
            string strResult = null;
            try{
                string jsonStr = Request.Params["postjson"];
                VisitData obj = JsonHelper.JsonDeserialize<VisitData>(jsonStr);//jsonStr.FromJsonTo<VisitData>();
                HeadacheDiagnosis HDiagnosis = new HeadacheDiagnosis();
                List<string> Result = HDiagnosis.GetDiagnosis(obj);
            }
            catch (Exception e)
            {
                return this.Json(new { OK = false, Message = e.Message + "推理出错" });
            }

            return this.Json(new { OK = true, Message = strResult});
         }
    }
}
