﻿using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class BinhLuan
{
    public int Id { get; set; }

    public string? BinhLuan1 { get; set; }

    public int? IdUser { get; set; }

    public int? IdChuong { get; set; }

    public int? IdTruyen { get; set; }

    public DateTime? HoatDong { get; set; }
}
