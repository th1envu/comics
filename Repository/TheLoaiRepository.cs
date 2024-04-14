using DoanComics.Models;
namespace DoanComics.Repository
{
	public interface TheLoaiRepository
	{
		TheLoai Add(TheLoai theLoaiTruyen);
		TheLoai Update(TheLoai theLoaiTruyen);
		TheLoai Delete(String id);
		TheLoai GetTheLoai(String id);
		IEnumerable<TheLoai> GetAllTheLoai();	
	}
}
