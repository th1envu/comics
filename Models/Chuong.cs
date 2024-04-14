using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class Chuong
{
    public int Id { get; set; }

    public int IdTruyen { get; set; }

    public string? TenChuong { get; set; }

    public string? NoiDung { get; set; }

    public long? LuotXem { get; set; }

    public DateTime? HoatDong { get; set; }
}
