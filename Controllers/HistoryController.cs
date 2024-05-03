using DoanComics.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoanComics.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class HistoryController : ControllerBase
	{
		DoAnTruyenContext db = new();
		[Route("insertlichsu")]
		//[HttpPost]
		//[ValidateAntiForgeryToken]
		public bool InsertLichSu(int idc, int idt, int idu)
		{
			try
			{
				LichSu checkExist = db.LichSus.FirstOrDefault(x => (x.IdChuong == idc && x.IdTruyen == idt && x.IdUser == idu));
				LichSu ls = new()
				{
					IdChuong = idc,
					IdTruyen = idt,
					IdUser = idu
				};
				if (checkExist != null)
				{
					db.Remove(checkExist);
					//db.RemoveRange(checkExist);
					db.Add(ls);
					db.SaveChanges();
					return true;
				}
				db.Add(ls);
				db.SaveChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}

		[Route("commentChuong")]
		public bool commenc(int idc, string bl)
		{
			try
			{
				if (HttpContext.Session.GetString("email") != null)
				{
					User user = db.Users.FirstOrDefault(x => x.Email == HttpContext.Session.GetString("email").Trim());
					BinhLuan binhLuan = new()
					{
						IdUser = user.Id,
						IdChuong = idc,
						BinhLuan1 = bl,
						HoatDong=DateTime.Now,
					};
					db.BinhLuans.Add(binhLuan);
					db.SaveChanges();
					return true;
				}
				return false;
			}
			catch { return false; }
		}

		[Route("commentTruyen")]
		public bool comment(int idt, string bl)
		{
			try
			{
				if (HttpContext.Session.GetString("email") != null)
				{
					User user = db.Users.FirstOrDefault(x => x.Email == HttpContext.Session.GetString("email").Trim());
					BinhLuan binhLuan = new()
					{
						IdUser = user.Id,
						IdTruyen = idt,
						BinhLuan1 = bl,
						HoatDong = DateTime.Now,
					};
					db.BinhLuans.Add(binhLuan);
					db.SaveChanges();
					return true;
				}
				return false;
			}
			catch { return false; }
		}
	}
}
