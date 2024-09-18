CREATE DATABASE [DATN_PTPM_SD22_FINAL]
GO
USE [DATN_PTPM_SD22_FINAL]
GO
/****** Object:  Table [dbo].[chat_lieu]    Script Date: 9/16/2024 10:01:25 PM ******/
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
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[co_giay]    Script Date: 9/16/2024 10:01:25 PM ******/
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
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[de_giay]    Script Date: 9/16/2024 10:01:25 PM ******/
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
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dia_chi]    Script Date: 9/16/2024 10:01:25 PM ******/
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
	[moTaChiTiet] [nvarchar](200) NULL,
	[tenNguoiNhan] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[gio_hang]    Script Date: 9/16/2024 10:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gio_hang](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idTaiKhoan] [bigint] NULL,
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
/****** Object:  Table [dbo].[gio_hang_chi_tiet]    Script Date: 9/16/2024 10:01:25 PM ******/
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
	[nguoiTao] [bigint] NULL,
	[nguoiCapNhat] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 9/16/2024 10:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](30) NULL,
	[loai] [int] NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[ngayGiaoHang] [datetime] NULL,
	[ngayThanhToan] [datetime] NULL,
	[ngayNhan] [datetime] NULL,
	[tongTien] [decimal](18, 0) NULL,
	[tienShip] [decimal](18, 0) NULL,
	[tongTienSauGiam] [decimal](18, 0) NULL,
	[nguoiNhan] [nvarchar](50) NULL,
	[sdtNguoiNhan] [nvarchar](20) NULL,
	[diaChiNguoiNhan] [nvarchar](100) NULL,
	[ghiChu] [nvarchar](200) NULL,
	[idPhieuGiamGia] [bigint] NULL,
	[idNhanVien] [bigint] NULL,
	[idKhachHang] [bigint] NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don_chi_tiet]    Script Date: 9/16/2024 10:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don_chi_tiet](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[soLuong] [int] NULL,
	[gia] [decimal](18, 0) NULL,
	[idChiTietSanPham] [bigint] NULL,
	[idHoaDon] [bigint] NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 9/16/2024 10:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khach_hang](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](50) NULL,
	[ten] [nvarchar](50) NULL,
	[sdt] [nvarchar](50) NULL,
	[ngaySinh] [date] NULL,
	[email] [nvarchar](50) NULL,
	[gioiTinh] [bit] NULL,
	[cccd] [nvarchar](50) NULL,
	[anh] [nvarchar](100) NULL,
	[matKhau] [nvarchar](50) NULL,
	[vaiTro] [int] NULL,
	[trangThai] [int] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kich_co]    Script Date: 9/16/2024 10:01:25 PM ******/
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
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lich_su_hoa_don]    Script Date: 9/16/2024 10:01:25 PM ******/
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
/****** Object:  Table [dbo].[mau_sac]    Script Date: 9/16/2024 10:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mau_sac](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[moTa] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[nha_san_xuat]    Script Date: 9/16/2024 10:01:25 PM ******/
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
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhan_vien]    Script Date: 9/16/2024 10:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhan_vien](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](50) NULL,
	[ten] [nvarchar](50) NULL,
	[sdt] [nvarchar](50) NULL,
	[ngaySinh] [date] NULL,
	[email] [nvarchar](50) NULL,
	[gioiTinh] [bit] NULL,
	[cccd] [nvarchar](50) NULL,
	[anh] [nvarchar](100) NULL,
	[matKhau] [nvarchar](50) NULL,
	[vaiTro] [int] NULL,
	[trangThai] [int] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[diaChi] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phieu_giam_gia]    Script Date: 9/16/2024 10:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phieu_giam_gia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](30) NULL,
	[ten] [nvarchar](200) NULL,
	[soLuong] [int] NULL,
	[hinhThucGiam] [bit] NULL,
	[donToiThieu] [decimal](18, 0) NULL,
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
/****** Object:  Table [dbo].[phuong_thuc_thanh_toan]    Script Date: 9/16/2024 10:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phuong_thuc_thanh_toan](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idHoaDon] [bigint] NULL,
	[tenThanhToan] [nvarchar](30) NULL,
	[loaiThanhToan] [bit] NULL,
	[tienDaThanhToan] [decimal](18, 0) NULL,
	[ghiChu] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[san_pham]    Script Date: 9/16/2024 10:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](30) NULL,
	[idThuongHieu] [bigint] NULL,
	[soLuong] [int] NULL,
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
/****** Object:  Table [dbo].[san_pham_chi_tiet]    Script Date: 9/16/2024 10:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham_chi_tiet](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](30) NULL,
	[ten] [nvarchar](50) NULL,
	[soLuong] [int] NULL,
	[barcode] [char](30) NULL,
	[anh] [varchar](200) NULL,
	[giaBan] [decimal](18, 0) NULL,
	[moTa] [nvarchar](100) NULL,
	[canNang] [int] NULL,
	[ngaySanXuat] [datetime] NULL,
	[nguoiTao] [nvarchar](50) NULL,
	[nguoiCapNhat] [nvarchar](50) NULL,
	[ngayTao] [datetime] NULL,
	[ngayCapNhat] [datetime] NULL,
	[idKichCo] [bigint] NULL,
	[idMauSac] [bigint] NULL,
	[idDeGiay] [bigint] NULL,
	[idChatLieu] [bigint] NULL,
	[idSanPham] [bigint] NULL,
	[idCoGiay] [bigint] NULL,
	[idNhaSanXuat] [bigint] NULL,
	[trangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thuong_hieu]    Script Date: 9/16/2024 10:01:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thuong_hieu](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tenThuongHieu] [nvarchar](30) NULL,
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
SET IDENTITY_INSERT [dbo].[chat_lieu] ON 
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Vải', CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Da bò', CAST(N'2024-01-02T08:00:00.000' AS DateTime), CAST(N'2024-01-02T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Da lộn', CAST(N'2024-01-03T08:00:00.000' AS DateTime), CAST(N'2024-01-03T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'Nhựa PVC', CAST(N'2024-01-04T08:00:00.000' AS DateTime), CAST(N'2024-01-04T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Gore-Tex', CAST(N'2024-01-05T08:00:00.000' AS DateTime), CAST(N'2024-01-05T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'Synthetic leather', CAST(N'2024-01-06T08:00:00.000' AS DateTime), CAST(N'2024-01-06T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'Chất liệu mesh', CAST(N'2024-01-07T08:00:00.000' AS DateTime), CAST(N'2024-01-07T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Chất liệu Nubuck', CAST(N'2024-01-08T08:00:00.000' AS DateTime), CAST(N'2024-01-08T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'Đế cao su', CAST(N'2024-01-09T08:00:00.000' AS DateTime), CAST(N'2024-01-09T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'Đế EVA', CAST(N'2024-01-10T08:00:00.000' AS DateTime), CAST(N'2024-01-10T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'Chất liệu Canvas', CAST(N'2024-01-11T08:00:00.000' AS DateTime), CAST(N'2024-01-11T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'Vải dù', CAST(N'2024-01-12T08:00:00.000' AS DateTime), CAST(N'2024-01-12T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'Vải lưới', CAST(N'2024-01-13T08:00:00.000' AS DateTime), CAST(N'2024-01-13T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'Gai', CAST(N'2024-01-14T08:00:00.000' AS DateTime), CAST(N'2024-01-14T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'Lụa', CAST(N'2024-01-15T08:00:00.000' AS DateTime), CAST(N'2024-01-15T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'Sợi tre', CAST(N'2024-01-16T08:00:00.000' AS DateTime), CAST(N'2024-01-16T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, N'Chất liệu vi sợi', CAST(N'2024-01-17T08:00:00.000' AS DateTime), CAST(N'2024-01-17T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, N'Bông', CAST(N'2024-01-18T08:00:00.000' AS DateTime), CAST(N'2024-01-18T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, N'Lông cừu', CAST(N'2024-01-19T08:00:00.000' AS DateTime), CAST(N'2024-01-19T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, N'Da PU', CAST(N'2024-01-20T08:00:00.000' AS DateTime), CAST(N'2024-01-20T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, N'Vải thun', CAST(N'2024-01-21T08:00:00.000' AS DateTime), CAST(N'2024-01-21T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, N'Gai', CAST(N'2024-01-22T08:00:00.000' AS DateTime), CAST(N'2024-01-22T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, N'Da cừu', CAST(N'2024-01-23T08:00:00.000' AS DateTime), CAST(N'2024-01-23T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, N'Vải polyamide', CAST(N'2024-01-24T08:00:00.000' AS DateTime), CAST(N'2024-01-24T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, N'Vải polyester', CAST(N'2024-01-25T08:00:00.000' AS DateTime), CAST(N'2024-01-25T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (26, N'Chất liệu chống nước', CAST(N'2024-01-26T08:00:00.000' AS DateTime), CAST(N'2024-01-26T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (27, N'Vải chống thấm', CAST(N'2024-01-27T08:00:00.000' AS DateTime), CAST(N'2024-01-27T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (28, N'Vải oxford', CAST(N'2024-01-28T08:00:00.000' AS DateTime), CAST(N'2024-01-28T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (29, N'Da lộn nubuck', CAST(N'2024-01-29T08:00:00.000' AS DateTime), CAST(N'2024-01-29T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (30, N'Chất liệu lưới', CAST(N'2024-01-30T08:00:00.000' AS DateTime), CAST(N'2024-01-30T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (31, N'Vải trơn', CAST(N'2024-01-31T08:00:00.000' AS DateTime), CAST(N'2024-01-31T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
SET IDENTITY_INSERT [dbo].[chat_lieu] OFF
GO
SET IDENTITY_INSERT [dbo].[co_giay] ON 
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Giày cổ thấp', CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Giày cổ cao', CAST(N'2024-01-02T08:00:00.000' AS DateTime), CAST(N'2024-01-02T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Giày cổ vừa', CAST(N'2024-01-03T08:00:00.000' AS DateTime), CAST(N'2024-01-03T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'Giày cổ lửng', CAST(N'2024-01-04T08:00:00.000' AS DateTime), CAST(N'2024-01-04T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Giày cổ xẻ', CAST(N'2024-01-05T08:00:00.000' AS DateTime), CAST(N'2024-01-05T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'Giày cổ trễ', CAST(N'2024-01-06T08:00:00.000' AS DateTime), CAST(N'2024-01-06T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'Giày cổ cao gót', CAST(N'2024-01-07T08:00:00.000' AS DateTime), CAST(N'2024-01-07T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Giày cổ ngắn', CAST(N'2024-01-08T08:00:00.000' AS DateTime), CAST(N'2024-01-08T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'Giày cổ thấp lưng', CAST(N'2024-01-09T08:00:00.000' AS DateTime), CAST(N'2024-01-09T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'Giày cổ cao lưng', CAST(N'2024-01-10T08:00:00.000' AS DateTime), CAST(N'2024-01-10T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'Giày cổ thả', CAST(N'2024-01-11T08:00:00.000' AS DateTime), CAST(N'2024-01-11T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'Giày cổ vừa lưng', CAST(N'2024-01-12T08:00:00.000' AS DateTime), CAST(N'2024-01-12T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'Giày cổ sụp', CAST(N'2024-01-13T08:00:00.000' AS DateTime), CAST(N'2024-01-13T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'Giày cổ thô', CAST(N'2024-01-14T08:00:00.000' AS DateTime), CAST(N'2024-01-14T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'Giày cổ mảnh', CAST(N'2024-01-15T08:00:00.000' AS DateTime), CAST(N'2024-01-15T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'Giày cổ nhung', CAST(N'2024-01-16T08:00:00.000' AS DateTime), CAST(N'2024-01-16T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, N'Giày cổ da', CAST(N'2024-01-17T08:00:00.000' AS DateTime), CAST(N'2024-01-17T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, N'Giày cổ lưới', CAST(N'2024-01-18T08:00:00.000' AS DateTime), CAST(N'2024-01-18T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, N'Giày cổ bông', CAST(N'2024-01-19T08:00:00.000' AS DateTime), CAST(N'2024-01-19T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, N'Giày cổ vải', CAST(N'2024-01-20T08:00:00.000' AS DateTime), CAST(N'2024-01-20T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, N'Giày cổ cao bản lớn', CAST(N'2024-01-21T08:00:00.000' AS DateTime), CAST(N'2024-01-21T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, N'Giày cổ thấp bản lớn', CAST(N'2024-01-22T08:00:00.000' AS DateTime), CAST(N'2024-01-22T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, N'Giày cổ chéo', CAST(N'2024-01-23T08:00:00.000' AS DateTime), CAST(N'2024-01-23T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, N'Giày cổ chữ V', CAST(N'2024-01-24T08:00:00.000' AS DateTime), CAST(N'2024-01-24T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, N'Giày cổ hình chữ U', CAST(N'2024-01-25T08:00:00.000' AS DateTime), CAST(N'2024-01-25T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (26, N'Giày cổ cao dạng boot', CAST(N'2024-01-26T08:00:00.000' AS DateTime), CAST(N'2024-01-26T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (27, N'Giày cổ thấp dạng boot', CAST(N'2024-01-27T08:00:00.000' AS DateTime), CAST(N'2024-01-27T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (28, N'Giày cổ mở', CAST(N'2024-01-28T08:00:00.000' AS DateTime), CAST(N'2024-01-28T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (29, N'Giày cổ kín', CAST(N'2024-01-29T08:00:00.000' AS DateTime), CAST(N'2024-01-29T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (30, N'Giày cổ bít', CAST(N'2024-01-30T08:00:00.000' AS DateTime), CAST(N'2024-01-30T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
SET IDENTITY_INSERT [dbo].[co_giay] OFF
GO
SET IDENTITY_INSERT [dbo].[de_giay] ON 
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Commando', CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Rubber', CAST(N'2024-01-02T08:00:00.000' AS DateTime), CAST(N'2024-01-02T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Crepe', CAST(N'2024-01-03T08:00:00.000' AS DateTime), CAST(N'2024-01-03T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'Leather', CAST(N'2024-01-04T08:00:00.000' AS DateTime), CAST(N'2024-01-04T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Composite', CAST(N'2024-01-05T08:00:00.000' AS DateTime), CAST(N'2024-01-05T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'Wood', CAST(N'2024-01-06T08:00:00.000' AS DateTime), CAST(N'2024-01-06T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'Cork', CAST(N'2024-01-07T08:00:00.000' AS DateTime), CAST(N'2024-01-07T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Foam', CAST(N'2024-01-08T08:00:00.000' AS DateTime), CAST(N'2024-01-08T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'EVA', CAST(N'2024-01-09T08:00:00.000' AS DateTime), CAST(N'2024-01-09T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'PU', CAST(N'2024-01-10T08:00:00.000' AS DateTime), CAST(N'2024-01-10T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'TPR', CAST(N'2024-01-11T08:00:00.000' AS DateTime), CAST(N'2024-01-11T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'Rubber and Cork', CAST(N'2024-01-12T08:00:00.000' AS DateTime), CAST(N'2024-01-12T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'Gum', CAST(N'2024-01-13T08:00:00.000' AS DateTime), CAST(N'2024-01-13T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'Plastic', CAST(N'2024-01-14T08:00:00.000' AS DateTime), CAST(N'2024-01-14T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'Steel', CAST(N'2024-01-15T08:00:00.000' AS DateTime), CAST(N'2024-01-15T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'Carbon Fiber', CAST(N'2024-01-16T08:00:00.000' AS DateTime), CAST(N'2024-01-16T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, N'TPU', CAST(N'2024-01-17T08:00:00.000' AS DateTime), CAST(N'2024-01-17T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, N'Crepe Rubber', CAST(N'2024-01-18T08:00:00.000' AS DateTime), CAST(N'2024-01-18T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, N'Synthetic', CAST(N'2024-01-19T08:00:00.000' AS DateTime), CAST(N'2024-01-19T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, N'Vibram', CAST(N'2024-01-20T08:00:00.000' AS DateTime), CAST(N'2024-01-20T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, N'Crepesole', CAST(N'2024-01-21T08:00:00.000' AS DateTime), CAST(N'2024-01-21T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, N'Polyurethane', CAST(N'2024-01-22T08:00:00.000' AS DateTime), CAST(N'2024-01-22T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, N'Air Cushion', CAST(N'2024-01-23T08:00:00.000' AS DateTime), CAST(N'2024-01-23T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, N'Latex', CAST(N'2024-01-24T08:00:00.000' AS DateTime), CAST(N'2024-01-24T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, N'Gel', CAST(N'2024-01-25T08:00:00.000' AS DateTime), CAST(N'2024-01-25T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (26, N'Sponge', CAST(N'2024-01-26T08:00:00.000' AS DateTime), CAST(N'2024-01-26T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (27, N'Rubber and TPU', CAST(N'2024-01-27T08:00:00.000' AS DateTime), CAST(N'2024-01-27T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (28, N'Jute', CAST(N'2024-01-28T08:00:00.000' AS DateTime), CAST(N'2024-01-28T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (29, N'Leather and Rubber', CAST(N'2024-01-29T08:00:00.000' AS DateTime), CAST(N'2024-01-29T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (30, N'Rubber and EVA', CAST(N'2024-01-30T08:00:00.000' AS DateTime), CAST(N'2024-01-30T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
SET IDENTITY_INSERT [dbo].[de_giay] OFF
GO
SET IDENTITY_INSERT [dbo].[dia_chi] ON 
Go
SET IDENTITY_INSERT [dbo].[dia_chi] OFF
GO
SET IDENTITY_INSERT [dbo].[khach_hang] ON 
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (1, N'KH001', N'Khách Vãng lai', N'', CAST(N'1900-01-01' AS Date), N'', 1, N'', N'', N'', 1, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (2, N'KH002', N'Nguyễn Bá Đăng', N'0987654321', CAST(N'1995-05-15' AS Date), N'dang@gmail.com', 0, N'987654321', N'', N'123', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (3, N'KH003', N'Lê Thị Bảo', N'0369852147', CAST(N'1998-08-20' AS Date), N'lethi.bao@example.com', 0, N'369852147', N'', N'bao123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (4, N'KH004', N'Nguyễn Văn Cảnh', N'0912345678', CAST(N'1997-10-25' AS Date), N'nguyenvan.canh@example.com', 1, N'912345678', N'', N'mkcanh123', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (5, N'KH005', N'Trần Thị Bình', N'0771234567', CAST(N'1996-12-30' AS Date), N'tranthi.binh@example.com', 0, N'771234567', N'', N'mkbtran789', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (6, N'KH006', N'Phạm Văn Dũng', N'0987654321', CAST(N'1994-09-12' AS Date), N'phamvan.dung@example.com', 1, N'987654321', N'', N'mkdung098', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (7, N'KH007', N'Lê Thị Thơm', N'0369852147', CAST(N'1995-07-18' AS Date), N'lethi.thom@example.com', 0, N'369852147', N'', N'thom123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (8, N'KH008', N'Trần Văn Đức', N'0912345678', CAST(N'1996-04-23' AS Date), N'tranvan.duc@example.com', 1, N'912345678', N'', N'ductv123', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (9, N'KH009', N'Hoàng Thị Hoa', N'0771234567', CAST(N'1997-03-10' AS Date), N'hoangthi.hoa@example.com', 0, N'771234567', N'', N'mkhoahoang', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (10, N'KH010', N'Nguyễn Văn Hùng', N'0987654321', CAST(N'1998-02-05' AS Date), N'nguyenvan.hung@example.com', 1, N'987654321', N'', N'mkhung1998', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (11, N'KH011', N'Trần Thị Lan', N'0369852147', CAST(N'1999-11-28' AS Date), N'tranthi.lan@example.com', 0, N'369852147', N'', N'tranlan2000', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (12, N'KH012', N'Lê Văn Minh', N'0912345678', CAST(N'2000-10-15' AS Date), N'levan.minh@example.com', 1, N'912345678', N'', N'mklevan123', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO

SET IDENTITY_INSERT [dbo].[khach_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[kich_co] ON 
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'35', CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'35.5', CAST(N'2024-01-02T08:00:00.000' AS DateTime), CAST(N'2024-01-02T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'36', CAST(N'2024-01-03T08:00:00.000' AS DateTime), CAST(N'2024-01-03T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'36.5', CAST(N'2024-01-04T08:00:00.000' AS DateTime), CAST(N'2024-01-04T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'37', CAST(N'2024-01-05T08:00:00.000' AS DateTime), CAST(N'2024-01-05T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'37.5', CAST(N'2024-01-06T08:00:00.000' AS DateTime), CAST(N'2024-01-06T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'38', CAST(N'2024-01-07T08:00:00.000' AS DateTime), CAST(N'2024-01-07T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'38.5', CAST(N'2024-01-08T08:00:00.000' AS DateTime), CAST(N'2024-01-08T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'39', CAST(N'2024-01-09T08:00:00.000' AS DateTime), CAST(N'2024-01-09T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'39.5', CAST(N'2024-01-10T08:00:00.000' AS DateTime), CAST(N'2024-01-10T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'40', CAST(N'2024-01-11T08:00:00.000' AS DateTime), CAST(N'2024-01-11T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'40.5', CAST(N'2024-01-12T08:00:00.000' AS DateTime), CAST(N'2024-01-12T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'41', CAST(N'2024-01-13T08:00:00.000' AS DateTime), CAST(N'2024-01-13T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'41.5', CAST(N'2024-01-14T08:00:00.000' AS DateTime), CAST(N'2024-01-14T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'42', CAST(N'2024-01-15T08:00:00.000' AS DateTime), CAST(N'2024-01-15T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'42.5', CAST(N'2024-01-16T08:00:00.000' AS DateTime), CAST(N'2024-01-16T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, N'43', CAST(N'2024-01-17T08:00:00.000' AS DateTime), CAST(N'2024-01-17T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, N'43.5', CAST(N'2024-01-18T08:00:00.000' AS DateTime), CAST(N'2024-01-18T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, N'44', CAST(N'2024-01-19T08:00:00.000' AS DateTime), CAST(N'2024-01-19T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
SET IDENTITY_INSERT [dbo].[kich_co] OFF
GO
SET IDENTITY_INSERT [dbo].[mau_sac] ON 
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'#FF0000', N'Đỏ', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'#00FF00', N'Xanh lá', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'#0000FF', N'Xanh dương', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'#FFFF00', N'Vàng', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'#FFA500', N'Cam', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'#800080', N'Tím', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'#00FFFF', N'Xanh ngọc', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'#FFC0CB', N'Hồng', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'#A52A2A', N'Nâu', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'#808080', N'Xám', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'#FFFFFF', N'Trắng', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'#000000', N'Đen', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'#8B4513', N'Nâu đất', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'#2F4F4F', N'Xanh đen', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'#228B22', N'Xanh lá cây đậm', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'#FF6347', N'Đỏ cà chua', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, N'#FFD700', N'Vàng kim', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, N'#ADFF2F', N'Xanh vàng', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, N'#DC143C', N'Đỏ yên chi', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, N'#7FFF00', N'Xanh nõn chuối', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, N'#4B0082', N'Chàm', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, N'#FF1493', N'Hồng đậm', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, N'#4682B4', N'Xanh thép', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, N'#B22222', N'Đỏ lửa', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, N'#FA8072', N'Hồng phấn', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (26, N'#DAA520', N'Vàng nâu', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (27, N'#00BFFF', N'Xanh trời nhạt', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (28, N'#556B2F', N'Xanh olive đậm', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (29, N'#9932CC', N'Tím lan', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (30, N'#FF4500', N'Cam đỏ', CAST(N'2024-09-16T20:38:15.630' AS DateTime), CAST(N'2024-09-16T20:38:15.630' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (31, N'#708090', N'Xám xanh', CAST(N'2024-09-16T21:57:08.597' AS DateTime), NULL, N'admin', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[mau_sac] OFF
GO
SET IDENTITY_INSERT [dbo].[nha_san_xuat] ON 
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Nike', CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Adidas', CAST(N'2024-01-02T08:00:00.000' AS DateTime), CAST(N'2024-01-02T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Puma', CAST(N'2024-01-03T08:00:00.000' AS DateTime), CAST(N'2024-01-03T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'New Balance', CAST(N'2024-01-04T08:00:00.000' AS DateTime), CAST(N'2024-01-04T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Vans', CAST(N'2024-01-05T08:00:00.000' AS DateTime), CAST(N'2024-01-05T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'Converse', CAST(N'2024-01-06T08:00:00.000' AS DateTime), CAST(N'2024-01-06T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'Under Armour', CAST(N'2024-01-07T08:00:00.000' AS DateTime), CAST(N'2024-01-07T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Reebok', CAST(N'2024-01-08T08:00:00.000' AS DateTime), CAST(N'2024-01-08T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'Asics', CAST(N'2024-01-09T08:00:00.000' AS DateTime), CAST(N'2024-01-09T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'Fila', CAST(N'2024-01-10T08:00:00.000' AS DateTime), CAST(N'2024-01-10T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'Skechers', CAST(N'2024-01-11T08:00:00.000' AS DateTime), CAST(N'2024-01-11T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'Salomon', CAST(N'2024-01-12T08:00:00.000' AS DateTime), CAST(N'2024-01-12T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'Lacoste', CAST(N'2024-01-13T08:00:00.000' AS DateTime), CAST(N'2024-01-13T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'Polo Ralph Lauren', CAST(N'2024-01-14T08:00:00.000' AS DateTime), CAST(N'2024-01-14T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'Burberry', CAST(N'2024-01-15T08:00:00.000' AS DateTime), CAST(N'2024-01-15T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'Gucci', CAST(N'2024-01-16T08:00:00.000' AS DateTime), CAST(N'2024-01-16T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, N'Louis Vuitton', CAST(N'2024-01-17T08:00:00.000' AS DateTime), CAST(N'2024-01-17T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, N'Hermès', CAST(N'2024-01-18T08:00:00.000' AS DateTime), CAST(N'2024-01-18T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, N'Chanel', CAST(N'2024-01-19T08:00:00.000' AS DateTime), CAST(N'2024-01-19T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, N'Dior', CAST(N'2024-01-20T08:00:00.000' AS DateTime), CAST(N'2024-01-20T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, N'Prada', CAST(N'2024-01-21T08:00:00.000' AS DateTime), CAST(N'2024-01-21T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, N'Balenciaga', CAST(N'2024-01-22T08:00:00.000' AS DateTime), CAST(N'2024-01-22T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, N'Versace', CAST(N'2024-01-23T08:00:00.000' AS DateTime), CAST(N'2024-01-23T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, N'Dolce & Gabbana', CAST(N'2024-01-24T08:00:00.000' AS DateTime), CAST(N'2024-01-24T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, N'Giorgio Armani', CAST(N'2024-01-25T08:00:00.000' AS DateTime), CAST(N'2024-01-25T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (26, N'Fendi', CAST(N'2024-01-26T08:00:00.000' AS DateTime), CAST(N'2024-01-26T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (27, N'Boss', CAST(N'2024-01-27T08:00:00.000' AS DateTime), CAST(N'2024-01-27T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (28, N'Valentino', CAST(N'2024-01-28T08:00:00.000' AS DateTime), CAST(N'2024-01-28T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (29, N'Yeezy', CAST(N'2024-01-29T08:00:00.000' AS DateTime), CAST(N'2024-01-29T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (30, N'Alexander McQueen', CAST(N'2024-01-30T08:00:00.000' AS DateTime), CAST(N'2024-01-30T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
SET IDENTITY_INSERT [dbo].[nha_san_xuat] OFF
GO
SET IDENTITY_INSERT [dbo].[nhan_vien] ON 
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (1, N'dangnb', N'Nguyễn Bá Đăng', N'0987654331', CAST(N'1993-04-04' AS Date), N'dang@gmail.com', 0, N'246813579', NULL, N'123', 0, 1, N'admin', N'admin', CAST(N'2024-01-04T08:00:00.000' AS DateTime), CAST(N'2024-01-04T08:00:00.000' AS DateTime), N'101 Đường GHI, Quận 4')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (2, N'tunglq', N'Lê Quang Tùng', N'0987654332', CAST(N'1994-05-05' AS Date), N'lqtung@example.com', 1, N'357924681', NULL, N'passwordxyz', 1, 1, N'admin', N'admin', CAST(N'2024-01-05T08:00:00.000' AS DateTime), CAST(N'2024-01-05T08:00:00.000' AS DateTime), N'202 Đường KLM, Quận 5')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (3, N'thoph', N'Phan Hữu Thọ', N'0987654333', CAST(N'1995-06-06' AS Date), N'phtho@example.com', 1, N'468135792', NULL, N'password123', 0, 1, N'admin', N'admin', CAST(N'2024-01-06T08:00:00.000' AS DateTime), CAST(N'2024-01-06T08:00:00.000' AS DateTime), N'303 Đường NOP, Quận 6')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (4, N'haihm', N'Mai Hoàng Hải', N'0987654334', CAST(N'1996-07-07' AS Date), N'mhhai@example.com', 1, N'579246813', NULL, N'password456', 0, 1, N'admin', N'admin', CAST(N'2024-01-07T08:00:00.000' AS DateTime), CAST(N'2024-01-07T08:00:00.000' AS DateTime), N'404 Đường QRS, Quận 7')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (5, N'dunglv', N'Lý Văn Dũng', N'0987654335', CAST(N'1997-08-08' AS Date), N'lvdung@example.com', 1, N'681357924', NULL, N'password789', 0, 1, N'admin', N'admin', CAST(N'2024-01-08T08:00:00.000' AS DateTime), CAST(N'2024-01-08T08:00:00.000' AS DateTime), N'505 Đường TUV, Quận 8')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (6, N'daobt', N'Bùi Thị Đào', N'0987654336', CAST(N'1998-09-09' AS Date), N'btdao@example.com', 0, N'792468135', NULL, N'passwordabc', 0, 1, N'admin', N'admin', CAST(N'2024-01-09T08:00:00.000' AS DateTime), CAST(N'2024-01-09T08:00:00.000' AS DateTime), N'606 Đường WXY, Quận 9')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (7, N'anhtn', N'Ngô Thị Anh', N'0987654337', CAST(N'1999-10-10' AS Date), N'ntanh@example.com', 1, N'813579246', NULL, N'passwordxyz', 0, 1, N'admin', N'admin', CAST(N'2024-01-10T08:00:00.000' AS DateTime), CAST(N'2024-01-10T08:00:00.000' AS DateTime), N'707 Đường ZAB, Quận 10')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (8, N'huonglt', N'Lê Thị Hương', N'0987654338', CAST(N'2000-11-11' AS Date), N'lthuong@example.com', 0, N'924681357', NULL, N'password123', 1, 1, N'admin', N'admin', CAST(N'2024-01-11T08:00:00.000' AS DateTime), CAST(N'2024-01-11T08:00:00.000' AS DateTime), N'808 Đường CDE, Quận 11')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (9, N'tungnv', N'Nguyễn Mạnh Tùng', N'0987654340', CAST(N'2002-01-13' AS Date), N'nmtung@example.com', 1, N'468135792', NULL, N'password789', 1, 1, N'admin', N'admin', CAST(N'2024-01-13T08:00:00.000' AS DateTime), CAST(N'2024-01-13T08:00:00.000' AS DateTime), N'1010 Đường IJK, Quận Bình Tân')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (10, N'chinv', N'Nguyễn Văn Chí', N'0987654341', CAST(N'2003-02-14' AS Date), N'nvchi@example.com', 1, N'579246813', NULL, N'passwordabc', 0, 1, N'admin', N'admin', CAST(N'2024-01-14T08:00:00.000' AS DateTime), CAST(N'2024-01-14T08:00:00.000' AS DateTime), N'1111 Đường LMN, Quận Bình Chánh')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (11, N'hatln', N'Trần Lê Nhật Hà', N'0987654342', CAST(N'2004-03-15' AS Date), N'tlnha@example.com', 0, N'681357924', NULL, N'passwordxyz', 1, 1, N'admin', N'admin', CAST(N'2024-01-15T08:00:00.000' AS DateTime), CAST(N'2024-01-15T08:00:00.000' AS DateTime), N'1212 Đường OPQ, Quận Gò Vấp')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (12, N'ngocph', N'Phạm Huyền Ngọc', N'0987654343', CAST(N'2005-04-16' AS Date), N'phngoc@example.com', 0, N'792468135', NULL, N'password123', 0, 1, N'admin', N'admin', CAST(N'2024-01-16T08:00:00.000' AS DateTime), CAST(N'2024-01-16T08:00:00.000' AS DateTime), N'1313 Đường RST, Quận Tân Bình')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (13, N'binhtn', N'Trần Ngọc Bình', N'0987654344', CAST(N'2006-05-17' AS Date), N'bntngoc@example.com', 1, N'813579246', NULL, N'password456', 1, 1, N'admin', N'admin', CAST(N'2024-01-17T08:00:00.000' AS DateTime), CAST(N'2024-01-17T08:00:00.000' AS DateTime), N'1414 Đường UVW, Quận Tân Phú')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (14, N'trunh', N'Hoàng Thị Trúc Như', N'0987654345', CAST(N'2007-06-18' AS Date), N'httnhu@example.com', 0, N'924681357', NULL, N'password789', 0, 1, N'admin', N'admin', CAST(N'2024-01-18T08:00:00.000' AS DateTime), CAST(N'2024-01-18T08:00:00.000' AS DateTime), N'1515 Đường XYZ, Quận Thủ Đức')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (15, N'lantt', N'Trần Thanh Lân', N'0987654346', CAST(N'2008-07-19' AS Date), N'ttl@example.com', 1, N'135792468', NULL, N'passwordabc', 1, 1, N'admin', N'admin', CAST(N'2024-01-19T08:00:00.000' AS DateTime), CAST(N'2024-01-19T08:00:00.000' AS DateTime), N'1616 Đường ABC, Quận 1')
GO


SET IDENTITY_INSERT [dbo].[nhan_vien] OFF
GO
SET IDENTITY_INSERT [dbo].[phieu_giam_gia] ON 
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'PGG202301', N'Phiếu giảm giá tháng 1/2023', 100, 1, CAST(500000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-01-31T23:59:59.000' AS DateTime), CAST(N'2023-01-01T08:00:00.000' AS DateTime), CAST(N'2023-01-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'PGG202302', N'Phiếu giảm giá tháng 2/2023', 150, 0, CAST(800000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), CAST(N'2023-02-01T00:00:00.000' AS DateTime), CAST(N'2023-02-28T23:59:59.000' AS DateTime), CAST(N'2023-02-01T08:00:00.000' AS DateTime), CAST(N'2023-02-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'PGG202303', N'Phiếu giảm giá tháng 3/2023', 120, 1, CAST(1200000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2023-03-01T00:00:00.000' AS DateTime), CAST(N'2023-03-31T23:59:59.000' AS DateTime), CAST(N'2023-03-01T08:00:00.000' AS DateTime), CAST(N'2023-03-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'PGG202304', N'Phiếu giảm giá tháng 4/2023', 200, 0, CAST(1500000 AS Decimal(18, 0)), CAST(40000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-30T23:59:59.000' AS DateTime), CAST(N'2023-04-01T08:00:00.000' AS DateTime), CAST(N'2023-04-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'PGG202305', N'Phiếu giảm giá tháng 5/2023', 180, 1, CAST(1000000 AS Decimal(18, 0)), CAST(25000 AS Decimal(18, 0)), CAST(180000 AS Decimal(18, 0)), CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(N'2023-05-31T23:59:59.000' AS DateTime), CAST(N'2023-05-01T08:00:00.000' AS DateTime), CAST(N'2023-05-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'PGG202306', N'Phiếu giảm giá tháng 6/2023', 160, 0, CAST(1100000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-06-30T23:59:59.000' AS DateTime), CAST(N'2023-06-01T08:00:00.000' AS DateTime), CAST(N'2023-06-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'PGG202307', N'Phiếu giảm giá tháng 7/2023', 140, 1, CAST(900000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(130000 AS Decimal(18, 0)), CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(N'2023-07-31T23:59:59.000' AS DateTime), CAST(N'2023-07-01T08:00:00.000' AS DateTime), CAST(N'2023-07-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'PGG202308', N'Phiếu giảm giá tháng 8/2023', 130, 0, CAST(700000 AS Decimal(18, 0)), CAST(18000 AS Decimal(18, 0)), CAST(120000 AS Decimal(18, 0)), CAST(N'2023-08-01T00:00:00.000' AS DateTime), CAST(N'2023-08-31T23:59:59.000' AS DateTime), CAST(N'2023-08-01T08:00:00.000' AS DateTime), CAST(N'2023-08-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'PGG202309', N'Phiếu giảm giá tháng 9/2023', 170, 1, CAST(1400000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2023-09-01T00:00:00.000' AS DateTime), CAST(N'2023-09-30T23:59:59.000' AS DateTime), CAST(N'2023-09-01T08:00:00.000' AS DateTime), CAST(N'2023-09-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'PGG202310', N'Phiếu giảm giá tháng 10/2023', 190, 0, CAST(1600000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), CAST(N'2023-10-01T00:00:00.000' AS DateTime), CAST(N'2023-10-31T23:59:59.000' AS DateTime), CAST(N'2023-10-01T08:00:00.000' AS DateTime), CAST(N'2023-10-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'PGG202311', N'Phiếu giảm giá tháng 11/2023', 110, 1, CAST(950000 AS Decimal(18, 0)), CAST(23000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2023-11-30T23:59:59.000' AS DateTime), CAST(N'2023-11-01T08:00:00.000' AS DateTime), CAST(N'2023-11-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'PGG202312', N'Phiếu giảm giá tháng 12/2023', 125, 0, CAST(1000000 AS Decimal(18, 0)), CAST(25000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2023-12-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T23:59:59.000' AS DateTime), CAST(N'2023-12-01T08:00:00.000' AS DateTime), CAST(N'2023-12-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'PGG202213', N'Phiếu giảm giá tháng 1/2022', 105, 1, CAST(800000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(120000 AS Decimal(18, 0)), CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-01-31T23:59:59.000' AS DateTime), CAST(N'2022-01-01T08:00:00.000' AS DateTime), CAST(N'2022-01-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'PGG202214', N'Phiếu giảm giá tháng 2/2022', 135, 0, CAST(900000 AS Decimal(18, 0)), CAST(25000 AS Decimal(18, 0)), CAST(180000 AS Decimal(18, 0)), CAST(N'2022-02-01T00:00:00.000' AS DateTime), CAST(N'2022-02-28T23:59:59.000' AS DateTime), CAST(N'2022-02-01T08:00:00.000' AS DateTime), CAST(N'2022-02-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'PGG202215', N'Phiếu giảm giá tháng 3/2022', 115, 1, CAST(700000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(N'2022-03-01T00:00:00.000' AS DateTime), CAST(N'2022-03-31T23:59:59.000' AS DateTime), CAST(N'2022-03-01T08:00:00.000' AS DateTime), CAST(N'2022-03-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'PGG202216', N'Phiếu giảm giá tháng 4/2022', 155, 0, CAST(1400000 AS Decimal(18, 0)), CAST(40000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-01T00:00:00.000' AS DateTime), CAST(N'2022-04-30T23:59:59.000' AS DateTime), CAST(N'2022-04-01T08:00:00.000' AS DateTime), CAST(N'2022-04-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, N'PGG202217', N'Phiếu giảm giá tháng 5/2022', 145, 1, CAST(900000 AS Decimal(18, 0)), CAST(22000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-31T23:59:59.000' AS DateTime), CAST(N'2022-05-01T08:00:00.000' AS DateTime), CAST(N'2022-05-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, N'PGG202218', N'Phiếu giảm giá tháng 6/2022', 175, 0, CAST(1600000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2022-06-01T00:00:00.000' AS DateTime), CAST(N'2022-06-30T23:59:59.000' AS DateTime), CAST(N'2022-06-01T08:00:00.000' AS DateTime), CAST(N'2022-06-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, N'PGG202219', N'Phiếu giảm giá tháng 7/2022', 165, 1, CAST(1000000 AS Decimal(18, 0)), CAST(25000 AS Decimal(18, 0)), CAST(180000 AS Decimal(18, 0)), CAST(N'2022-07-01T00:00:00.000' AS DateTime), CAST(N'2022-07-31T23:59:59.000' AS DateTime), CAST(N'2022-07-01T08:00:00.000' AS DateTime), CAST(N'2022-07-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, N'PGG202220', N'Phiếu giảm giá tháng 8/2022', 185, 0, CAST(1200000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-08-01T00:00:00.000' AS DateTime), CAST(N'2022-08-31T23:59:59.000' AS DateTime), CAST(N'2022-08-01T08:00:00.000' AS DateTime), CAST(N'2022-08-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, N'PGG202401', N'Phiếu giảm giá mới 1', 100, 1, CAST(500000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-31T23:59:59.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), N'1', N'1', 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, N'PGG202402', N'Phiếu giảm giá mới 2', 100, 1, CAST(1000000 AS Decimal(18, 0)), CAST(25000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)), CAST(N'2024-02-01T00:00:00.000' AS DateTime), CAST(N'2024-02-28T23:59:59.000' AS DateTime), CAST(N'2024-02-01T08:00:00.000' AS DateTime), CAST(N'2024-02-01T08:00:00.000' AS DateTime), N'1', N'1', 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, N'PGG202403', N'Phiếu giảm giá mới 3', 100, 1, CAST(1500000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)), CAST(40000 AS Decimal(18, 0)), CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-31T23:59:59.000' AS DateTime), CAST(N'2024-03-01T08:00:00.000' AS DateTime), CAST(N'2024-03-01T08:00:00.000' AS DateTime), N'1', N'1', 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, N'PGG202404', N'Phiếu giảm giá mới 4', 100, 1, CAST(2000000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(N'2024-04-01T00:00:00.000' AS DateTime), CAST(N'2024-04-30T23:59:59.000' AS DateTime), CAST(N'2024-04-01T08:00:00.000' AS DateTime), CAST(N'2024-04-01T08:00:00.000' AS DateTime), N'1', N'1', 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, N'PGG202405', N'Phiếu giảm giá mới 5', 100, 1, CAST(2500000 AS Decimal(18, 0)), CAST(40000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), CAST(N'2024-05-01T00:00:00.000' AS DateTime), CAST(N'2024-05-31T23:59:59.000' AS DateTime), CAST(N'2024-05-01T08:00:00.000' AS DateTime), CAST(N'2024-05-01T08:00:00.000' AS DateTime), N'1', N'1', 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (26, N'PGG202406', N'Phiếu giảm giá mới 6', 100, 1, CAST(3000000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-06-30T23:59:59.000' AS DateTime), CAST(N'2024-06-01T08:00:00.000' AS DateTime), CAST(N'2024-06-01T08:00:00.000' AS DateTime), N'1', N'1', 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (27, N'PGG202407', N'Phiếu giảm giá mới 7', 100, 1, CAST(3500000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), CAST(N'2024-07-01T00:00:00.000' AS DateTime), CAST(N'2024-07-31T23:59:59.000' AS DateTime), CAST(N'2024-07-01T08:00:00.000' AS DateTime), CAST(N'2024-07-01T08:00:00.000' AS DateTime), N'1', N'1', 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (28, N'PGG202408', N'Phiếu giảm giá mới 8', 100, 1, CAST(4000000 AS Decimal(18, 0)), CAST(55000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-08-31T23:59:59.000' AS DateTime), CAST(N'2024-08-01T08:00:00.000' AS DateTime), CAST(N'2024-08-01T08:00:00.000' AS DateTime), N'1', N'1', 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (29, N'PGG202409', N'Phiếu giảm giá mới 9', 100, 1, CAST(4500000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-09-30T23:59:59.000' AS DateTime), CAST(N'2024-09-01T08:00:00.000' AS DateTime), CAST(N'2024-09-01T08:00:00.000' AS DateTime), N'1', N'1', 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (30, N'PGG202410', N'Phiếu giảm giá mới 10', 100, 1, CAST(5000000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-10-31T23:59:59.000' AS DateTime), CAST(N'2024-10-01T08:00:00.000' AS DateTime), CAST(N'2024-10-01T08:00:00.000' AS DateTime), N'1', N'1', 0)
GO
SET IDENTITY_INSERT [dbo].[phieu_giam_gia] OFF
GO
SET IDENTITY_INSERT [dbo].[san_pham] ON 
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (33, N'Nike Air Force 1', 1, NULL, NULL, CAST(N'2024-09-16T20:41:41.893' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (34, N'Nike Zoom Vomero', 1, NULL, NULL, CAST(N'2024-09-16T20:57:15.760' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (35, N'Nike Blazer', 1, NULL, NULL, CAST(N'2024-09-16T21:08:38.277' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (36, N'Jordan 1 Retro High', 32, NULL, NULL, CAST(N'2024-09-16T21:12:38.017' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (37, N'Nike P-6000', 1, NULL, NULL, CAST(N'2024-09-16T21:27:30.393' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (40, N'Bitis Hunter X MARVEL', 33, NULL, NULL, CAST(N'2024-09-16T21:41:26.337' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (41, N'Puma Suede', 3, NULL, NULL, CAST(N'2024-09-16T21:47:32.507' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (42, N'Yeezy 700', 2, NULL, NULL, CAST(N'2024-09-16T21:55:52.143' AS DateTime), NULL, N'admin', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[san_pham] OFF
GO
SET IDENTITY_INSERT [dbo].[san_pham_chi_tiet] ON 
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (1, N'SPCT239264', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494522/i7znwoa486zcsfb0r50m.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 9, 1, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (2, N'SPCT420865', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494522/i7znwoa486zcsfb0r50m.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 11, 1, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (3, N'SPCT706131', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494522/i7znwoa486zcsfb0r50m.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 13, 1, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (4, N'SPCT570590', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494522/i7znwoa486zcsfb0r50m.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 15, 1, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (5, N'SPCT382414', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494522/i7znwoa486zcsfb0r50m.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 17, 1, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (6, N'SPCT817088', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494532/ogpgshuwwqykzrvvm4sh.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 9, 11, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (7, N'SPCT135101', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494532/ogpgshuwwqykzrvvm4sh.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 11, 11, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (8, N'SPCT704204', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494532/ogpgshuwwqykzrvvm4sh.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 13, 11, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (9, N'SPCT662172', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494532/ogpgshuwwqykzrvvm4sh.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 15, 11, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (10, N'SPCT160048', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494532/ogpgshuwwqykzrvvm4sh.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 17, 11, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (11, N'SPCT569851', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494555/hthkff7ib9tdmr8gz8gh.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 9, 12, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (12, N'SPCT778806', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494555/hthkff7ib9tdmr8gz8gh.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 11, 12, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (13, N'SPCT842427', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494555/hthkff7ib9tdmr8gz8gh.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 13, 12, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (14, N'SPCT405361', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494555/hthkff7ib9tdmr8gz8gh.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 15, 12, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (15, N'SPCT806316', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494555/hthkff7ib9tdmr8gz8gh.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 17, 12, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (16, N'SPCT855748', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494560/rljaalbn4kbniujvuqzf.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 9, 15, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (17, N'SPCT364377', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494560/rljaalbn4kbniujvuqzf.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 11, 15, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (18, N'SPCT677990', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494560/rljaalbn4kbniujvuqzf.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 13, 15, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (19, N'SPCT419284', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494560/rljaalbn4kbniujvuqzf.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 15, 15, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (20, N'SPCT861234', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494560/rljaalbn4kbniujvuqzf.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 17, 15, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (21, N'SPCT817947', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494566/ggf7a7ne5m1gq8thkpkm.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 9, 27, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (22, N'SPCT242190', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494566/ggf7a7ne5m1gq8thkpkm.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 11, 27, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (23, N'SPCT949435', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494566/ggf7a7ne5m1gq8thkpkm.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 13, 27, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (24, N'SPCT469161', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494566/ggf7a7ne5m1gq8thkpkm.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 15, 27, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (25, N'SPCT353235', N'Nike Air Force 1', 30, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726494566/ggf7a7ne5m1gq8thkpkm.webp', CAST(2000000 AS Decimal(18, 0)), N'Nike Air Force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-16T20:49:14.347' AS DateTime), NULL, 17, 27, 20, 20, 33, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (26, N'SPCT142909', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495336/x7rddogboockybregt5b.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero ', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:02:07.930' AS DateTime), NULL, 9, 10, 3, 1, 34, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (27, N'SPCT752402', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495336/x7rddogboockybregt5b.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero ', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:02:07.930' AS DateTime), NULL, 11, 10, 3, 1, 34, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (28, N'SPCT217451', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495336/x7rddogboockybregt5b.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero ', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:02:07.930' AS DateTime), NULL, 13, 10, 3, 1, 34, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (29, N'SPCT982577', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495336/x7rddogboockybregt5b.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero ', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:02:07.930' AS DateTime), NULL, 15, 10, 3, 1, 34, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (30, N'SPCT480943', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495336/x7rddogboockybregt5b.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero ', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:02:07.930' AS DateTime), NULL, 17, 10, 3, 1, 34, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (31, N'SPCT149929', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495340/jobbhb3ypm3nurb01ehq.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero ', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:02:07.930' AS DateTime), NULL, 9, 12, 3, 1, 34, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (32, N'SPCT449416', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495340/jobbhb3ypm3nurb01ehq.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero ', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:02:07.930' AS DateTime), NULL, 11, 12, 3, 1, 34, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (33, N'SPCT672550', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495340/jobbhb3ypm3nurb01ehq.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero ', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:02:07.930' AS DateTime), NULL, 13, 12, 3, 1, 34, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (34, N'SPCT830924', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495340/jobbhb3ypm3nurb01ehq.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero ', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:02:07.930' AS DateTime), NULL, 15, 12, 3, 1, 34, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (35, N'SPCT722049', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495340/jobbhb3ypm3nurb01ehq.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero ', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:02:07.930' AS DateTime), NULL, 17, 12, 3, 1, 34, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (36, N'SPCT189584', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495786/tqznysorxivyplk7rp5u.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 11, 1, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (37, N'SPCT505318', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495786/tqznysorxivyplk7rp5u.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 13, 1, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (38, N'SPCT228800', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495786/tqznysorxivyplk7rp5u.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 15, 1, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (39, N'SPCT417309', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495786/tqznysorxivyplk7rp5u.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 18, 1, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (40, N'SPCT718550', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495786/tqznysorxivyplk7rp5u.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 19, 1, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (41, N'SPCT448774', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495807/i1drg1y72f4wlwnvigar.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 11, 5, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (42, N'SPCT959862', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495807/i1drg1y72f4wlwnvigar.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 13, 5, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (43, N'SPCT745108', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495807/i1drg1y72f4wlwnvigar.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 15, 5, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (44, N'SPCT611154', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495807/i1drg1y72f4wlwnvigar.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 18, 5, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (45, N'SPCT993435', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495807/i1drg1y72f4wlwnvigar.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 19, 5, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (46, N'SPCT193187', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495811/f3cp0e6etkukukoup1jw.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 11, 8, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (47, N'SPCT140494', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495811/f3cp0e6etkukukoup1jw.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 13, 8, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (48, N'SPCT641676', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495811/f3cp0e6etkukukoup1jw.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 15, 8, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (49, N'SPCT898998', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495811/f3cp0e6etkukukoup1jw.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 18, 8, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (50, N'SPCT157875', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495811/f3cp0e6etkukukoup1jw.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 19, 8, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (51, N'SPCT310770', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495816/wwkimgixjfnk8da42lna.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 11, 11, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (52, N'SPCT379502', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495816/wwkimgixjfnk8da42lna.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 13, 11, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (53, N'SPCT125893', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495816/wwkimgixjfnk8da42lna.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 15, 11, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (54, N'SPCT602645', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495816/wwkimgixjfnk8da42lna.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 18, 11, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (55, N'SPCT779159', N'Nike Blazer', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726495816/wwkimgixjfnk8da42lna.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blazer', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:10:04.127' AS DateTime), NULL, 19, 11, 17, 3, 35, 2, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (58, N'SPCT617365', N'Jordan 1 Retro High', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726496681/xw2xagrrosteyfaoes5d.jpg', CAST(1000000 AS Decimal(18, 0)), N'Jordan 1 Retro High', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:24:26.510' AS DateTime), NULL, 15, 11, 3, 9, 36, 2, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (59, N'SPCT473707', N'Jordan 1 Retro High', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726496681/xw2xagrrosteyfaoes5d.jpg', CAST(1000000 AS Decimal(18, 0)), N'Jordan 1 Retro High', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:24:26.510' AS DateTime), NULL, 16, 11, 3, 9, 36, 2, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (60, N'SPCT109556', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497015/qsgutqtwpfqnlp1qsgi3.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 7, 10, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (61, N'SPCT487968', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497015/qsgutqtwpfqnlp1qsgi3.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 9, 10, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (62, N'SPCT239513', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497015/qsgutqtwpfqnlp1qsgi3.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 11, 10, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (63, N'SPCT859296', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497015/qsgutqtwpfqnlp1qsgi3.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 13, 10, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (64, N'SPCT892434', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497015/qsgutqtwpfqnlp1qsgi3.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 15, 10, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (65, N'SPCT402793', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497015/qsgutqtwpfqnlp1qsgi3.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 17, 10, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (66, N'SPCT910577', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497018/fsocnzhkgx2dx4ffjxui.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 7, 23, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (67, N'SPCT614024', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497018/fsocnzhkgx2dx4ffjxui.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 9, 23, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (68, N'SPCT784523', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497018/fsocnzhkgx2dx4ffjxui.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 11, 23, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (69, N'SPCT606856', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497018/fsocnzhkgx2dx4ffjxui.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 13, 23, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (70, N'SPCT338826', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497018/fsocnzhkgx2dx4ffjxui.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 15, 23, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (71, N'SPCT684505', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497018/fsocnzhkgx2dx4ffjxui.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 17, 23, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (72, N'SPCT205094', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497021/oauwdioqh0jkq0mnht4b.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 7, 24, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (73, N'SPCT715082', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497021/oauwdioqh0jkq0mnht4b.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 9, 24, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (74, N'SPCT700203', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497021/oauwdioqh0jkq0mnht4b.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 11, 24, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (75, N'SPCT241358', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497021/oauwdioqh0jkq0mnht4b.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 13, 24, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (76, N'SPCT127740', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497021/oauwdioqh0jkq0mnht4b.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 15, 24, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (77, N'SPCT319149', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497021/oauwdioqh0jkq0mnht4b.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-6000', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:30:09.173' AS DateTime), NULL, 17, 24, 8, 10, 37, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (78, N'SPCT733601', N'Bitis Hunter X MARVEL', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497761/liflsukrcakudlnklwlb.webp', CAST(1000000 AS Decimal(18, 0)), N'MARVEL Spiderman', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:42:28.037' AS DateTime), NULL, 13, 12, 3, 8, 40, 3, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (79, N'SPCT492934', N'Bitis Hunter X MARVEL', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497761/liflsukrcakudlnklwlb.webp', CAST(1000000 AS Decimal(18, 0)), N'MARVEL Spiderman', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:42:28.037' AS DateTime), NULL, 15, 12, 3, 8, 40, 3, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (80, N'SPCT147502', N'Bitis Hunter X MARVEL', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726497761/liflsukrcakudlnklwlb.webp', CAST(1000000 AS Decimal(18, 0)), N'MARVEL Spiderman', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:42:28.037' AS DateTime), NULL, 17, 12, 3, 8, 40, 3, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (81, N'SPCT303868', N'Puma Suede', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498148/o3wri0kwshqjupzewiav.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:48:59.637' AS DateTime), NULL, 12, 1, 23, 8, 41, 1, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (82, N'SPCT207454', N'Puma Suede', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498148/o3wri0kwshqjupzewiav.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:48:59.637' AS DateTime), NULL, 13, 1, 23, 8, 41, 1, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (83, N'SPCT506556', N'Puma Suede', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498148/o3wri0kwshqjupzewiav.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:48:59.637' AS DateTime), NULL, 15, 1, 23, 8, 41, 1, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (84, N'SPCT383947', N'Puma Suede', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498148/o3wri0kwshqjupzewiav.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:48:59.637' AS DateTime), NULL, 17, 1, 23, 8, 41, 1, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (85, N'SPCT981908', N'Puma Suede', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498148/o3wri0kwshqjupzewiav.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:48:59.637' AS DateTime), NULL, 19, 1, 23, 8, 41, 1, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (86, N'SPCT972755', N'Puma Suede', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498152/jgci4sgojlpdimgj96xr.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:48:59.637' AS DateTime), NULL, 12, 27, 23, 8, 41, 1, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (87, N'SPCT908796', N'Puma Suede', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498152/jgci4sgojlpdimgj96xr.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:48:59.637' AS DateTime), NULL, 13, 27, 23, 8, 41, 1, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (88, N'SPCT716811', N'Puma Suede', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498152/jgci4sgojlpdimgj96xr.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:48:59.637' AS DateTime), NULL, 15, 27, 23, 8, 41, 1, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (89, N'SPCT932082', N'Puma Suede', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498152/jgci4sgojlpdimgj96xr.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:48:59.637' AS DateTime), NULL, 17, 27, 23, 8, 41, 1, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (90, N'SPCT145628', N'Puma Suede', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498152/jgci4sgojlpdimgj96xr.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:48:59.637' AS DateTime), NULL, 19, 27, 23, 8, 41, 1, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (91, N'SPCT259522', N'Yeezy 700', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498697/peourwf7ezjommogrema.jpg', CAST(1420000 AS Decimal(18, 0)), N'', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:58:10.497' AS DateTime), NULL, 11, 11, 1, 10, 42, 1, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (92, N'SPCT735237', N'Yeezy 700', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498697/peourwf7ezjommogrema.jpg', CAST(1420000 AS Decimal(18, 0)), N'', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:58:10.497' AS DateTime), NULL, 13, 11, 1, 10, 42, 1, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (93, N'SPCT711707', N'Yeezy 700', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498697/peourwf7ezjommogrema.jpg', CAST(1420000 AS Decimal(18, 0)), N'', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:58:10.497' AS DateTime), NULL, 15, 11, 1, 10, 42, 1, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (94, N'SPCT735148', N'Yeezy 700', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498697/peourwf7ezjommogrema.jpg', CAST(1420000 AS Decimal(18, 0)), N'', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:58:10.497' AS DateTime), NULL, 17, 11, 1, 10, 42, 1, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (95, N'SPCT264424', N'Yeezy 700', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498697/peourwf7ezjommogrema.jpg', CAST(1420000 AS Decimal(18, 0)), N'', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:58:10.497' AS DateTime), NULL, 19, 11, 1, 10, 42, 1, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (96, N'SPCT215345', N'Yeezy 700', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498703/gbxlo89kjcpngr9gjlg4.png', CAST(1420000 AS Decimal(18, 0)), N'', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:58:10.497' AS DateTime), NULL, 11, 31, 1, 10, 42, 1, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (97, N'SPCT129176', N'Yeezy 700', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498703/gbxlo89kjcpngr9gjlg4.png', CAST(1420000 AS Decimal(18, 0)), N'', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:58:10.497' AS DateTime), NULL, 13, 31, 1, 10, 42, 1, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (98, N'SPCT121373', N'Yeezy 700', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498703/gbxlo89kjcpngr9gjlg4.png', CAST(1420000 AS Decimal(18, 0)), N'', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:58:10.497' AS DateTime), NULL, 15, 31, 1, 10, 42, 1, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (99, N'SPCT663314', N'Yeezy 700', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498703/gbxlo89kjcpngr9gjlg4.png', CAST(1420000 AS Decimal(18, 0)), N'', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:58:10.497' AS DateTime), NULL, 17, 31, 1, 10, 42, 1, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (100, N'SPCT682570', N'Yeezy 700', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726498703/gbxlo89kjcpngr9gjlg4.png', CAST(1420000 AS Decimal(18, 0)), N'', 500, NULL, N'admin', N'', CAST(N'2024-09-16T21:58:10.497' AS DateTime), NULL, 19, 31, 1, 10, 42, 1, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[san_pham_chi_tiet] OFF
GO
SET IDENTITY_INSERT [dbo].[thuong_hieu] ON 
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Nike', CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Adidas', CAST(N'2024-01-02T08:00:00.000' AS DateTime), CAST(N'2024-01-02T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Puma', CAST(N'2024-01-03T08:00:00.000' AS DateTime), CAST(N'2024-01-03T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'New Balance', CAST(N'2024-01-04T08:00:00.000' AS DateTime), CAST(N'2024-01-04T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Vans', CAST(N'2024-01-05T08:00:00.000' AS DateTime), CAST(N'2024-01-05T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'Converse', CAST(N'2024-01-06T08:00:00.000' AS DateTime), CAST(N'2024-01-06T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'Ralph Lauren', CAST(N'2024-02-06T08:00:00.000' AS DateTime), CAST(N'2024-02-06T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Marc Jacobs', CAST(N'2024-02-07T08:00:00.000' AS DateTime), CAST(N'2024-02-07T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'Kate Spade', CAST(N'2024-02-08T08:00:00.000' AS DateTime), CAST(N'2024-02-08T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'Burberry', CAST(N'2024-02-09T08:00:00.000' AS DateTime), CAST(N'2024-02-09T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'Coach', CAST(N'2024-02-10T08:00:00.000' AS DateTime), CAST(N'2024-02-10T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'Fossil', CAST(N'2024-02-11T08:00:00.000' AS DateTime), CAST(N'2024-02-11T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'Swarovski', CAST(N'2024-02-12T08:00:00.000' AS DateTime), CAST(N'2024-02-12T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'Guess', CAST(N'2024-02-13T08:00:00.000' AS DateTime), CAST(N'2024-02-13T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'Chloé', CAST(N'2024-02-14T08:00:00.000' AS DateTime), CAST(N'2024-02-14T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'Hugo Boss', CAST(N'2024-02-15T08:00:00.000' AS DateTime), CAST(N'2024-02-15T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, N'Givenchy', CAST(N'2024-02-16T08:00:00.000' AS DateTime), CAST(N'2024-02-16T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, N'Kenzo', CAST(N'2024-02-17T08:00:00.000' AS DateTime), CAST(N'2024-02-17T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, N'Balmain', CAST(N'2024-02-18T08:00:00.000' AS DateTime), CAST(N'2024-02-18T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, N'Alexander Wang', CAST(N'2024-02-19T08:00:00.000' AS DateTime), CAST(N'2024-02-19T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, N'Missoni', CAST(N'2024-02-20T08:00:00.000' AS DateTime), CAST(N'2024-02-20T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, N'Balenciaga', CAST(N'2024-02-21T08:00:00.000' AS DateTime), CAST(N'2024-02-21T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, N'Giorgio Armani', CAST(N'2024-02-22T08:00:00.000' AS DateTime), CAST(N'2024-02-22T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, N'Prada', CAST(N'2024-02-23T08:00:00.000' AS DateTime), CAST(N'2024-02-23T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, N'Gucci', CAST(N'2024-02-24T08:00:00.000' AS DateTime), CAST(N'2024-02-24T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (26, N'Louis Vuitton', CAST(N'2024-02-25T08:00:00.000' AS DateTime), CAST(N'2024-02-25T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (27, N'Versace', CAST(N'2024-02-26T08:00:00.000' AS DateTime), CAST(N'2024-02-26T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (28, N'Chanel', CAST(N'2024-02-27T08:00:00.000' AS DateTime), CAST(N'2024-02-27T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (29, N'Hermès', CAST(N'2024-02-28T08:00:00.000' AS DateTime), CAST(N'2024-02-28T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (30, N'Fendi', CAST(N'2024-02-29T08:00:00.000' AS DateTime), CAST(N'2024-02-29T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (31, N'Burberry', CAST(N'2024-03-01T08:00:00.000' AS DateTime), CAST(N'2024-03-01T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (32, N'Dior', CAST(N'2024-03-01T08:00:00.000' AS DateTime), CAST(N'2024-03-01T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (33, N'Bitis Hunter', CAST(N'2024-03-01T08:00:00.000' AS DateTime), CAST(N'2024-03-01T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
SET IDENTITY_INSERT [dbo].[thuong_hieu] OFF
GO
USE [master]
GO
ALTER DATABASE [DATN_PTPM_SD22_FINAL] SET  READ_WRITE 
GO
