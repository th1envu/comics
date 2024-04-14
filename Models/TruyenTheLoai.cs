using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class TruyenTheLoai
{
    public int Id { get; set; }

    public int? IdTruyen { get; set; }

    public int? IdTheLoai { get; set; }
}
