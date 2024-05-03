using Azure;
using DoanComics.Models;
using DoanComics.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing.Printing;
using X.PagedList;
using System.Net;
using System.IO;
using System.Globalization;
using System.Text;

namespace DoanComics.Controllers
{
	public class HomeController : Controller
	{
		DoAnTruyenContext db = new DoAnTruyenContext();
		private readonly ILogger<HomeController> _logger;

		public HomeController(ILogger<HomeController> logger)
		{
			_logger = logger;
		}

		public bool isLoggedIn()
		{
			if (HttpContext.Session.GetString("email") != null)
			{
				string s = HttpContext.Session.GetString("email").Trim();
				var user = db.Users.FirstOrDefault(x => x.Email == s);
				ViewBag.name = user.Ten;
				ViewBag.avt = user.Avatar;
				return true;
			}
			return false;
		}
		static string RemoveDiacritics(string text)
		{
			string normalizedString = text.Normalize(NormalizationForm.FormD);
			StringBuilder stringBuilder = new StringBuilder();

			foreach (char c in normalizedString)
			{
				UnicodeCategory unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
				if (unicodeCategory != UnicodeCategory.NonSpacingMark)
				{
					stringBuilder.Append(c);
				}
			}

			return stringBuilder.ToString().Normalize(NormalizationForm.FormC);
		}

		public IActionResult Index(int? page)
		{
			int pageSize = 20;
			int pageNumber = page == null || page < 0 ? 1 : page.Value;
			var listTruyen = db.Truyens.AsNoTracking().OrderBy(x => x.NgayDang);
			PagedList<Truyen> lst = new PagedList<Truyen>(listTruyen, pageNumber, pageSize);
			if (isLoggedIn())
			{
				return View("IndexLogged", lst);
			}
			return View(lst);
		}

		public IActionResult TruyenTheoTheLoai(int idTheLoai, int? page)
		{
			int pageSize = 20;
			int pageNumber = page == null || page < 0 ? 1 : page.Value;

			var listTL = db.TruyenTheLoais.Where(x => x.IdTheLoai == idTheLoai);
			List<Truyen> listTruyen = new List<Truyen>();
			List<int?> ints = new List<int?>();
			foreach (var truyen in listTL)
			{
				ints.Add(truyen.IdTruyen);
			}
			foreach (int? i in ints)
			{
				Truyen x = db.Truyens.FirstOrDefault(x => x.Id == i);
				listTruyen.Add(x);
			}
			ViewBag.Id = idTheLoai;
			PagedList<Truyen> lst = new PagedList<Truyen>(listTruyen, pageNumber, pageSize);
			if (isLoggedIn())
			{
				return View("IndexLogged", lst);
			}
			return View(lst);
		}

		public IActionResult ChiTietTruyen(int id)
		{
			string email = HttpContext.Session.GetString("email");
			if (email != null)
			{
				var user = db.Users.FirstOrDefault(x => x.Email == email);
				TempData["idUser"] = user.Id;
				TempData["idTruyen"] = id;
			}
			List<Truyen> truyens = db.Truyens.ToList();
			List<Chuong> chuongs = db.Chuongs.ToList();
			List<LuotXem> luotXems = db.LuotXems.ToList();
			List<TruyenTacGium> truyenTacGias = db.TruyenTacGia.Where(x => x.IdTruyen == id).ToList();
			List<TacGium> listTG = new();
			foreach (var item in truyenTacGias)
			{
				int? idt = item.IdTacGia;
				listTG.Add(db.TacGia.FirstOrDefault(x => x.Id == idt));
			}
			List<TruyenTheLoai> truyenTheLoais = db.TruyenTheLoais.Where(x => x.IdTruyen == id).ToList();
			List<TheLoai> listTL = new();
			foreach (var item in truyenTheLoais)
			{
				int? idt = item.IdTheLoai;
				listTL.Add(db.TheLoais.FirstOrDefault(x => x.Id == idt));
			}
			TruyenAndChuong truyenAndChuong = new TruyenAndChuong()
			{
				myTruyen = truyens.FirstOrDefault(x => x.Id == id),
				myChuong = chuongs.Where(x => x.IdTruyen == id).ToList(),
				myTacGias = listTG,
				myTheLoais = listTL,
				myLuotXem = luotXems.Where(x => x.IdTruyen == id).ToList()
			}; 
			ViewBag.folder = RemoveDiacritics(truyenAndChuong.myTruyen.TenTruyen.Trim()).Replace(' ', '-');
			ViewBag.id = id;
			if (isLoggedIn())
			{
				return View("ChiTietTruyenLogged", truyenAndChuong);
			}
			return View(truyenAndChuong);
		}

