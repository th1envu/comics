using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class Truyen
{
    public int Id { get; set; }

    public string TenTruyen { get; set; } = null!;

    public string BiDanh { get; set; } = null!;

    public string? NoiDung { get; set; }

    public byte? TrangThai { get; set; }

    public string? Nguon { get; set; }

    public string? AnhDaiDien { get; set; }

    public int? IdUser { get; set; }

    public string? GhiChu { get; set; }

    public DateTime? HoatDong { get; set; }

    public DateTime? NgayDang { get; set; }

    public bool? IsDelete { get; set; }
}
