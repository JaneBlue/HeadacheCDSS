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
        VisitDataOperation vr = new VisitDataOperation();
        public ActionResult Index(string ID)
        {
          
            this.TempData["PatID"] = ID;
        
            return View();
        }
        public ActionResult ContinueVisit(string identity)
        {
            string[] IDs = identity.Split(new Char[] { '%' });
            this.TempData["PatID"] = IDs[0];
            this.TempData["ContinueVisitID"] = IDs[1];
           ReportData  RData= vr.ViewDetail(IDs[0], IDs[1]);
           System.Web.Script.Serialization.JavaScriptSerializer oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
           string sJSON = JsonHelper.JsonSerializer(RData);
           ViewData["data"] = sJSON;
           return View();
          //  return View(RData);
        }
        [HttpPost]
        public JsonResult Save()
        {
            
            string jsonStr = Request.Params["postjson"];
            string PatID = this.TempData["PatID"].ToString();

            try
            {
                //VisitData obj = JsonHelper.JsonDeserialize<VisitData>(jsonStr);//jsonStr.FromJsonTo<VisitData>();
                VisitData obj = new VisitData();
                obj.visitrecord = new VisitRecord();
                obj.visitrecord.ChiefComplaint = "345";
                obj.visitrecord.OutpatientID = "1";
                obj.visitrecord.VisitDate = DateTime.Now;
                obj.visitrecord.CDSSDiagnosis1 = "紧张性头痛";
                obj.visitrecord.DiagnosisResult1 = "偏头痛";
                MedicationAdvice ma=new MedicationAdvice();
                ma.DrugApplication = "chis ";
                ma.DrugCategory = "曲普坦类";
                ma.DrugDose="一日三粒";
                ma.DrugName = "dsfsd";
                ma.Therapy = "sdf";
                obj.visitrecord.MecicationAdvice.Add(ma);
                obj.PHeadacheOverview = new PrimaryHeadacheOverView();
                obj.PHeadacheOverview.DailyAggravation="yes";
                obj.PHeadacheOverview.FirstOnsetContinue = "yes";
                obj.PHeadacheOverview.FrequencyPerDay= "yes";
                obj.PHeadacheOverview.FrequencyPerMonth = "yes";
                obj.PHeadacheOverview.HeacheTimeUnit= "yes";
                obj.PHeadacheOverview.HeadacheDegree = "yes";
                obj.PHeadacheOverview.HeadacheType= "yes";
                obj.PHeadacheOverview.OnsetFixedDay = "yes";
                obj.PHeadacheOverview.OnsetFixedYear = "yes";
                obj.PHeadacheOverview.OnsetDate = DateTime.Now.ToString();
                obj.PHeadacheOverview.OnsetAmount= "yes";
                obj.PHeadacheOverview.HeadcheTime= "yes";
                HeadachePlace hp = new HeadachePlace();
                hp.Position = "左侧";
                hp.SpecificPlace = "脸部";
                obj.PHeadacheOverview.HeadachePlace.Add(hp);
                if (this.TempData["ContinueVisitID"] == null)
                {
                    vr.SaveRecord(PatID, obj);
                }
                else
                {
                    string VisitID= this.TempData["ContinueVisitID"].ToString();
                    vr.UpdateRecord(PatID,VisitID ,obj);
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
            strResult = "123";
            return this.Json(new { OK = true, Message = strResult});
         }
    }
}
