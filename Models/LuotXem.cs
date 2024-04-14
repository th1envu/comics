using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class LuotXem
{
    public long Id { get; set; }

    public int? IdTruyen { get; set; }

    public int? IdChuong { get; set; }

    public int? IdUser { get; set; }
}
