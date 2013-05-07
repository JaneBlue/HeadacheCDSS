using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HeadacheCDSSWeb.Models;
namespace HeadacheCDSSWeb.Controllers
{
    public class DAccountController : Controller
    {
        //
        // GET: /DAccount/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(DoctorAccount dacount)
        {
            HeadacheModelContainer DataContainer = new HeadacheModelContainer();
            var doctors = from s in DataContainer.DoctorAccountSet.ToList() select s;
            var doctor = doctors.Where(s => s.UserName == dacount.UserName && s.PassWord == dacount.PassWord).FirstOrDefault();
            if (doctor != null)
            {
                HttpCookie cookie = new HttpCookie("username", doctor.UserName);
                Response.Cookies.Add(cookie);
                return RedirectToAction("Index", "EnterPatInfor");

            }
            else
            {
                ViewBag.message = "用户名或密码错误";
                return View();
            }



        }
    }
}
