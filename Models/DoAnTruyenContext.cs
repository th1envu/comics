using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DoanComics.Models;

public partial class DoAnTruyenContext : DbContext
{
    public DoAnTruyenContext()
    {
    }

    public DoAnTruyenContext(DbContextOptions<DoAnTruyenContext> options)
        : base(options)
    {
    }

    public virtual DbSet<BaoCao> BaoCaos { get; set; }

    public virtual DbSet<BinhLuan> BinhLuans { get; set; }

    public virtual DbSet<Chuong> Chuongs { get; set; }

    public virtual DbSet<LichSu> LichSus { get; set; }

    public virtual DbSet<LuotXem> LuotXems { get; set; }

    public virtual DbSet<TacGium> TacGia { get; set; }

    public virtual DbSet<TheLoai> TheLoais { get; set; }

    public virtual DbSet<TheoDoi> TheoDois { get; set; }

    public virtual DbSet<Truyen> Truyens { get; set; }

    public virtual DbSet<TruyenTacGium> TruyenTacGia { get; set; }

    public virtual DbSet<TruyenTheLoai> TruyenTheLoais { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=CAU-BANH\\SQLEXPRESS;Initial Catalog=DoAnTruyen;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;MultipleActiveResultSets=true");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<BaoCao>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Reports");

            entity.ToTable("BaoCao");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.IdChuong).HasColumnName("idChuong");
            entity.Property(e => e.LoiNhan).HasMaxLength(250);
        });

        modelBuilder.Entity<BinhLuan>(entity =>
        {
            entity.ToTable("BinhLuan");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.BinhLuan1)
                .HasMaxLength(500)
                .HasColumnName("BinhLuan");
            entity.Property(e => e.HoatDong).HasColumnType("datetime");
            entity.Property(e => e.IdChuong).HasColumnName("idChuong");
            entity.Property(e => e.IdUser).HasColumnName("idUser");
        });

        modelBuilder.Entity<Chuong>(entity =>
        {
            entity.ToTable("Chuong");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.HoatDong)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.IdTruyen).HasColumnName("idTruyen");
            entity.Property(e => e.NoiDung).HasMaxLength(2500);
            entity.Property(e => e.TenChuong).HasMaxLength(250);
        });

        modelBuilder.Entity<LichSu>(entity =>
        {
            entity.ToTable("LichSu");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.HoatDong)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.IdChuong).HasColumnName("idChuong");
            entity.Property(e => e.IdTruyen).HasColumnName("idTruyen");
            entity.Property(e => e.IdUser).HasColumnName("idUser");
        });

        modelBuilder.Entity<LuotXem>(entity =>
        {
            entity.ToTable("LuotXem");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.IdChuong).HasColumnName("idChuong");
            entity.Property(e => e.IdTruyen).HasColumnName("idTruyen");
            entity.Property(e => e.IdUser).HasColumnName("idUser");
        });

        modelBuilder.Entity<TacGium>(entity =>
        {
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.BiDanh).HasMaxLength(250);
            entity.Property(e => e.GhiChu).HasMaxLength(250);
            entity.Property(e => e.TenTacGia).HasMaxLength(250);
        });

        modelBuilder.Entity<TheLoai>(entity =>
        {
            entity.HasKey(e => new { e.Id, e.TenTheLoai });

            entity.ToTable("TheLoai");

            entity.Property(e => e.Id)
                .ValueGeneratedOnAdd()
                .HasColumnName("id");
            entity.Property(e => e.TenTheLoai).HasMaxLength(250);
            entity.Property(e => e.GhiChu).HasMaxLength(250);
            entity.Property(e => e.Keyword).HasMaxLength(250);
        });

        modelBuilder.Entity<TheoDoi>(entity =>
        {
            entity.ToTable("TheoDoi");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.IsFollow).HasColumnName("isFollow");
        });

        modelBuilder.Entity<Truyen>(entity =>
        {
            entity.ToTable("Truyen");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AnhDaiDien).HasMaxLength(250);
            entity.Property(e => e.BiDanh).HasMaxLength(250);
            entity.Property(e => e.GhiChu).HasMaxLength(250);
            entity.Property(e => e.HoatDong).HasColumnType("datetime");
            entity.Property(e => e.IdUser).HasColumnName("idUser");
            entity.Property(e => e.IsDelete).HasColumnName("isDelete");
            entity.Property(e => e.NgayDang)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("date");
            entity.Property(e => e.Nguon).HasMaxLength(250);
            entity.Property(e => e.TenTruyen).HasMaxLength(250);
        });

        modelBuilder.Entity<TruyenTacGium>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_TacGiaTruyen");

            entity.ToTable("Truyen_TacGia");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.IdTacGia).HasColumnName("idTacGia");
            entity.Property(e => e.IdTruyen).HasColumnName("idTruyen");
        });

        modelBuilder.Entity<TruyenTheLoai>(entity =>
        {
            entity.ToTable("Truyen_TheLoai");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.IdTheLoai).HasColumnName("idTheLoai");
            entity.Property(e => e.IdTruyen).HasColumnName("idTruyen");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Avatar)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("avatar");
            entity.Property(e => e.Email)
                .HasMaxLength(250)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.MatKhau)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.RememberToken)
                .HasMaxLength(150)
                .IsUnicode(false)
                .HasColumnName("remember_token");
            entity.Property(e => e.Ten)
                .HasMaxLength(250)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
