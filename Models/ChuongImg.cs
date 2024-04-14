using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class ChuongImg
{
    public int Id { get; set; }

    public int AnhSo { get; set; }

    public int? IdChuong { get; set; }

    public int? IdTruyen { get; set; }

    public string? LinkAnh { get; set; }
}
