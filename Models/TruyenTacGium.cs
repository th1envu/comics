using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class TruyenTacGium
{
    public int Id { get; set; }

    public int? IdTruyen { get; set; }

    public int? IdTacGia { get; set; }
}
