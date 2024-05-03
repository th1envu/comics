using DoanComics.Models;
using X.PagedList;

namespace DoanComics.Repository
{
	public interface IBinhLuanRepository
	{
		List<Comment> GetAll(int id);
		List<Comment> GetC(int id);
	}
}
