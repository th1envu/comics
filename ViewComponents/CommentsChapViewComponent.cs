using DoanComics.Repository;
using Microsoft.AspNetCore.Mvc;

namespace DoanComics.ViewComponents
{
	public class CommentsChapViewComponent:ViewComponent
	{
		private readonly IBinhLuanRepository _cmt;
		public CommentsChapViewComponent(IBinhLuanRepository cmt)
		{
			_cmt = cmt;
		}
		public IViewComponentResult Invoke(int id)
		{
			var comments = _cmt.GetC(id);
			return View(comments);
		}
	}
}
