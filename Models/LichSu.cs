using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class LichSu
{
    public int Id { get; set; }

    public int? IdChuong { get; set; }

    public int? IdUser { get; set; }

    public int? IdTruyen { get; set; }

    public DateTime HoatDong { get; set; }
}
