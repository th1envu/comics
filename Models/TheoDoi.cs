using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class TheoDoi
{
    public int Id { get; set; }

    public int? IdTruyen { get; set; }

    public int? IdUser { get; set; }

    public bool? IsFollow { get; set; }
}
