using Microsoft.AspNetCore.Mvc;
using DoanComics.Models;

namespace DoanComics.Controllers
{
    public class AccessController : Controller
    {
        DoAnTruyenContext db=new DoAnTruyenContext();
        [HttpGet]
        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("email") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        [HttpPost]
        public IActionResult Login(User user)
        {
            if(HttpContext.Session.GetString("email")==null)
            {
                var u =db.Users.FirstOrDefault(x=>x.Email.Equals(user.Email)&&x.MatKhau.Equals(user.MatKhau));
                if(u!=null)
                {
                    if (u.Loai == 0)
                    {
                        HttpContext.Session.SetString("email", user.Email.ToString());
                        return RedirectToAction("Index", "Admin");
                    }
                    else
                    {
                        HttpContext.Session.SetString("email", user.Email.ToString());
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Sai email hoặc mật khẩu");
                }
            }
            return View();
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("email");
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public IActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SignUp(User user)
        {
            var check=db.Users.FirstOrDefault(x=>x.Email==user.Email);
            if (check == null)
            {
				if (ModelState.IsValid)
				{
					db.Users.Add(user);
					db.SaveChanges();
                    Thread.Sleep(5000);
					ModelState.AddModelError(string.Empty, "Đăng ký thành công!");
					return RedirectToAction("Login", "Access");
				}
            }
            else
            {
				ModelState.AddModelError(string.Empty, "Email đã được đăng ký trước đó");
			}
			return View(user);
        }
    }
}
