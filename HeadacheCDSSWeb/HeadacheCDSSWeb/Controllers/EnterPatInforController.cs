﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HeadacheCDSSWeb.Models;
using System.Text.RegularExpressions;
using HeadacheCDSSWeb.Filters;
namespace HeadacheCDSSWeb.Controllers
{
    public class EnterPatInforController : Controller
    {
        //
        // GET: /EnterPatientInfor/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(PatBasicInfor pat)
        {

            PatOperation pto = new PatOperation();

            string PID = Request.Form["门诊号"];
            if (string.IsNullOrEmpty(pat.Name) || string.IsNullOrEmpty(pat.Sex) || string.IsNullOrEmpty(pat.Age) || string.IsNullOrEmpty(pat.Education) || string.IsNullOrEmpty(pat.Phone) || string.IsNullOrEmpty(pat.Address) || string.IsNullOrEmpty(pat.ChiefDoctor))
            {
                ModelState.AddModelError("", "输入项不能为空");
            }
            else
            {
                Regex reg = new Regex("^[0-9]+$");
                Match ma1 = reg.Match(pat.Age);
                Match ma2 = reg.Match(pat.Phone);
                if (ma1.Success && ma2.Success)
                {
                }
                else
                {
                    ModelState.AddModelError("", "手机和年龄必须为数字");
                }
            }
            if (ModelState.IsValid)
            {
                string user;
                user = HttpContext.Request.Cookies["username"].Value.ToString();
                pto.InsertPat(pat, PID, user);
                return RedirectToAction("Index", "Diagnosis", new { ID = pat.Id });
            }
            else
            {
                return View();
            }
        }
    }
}
