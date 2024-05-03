using DoanComics.Models;
using X.PagedList;

namespace DoanComics.Repository
{
	public class BinhLuanRepository : IBinhLuanRepository
	{
		private readonly DoAnTruyenContext _context;
		public BinhLuanRepository(DoAnTruyenContext context)
		{
			_context= context;
		}
		public List<Comment> GetAll(int id)
		{
			List<Chuong> chuongs = _context.Chuongs.Where(x => x.IdTruyen == id).ToList();
			List<BinhLuan> bls = new();
			foreach (var item in chuongs)
			{
				bls.AddRange(_context.BinhLuans.Where(x => x.IdChuong == item.Id).ToList());
			}
			bls.AddRange(_context.BinhLuans.Where(x => x.IdTruyen == id));
			List<Comment> cmts = new();
			foreach (var item in bls)
			{
				string s;
				if (item.IdChuong != null)
				{
					Chuong y = _context.Chuongs.FirstOrDefault(x => x.Id == item.IdChuong);
					s = y.TenChuong;
				}
				else
				{
					s = "";
				}
				Comment i = new()
				{
					myUser = _context.Users.FirstOrDefault(x => x.Id == item.IdUser),
					myBinhLuan = bls.FirstOrDefault(x => x.Id == item.Id),
					tenChuong = s,
				};
				cmts.Add(i);
			}
			cmts = cmts.OrderByDescending(x => x.myBinhLuan.Id).ToList();
			return cmts;
		}

		public List<Comment> GetC(int id)
		{
			List<BinhLuan> binhLuans = _context.BinhLuans.Where(x => x.IdChuong == id).ToList();
			List<Comment> cmts = new();
			foreach(var item in binhLuans)
			{
				Comment i = new()
				{
					myUser = _context.Users.FirstOrDefault(x => x.Id == item.IdUser),
					myBinhLuan = binhLuans.FirstOrDefault(x => x.Id == item.Id),
					tenChuong = "",
				};
				cmts.Add(i);
			}
			cmts = cmts.OrderByDescending(x => x.myBinhLuan.Id).ToList();
			return cmts;
		}
	}
}
