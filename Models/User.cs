using System;
using System.Collections.Generic;

namespace DoanComics.Models;

public partial class User
{
    public int Id { get; set; }

    public string? Ten { get; set; }

    public string? Email { get; set; }

    public string? MatKhau { get; set; }

    public byte? Loai { get; set; }

    public string? Avatar { get; set; }

    public string? RememberToken { get; set; }
}
