using DoanComics.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoanComics.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin/homeadmin")]
    public class ChuongController : Controller
    {
        DoAnTruyenContext db=new DoAnTruyenContext();
        // GET: ChuongController
        public IActionResult Index()
        {
            return View();
        }

        // GET: ChuongController/Details/5
        [HttpGet]
        public IActionResult ChiTiet(int id)
        {
            if (HttpContext.Session.GetString("email") != null)
            {
                var user = db.Users.FirstOrDefault(x => x.Email == HttpContext.Session.GetString("email").Trim());
                ViewBag.name = user.Ten;
                ViewBag.avt = user.Avatar;
                Chuong chuong = db.Chuongs.FirstOrDefault(x => x.Id == id);
                return View(chuong);
            }
            else
            {
                return RedirectToAction("Login", "Access");
            }
        }

        // GET: ChuongController/Create
        [Route("ThemChuong")]
        [HttpGet]
        public ActionResult Them()
        {
            if (HttpContext.Session.GetString("email") != null)
            {
                var user = db.Users.FirstOrDefault(x => x.Email == HttpContext.Session.GetString("email").Trim());
                ViewBag.name = user.Ten;
                ViewBag.avt = user.Avatar;
                return View();
            }
            return RedirectToAction("Login", "Access");
        }

        // POST: ChuongController/Create
        [Route("ThemChuong")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Them(Chuong chuong)
        {
            if (ModelState.IsValid)
            {
                chuong.IdTruyen = Convert.ToInt32(TempData["IDtruyen"]);
                db.Chuongs.Add(chuong);
                db.SaveChanges();
                int tempID = Convert.ToInt32(TempData["IDtruyen"]);
                TempData.Remove("IDtruyen");
                return RedirectToAction("Truyen", "HomeAdmin");
            }
            return View(chuong);
        }

        // GET: ChuongController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ChuongController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ChuongController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ChuongController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
