using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace DoanComics.Models.Authentication
{
    public class Authentication: ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            DoAnTruyenContext db = new DoAnTruyenContext();
            //if (context.HttpContext.Session.GetString("email") == null)
            //{
            //    context.Result = new RedirectToRouteResult(
            //    new RouteValueDictionary
            //    {
            //        {"Controller", "Home"},
            //        {"Action", "Index" }
            //    });
            //}
            if (context.HttpContext.Session.GetString("email") != null)
            {
                var a=db.Users.FirstOrDefault(x=>x.Email== context.HttpContext.Session.GetString("email"));
                if (a.Loai == 1)
                {
                    context.Result = new RedirectToRouteResult(
                        new RouteValueDictionary
                        {
                            {"Controller", "Home" },
                            {"Action", "Index" }
                        });
                }
            }
        }
    }
}
