using DoanComics.Repository;
using Microsoft.AspNetCore.Mvc;

namespace DoanComics.ViewComponents
{
	public class CommentsViewComponent:ViewComponent
	{
		private readonly IBinhLuanRepository _cmt;
		public CommentsViewComponent(IBinhLuanRepository cmt)
		{
			_cmt = cmt;
		}
		public IViewComponentResult Invoke(int id)
		{
			var comments = _cmt.GetAll(id);
			return View(comments);
		}
	}
}
