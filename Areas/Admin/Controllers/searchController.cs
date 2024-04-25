using DoanComics.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoanComics.Areas.Admin.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class searchController : ControllerBase
	{
		DoAnTruyenContext db = new DoAnTruyenContext();
		[HttpGet]
		public List<Truyen> search(string name)
		{
			return db.Truyens.Where(x => x.TenTruyen.Contains(name)).ToList();
		}

		[Route("addTacGia")]
		public bool add(string ten)
		{
			try
			{
				var checkExist = db.TacGia.FirstOrDefault(x => x.TenTacGia == ten.Trim());
				if (checkExist != null)
				{
					TruyenTacGium ttg = new()
					{
						IdTacGia = checkExist.Id
					};
					db.TruyenTacGia.Add(ttg);
				}
				else
				{
					TacGium tg = new()
					{
						TenTacGia = ten
					};
					db.TacGia.Add(tg);
					db.SaveChanges();
					TruyenTacGium ttg = new()
					{
						IdTacGia = tg.Id
					};
					db.TruyenTacGia.Add(ttg);
				}
				db.SaveChanges();
				return true;
			}
			catch
			{
				return false;
			}
		}
	}
}
