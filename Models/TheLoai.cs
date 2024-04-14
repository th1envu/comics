using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class TheLoai
{
    public int Id { get; set; }

    public string TenTheLoai { get; set; } = null!;

    public string? GhiChu { get; set; }

    public string? Keyword { get; set; }
}
