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

		//[HttpPost]
		//public bool follow(int idtruyen, int iduser) {
		//	try
		//	{
		//		var isExist = db.TheoDois.FirstOrDefault(x => (x.IdTruyen == idtruyen && x.IdUser == iduser));
		//		if (isExist == null)
		//		{
		//			var insert = new TheoDoi
		//			{
		//				IdTruyen = idtruyen,
		//				IdUser = iduser,
		//				IsFollow = true,
		//			};
		//			db.TheoDois.Add(insert);
		//			db.SaveChanges();
		//			return true;
		//		}
		//		else
		//		{
		//			var change = db.TheoDois.FirstOrDefault(x => (x.IdTruyen == idtruyen && x.IdUser == iduser));
		//			change.IsFollow = false;
		//			db.Update(change);
		//			db.SaveChanges();
		//			return true;
		//		}
		//	}
		//	catch
		//	{
		//		return false;
		//	}
		//}
		//[HttpPost]
		//[ValidateAntiForgeryToken]
		//public bool follow(int idtruyen, int iduser)
		//{
		//	try
		//	{
		//		TheoDoi insert = new TheoDoi()
		//		{
		//			IdTruyen = idtruyen,
		//			IdUser = iduser,
		//			IsFollow = true
		//		};
		//		db.TheoDois.Add(insert);
		//		db.SaveChanges();
		//		return true;
		//	}
		//	catch
		//	{
		//		return false;
		//	}
		//}
	}
}
