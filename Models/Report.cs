using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class Report
{
    public int Id { get; set; }

    public int? IdChuong { get; set; }

    public string? LoiNhan { get; set; }
}
