USE [master]
GO
/****** Object:  Database [BanMayTinh]    Script Date: 1/31/2023 10:39:45 AM ******/
CREATE DATABASE [BanMayTinh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanMayTinh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BanMayTinh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanMayTinh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BanMayTinh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BanMayTinh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanMayTinh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanMayTinh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanMayTinh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanMayTinh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanMayTinh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanMayTinh] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanMayTinh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanMayTinh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanMayTinh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanMayTinh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanMayTinh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanMayTinh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanMayTinh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanMayTinh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanMayTinh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanMayTinh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BanMayTinh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanMayTinh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanMayTinh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanMayTinh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanMayTinh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanMayTinh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanMayTinh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanMayTinh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BanMayTinh] SET  MULTI_USER 
GO
ALTER DATABASE [BanMayTinh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanMayTinh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanMayTinh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanMayTinh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanMayTinh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BanMayTinh] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BanMayTinh] SET QUERY_STORE = OFF
GO
USE [BanMayTinh]
GO
/****** Object:  Table [dbo].[ChiTietAnhSanPham]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietAnhSanPham](
	[MaAnhChitiet] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [int] NULL,
	[Anh] [varchar](500) NULL,
 CONSTRAINT [PK_ChiTietAnhSanPham] PRIMARY KEY CLUSTERED 
(
	[MaAnhChitiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaChiTietDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaDonHang] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaMua] [float] NOT NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaChiTietDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonNhap]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonNhap](
	[MaChiTiet] [int] NOT NULL,
	[MaSanPham] [int] NULL,
	[MaHoaDonNhap] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGiaNhap] [float] NULL,
 CONSTRAINT [PK_ChiTietHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDonXuat]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonXuat](
	[MaChiTietHoaDonXuat] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDonXuat] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaBan] [float] NOT NULL,
	[ChietKhau] [float] NULL,
	[TraLai] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDonXuat] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHoaDonXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietKho]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKho](
	[MaChiTietKho] [int] IDENTITY(1,1) NOT NULL,
	[MaKho] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[KhayKhe] [nvarchar](1500) NULL,
 CONSTRAINT [PK_ChiTietKho] PRIMARY KEY CLUSTERED 
(
	[MaChiTietKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietKhuyenMai]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKhuyenMai](
	[MaChiTietKhuyenMai] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[NgayBatDau] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NOT NULL,
	[MaKhuyenMai] [int] NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_ChiTietKhuyenMai] PRIMARY KEY CLUSTERED 
(
	[MaChiTietKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietKiemKho]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKiemKho](
	[MaChiTietKiemKho] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[MaKiemKho] [int] NOT NULL,
	[SoLuongDemDuoc] [int] NULL,
	[SoLuongTinhToan] [int] NULL,
	[SoLuongThayDoi] [int] NULL,
 CONSTRAINT [PK_ChiTietKiemKho] PRIMARY KEY CLUSTERED 
(
	[MaChiTietKiemKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietNhom]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietNhom](
	[MaChiTietNhom] [int] IDENTITY(1,1) NOT NULL,
	[MaNhomSanPham] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietNhom] PRIMARY KEY CLUSTERED 
(
	[MaChiTietNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[MaDanhMucCha] [int] NULL,
	[TenDanhMuc] [nvarchar](250) NOT NULL,
	[STT] [int] NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [int] NULL,
	[NgayDat] [datetime] NULL,
	[TrangThaiDonHang] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonViTinh]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonViTinh](
	[MaDonViTinh] [int] IDENTITY(1,1) NOT NULL,
	[TenDonViTinh] [nvarchar](100) NULL,
 CONSTRAINT [PK_DonViTinh] PRIMARY KEY CLUSTERED 
(
	[MaDonViTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiamGia]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiamGia](
	[MaGiamGia] [int] NOT NULL,
	[MaSanPham] [int] NULL,
	[PhanTram] [float] NULL,
	[ThoiGianBatDau] [datetime] NULL,
	[ThoiGianKetThuc] [datetime] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_GiamGia] PRIMARY KEY CLUSTERED 
(
	[MaGiamGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaSanPham]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaSanPham](
	[MaGiaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[NgayBatDau] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NULL,
	[Gia] [float] NULL,
 CONSTRAINT [PK_GiaSanPham_1] PRIMARY KEY CLUSTERED 
(
	[MaGiaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHoaDonNhap] [int] NOT NULL,
	[SoHoaDon] [nchar](50) NOT NULL,
	[NgayNhap] [datetime] NOT NULL,
	[MaNguoiDung] [int] NOT NULL,
	[MaNhaCungCap] [int] NOT NULL,
 CONSTRAINT [PK_HoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHoaDonNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonXuat]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonXuat](
	[MaHoaDonXuat] [int] IDENTITY(1,1) NOT NULL,
	[SoHoaDon] [nchar](50) NULL,
	[NgayXuat] [datetime] NULL,
	[MaKhachHang] [int] NULL,
	[MaNguoiDung] [int] NULL,
 CONSTRAINT [PK_HoaDonXuat] PRIMARY KEY CLUSTERED 
(
	[MaHoaDonXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](250) NOT NULL,
	[DiaChi] [nvarchar](1500) NULL,
	[SoDienThoai] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MaKho] [int] IDENTITY(1,1) NOT NULL,
	[TenKho] [nvarchar](250) NOT NULL,
	[DiaChi] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MaKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKhuyenMai] [int] NOT NULL,
	[TenKhuyenMai] [nvarchar](250) NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[MaKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KiemKho]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KiemKho](
	[MaKiemKho] [int] NOT NULL,
	[MaNguoiDung] [int] NULL,
	[ThoiGianBatDau] [datetime] NULL,
	[ThoiGianKetThuc] [datetime] NULL,
	[TrangThaiKho] [int] NULL,
	[MaKho] [int] NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_KiemKho] PRIMARY KEY CLUSTERED 
(
	[MaKiemKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuGiaBan]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuGiaBan](
	[MaGiaBan] [int] NOT NULL,
	[MaSanPham] [int] NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[Gia] [float] NULL,
 CONSTRAINT [PK_LichSuGiaBan] PRIMARY KEY CLUSTERED 
(
	[MaGiaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MaMenu] [int] NOT NULL,
	[TenMenu] [nvarchar](250) NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MaMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](250) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](20) NULL,
	[AnhDaiDien] [varchar](500) NULL,
	[DiaChi] [nvarchar](1500) NULL,
	[Email] [nvarchar](100) NULL,
	[DienThoai] [char](20) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNhaCungCap] [int] NOT NULL,
	[TenNhaCungCap] [nvarchar](250) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[SoDienThoai] [char](20) NULL,
	[Email] [char](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNhaSanXuat] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaSanXuat] [nvarchar](250) NOT NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNhaSanXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomSanPham]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSanPham](
	[MaNhomSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenNhom] [nvarchar](250) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_NhomSanPham] PRIMARY KEY CLUSTERED 
(
	[MaNhomSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[MaDanhMuc] [int] NOT NULL,
	[TenSanPham] [nvarchar](250) NOT NULL,
	[MoTaSanPham] [ntext] NOT NULL,
	[AnhDaiDien] [varchar](500) NOT NULL,
	[MaNhaSanXuat] [int] NOT NULL,
	[MaDonViTinh] [int] NOT NULL,
	[NgayTao] [datetime] NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Silde]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Silde](
	[MaSilde] [int] IDENTITY(1,1) NOT NULL,
	[Anh] [varchar](250) NULL,
	[Link] [varchar](250) NULL,
 CONSTRAINT [PK_Silde] PRIMARY KEY CLUSTERED 
(
	[MaSilde] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[MaNguoiDung] [int] NULL,
	[TaiKhoan] [varchar](100) NULL,
	[MatKhau] [varchar](100) NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[TrangThai] [bit] NULL,
	[LoaiQuyet] [varchar](10) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongSoKyThuat]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongSoKyThuat](
	[MaThongSo] [int] NOT NULL,
	[MaSanPham] [int] NULL,
	[TenThongSo] [nvarchar](150) NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_ThongSoKyThuat] PRIMARY KEY CLUSTERED 
(
	[MaThongSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietAnhSanPham] ON 

INSERT [dbo].[ChiTietAnhSanPham] ([MaAnhChitiet], [MaSanPham], [Anh]) VALUES (1, 4, N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png')
INSERT [dbo].[ChiTietAnhSanPham] ([MaAnhChitiet], [MaSanPham], [Anh]) VALUES (2, 4, N'assets\img\LAPTOP\Asus_D409DA-EK152T.jpeg')
INSERT [dbo].[ChiTietAnhSanPham] ([MaAnhChitiet], [MaSanPham], [Anh]) VALUES (3, 4, N'assets\img\LAPTOP\Laptop_ASUS_ZenBook_UX325EA_EG079T.jpg')
SET IDENTITY_INSERT [dbo].[ChiTietAnhSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaSanPham], [SoLuong], [GiaMua]) VALUES (17, 5, 67, 1, 2628)
INSERT [dbo].[ChiTietDonHang] ([MaChiTietDonHang], [MaDonHang], [MaSanPham], [SoLuong], [GiaMua]) VALUES (18, 5, 68, 1, 9995)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonXuat] ON 

INSERT [dbo].[ChiTietHoaDonXuat] ([MaChiTietHoaDonXuat], [MaHoaDonXuat], [MaSanPham], [SoLuong], [GiaBan], [ChietKhau], [TraLai]) VALUES (1, 1, 65, 2, 8949, NULL, NULL)
INSERT [dbo].[ChiTietHoaDonXuat] ([MaChiTietHoaDonXuat], [MaHoaDonXuat], [MaSanPham], [SoLuong], [GiaBan], [ChietKhau], [TraLai]) VALUES (2, 1, 68, 1, 9995, NULL, NULL)
INSERT [dbo].[ChiTietHoaDonXuat] ([MaChiTietHoaDonXuat], [MaHoaDonXuat], [MaSanPham], [SoLuong], [GiaBan], [ChietKhau], [TraLai]) VALUES (3, 2, 65, 2, 8949, NULL, NULL)
INSERT [dbo].[ChiTietHoaDonXuat] ([MaChiTietHoaDonXuat], [MaHoaDonXuat], [MaSanPham], [SoLuong], [GiaBan], [ChietKhau], [TraLai]) VALUES (4, 2, 68, 1, 9995, NULL, NULL)
INSERT [dbo].[ChiTietHoaDonXuat] ([MaChiTietHoaDonXuat], [MaHoaDonXuat], [MaSanPham], [SoLuong], [GiaBan], [ChietKhau], [TraLai]) VALUES (5, 3, 65, 2, 8949, NULL, NULL)
INSERT [dbo].[ChiTietHoaDonXuat] ([MaChiTietHoaDonXuat], [MaHoaDonXuat], [MaSanPham], [SoLuong], [GiaBan], [ChietKhau], [TraLai]) VALUES (6, 3, 66, 1, 2923, NULL, NULL)
INSERT [dbo].[ChiTietHoaDonXuat] ([MaChiTietHoaDonXuat], [MaHoaDonXuat], [MaSanPham], [SoLuong], [GiaBan], [ChietKhau], [TraLai]) VALUES (7, 3, 68, 1, 9995, NULL, NULL)
INSERT [dbo].[ChiTietHoaDonXuat] ([MaChiTietHoaDonXuat], [MaHoaDonXuat], [MaSanPham], [SoLuong], [GiaBan], [ChietKhau], [TraLai]) VALUES (8, 4, 65, 3, 8949, NULL, NULL)
INSERT [dbo].[ChiTietHoaDonXuat] ([MaChiTietHoaDonXuat], [MaHoaDonXuat], [MaSanPham], [SoLuong], [GiaBan], [ChietKhau], [TraLai]) VALUES (9, 4, 66, 3, 2923, NULL, NULL)
INSERT [dbo].[ChiTietHoaDonXuat] ([MaChiTietHoaDonXuat], [MaHoaDonXuat], [MaSanPham], [SoLuong], [GiaBan], [ChietKhau], [TraLai]) VALUES (10, 4, 67, 1, 2628, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDonXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietKho] ON 

INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (66, 1, 4, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (67, 1, 5, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (68, 1, 7, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (69, 1, 8, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (70, 1, 10, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (71, 1, 11, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (72, 1, 12, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (73, 1, 13, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (74, 1, 14, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (75, 1, 15, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (76, 1, 16, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (77, 1, 17, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (78, 1, 18, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (79, 1, 19, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (80, 1, 20, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (81, 1, 21, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (82, 1, 22, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (83, 1, 23, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (84, 1, 24, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (85, 1, 25, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (86, 1, 26, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (87, 1, 27, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (88, 1, 28, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (89, 1, 29, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (90, 1, 30, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (91, 1, 31, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (92, 1, 32, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (93, 1, 33, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (94, 1, 34, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (95, 1, 35, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (96, 1, 36, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (97, 1, 37, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (98, 1, 38, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (99, 1, 39, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (100, 1, 40, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (101, 1, 41, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (102, 1, 42, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (103, 1, 43, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (104, 1, 44, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (105, 1, 45, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (106, 1, 46, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (107, 1, 47, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (108, 1, 48, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (109, 1, 49, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (110, 1, 50, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (111, 1, 51, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (112, 1, 52, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (113, 1, 53, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (114, 1, 54, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (115, 1, 55, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (116, 1, 56, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (117, 1, 57, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (118, 1, 58, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (119, 1, 59, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (120, 1, 60, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (121, 1, 61, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (122, 1, 62, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (123, 1, 63, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (124, 1, 64, 30, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (125, 1, 65, 23, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (126, 1, 66, 26, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (127, 1, 67, 29, NULL)
INSERT [dbo].[ChiTietKho] ([MaChiTietKho], [MaKho], [MaSanPham], [SoLuong], [KhayKhe]) VALUES (128, 1, 68, 28, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietKho] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietNhom] ON 

INSERT [dbo].[ChiTietNhom] ([MaChiTietNhom], [MaNhomSanPham], [MaSanPham]) VALUES (2, 1, 4)
INSERT [dbo].[ChiTietNhom] ([MaChiTietNhom], [MaNhomSanPham], [MaSanPham]) VALUES (3, 1, 5)
INSERT [dbo].[ChiTietNhom] ([MaChiTietNhom], [MaNhomSanPham], [MaSanPham]) VALUES (5, 1, 7)
INSERT [dbo].[ChiTietNhom] ([MaChiTietNhom], [MaNhomSanPham], [MaSanPham]) VALUES (6, 2, 4)
INSERT [dbo].[ChiTietNhom] ([MaChiTietNhom], [MaNhomSanPham], [MaSanPham]) VALUES (8, 2, 7)
INSERT [dbo].[ChiTietNhom] ([MaChiTietNhom], [MaNhomSanPham], [MaSanPham]) VALUES (9, 2, 8)
SET IDENTITY_INSERT [dbo].[ChiTietNhom] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [MaDanhMucCha], [TenDanhMuc], [STT], [TrangThai]) VALUES (1, NULL, N'PC Đồ họa', 1, 1)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [MaDanhMucCha], [TenDanhMuc], [STT], [TrangThai]) VALUES (2, NULL, N'Màn Hình', 2, 1)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [MaDanhMucCha], [TenDanhMuc], [STT], [TrangThai]) VALUES (3, NULL, N'Linh kiện', 3, 1)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [MaDanhMucCha], [TenDanhMuc], [STT], [TrangThai]) VALUES (4, 3, N'RAM', 31, 1)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [MaDanhMucCha], [TenDanhMuc], [STT], [TrangThai]) VALUES (5, 3, N'CPU', 32, 1)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [MaKhachHang], [NgayDat], [TrangThaiDonHang]) VALUES (5, 11, CAST(N'2022-11-24T08:56:34.017' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DonViTinh] ON 

INSERT [dbo].[DonViTinh] ([MaDonViTinh], [TenDonViTinh]) VALUES (1, N'Cái')
INSERT [dbo].[DonViTinh] ([MaDonViTinh], [TenDonViTinh]) VALUES (2, N'Chiếc')
INSERT [dbo].[DonViTinh] ([MaDonViTinh], [TenDonViTinh]) VALUES (3, N'Họp')
SET IDENTITY_INSERT [dbo].[DonViTinh] OFF
GO
SET IDENTITY_INSERT [dbo].[GiaSanPham] ON 

INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (64, 4, CAST(N'2022-08-10T04:49:58.000' AS DateTime), CAST(N'2023-08-10T04:49:58.000' AS DateTime), 9082)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (65, 5, CAST(N'2022-08-10T04:49:58.000' AS DateTime), CAST(N'2023-08-10T04:49:58.000' AS DateTime), 3489)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (66, 7, CAST(N'2022-08-10T04:49:58.003' AS DateTime), CAST(N'2023-08-10T04:49:58.003' AS DateTime), 1981)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (67, 8, CAST(N'2022-08-10T04:49:58.003' AS DateTime), CAST(N'2023-08-10T04:49:58.003' AS DateTime), 3344)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (68, 10, CAST(N'2022-08-10T04:49:58.003' AS DateTime), CAST(N'2023-08-10T04:49:58.003' AS DateTime), 3911)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (69, 11, CAST(N'2022-08-10T04:49:58.007' AS DateTime), CAST(N'2023-08-10T04:49:58.007' AS DateTime), 2733)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (70, 12, CAST(N'2022-08-10T04:49:58.007' AS DateTime), CAST(N'2023-08-10T04:49:58.007' AS DateTime), 3714)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (71, 13, CAST(N'2022-08-10T04:49:58.007' AS DateTime), CAST(N'2023-08-10T04:49:58.007' AS DateTime), 4774)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (72, 14, CAST(N'2022-08-10T04:49:58.007' AS DateTime), CAST(N'2023-08-10T04:49:58.007' AS DateTime), 8441)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (73, 15, CAST(N'2022-08-10T04:49:58.010' AS DateTime), CAST(N'2023-08-10T04:49:58.010' AS DateTime), 4484)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (74, 16, CAST(N'2022-08-10T04:49:58.010' AS DateTime), CAST(N'2023-08-10T04:49:58.010' AS DateTime), 7493)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (75, 17, CAST(N'2022-08-10T04:49:58.010' AS DateTime), CAST(N'2023-08-10T04:49:58.010' AS DateTime), 5856)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (76, 18, CAST(N'2022-08-10T04:49:58.013' AS DateTime), CAST(N'2023-08-10T04:49:58.013' AS DateTime), 2888)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (77, 19, CAST(N'2022-08-10T04:49:58.013' AS DateTime), CAST(N'2023-08-10T04:49:58.013' AS DateTime), 1744)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (78, 20, CAST(N'2022-08-10T04:49:58.013' AS DateTime), CAST(N'2023-08-10T04:49:58.013' AS DateTime), 1875)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (79, 21, CAST(N'2022-08-10T04:49:58.017' AS DateTime), CAST(N'2023-08-10T04:49:58.017' AS DateTime), 8218)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (80, 22, CAST(N'2022-08-10T04:49:58.017' AS DateTime), CAST(N'2023-08-10T04:49:58.017' AS DateTime), 2551)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (81, 23, CAST(N'2022-08-10T04:49:58.017' AS DateTime), CAST(N'2023-08-10T04:49:58.017' AS DateTime), 8924)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (82, 24, CAST(N'2022-08-10T04:49:58.017' AS DateTime), CAST(N'2023-08-10T04:49:58.017' AS DateTime), 6335)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (83, 25, CAST(N'2022-08-10T04:49:58.020' AS DateTime), CAST(N'2023-08-10T04:49:58.020' AS DateTime), 9820)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (84, 26, CAST(N'2022-08-10T04:49:58.020' AS DateTime), CAST(N'2023-08-10T04:49:58.020' AS DateTime), 9192)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (85, 27, CAST(N'2022-08-10T04:49:58.020' AS DateTime), CAST(N'2023-08-10T04:49:58.020' AS DateTime), 3735)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (86, 28, CAST(N'2022-08-10T04:49:58.023' AS DateTime), CAST(N'2023-08-10T04:49:58.023' AS DateTime), 1316)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (87, 29, CAST(N'2022-08-10T04:49:58.023' AS DateTime), CAST(N'2023-08-10T04:49:58.023' AS DateTime), 3647)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (88, 30, CAST(N'2022-08-10T04:49:58.023' AS DateTime), CAST(N'2023-08-10T04:49:58.023' AS DateTime), 3101)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (89, 31, CAST(N'2022-08-10T04:49:58.027' AS DateTime), CAST(N'2023-08-10T04:49:58.027' AS DateTime), 3237)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (90, 32, CAST(N'2022-08-10T04:49:58.027' AS DateTime), CAST(N'2023-08-10T04:49:58.027' AS DateTime), 6844)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (91, 33, CAST(N'2022-08-10T04:49:58.027' AS DateTime), CAST(N'2023-08-10T04:49:58.027' AS DateTime), 9433)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (92, 34, CAST(N'2022-08-10T04:49:58.027' AS DateTime), CAST(N'2023-08-10T04:49:58.027' AS DateTime), 1728)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (93, 35, CAST(N'2022-08-10T04:49:58.030' AS DateTime), CAST(N'2023-08-10T04:49:58.030' AS DateTime), 7269)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (94, 36, CAST(N'2022-08-10T04:49:58.030' AS DateTime), CAST(N'2023-08-10T04:49:58.030' AS DateTime), 2259)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (95, 37, CAST(N'2022-08-10T04:49:58.030' AS DateTime), CAST(N'2023-08-10T04:49:58.030' AS DateTime), 5530)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (96, 38, CAST(N'2022-08-10T04:49:58.033' AS DateTime), CAST(N'2023-08-10T04:49:58.033' AS DateTime), 3099)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (97, 39, CAST(N'2022-08-10T04:49:58.033' AS DateTime), CAST(N'2023-08-10T04:49:58.033' AS DateTime), 8170)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (98, 40, CAST(N'2022-08-10T04:49:58.033' AS DateTime), CAST(N'2023-08-10T04:49:58.033' AS DateTime), 9834)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (99, 41, CAST(N'2022-08-10T04:49:58.037' AS DateTime), CAST(N'2023-08-10T04:49:58.037' AS DateTime), 7092)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (100, 42, CAST(N'2022-08-10T04:49:58.037' AS DateTime), CAST(N'2023-08-10T04:49:58.037' AS DateTime), 8950)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (101, 43, CAST(N'2022-08-10T04:49:58.037' AS DateTime), CAST(N'2023-08-10T04:49:58.037' AS DateTime), 6091)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (102, 44, CAST(N'2022-08-10T04:49:58.037' AS DateTime), CAST(N'2023-08-10T04:49:58.037' AS DateTime), 2538)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (103, 45, CAST(N'2022-08-10T04:49:58.040' AS DateTime), CAST(N'2023-08-10T04:49:58.040' AS DateTime), 7910)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (104, 46, CAST(N'2022-08-10T04:49:58.040' AS DateTime), CAST(N'2023-08-10T04:49:58.040' AS DateTime), 9743)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (105, 47, CAST(N'2022-08-10T04:49:58.040' AS DateTime), CAST(N'2023-08-10T04:49:58.040' AS DateTime), 4758)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (106, 48, CAST(N'2022-08-10T04:49:58.043' AS DateTime), CAST(N'2023-08-10T04:49:58.043' AS DateTime), 1203)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (107, 49, CAST(N'2022-08-10T04:49:58.043' AS DateTime), CAST(N'2023-08-10T04:49:58.043' AS DateTime), 1124)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (108, 50, CAST(N'2022-08-10T04:49:58.043' AS DateTime), CAST(N'2023-08-10T04:49:58.043' AS DateTime), 2851)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (109, 51, CAST(N'2022-08-10T04:49:58.047' AS DateTime), CAST(N'2023-08-10T04:49:58.047' AS DateTime), 3350)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (110, 52, CAST(N'2022-08-10T04:49:58.047' AS DateTime), CAST(N'2023-08-10T04:49:58.047' AS DateTime), 7228)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (111, 53, CAST(N'2022-08-10T04:49:58.047' AS DateTime), CAST(N'2023-08-10T04:49:58.047' AS DateTime), 7075)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (112, 54, CAST(N'2022-08-10T04:49:58.047' AS DateTime), CAST(N'2023-08-10T04:49:58.047' AS DateTime), 4856)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (113, 55, CAST(N'2022-08-10T04:49:58.050' AS DateTime), CAST(N'2023-08-10T04:49:58.050' AS DateTime), 6415)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (114, 56, CAST(N'2022-08-10T04:49:58.050' AS DateTime), CAST(N'2023-08-10T04:49:58.050' AS DateTime), 1726)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (115, 57, CAST(N'2022-08-10T04:49:58.050' AS DateTime), CAST(N'2023-08-10T04:49:58.050' AS DateTime), 8161)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (116, 58, CAST(N'2022-08-10T04:49:58.053' AS DateTime), CAST(N'2023-08-10T04:49:58.053' AS DateTime), 6634)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (117, 59, CAST(N'2022-08-10T04:49:58.053' AS DateTime), CAST(N'2023-08-10T04:49:58.053' AS DateTime), 1148)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (118, 60, CAST(N'2022-08-10T04:49:58.053' AS DateTime), CAST(N'2023-08-10T04:49:58.053' AS DateTime), 9960)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (119, 61, CAST(N'2022-08-10T04:49:58.057' AS DateTime), CAST(N'2023-08-10T04:49:58.057' AS DateTime), 3859)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (120, 62, CAST(N'2022-08-10T04:49:58.057' AS DateTime), CAST(N'2023-08-10T04:49:58.057' AS DateTime), 3750)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (121, 63, CAST(N'2022-08-10T04:49:58.057' AS DateTime), CAST(N'2023-08-10T04:49:58.057' AS DateTime), 4440)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (122, 64, CAST(N'2022-08-10T04:49:58.057' AS DateTime), CAST(N'2023-08-10T04:49:58.057' AS DateTime), 9543)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (123, 65, CAST(N'2022-08-10T04:49:58.060' AS DateTime), CAST(N'2023-08-10T04:49:58.060' AS DateTime), 8949)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (124, 66, CAST(N'2022-08-10T04:49:58.060' AS DateTime), CAST(N'2023-08-10T04:49:58.060' AS DateTime), 2923)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (125, 67, CAST(N'2022-08-10T04:49:58.060' AS DateTime), CAST(N'2023-08-10T04:49:58.060' AS DateTime), 2628)
INSERT [dbo].[GiaSanPham] ([MaGiaSanPham], [MaSanPham], [NgayBatDau], [NgayKetThuc], [Gia]) VALUES (126, 68, CAST(N'2022-08-10T04:49:58.063' AS DateTime), CAST(N'2023-08-10T04:49:58.063' AS DateTime), 9995)
SET IDENTITY_INSERT [dbo].[GiaSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonXuat] ON 

INSERT [dbo].[HoaDonXuat] ([MaHoaDonXuat], [SoHoaDon], [NgayXuat], [MaKhachHang], [MaNguoiDung]) VALUES (1, NULL, CAST(N'2022-12-11T21:46:57.967' AS DateTime), 15, NULL)
INSERT [dbo].[HoaDonXuat] ([MaHoaDonXuat], [SoHoaDon], [NgayXuat], [MaKhachHang], [MaNguoiDung]) VALUES (2, NULL, CAST(N'2022-12-11T22:01:06.620' AS DateTime), 17, 1)
INSERT [dbo].[HoaDonXuat] ([MaHoaDonXuat], [SoHoaDon], [NgayXuat], [MaKhachHang], [MaNguoiDung]) VALUES (3, NULL, CAST(N'2022-12-12T08:53:10.743' AS DateTime), 18, 1)
INSERT [dbo].[HoaDonXuat] ([MaHoaDonXuat], [SoHoaDon], [NgayXuat], [MaKhachHang], [MaNguoiDung]) VALUES (4, NULL, CAST(N'2022-12-13T08:35:24.607' AS DateTime), 19, 1)
SET IDENTITY_INSERT [dbo].[HoaDonXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (11, N'đông', N'Hưng yên', N'0965543245', N'')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (12, N'mai', NULL, N'', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (13, N'mai', NULL, N'', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (14, N'mai', NULL, N'', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (15, N'mai', NULL, N'', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (16, N'mai', NULL, N'', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (17, N'mai', NULL, N'', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (18, N'mai', NULL, N'', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [Email]) VALUES (19, N'pppp', NULL, N'', NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[Kho] ON 

INSERT [dbo].[Kho] ([MaKho], [TenKho], [DiaChi]) VALUES (1, N'Kho 1', N'Hưng yên')
INSERT [dbo].[Kho] ([MaKho], [TenKho], [DiaChi]) VALUES (2, N'Kho 2', N'Hải Dương')
SET IDENTITY_INSERT [dbo].[Kho] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [Email], [DienThoai], [TrangThai]) VALUES (1, N'Nguyễn Hữu Đông', CAST(N'1970-01-01T00:00:00.000' AS DateTime), NULL, N'assets/upload/2.jpg', N'Hưng Yên', N'dongnh@gmail.com', N'0999999999          ', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [Email], [DienThoai], [TrangThai]) VALUES (2, N'Nguyễn Minh Khôi', NULL, NULL, N'assets/upload/1.jpg', N'Hưng Yên', N'khoi@gmail.com', N'09888888888888      ', 1)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [NgaySinh], [GioiTinh], [AnhDaiDien], [DiaChi], [Email], [DienThoai], [TrangThai]) VALUES (12, N'Nguyễn Văn Anh', CAST(N'2022-03-05T00:00:00.000' AS DateTime), N'Nam', N'assets/upload/user/4.jpg', N'', N'', N'                    ', 1)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [MoTa]) VALUES (1, N'Nhà sản xuất 1', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [MoTa]) VALUES (2, N'Nhà sản xuất 2', NULL)
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
GO
SET IDENTITY_INSERT [dbo].[NhomSanPham] ON 

INSERT [dbo].[NhomSanPham] ([MaNhomSanPham], [TenNhom], [TrangThai]) VALUES (1, N'PC VĂN PHÒNG, AIO, MINI PC', 1)
INSERT [dbo].[NhomSanPham] ([MaNhomSanPham], [TenNhom], [TrangThai]) VALUES (2, N'LAPTOP, MÁY TÍNH XÁCH TAY', 1)
SET IDENTITY_INSERT [dbo].[NhomSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (4, 2, N'Màn hình1', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.000' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (5, 2, N'Màn hình 2', N'Mô tả 2', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.000' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (7, 1, N'Máy tính 1', N'Máy tính 1', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.000' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (8, 1, N'Máy tính 2', N'MMM', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.000' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (10, 2, N'Màn hình 6', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.000' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (11, 2, N'Màn hình 7', N'Mô tả 2', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.000' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (12, 2, N'Màn hình 8', N'Máy tính 1', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.000' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (13, 2, N'Màn hình 9', N'MMM', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.000' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (14, 2, N'Màn hình 10', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.000' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (15, 2, N'Màn hình 11', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.003' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (16, 2, N'Màn hình 12', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.003' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (17, 2, N'Màn hình 13', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.003' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (18, 2, N'Màn hình 14', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.007' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (19, 2, N'Màn hình 15', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.007' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (20, 2, N'Màn hình 16', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.007' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (21, 2, N'Màn hình 17', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.007' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (22, 2, N'Màn hình 18', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.010' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (23, 2, N'Màn hình 19', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.010' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (24, 2, N'Màn hình 20', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.010' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (25, 2, N'Màn hình 21', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.013' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (26, 2, N'Màn hình 22', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.013' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (27, 2, N'Màn hình 23', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.013' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (28, 2, N'Màn hình 24', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.017' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (29, 2, N'Màn hình 25', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.017' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (30, 2, N'Màn hình 26', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.017' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (31, 2, N'Màn hình 27', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.017' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (32, 2, N'Màn hình 28', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.020' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (33, 2, N'Màn hình 29', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.020' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (34, 2, N'Màn hình 30', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.020' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (35, 2, N'Màn hình 31', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.023' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (36, 2, N'Màn hình 32', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.023' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (37, 2, N'Màn hình 33', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.023' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (38, 2, N'Màn hình 34', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.027' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (39, 2, N'Màn hình 35', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.027' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (40, 2, N'Màn hình 36', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.027' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (41, 2, N'Màn hình 37', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.027' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (42, 2, N'Màn hình 38', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.030' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (43, 2, N'Màn hình 39', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.030' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (44, 2, N'Màn hình 40', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.030' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (45, 2, N'Màn hình 41', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.033' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (46, 2, N'Màn hình 42', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.033' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (47, 2, N'Màn hình 43', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.033' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (48, 2, N'Màn hình 44', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.037' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (49, 2, N'Màn hình 45', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.037' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (50, 2, N'Màn hình 46', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.037' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (51, 2, N'Màn hình 47', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.037' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (52, 2, N'Màn hình 48', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.040' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (53, 2, N'Màn hình 49', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.040' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (54, 2, N'Màn hình 50', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.040' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (55, 2, N'Màn hình 51', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.043' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (56, 2, N'Màn hình 52', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.043' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (57, 2, N'Màn hình 53', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.043' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (58, 2, N'Màn hình 54', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.047' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (59, 2, N'Màn hình 55', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.047' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (60, 2, N'Màn hình 56', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.047' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (61, 2, N'Màn hình 57', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.047' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (62, 2, N'Màn hình 58', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.050' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (63, 2, N'Màn hình 59', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.050' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (64, 2, N'Màn hình 60', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.050' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (65, 2, N'Màn hình 61', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.053' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (66, 2, N'Màn hình 62', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.053' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (67, 2, N'Màn hình 63', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.053' AS DateTime))
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [MoTaSanPham], [AnhDaiDien], [MaNhaSanXuat], [MaDonViTinh], [NgayTao]) VALUES (68, 2, N'Màn hình 64', N'Mô tả', N'assets\img\LAPTOP\Acer_Swift_3_SF313-53-518Y.png', 1, 1, CAST(N'2022-08-10T04:49:58.057' AS DateTime))
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MaNguoiDung], [TaiKhoan], [MatKhau], [NgayBatDau], [NgayKetThuc], [TrangThai], [LoaiQuyet]) VALUES (1, 1, N'dongnh', N'123456@', CAST(N'2021-08-18T00:44:56.683' AS DateTime), CAST(N'2021-08-18T00:44:56.683' AS DateTime), 1, N'Admin')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MaNguoiDung], [TaiKhoan], [MatKhau], [NgayBatDau], [NgayKetThuc], [TrangThai], [LoaiQuyet]) VALUES (2, 2, N'khoi', N'123456', CAST(N'2021-08-18T00:44:56.683' AS DateTime), CAST(N'2021-08-18T00:44:56.683' AS DateTime), 1, N'User')
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MaNguoiDung], [TaiKhoan], [MatKhau], [NgayBatDau], [NgayKetThuc], [TrangThai], [LoaiQuyet]) VALUES (12, 12, N'anhabc', N'123456@', NULL, NULL, 1, N'User')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
ALTER TABLE [dbo].[ChiTietAnhSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietAnhSanPham_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietAnhSanPham] CHECK CONSTRAINT [FK_ChiTietAnhSanPham_SanPham]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap] FOREIGN KEY([MaHoaDonNhap])
REFERENCES [dbo].[HoaDonNhap] ([MaHoaDonNhap])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_HoaDonNhap]
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonNhap_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDonNhap] CHECK CONSTRAINT [FK_ChiTietHoaDonNhap_SanPham]
GO
ALTER TABLE [dbo].[ChiTietHoaDonXuat]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonXuat_HoaDonXuat] FOREIGN KEY([MaHoaDonXuat])
REFERENCES [dbo].[HoaDonXuat] ([MaHoaDonXuat])
GO
ALTER TABLE [dbo].[ChiTietHoaDonXuat] CHECK CONSTRAINT [FK_ChiTietHoaDonXuat_HoaDonXuat]
GO
ALTER TABLE [dbo].[ChiTietHoaDonXuat]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonXuat_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDonXuat] CHECK CONSTRAINT [FK_ChiTietHoaDonXuat_SanPham]
GO
ALTER TABLE [dbo].[ChiTietKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKho_Kho] FOREIGN KEY([MaKho])
REFERENCES [dbo].[Kho] ([MaKho])
GO
ALTER TABLE [dbo].[ChiTietKho] CHECK CONSTRAINT [FK_ChiTietKho_Kho]
GO
ALTER TABLE [dbo].[ChiTietKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKho_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietKho] CHECK CONSTRAINT [FK_ChiTietKho_SanPham]
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKhuyenMai_KhuyenMai] FOREIGN KEY([MaKhuyenMai])
REFERENCES [dbo].[KhuyenMai] ([MaKhuyenMai])
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai] CHECK CONSTRAINT [FK_ChiTietKhuyenMai_KhuyenMai]
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKhuyenMai_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai] CHECK CONSTRAINT [FK_ChiTietKhuyenMai_SanPham]
GO
ALTER TABLE [dbo].[ChiTietKiemKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKiemKho_KiemKho] FOREIGN KEY([MaKiemKho])
REFERENCES [dbo].[KiemKho] ([MaKiemKho])
GO
ALTER TABLE [dbo].[ChiTietKiemKho] CHECK CONSTRAINT [FK_ChiTietKiemKho_KiemKho]
GO
ALTER TABLE [dbo].[ChiTietKiemKho]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietKiemKho_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietKiemKho] CHECK CONSTRAINT [FK_ChiTietKiemKho_SanPham]
GO
ALTER TABLE [dbo].[ChiTietNhom]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietNhom_NhomSanPham] FOREIGN KEY([MaNhomSanPham])
REFERENCES [dbo].[NhomSanPham] ([MaNhomSanPham])
GO
ALTER TABLE [dbo].[ChiTietNhom] CHECK CONSTRAINT [FK_ChiTietNhom_NhomSanPham]
GO
ALTER TABLE [dbo].[ChiTietNhom]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietNhom_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietNhom] CHECK CONSTRAINT [FK_ChiTietNhom_SanPham]
GO
ALTER TABLE [dbo].[GiamGia]  WITH CHECK ADD  CONSTRAINT [FK_GiamGia_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[GiamGia] CHECK CONSTRAINT [FK_GiamGia_SanPham]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NguoiDung]
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonNhap_NhaCungCap] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNhaCungCap])
GO
ALTER TABLE [dbo].[HoaDonNhap] CHECK CONSTRAINT [FK_HoaDonNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[HoaDonXuat]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonXuat_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDonXuat] CHECK CONSTRAINT [FK_HoaDonXuat_KhachHang]
GO
ALTER TABLE [dbo].[KiemKho]  WITH CHECK ADD  CONSTRAINT [FK_KiemKho_Kho] FOREIGN KEY([MaKho])
REFERENCES [dbo].[Kho] ([MaKho])
GO
ALTER TABLE [dbo].[KiemKho] CHECK CONSTRAINT [FK_KiemKho_Kho]
GO
ALTER TABLE [dbo].[LichSuGiaBan]  WITH CHECK ADD  CONSTRAINT [FK_LichSuGiaBan_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[LichSuGiaBan] CHECK CONSTRAINT [FK_LichSuGiaBan_SanPham]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NguoiDung]
GO
ALTER TABLE [dbo].[ThongSoKyThuat]  WITH CHECK ADD  CONSTRAINT [FK_ThongSoKyThuat_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ThongSoKyThuat] CHECK CONSTRAINT [FK_ThongSoKyThuat_SanPham]
GO
/****** Object:  StoredProcedure [dbo].[sp_danhmuc_get_by_id]    Script Date: 1/31/2023 10:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[sp_danhmuc_get_by_id](@MaDanhMuc int)
AS
    BEGIN
        SELECT *                       
        FROM DanhMuc
      where  MaDanhMuc = @MaDanhMuc;
    END;
GO
USE [master]
GO
ALTER DATABASE [BanMayTinh] SET  READ_WRITE 
GO
