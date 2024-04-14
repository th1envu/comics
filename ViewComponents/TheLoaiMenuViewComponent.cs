using DoanComics.Models;
using DoanComics.Repository;
using Microsoft.AspNetCore.Mvc;
namespace DoanComics.ViewComponents
{
    public class TheLoaiMenuViewComponent : ViewComponent
    {
        private readonly TheLoaiRepository _loaiMenu;
        public TheLoaiMenuViewComponent(TheLoaiRepository theLoaiRepository)
        {
            _loaiMenu = theLoaiRepository;
        }
        public IViewComponentResult Invoke()
        {
            var loaiMn = _loaiMenu.GetAllTheLoai().OrderBy(x => x.TenTheLoai);
            return View(loaiMn);
        }
    }
}
