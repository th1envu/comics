using DoanComics.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using X.PagedList;

namespace DoanComics.Areas.Admin.Controllers
{
	[Area("admin")]
	[Route("admin")]
	[Route("admin/homeadmin")]
	public class HomeAdminController : Controller
	{
		DoAnTruyenContext db = new DoAnTruyenContext();


		[Route("")]
		[Route("index")]
		public IActionResult Index()
		{
			if (HttpContext.Session.GetString("email") != null)
			{
				var user = db.Users.FirstOrDefault(x => x.Email == HttpContext.Session.GetString("email").Trim());
				ViewBag.name = user.Ten;
				ViewBag.avt = user.Avatar;
				if (user.Loai != 0)
				{
					Response.StatusCode = 404;
				}
				else
				{
					return View();
				}
			}
			return RedirectToAction("Login", "Access");
		}

		[Route("truyen")]
		public IActionResult Truyen(int? page)
		{
			int pageSize = 10;
			int pageNumber = page == null || page < 0 ? 1 : page.Value;
			var listTruyen = db.Truyens.AsNoTracking().OrderBy(x => x.NgayDang);
			PagedList<Truyen> lst = new PagedList<Truyen>(listTruyen, pageNumber, pageSize);
			if (HttpContext.Session.GetString("email") != null)
			{
				var user = db.Users.FirstOrDefault(x => x.Email == HttpContext.Session.GetString("email").Trim());
				ViewBag.name = user.Ten;
				ViewBag.avt = user.Avatar;
				if (user.Loai != 0)
				{
					Response.StatusCode = 404;
					return RedirectToAction("index", "home");
				}
				else
				{
					return View(lst);
				}
			}
			else
			{
				return RedirectToAction("Login", "Access");
			}
		}

		[Route("ThemTruyen")]
		[HttpGet]
		public IActionResult ThemTruyen()
		{
			if (HttpContext.Session.GetString("email") != null)
			{
				var user = db.Users.FirstOrDefault(x => x.Email == HttpContext.Session.GetString("email").Trim());
				ViewBag.name = user.Ten;
				ViewBag.avt = user.Avatar;
				if (user.Loai != 0)
				{
					Response.StatusCode = 404;
				}
				else
				{
					return View();
				}
			}
			return RedirectToAction("Login", "Access");
		}
		[Route("ThemTruyen")]
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult ThemTruyen(Truyen truyen)
		{
			if (ModelState.IsValid)
			{
				db.Truyens.Add(truyen);
				db.SaveChanges();
				return RedirectToAction("truyen");
			}
			return View(truyen);
		}

		[Route("SuaTruyen")]
		[HttpGet]
		public IActionResult SuaTruyen(int id)
		{
			var truyen = db.Truyens.Find(id);
			return View(truyen);
		}
		[Route("SuaTruyen")]
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult SuaTruyen(Truyen truyen)
		{
			if (ModelState.IsValid)
			{
				db.Update(truyen);
				db.SaveChanges();
				return RedirectToAction("Truyen", "HomeAdmin");
			}
			return View(truyen);
		}

		[Route("ChiTiet")]
		[HttpGet]
		public IActionResult ChiTiet(int id)
		{
			if (HttpContext.Session.GetString("email") != null)
			{
				var user = db.Users.FirstOrDefault(x => x.Email == HttpContext.Session.GetString("email").Trim());
				ViewBag.name = user.Ten;
				ViewBag.avt = user.Avatar;
				Truyen truyen = db.Truyens.FirstOrDefault(x => x.Id == id);
				List<Chuong> chuongs = db.Chuongs.ToList();
				TruyenAndChuong truyenAndChuong = new TruyenAndChuong()
				{
					myTruyen = truyen,
					myChuong = chuongs.Where(x => x.IdTruyen == id).ToList(),
				};
				TempData["IDtruyen"] = truyen.Id;
				return View(truyenAndChuong);
			}
			else
			{
				return RedirectToAction("Login", "Access");
			}
		}

		[Route("LiveSearch")]
		[HttpGet]
		public IActionResult LiveSearch(string search)
		{
			List<Truyen> res = (
				from t in db.Truyens
				where t.TenTruyen.Contains(search)
				select t
				).ToList();
			if (res == null)
			{
				return View(db.Truyens.ToList());
			}
			return View(res);
		}


	}
}
