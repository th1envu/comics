USE [master]
GO
/****** Object:  Database [DoAnTruyen]    Script Date: 03/05/2024 12:31:16 CH ******/
CREATE DATABASE [DoAnTruyen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DoAnTruyen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DoAnTruyen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DoAnTruyen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DoAnTruyen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DoAnTruyen] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DoAnTruyen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DoAnTruyen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DoAnTruyen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DoAnTruyen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DoAnTruyen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DoAnTruyen] SET ARITHABORT OFF 
GO
ALTER DATABASE [DoAnTruyen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DoAnTruyen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DoAnTruyen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DoAnTruyen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DoAnTruyen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DoAnTruyen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DoAnTruyen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DoAnTruyen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DoAnTruyen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DoAnTruyen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DoAnTruyen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DoAnTruyen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DoAnTruyen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DoAnTruyen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DoAnTruyen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DoAnTruyen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DoAnTruyen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DoAnTruyen] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DoAnTruyen] SET  MULTI_USER 
GO
ALTER DATABASE [DoAnTruyen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DoAnTruyen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DoAnTruyen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DoAnTruyen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DoAnTruyen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DoAnTruyen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DoAnTruyen] SET QUERY_STORE = OFF
GO
USE [DoAnTruyen]
GO
/****** Object:  Table [dbo].[BaoCao]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoCao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idChuong] [int] NULL,
	[LoiNhan] [nvarchar](250) NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BinhLuan] [nvarchar](500) NULL,
	[idUser] [int] NULL,
	[idChuong] [int] NULL,
	[idTruyen] [int] NULL,
	[HoatDong] [datetime] NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chuong]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chuong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTruyen] [int] NOT NULL,
	[TenChuong] [nvarchar](250) NULL,
	[NoiDung] [nvarchar](2500) NULL,
	[LuotXem] [bigint] NULL,
	[HoatDong] [datetime] NULL,
 CONSTRAINT [PK_Chuong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSu]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idChuong] [int] NULL,
	[idUser] [int] NULL,
	[idTruyen] [int] NULL,
	[HoatDong] [datetime] NOT NULL,
 CONSTRAINT [PK_LichSu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuotXem]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuotXem](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idTruyen] [int] NULL,
	[idChuong] [int] NULL,
	[idUser] [int] NULL,
 CONSTRAINT [PK_LuotXem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenTacGia] [nvarchar](250) NULL,
	[BiDanh] [nvarchar](250) NULL,
	[GhiChu] [nvarchar](250) NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](250) NOT NULL,
	[GhiChu] [nvarchar](250) NULL,
	[Keyword] [nvarchar](250) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[TenTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheoDoi]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheoDoi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdTruyen] [int] NULL,
	[IdUser] [int] NULL,
	[isFollow] [bit] NULL,
 CONSTRAINT [PK_TheoDoi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Truyen]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truyen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenTruyen] [nvarchar](250) NOT NULL,
	[BiDanh] [nvarchar](250) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[TrangThai] [tinyint] NULL,
	[Nguon] [nvarchar](250) NULL,
	[AnhDaiDien] [nvarchar](250) NULL,
	[idUser] [int] NULL,
	[GhiChu] [nvarchar](250) NULL,
	[HoatDong] [datetime] NULL,
	[NgayDang] [date] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Truyen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Truyen_TacGia]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truyen_TacGia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTruyen] [int] NULL,
	[idTacGia] [int] NULL,
 CONSTRAINT [PK_TacGiaTruyen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Truyen_TheLoai]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truyen_TheLoai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idTruyen] [int] NULL,
	[idTheLoai] [int] NULL,
 CONSTRAINT [PK_Truyen_TheLoai] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 03/05/2024 12:31:16 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [varchar](250) NULL,
	[email] [varchar](250) NULL,
	[MatKhau] [varchar](50) NULL,
	[Loai] [tinyint] NULL,
	[avatar] [varchar](250) NULL,
	[remember_token] [varchar](150) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (2, N'hay', 2, 1, NULL, CAST(N'2024-04-24T22:30:48.150' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (3, N'được', 2, 1, NULL, CAST(N'2024-04-24T23:16:31.980' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (4, N'quỷ', 1, 1, NULL, CAST(N'2024-04-24T23:16:43.663' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (6, N'qtv', 1, 3, NULL, CAST(N'2024-04-25T11:29:46.260' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (8, N'vip', 2, 3, NULL, CAST(N'2024-04-25T11:31:26.670' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (9, N'quá được', 2, NULL, 2, CAST(N'2024-04-25T20:53:53.923' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (10, N'quá dữ', 1, NULL, 2, CAST(N'2024-04-25T21:16:15.460' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (11, N'thứ dữ không!', 2, NULL, 2, CAST(N'2024-04-25T21:29:38.273' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (12, N'hay quá', 2, NULL, 2, CAST(N'2024-04-25T21:30:36.407' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (13, N'gg', 2, NULL, 2, CAST(N'2024-04-25T21:47:58.690' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (14, N'ayyyyyy', 2, NULL, 2, CAST(N'2024-04-25T21:52:49.970' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (15, N'ão', 2, 2, NULL, CAST(N'2024-04-25T22:28:47.960' AS DateTime))
INSERT [dbo].[BinhLuan] ([id], [BinhLuan], [idUser], [idChuong], [idTruyen], [HoatDong]) VALUES (16, N'vl', 2, 2, NULL, CAST(N'2024-04-25T23:06:31.503' AS DateTime))
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
GO
SET IDENTITY_INSERT [dbo].[Chuong] ON 

INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (1, 2, N'Chapter 1', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (2, 2, N'Chapter 2', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (3, 2, N'Chapter 3', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (4, 3, N'Chapter 1', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (5, 3, N'Chapter 2', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (6, 3, N'Chapter 3', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (7, 2, N'Chapter 4', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (8, 2, N'Chapter 5', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (9, 2, N'Chapter 6', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (10, 4, N'Chapter 1', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (11, 4, N'Chapter 2', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (12, 4, N'Chapter 3', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (13, 5, N'Chapter 1', NULL, NULL, NULL)
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (14, 3, N'Chapter 4', NULL, NULL, CAST(N'2024-04-15T23:40:44.577' AS DateTime))
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (15, 3, N'Chapter 5', NULL, NULL, CAST(N'2024-04-15T23:52:42.033' AS DateTime))
INSERT [dbo].[Chuong] ([id], [idTruyen], [TenChuong], [NoiDung], [LuotXem], [HoatDong]) VALUES (18, 2, N'Chapter 7', NULL, NULL, CAST(N'2024-04-18T23:44:47.673' AS DateTime))
SET IDENTITY_INSERT [dbo].[Chuong] OFF
GO
SET IDENTITY_INSERT [dbo].[LichSu] ON 

INSERT [dbo].[LichSu] ([id], [idChuong], [idUser], [idTruyen], [HoatDong]) VALUES (5, 1, 1, 2, CAST(N'2024-04-18T22:06:49.177' AS DateTime))
INSERT [dbo].[LichSu] ([id], [idChuong], [idUser], [idTruyen], [HoatDong]) VALUES (17, 4, 2, 3, CAST(N'2024-04-20T21:05:55.657' AS DateTime))
INSERT [dbo].[LichSu] ([id], [idChuong], [idUser], [idTruyen], [HoatDong]) VALUES (20, 10, 2, 4, CAST(N'2024-04-20T22:34:49.270' AS DateTime))
INSERT [dbo].[LichSu] ([id], [idChuong], [idUser], [idTruyen], [HoatDong]) VALUES (27, 8, 2, 2, CAST(N'2024-04-22T22:41:52.580' AS DateTime))
INSERT [dbo].[LichSu] ([id], [idChuong], [idUser], [idTruyen], [HoatDong]) VALUES (28, 18, 2, 2, CAST(N'2024-04-22T22:41:56.850' AS DateTime))
INSERT [dbo].[LichSu] ([id], [idChuong], [idUser], [idTruyen], [HoatDong]) VALUES (41, 1, 2, 2, CAST(N'2024-04-25T22:05:24.613' AS DateTime))
INSERT [dbo].[LichSu] ([id], [idChuong], [idUser], [idTruyen], [HoatDong]) VALUES (50, 2, 2, 2, CAST(N'2024-04-26T00:34:11.363' AS DateTime))
SET IDENTITY_INSERT [dbo].[LichSu] OFF
GO
SET IDENTITY_INSERT [dbo].[LuotXem] ON 

INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (3, 2, 1, 2)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (4, 2, 2, 2)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (8, 2, 2, 2)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (39, 2, 1, 1)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (128, 2, 3, 2)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (129, 2, 8, 2)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (130, 2, 9, 2)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (131, 2, 18, 2)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (132, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (133, 2, 7, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (134, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (135, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (136, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (137, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (138, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (139, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (140, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (141, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (142, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (143, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (144, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (145, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (146, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (147, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (148, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (149, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (150, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (151, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (152, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (153, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (154, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (155, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (156, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (157, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (158, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (159, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (160, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (161, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (162, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (163, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (164, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (165, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (166, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (167, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (168, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (169, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (170, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (171, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (172, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (173, 2, 3, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (174, 2, 7, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (175, 2, 3, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (176, 2, 2, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (177, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (178, 2, 1, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (179, 2, 18, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (180, 2, 9, NULL)
INSERT [dbo].[LuotXem] ([id], [idTruyen], [idChuong], [idUser]) VALUES (181, 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[LuotXem] OFF
GO
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (1, N'La Quán Trung', NULL, NULL)
INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (2, N'Ngô Thừa Ân', NULL, NULL)
INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (3, N'Thi Nại Am', NULL, NULL)
INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (4, N'Lý Bạch', NULL, NULL)
INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (5, N'Lỗ Tấn', NULL, NULL)
INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (6, N'Tào Tuyết Cần', NULL, NULL)
INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (7, N'Đỗ Phủ', NULL, NULL)
INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (9, N'Phạm Vũ', NULL, NULL)
INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (10, N'HAROLD Sakuishi', NULL, NULL)
INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (11, N'Ngưu Lão', NULL, NULL)
INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (12, N'Kim Dung', NULL, NULL)
INSERT [dbo].[TacGia] ([id], [TenTacGia], [BiDanh], [GhiChu]) VALUES (13, N'Mộng Tiên Giới', NULL, NULL)
SET IDENTITY_INSERT [dbo].[TacGia] OFF
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (1, N'Hành Động', NULL, N'')
INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (2, N'Phiêu Lưu', NULL, N'')
INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (3, N'Hài Hước', NULL, N'')
INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (4, N'Viễn Tưởng', NULL, N'')
INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (5, N'Drama', NULL, N'')
INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (6, N'Manhwa', NULL, NULL)
INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (7, N'Manhua', NULL, NULL)
INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (8, N'Lãng Mạn', NULL, NULL)
INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (9, N'Thể Thao', NULL, NULL)
INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (10, N'Trinh Thám', NULL, NULL)
INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (11, N'Ngôn Tình', NULL, NULL)
INSERT [dbo].[TheLoai] ([id], [TenTheLoai], [GhiChu], [Keyword]) VALUES (12, N'Kinh Dị', NULL, NULL)
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
SET IDENTITY_INSERT [dbo].[TheoDoi] ON 

INSERT [dbo].[TheoDoi] ([id], [IdTruyen], [IdUser], [isFollow]) VALUES (1, 2, 2, 1)
INSERT [dbo].[TheoDoi] ([id], [IdTruyen], [IdUser], [isFollow]) VALUES (2, 3, 2, 1)
INSERT [dbo].[TheoDoi] ([id], [IdTruyen], [IdUser], [isFollow]) VALUES (3, 4, 2, 1)
INSERT [dbo].[TheoDoi] ([id], [IdTruyen], [IdUser], [isFollow]) VALUES (4, 2, 0, 1)
INSERT [dbo].[TheoDoi] ([id], [IdTruyen], [IdUser], [isFollow]) VALUES (5, 5, 2, 0)
INSERT [dbo].[TheoDoi] ([id], [IdTruyen], [IdUser], [isFollow]) VALUES (6, 8, 2, 0)
INSERT [dbo].[TheoDoi] ([id], [IdTruyen], [IdUser], [isFollow]) VALUES (7, 6, 2, 0)
INSERT [dbo].[TheoDoi] ([id], [IdTruyen], [IdUser], [isFollow]) VALUES (8, 7, 2, 0)
SET IDENTITY_INSERT [dbo].[TheoDoi] OFF
GO
SET IDENTITY_INSERT [dbo].[Truyen] ON 

INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (2, N'Naruto', N'Cửu vĩ hồ ly', N'Naruto là một cậu bé có mơ ước trở thành hokage của làng Konoha,được Hokage phong ấn trong người một trong 9 quái vật của thể giới : Cửu vĩ Hồ ly.Vì cho cậu là một con quái vật, ko ai dám chơi với cậu!& Vì muốn được thừa nhận nên rất phá phách.Khi tốt nghiệp trướng ninja, lần đầu tiên cậu đã được thừa nhận và có một người bạn thân là Sasuke.Hai năm sau, Sasuke đã rời bỏ làng lá để đi theo Orochimaru vì muốn đạt được sức mạnh hơn người, và dùng sức mạnh đó để giết người anh của mình.Naruto muốn đem Sasuke trở về, và vì Kakashi ko đủ trình độ nên đã đi theo Jiraiya - một trong tam nin truyền thuyết của Konoha - để học tập thêm cách dùng sức mạnh.Sau hai năm trờ về, Naruto đã 16 tuổi và có nhiều thay đổi! Và những khó khăn nguy hiểm cũng từ đó tăng lên 2 năm sau Sasuke đã trưởng thành...và đúng với cái tên thiên tài Uchiha cậu đã hạ được Orochimaru ( tất nhiên là lúc hắn đang bị ấn chú của Đệ tam làm yếu nhất ) và phong ấn hắn trong người cậu. Cậu cùng Suigetsu , Juugo và Karin thành lập Mãng xà truy tìm Itachi. Naruto Sakura Choiji Sai Ino Shikamaru Kiba Shino....cũng dần trở thành những ninja mạnh mẽ trụ cột của làng lá. Họ đã hạ được 2 thành viên Akatsuki. Cũng như Sasuke hạ được Deidara Sasuke và Itachi đã gặp nhau. Và trận chiến cuối cùng đã xảy ra với chiến thắng của Sasuke. Madara xuất hiện và sự thật về Itachi đã đc hé lộ...bí mật về Gia tộc Uchiha và Làng Lá đã tạo nên bi kịch giữa Sasuke và Itachi. Nhóm Đại Bàng được thành lập kết hợp cùng Akatsuki chính thức truy tìm 9 quái vật có đuôi và bắt đầu kế hoạch trả thù của Sasuke ..........', 0, NULL, N'Naruto_Volume_1_manga_cover.jpg', NULL, NULL, NULL, CAST(N'2024-02-02' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (3, N'Dragon Ball', N'7 Viên Ngọc Rồng', NULL, 0, NULL, N'e5k1xnz6_1920x1080-dragonball_1920_1080.jpg                                                         ', NULL, NULL, NULL, CAST(N'2024-02-20' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (4, N'Yu-Gi-Oh!                ', N'Vua Trò Chơi', NULL, 0, NULL, N'p534172_b_v9_bc.jpg                                                                                 ', NULL, NULL, NULL, CAST(N'2024-02-20' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (5, N'One Piece                ', N'Vua Hải Tặc', NULL, 1, NULL, N'a_100421840_m_601_en_m1_1013_638.jpg', NULL, NULL, NULL, CAST(N'2024-02-20' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (6, N'Doraemon                 ', N'Mèo máy thông minh', NULL, 1, NULL, N'21-Savage-Desktop-Wallpaper-4k.jpg', NULL, NULL, NULL, CAST(N'2024-02-20' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (7, N'Tower Of God', N'Tòa Tháp Bí Ẩn', NULL, 1, NULL, N'cuoc-chien-trong-toa-thap-tower-of-god.jpg', NULL, NULL, NULL, CAST(N'2024-03-08' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (8, N'Baki Dou', N'Baki', N'Đang cập nhật', 0, NULL, N'baki-dou.jpg', NULL, NULL, NULL, CAST(N'2024-04-02' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (9, N'BECK - MONGOLIAN CHOP SQUAD', N'BECK', N'Câu chuyện chủ yếu xoay quanh quá trình một ban nhạc mang tên BECK hình thành và phát triển cùng các thành viên.', 1, NULL, N'beck-mongolian-chop-squad.jpg', NULL, NULL, NULL, CAST(N'2024-04-23' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (10, N'MAEDA TAISON BLUES', N'Rokudenashi Blues', NULL, 1, NULL, N'maeda-taison-blues-7017.jpg', NULL, NULL, NULL, CAST(N'2024-04-24' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (11, N'CAO THỦ BÓNG RỔ', N'Slam Dunk', NULL, 0, NULL, N'cao-thu-bong-ro-remake-7152.jpg', NULL, NULL, NULL, CAST(N'2024-04-24' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (12, N'ĐẠI VƯƠNG THA MẠNG', N'ĐẠI VƯƠNG THA MẠNG', NULL, 1, NULL, N'dai-vuong-tha-mang-7670.jpg', NULL, NULL, NULL, CAST(N'2024-04-24' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (13, N'NGƯỜI TRONG GIANG HỒ', N'Teddy Boy', N'Người Trong Giang Hồ là bộ truyện tranh nổi tiếng Cổ Hoặc Tử - Teddy Boy! Truyện đạt kỷ lục bộ truyện tranh dài nhất thế giới! Thế giới truyện rộng lớn, tình tiết ly kỳ, cao trào, nhiều nét đột phá, truyện tả thật thế giới xã hội đen Hongkong, mặt xấu ác lòng người, hiệp nghĩa can trường, huynh đệ tình thân...', 0, NULL, N'nguoi-trong-giang-ho.jpg', NULL, NULL, NULL, CAST(N'2024-04-24' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (14, N'TIẾU NGẠO GIANG HỒ', N'TIẾU NGẠO GIANG HỒ', N'Tiếu Ngạo Giang Hồ - một trong những tác phẩm được đánh giá là hay nhất của Kim Dung tiên sinh, qua nét vẽ của họa sĩ Lý Chí Thanh, lần nữa mang đến cho người đọc những thích thú mới mẻ trên nền cốt truyện kinh điển quen thuộc. Khác với các tác phẩm khác của Kim Dung, Tiếu Ngạo Giang Hồ không được lồng trong một bối cảnh lịch sử cụ thể nào cả, chủ nghĩa anh hùng dân tộc cũng không phải là điểm nhấn của bộ truyện này. Thay vào đó, nó tập trung khai thác những số phận và con người trong một thế giới võ lâm đầy hỗn loạn, nơi mà những khái niệm chánh-tà, người tốt, kẻ xấu dường như không có ranh giới phân định rõ ràng. Con người vì tư lợi có thể bất chấp thủ đoạn, thậm chí sát hại người thân nhằm đạt được tham vọng của bản thân. Tuy vậy, lại có không ít những người bị cho là kì quái hoặc tà đạo, thật chất lại là những con người đầy tiết khí, trọng tình trọng nghĩa, đầu đội trời chân đạp đất. Tỷ như Nhạc Bất Quần, chưởng môn phái Hoa Sơn, lừng danh giang hồ với ngoại hiệu là Quân Tử Kiếm, hóa ra chỉ là một kẻ đạo đức giả, lòng lang dạ sói. Hay Dư Thương Hải – chưởng môn phái Thanh Thành, vì muốn đoạt được Tịch Tà Kiếm Phổ mà thản nhiên tàn sát cả nhà Phước Oai Tiêu Cục, mở đầu cho một loạt những bi kịch tiếp diễn sau đó xoay quanh pho kiếm phổ này. Trong một thế giới điên đảo như vậy, liệu có mấy ai có thể bỏ qua những tư lợi ích kỉ, tranh quyền đoạt lợi để sống một cuộc đời thỏa chí tang bồng, ung dung tự tại, tiếu ngạo giang hồ ?', 1, NULL, N'tieu-ngao-giang-ho.jpg', NULL, NULL, NULL, CAST(N'2024-04-24' AS Date), NULL)
INSERT [dbo].[Truyen] ([id], [TenTruyen], [BiDanh], [NoiDung], [TrangThai], [Nguon], [AnhDaiDien], [idUser], [GhiChu], [HoatDong], [NgayDang], [isDelete]) VALUES (15, N'CAO VÕ: HẠ CÁNH ĐẾN MỘT VẠN NĂM SAU', N'Cao Võ: Ngàn Năm Tiến Hóa', N'Khi võ thuật lần đầu tiên phát triển mạnh mẽ, những con thú ngoài hành tinh đáng sợ đã xâm chiếm và các chiến binh loài người dần dần rút lui. Lu Sheng xuyên qua và bước vào thế giới 10.000 năm sau trong giấc mơ của anh ấy — kỹ thuật luyện thân cơ bản 10.000 năm sau đã được sửa đổi, và hiệu quả mạnh hơn bây giờ gấp ngàn lần! Vạn năm sau, hô hấp phương pháp, luyện thân phương thuốc, võ công kinh thư... Vạn năm võ đạo về sau, nhân loại diệt vong. Nền văn minh võ học đã nhân lên đến đỉnh cao là không ai thừa kế. Lu Sheng là tia lửa duy nhất!', 1, NULL, N'cao-vo-ha-canh-den-mot-van-nam-sau-3077.jpg', NULL, NULL, NULL, CAST(N'2024-04-24' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Truyen] OFF
GO
SET IDENTITY_INSERT [dbo].[Truyen_TacGia] ON 

INSERT [dbo].[Truyen_TacGia] ([id], [idTruyen], [idTacGia]) VALUES (1, 2, 1)
INSERT [dbo].[Truyen_TacGia] ([id], [idTruyen], [idTacGia]) VALUES (2, 3, 6)
INSERT [dbo].[Truyen_TacGia] ([id], [idTruyen], [idTacGia]) VALUES (3, 4, 3)
INSERT [dbo].[Truyen_TacGia] ([id], [idTruyen], [idTacGia]) VALUES (4, 5, 2)
INSERT [dbo].[Truyen_TacGia] ([id], [idTruyen], [idTacGia]) VALUES (5, 6, 6)
INSERT [dbo].[Truyen_TacGia] ([id], [idTruyen], [idTacGia]) VALUES (6, 2, 2)
INSERT [dbo].[Truyen_TacGia] ([id], [idTruyen], [idTacGia]) VALUES (13, 12, 11)
INSERT [dbo].[Truyen_TacGia] ([id], [idTruyen], [idTacGia]) VALUES (14, 14, 12)
INSERT [dbo].[Truyen_TacGia] ([id], [idTruyen], [idTacGia]) VALUES (15, 15, 13)
SET IDENTITY_INSERT [dbo].[Truyen_TacGia] OFF
GO
SET IDENTITY_INSERT [dbo].[Truyen_TheLoai] ON 

INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (1, 2, 1)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (2, 2, 2)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (3, 2, 5)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (4, 2, 3)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (5, 2, 4)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (6, 3, 1)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (7, 3, 2)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (8, 3, 3)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (9, 3, 4)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (10, 4, 1)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (11, 4, 2)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (12, 4, 3)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (13, 4, 4)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (14, 5, 1)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (15, 5, 2)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (16, 5, 3)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (17, 5, 4)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (18, 5, 5)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (19, 6, 2)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (20, 6, 3)
INSERT [dbo].[Truyen_TheLoai] ([id], [idTruyen], [idTheLoai]) VALUES (21, 6, 4)
SET IDENTITY_INSERT [dbo].[Truyen_TheLoai] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [Ten], [email], [MatKhau], [Loai], [avatar], [remember_token]) VALUES (1, N'vu', N'vu@gmail.com', N'123', 0, N'430139226_795292882633082_890267652449670232_n.jpg', NULL)
INSERT [dbo].[User] ([id], [Ten], [email], [MatKhau], [Loai], [avatar], [remember_token]) VALUES (2, N'long', N'long@gmail.com', N'123', 1, N'Danzo_Shimura.jpg', NULL)
INSERT [dbo].[User] ([id], [Ten], [email], [MatKhau], [Loai], [avatar], [remember_token]) VALUES (3, N'lan', N'lan@gmail.com', N'123', NULL, NULL, NULL)
INSERT [dbo].[User] ([id], [Ten], [email], [MatKhau], [Loai], [avatar], [remember_token]) VALUES (4, N'anna', N'ana@gmail.com', N'123', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[BinhLuan] ADD  CONSTRAINT [DF_BinhLuan_HoatDong]  DEFAULT (getdate()) FOR [HoatDong]
GO
ALTER TABLE [dbo].[Chuong] ADD  CONSTRAINT [DF_Chuong_HoatDong]  DEFAULT (getdate()) FOR [HoatDong]
GO
ALTER TABLE [dbo].[LichSu] ADD  CONSTRAINT [DF_LichSu_HoatDong]  DEFAULT (getdate()) FOR [HoatDong]
GO
ALTER TABLE [dbo].[Truyen] ADD  CONSTRAINT [DF_Truyen_NgayDang]  DEFAULT (getdate()) FOR [NgayDang]
GO
USE [master]
GO
ALTER DATABASE [DoAnTruyen] SET  READ_WRITE 
GO
