USE [master]
GO
/****** Object:  Database [DATN_PTPM_SD22]    Script Date: 6/4/2024 10:19:30 PM ******/
CREATE DATABASE [DATN_PTPM_SD22]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'DATN_PTPM_SD22', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DATN_PTPM_SD22.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'DATN_PTPM_SD22_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DATN_PTPM_SD22_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DATN_PTPM_SD22] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DATN_PTPM_SD22].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DATN_PTPM_SD22] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET ARITHABORT OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET  MULTI_USER 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DATN_PTPM_SD22] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DATN_PTPM_SD22] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DATN_PTPM_SD22] SET QUERY_STORE = ON
GO
ALTER DATABASE [DATN_PTPM_SD22] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DATN_PTPM_SD22]
GO
/****** Object:  Table [dbo].[anh]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anh](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[url] [nvarchar](max) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chat_lieu]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chat_lieu](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[moTa] [nvarchar](100) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[co_giay]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[co_giay](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[moTa] [nvarchar](100) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danh_muc]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danh_muc](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[de_giay]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[de_giay](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[moTa] [nvarchar](100) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dia_chi]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dia_chi](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idKhachHang] [bigint] NULL,
	[thanhPho] [nvarchar](50) NULL,
	[quanHuyen] [nvarchar](50) NULL,
	[phuongXa] [nvarchar](50) NULL,
	[soNha] [nvarchar](50) NULL,
	[moTaChiTiet] [nvarchar](500) NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gio_hang]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gio_hang](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idKhachHang] [bigint] NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gio_hang_chi_tiet]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gio_hang_chi_tiet](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idGioHang] [bigint] NULL,
	[idSanPhamChiTiet] [bigint] NULL,
	[soLuong] [int] NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idPhieuGiamGia] [bigint] NULL,
	[idNhanVien] [bigint] NULL,
	[idKhachHang] [bigint] NULL,
	[ma] [nvarchar](30) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[ngayGiaoHang] [datetime] NULL,
	[tienShip] [decimal](18, 0) NULL,
	[ngayNhan] [datetime] NULL,
	[ngayThanhToan] [datetime] NULL,
	[tongTien] [decimal](18, 0) NULL,
	[tongTienSauGiam] [decimal](18, 0) NULL,
	[nguoiNhan] [nvarchar](50) NULL,
	[sdtNguoiNhan] [nvarchar](20) NULL,
	[diaChiNguoiNhan] [nvarchar](100) NULL,
	[loai] [int] null,
	[ghiChu] [nvarchar](200) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don_chi_tiet]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don_chi_tiet](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idSanPhamChiTiet] [bigint] NULL,
	[idHoaDon] [bigint] NULL,
	[soLuong] [int] NULL,
	[gia] [decimal](18, 0) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khach_hang](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[ma] [nvarchar](30) NULL,
	[sdt] [nvarchar](30) NULL,
	[ngaySinh] [datetime] NULL,
	[email] [nvarchar](50) NULL,
	[gioiTinh] [bit] NULL,
	[cccd] [nvarchar](30) NULL,
	[anh] [nvarchar](100) NULL,
	[matKhau] [nvarchar](30) NULL,
	[trangThai] [int] NULL,
	[ngaytao] [datetime] NULL,
	[ngaycapnhat] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kich_co]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kich_co](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[moTa] [nvarchar](100) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lich_su_hoa_don]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lich_su_hoa_don](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idHoaDon] [bigint] NULL,
	[ghiChu] [nvarchar](200) NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[hanhDong] [int] NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mau_sac]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mau_sac](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[moTa] [nvarchar](100) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nha_san_xuat]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nha_san_xuat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[moTa] [nvarchar](100) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhan_vien]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhan_vien](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[ma] [nvarchar](30) NULL,
	[sdt] [nvarchar](30) NULL,
	[ngaySinh] [datetime] NULL,
	[email] [nvarchar](50) NULL,
	[gioiTinh] [bit] NULL,
	[cccd] [nvarchar](30) NULL,
	[anh] [nvarchar](100) NULL,
	[matKhau] [nvarchar](30) NULL,
	[vai_tro] [int] NULL,
	[trangThai] [int] NULL,
	[ngaytao] [datetime] NULL,
	[ngaycapnhap] [datetime] NULL,
	diachi [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phieu_giam_gia]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phieu_giam_gia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](30) NULL,
	[ten] [nvarchar](30) NULL,
	[soLuong] [int] NULL,
	[hinhThucGiam] [bit] NULL,
	[dieuKienGiam] [decimal](18, 0) NULL,
	[giaTriGiam] [decimal](18, 0) NULL,
	[giamToiDa] [decimal](18, 0) NULL,
	[ngayBatdau] [datetime] NULL,
	[ngayKetThuc] [datetime] NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phuong_thuc_thanh_toan]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phuong_thuc_thanh_toan](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tenPhuongThuc] [nvarchar](30) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[ghiChu] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[san_pham]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idThuongHieu] [bigint] NULL,
	[ten] [nvarchar](100) NULL,
	[moTa] [nvarchar](100) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[san_pham_chi_tiet]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham_chi_tiet](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](30) NULL,
	[ten] [nvarchar](50) null,
	[barcode] [char](20) NULL,
	[soLuong] [int] NULL,
	[giaBan] [decimal](18, 0) NULL,
	[moTa] [nvarchar](100) NULL,
	[idKichCo] [bigint] NULL,
	[idMauSac] [bigint] NULL,
	[idDeGiay] [bigint] NULL,
	[idChatLieu] [bigint] NULL,
	[idSanPham] [bigint] NULL,
	[idCoGiay] [bigint] NULL,
	[idNhaSanXuat] [bigint] NULL,
	[idAnh] [bigint] NULL,
	[idDanhMuc] [bigint] NULL,
	[canNang] [int] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL, 
	[ngayTao] [nvarchar](50) NULL,
	[ngayCapNhat] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thanh_toan_chi_tiet]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thanh_toan_chi_tiet](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idHoaDon] [bigint] NULL,
	[idPhuongThucThanhToan] [bigint] NULL,
	[giaTien] [decimal](18, 0) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[ghiChu] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thuong_hieu]    Script Date: 6/4/2024 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thuong_hieu](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dia_chi]  WITH CHECK ADD FOREIGN KEY([idKhachHang])
REFERENCES [dbo].[khach_hang] ([id])
GO
ALTER TABLE [dbo].[gio_hang]  WITH CHECK ADD FOREIGN KEY([idKhachHang])
REFERENCES [dbo].[khach_hang] ([id])
GO
ALTER TABLE [dbo].[gio_hang_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idGioHang])
REFERENCES [dbo].[gio_hang] ([id])
GO
ALTER TABLE [dbo].[gio_hang_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idSanPhamChiTiet])
REFERENCES [dbo].[san_pham_chi_tiet] ([id])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([idKhachHang])
REFERENCES [dbo].[khach_hang] ([id])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([idNhanVien])
REFERENCES [dbo].[nhan_vien] ([id])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([idPhieuGiamGia])
REFERENCES [dbo].[phieu_giam_gia] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idHoaDon])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idSanPhamChiTiet])
REFERENCES [dbo].[san_pham_chi_tiet] ([id])
GO
ALTER TABLE [dbo].[lich_su_hoa_don]  WITH CHECK ADD FOREIGN KEY([idHoaDon])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[san_pham]  WITH CHECK ADD FOREIGN KEY([idThuongHieu])
REFERENCES [dbo].[thuong_hieu] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idAnh])
REFERENCES [dbo].[anh] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idChatLieu])
REFERENCES [dbo].[chat_lieu] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idCoGiay])
REFERENCES [dbo].[co_giay] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idDanhMuc])
REFERENCES [dbo].[danh_muc] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idDeGiay])
REFERENCES [dbo].[de_giay] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idKichCo])
REFERENCES [dbo].[kich_co] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idMauSac])
REFERENCES [dbo].[mau_sac] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idNhaSanXuat])
REFERENCES [dbo].[nha_san_xuat] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idSanPham])
REFERENCES [dbo].[san_pham] ([id])
GO
ALTER TABLE [dbo].[thanh_toan_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idHoaDon])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[thanh_toan_chi_tiet]  WITH CHECK ADD FOREIGN KEY([idPhuongThucThanhToan])
REFERENCES [dbo].[phuong_thuc_thanh_toan] ([id])
GO
USE [master]
GO
ALTER DATABASE [DATN_PTPM_SD22] SET  READ_WRITE 
GO


select * from phieu_giam_gia
 