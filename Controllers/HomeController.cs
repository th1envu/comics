using Azure;
using DoanComics.Models;
using DoanComics.Models.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing.Printing;
using X.PagedList;

namespace DoanComics.Controllers
{
    public class HomeController : Controller
    {
        DoAnTruyenContext db = new DoAnTruyenContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public bool isLoggedIn()
        {
            if (HttpContext.Session.GetString("email") != null)
            {
                string s = HttpContext.Session.GetString("email").Trim();
                var user = db.Users.FirstOrDefault(x => x.Email == s);
                ViewBag.name = user.Ten;
                ViewBag.avt = user.Avatar;
                return true;
            }
            return false;
        }

        public IActionResult Index(int? page)
        {
            int pageSize = 18;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listTruyen = db.Truyens.AsNoTracking().OrderBy(x => x.NgayDang);
            PagedList<Truyen> lst = new PagedList<Truyen>(listTruyen, pageNumber, pageSize);
            if (isLoggedIn())
            {
                return View("IndexLogged", lst);
            }
            return View(lst);
        }

        public IActionResult TruyenTheoTheLoai(int idTheLoai, int? page)
        {
            int pageSize = 18;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;

            var listTL = db.TruyenTheLoais.Where(x => x.IdTheLoai == idTheLoai);
            List<Truyen> listTruyen = new List<Truyen>();
            List<int?> ints = new List<int?>();
            foreach (var truyen in listTL)
            {
                ints.Add(truyen.IdTruyen);
            }
            foreach (int? i in ints)
            {
                Truyen x = db.Truyens.FirstOrDefault(x => x.Id == i);
                listTruyen.Add(x);
            }
            ViewBag.Id = idTheLoai;
            PagedList<Truyen> lst = new PagedList<Truyen>(listTruyen, pageNumber, pageSize);
            if (isLoggedIn())
            {
                return View("IndexLogged", lst);
            }
            return View(lst);
        }

        public IActionResult ChiTietTruyen(int id)
        {
            string email = HttpContext.Session.GetString("email");
            if (email != null)
            {
                var user = db.Users.FirstOrDefault(x => x.Email == email);
                TempData["idUser"] = user.Id;
                TempData["idTruyen"] = id;
            }
            List<Truyen> truyens = db.Truyens.ToList();
            List<Chuong> chuongs = db.Chuongs.ToList();
            List<TruyenTacGium> truyenTacGias=db.TruyenTacGia.Where(x=>x.IdTruyen==id).ToList();
            List<TacGium> listTG = new();
            foreach(var item in truyenTacGias)
            {
                int? idt = item.IdTacGia;
                listTG.Add(db.TacGia.FirstOrDefault(x=>x.Id==idt));
            }
            List<TruyenTheLoai> truyenTheLoais=db.TruyenTheLoais.Where(x => x.IdTruyen == id).ToList();
            List<TheLoai> listTL= new();
            foreach(var item in truyenTheLoais)
            {
                int? idt = item.IdTheLoai;
                listTL.Add(db.TheLoais.FirstOrDefault(x => x.Id == idt));
            }
            TruyenAndChuong truyenAndChuong = new TruyenAndChuong()
            {
                myTruyen = truyens.FirstOrDefault(x => x.Id == id),
                myChuong = chuongs.Where(x => x.IdTruyen == id).ToList(),
                myTacGias = listTG,
                myTheLoais= listTL,
            };
            if (isLoggedIn())
            {
                return View("ChiTietTruyenLogged", truyenAndChuong);
            }
            return View(truyenAndChuong);
        }

        public IActionResult ChiTietChuong(int idChuong)
        {
            Chuong chuongs = db.Chuongs.FirstOrDefault(x => x.Id == idChuong);
            var imagePaths = Directory.GetFiles(@"C:/Users/thien vu/OneDrive/Máy tính/Doan/truyenStorage/chapImg/" + chuongs.Id + "_" + chuongs.IdTruyen);
            int i = 0;
            string[] imgnames = new string[250];
            foreach (var item in imagePaths)
            {
                imgnames[i] = Path.GetFileName(item); i++;
            }
            ViewBag.folder = chuongs.Id + "_" + chuongs.IdTruyen;
            if (isLoggedIn())
            {
                return View("ChiTietChuongLogged", imgnames);
            }
            return View(imgnames);
        }

        public IActionResult TruyenDeCu(int? page)
        {
            int pageSize = 18;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            Random random = new Random();
            var truyenDeCu = db.Truyens.OrderBy(x => random.Next()).Take(8).ToList();
            PagedList<Truyen> lst = new PagedList<Truyen>(truyenDeCu, pageNumber, pageSize);
            return View(lst);
        }

        public IActionResult TruyenTop(int? page)
        {
            int pageSize = 18;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            Random random = new Random();
            var truyenDeCu = db.Truyens.OrderBy(x => random.Next()).Take(10).ToList();
            PagedList<Truyen> lst = new PagedList<Truyen>(truyenDeCu, pageNumber, pageSize);
            return View(lst);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Follow(int idtruyen, int iduser)
        {
            if (isLoggedIn())
            {
                string email = HttpContext.Session.GetString("email");
                if (email != null)
                {
                    var user = db.Users.FirstOrDefault(x => x.Email == email);
                    TempData["idUser"] = user.Id;
                }
                List<Truyen> truyens = db.Truyens.ToList();
                List<Chuong> chuongs = db.Chuongs.ToList();
                TruyenAndChuong truyenAndChuong = new TruyenAndChuong()
                {
                    myTruyen = truyens.FirstOrDefault(x => x.Id == idtruyen),
                    myChuong = chuongs.Where(x => x.IdTruyen == idtruyen).ToList(),
                };

                var isExist = db.TheoDois.FirstOrDefault(x => (x.IdTruyen == idtruyen && x.IdUser == iduser));
                if (isExist == null)
                {
                    var insert = new TheoDoi
                    {
                        IdTruyen = idtruyen,
                        IdUser = iduser,
                        IsFollow = true,
                    };
                    db.TheoDois.Add(insert);
                    db.SaveChanges();
				}
                else
                {
                    var change = db.TheoDois.FirstOrDefault(x => (x.IdTruyen == idtruyen && x.IdUser == iduser));
                    if (change.IsFollow == true)
                    {
                        change.IsFollow = false;
                        db.Update(change);
                        db.SaveChanges();
                    }
                    else
                    {
                        change.IsFollow = true;
                        db.Update(change);
                        db.SaveChanges();
                    }
                }
                return RedirectToAction("ChiTietTruyen", new {id=idtruyen});
            }
            else
            {
                return RedirectToAction("Login", "Access");
            }
        }

        public IActionResult TruyenTheoDoi(int? page)
        {
            if (isLoggedIn())
            {
                string email = HttpContext.Session.GetString("email").Trim();
                var user = db.Users.FirstOrDefault(x => x.Email == email);
                var theodoi = db.TheoDois.Where(x => x.IdUser == user.Id);
                List<Truyen> listTruyen = new List<Truyen>();
                foreach (var item in theodoi)
                {
                    if(item.IsFollow== true)
                    {
                        listTruyen.Add(db.Truyens.FirstOrDefault(x => x.Id == item.IdTruyen));
                    }
                }
                int pageSize = 18;
                int pageNumber = page == null || page < 0 ? 1 : page.Value;
                PagedList<Truyen> lst = new PagedList<Truyen>(listTruyen, pageNumber, pageSize);
                return View("TruyenTheoDoi", lst);
            }
            else
            {
                return RedirectToAction("Login", "access");
            }
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}