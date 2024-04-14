using DoanComics.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DoanComics.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class checkController : ControllerBase
    {
        DoAnTruyenContext db = new DoAnTruyenContext();

        [HttpGet]
        public bool isFollow(int idtruyen, int iduser)
        {
            TheoDoi td=db.TheoDois.FirstOrDefault(x=>(x.IdTruyen==idtruyen&&x.IdUser==iduser));
            if(td!=null&&td.IsFollow==true)
            {
                return true;
            }
            return false;
        }
    }
}