		public IActionResult ChiTietChuong(int idChuong)
		{
			Chuong chuongs = db.Chuongs.FirstOrDefault(x => x.Id == idChuong);
			Truyen truyen = db.Truyens.FirstOrDefault(x => x.Id == chuongs.IdTruyen);
			string[] imagePaths = Directory.GetFiles(@"C:/Users/thien vu/OneDrive/Máy tính/Doan/truyenStorage/chapImg/" + RemoveDiacritics(truyen.TenTruyen.Trim()).Replace(' ', '-') + "/" + chuongs.TenChuong.Trim().Replace(' ', '-'));
			int i = 0;
			string[] imgNames = new string[250];
			TempData["idChuong"] = chuongs.Id;
			ViewBag.idc=chuongs.Id;
			List<Chuong> prev_Next_Chap = db.Chuongs.Where(x => x.IdTruyen == chuongs.IdTruyen).OrderBy(x => x.Id).ToList();
			for (int j = 0; j < prev_Next_Chap.Count; j++)
			{
				if (prev_Next_Chap[j].Id == chuongs.Id && j > 0&&j< prev_Next_Chap.Count-1)
				{
					TempData["PrevChap"] = prev_Next_Chap[j - 1].Id;
					TempData["NextChap"] = prev_Next_Chap[j + 1].Id;
				}
				if (prev_Next_Chap[j].Id == chuongs.Id&&j==0)
				{
					TempData["PrevChap"] = 0;
					TempData["NextChap"] = prev_Next_Chap[j + 1].Id;
				}
				if (prev_Next_Chap[j].Id == chuongs.Id&&j== prev_Next_Chap.Count-1)
				{
					TempData["PrevChap"] = prev_Next_Chap[j - 1].Id;
					TempData["NextChap"] = 0;
				}
			}
			TempData["MaxChap"] = db.Chuongs.Where(x => x.IdTruyen == truyen.Id).OrderByDescending(x => x.Id).FirstOrDefault().Id;
			foreach (var item in imagePaths)
			{
				imgNames[i] = Path.GetFileName(item); i++;
			}
			ViewBag.tenTruyen = RemoveDiacritics(truyen.TenTruyen.Trim()).Replace(' ', '-');
			ViewBag.folder = chuongs.TenChuong.Trim().Replace(' ', '-');
			if (isLoggedIn())
			{
				string email = HttpContext.Session.GetString("email");
				if (email != null)
				{
					var user = db.Users.FirstOrDefault(x => x.Email == email);
					if (db.LuotXems.FirstOrDefault(x => (x.IdChuong == idChuong && x.IdUser == user.Id)) == null)
					{
						LuotXem luotXemx = new()
						{
							IdTruyen = chuongs.IdTruyen,
							IdChuong = idChuong,
							IdUser = user.Id
						};
						db.LuotXems.Add(luotXemx);
						db.SaveChanges();
					}
				}
				return View("ChiTietChuongLogged", imgNames);
			}
			LuotXem luotXem = new()
			{
				IdTruyen = chuongs.IdTruyen,
				IdChuong = idChuong
			};
			db.LuotXems.Add(luotXem);
			db.SaveChanges();
			return View(imgNames);
		}

		public IActionResult TruyenDeCu(int? page)
		{
			int pageSize = 18;
			int pageNumber = page == null || page < 0 ? 1 : page.Value;
			Random random = new Random();
			var truyenDeCu = db.Truyens.OrderBy(x => random.Next()).Take(8).ToList();
			PagedList<Truyen> lst = new PagedList<Truyen>(truyenDeCu, pageNumber, pageSize);
			return View(lst);
		}

