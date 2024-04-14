using System;
using System.Collections.Generic;

namespace DoanComics.Models
{
	public class TruyenAndChuong
	{
		public Truyen myTruyen { get; set; }
		public List<Chuong> myChuong { get; set; }
		public List<TheLoai> myTheLoais { get; set; }
		public List<TacGium> myTacGias { get; set; }
	}
}
