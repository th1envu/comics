using DoanComics.Models;

namespace DoanComics.Repository
{
	public class ClassTheLoai : TheLoaiRepository
	{
		private readonly DoAnTruyenContext _context;
		public ClassTheLoai(DoAnTruyenContext context)
		{
			_context = context;
		}

		public TheLoai Add(TheLoai theLoaiTruyen)
		{
			_context.TheLoais.Add(theLoaiTruyen);
			_context.SaveChanges();
			return theLoaiTruyen;
		}

		public TheLoai Delete(string id)
		{
			throw new NotImplementedException();
		}

		public IEnumerable<TheLoai> GetAllTheLoai()
		{
			return _context.TheLoais;
		}

		public TheLoai GetTheLoai(string id)
		{
			return _context.TheLoais.Find(id);
		}

		public TheLoai Update(TheLoai theLoaiTruyen)
		{
			_context.Update(theLoaiTruyen);
			_context.SaveChanges();
			return theLoaiTruyen;
		}
	}
}