		public IActionResult TruyenTop(int? page)
		{
			int pageSize = 18;
			int pageNumber = page == null || page < 0 ? 1 : page.Value;
			Random random = new Random();
			//var truyenTop = db.Truyens.OrderBy(x => random.Next()).Take(5).ToList();
			var truyenTop = db.Truyens.ToList();
			PagedList<Truyen> lst = new PagedList<Truyen>(truyenTop, pageNumber, pageSize);
			return View(truyenTop);
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult Follow(int idtruyen, int iduser)
		{
			if (isLoggedIn())
			{
				string email = HttpContext.Session.GetString("email");
				if (email != null)
				{
					var user = db.Users.FirstOrDefault(x => x.Email == email);
					TempData["idUser"] = user.Id;
				}
				List<Truyen> truyens = db.Truyens.ToList();
				List<Chuong> chuongs = db.Chuongs.ToList();
				TruyenAndChuong truyenAndChuong = new TruyenAndChuong()
				{
					myTruyen = truyens.FirstOrDefault(x => x.Id == idtruyen),
					myChuong = chuongs.Where(x => x.IdTruyen == idtruyen).ToList(),
				};

				var isExist = db.TheoDois.FirstOrDefault(x => (x.IdTruyen == idtruyen && x.IdUser == iduser));
				if (isExist == null)
				{
					var insert = new TheoDoi
					{
						IdTruyen = idtruyen,
						IdUser = iduser,
						IsFollow = true,
					};
					db.TheoDois.Add(insert);
					db.SaveChanges();
				}
				else
				{
					var change = db.TheoDois.FirstOrDefault(x => (x.IdTruyen == idtruyen && x.IdUser == iduser));
					if (change.IsFollow == true)
					{
						change.IsFollow = false;
						db.Update(change);
						db.SaveChanges();
					}
					else
					{
						change.IsFollow = true;
						db.Update(change);
						db.SaveChanges();
					}
				}
				return RedirectToAction("ChiTietTruyen", new { id = idtruyen });
			}
			else
			{
				return RedirectToAction("Login", "Access");
			}
		}

		public IActionResult TruyenTheoDoi(int? page)
		{
			if (isLoggedIn())
			{
				string email = HttpContext.Session.GetString("email").Trim();
				var user = db.Users.FirstOrDefault(x => x.Email == email);
				var theodoi = db.TheoDois.Where(x => x.IdUser == user.Id);
				List<Truyen> listTruyen = new List<Truyen>();
				foreach (var item in theodoi)
				{
					if (item.IsFollow == true)
					{
						listTruyen.Add(db.Truyens.FirstOrDefault(x => x.Id == item.IdTruyen));
					}
				}
				int pageSize = 18;
				int pageNumber = page == null || page < 0 ? 1 : page.Value;
				PagedList<Truyen> lst = new PagedList<Truyen>(listTruyen, pageNumber, pageSize);
				return View("TruyenTheoDoi", lst);
			}
			else
			{
				return RedirectToAction("Login", "access");
			}
		}

		public IActionResult LichSu(int? page)
		{
			if (isLoggedIn())
			{
				string email = HttpContext.Session.GetString("email").Trim();
				var user = db.Users.FirstOrDefault(x => x.Email == email);
				var lichsu = db.LichSus.Where(x => x.IdUser == user.Id).OrderBy(x => x.HoatDong).ToList();
				List<Truyen> listTruyen = new List<Truyen>();
				foreach (var item in lichsu)
				{
					listTruyen.Add(db.Truyens.FirstOrDefault(x => x.Id == item.IdTruyen));
				}
				HashSet<Truyen> unique = new HashSet<Truyen>(listTruyen);
				List<Truyen> listTruyen_ = new List<Truyen>(unique);
				int pageSize = 18;
				int pageNumber = page == null || page < 0 ? 1 : page.Value;
				PagedList<Truyen> l = new PagedList<Truyen>(listTruyen_, pageNumber, pageSize);
				return View("LichSu", l);
			}
			else
			{
				return RedirectToAction("Login", "access");
			}
		}


		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}