/****** Object:  Database [DATN_PTPM_SD22_FINAL]    Script Date: 9/19/2024 1:08:33 AM ******/
CREATE DATABASE [DATN_PTPM_SD22_FINAL]
GO
USE [DATN_PTPM_SD22_FINAL]
GO
/****** Object:  Table [dbo].[chat_lieu]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[co_giay]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[de_giay]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[dia_chi]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[gio_hang]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[gio_hang_chi_tiet]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[hoa_don]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[hoa_don_chi_tiet]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[khach_hang]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[kich_co]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[lich_su_hoa_don]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[mau_sac]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[nha_san_xuat]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[nhan_vien]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[phieu_giam_gia]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[phuong_thuc_thanh_toan]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[san_pham]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[san_pham_chi_tiet]    Script Date: 9/19/2024 1:08:33 AM ******/
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
/****** Object:  Table [dbo].[thuong_hieu]    Script Date: 9/19/2024 1:08:33 AM ******/
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
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Da bò', CAST(N'2024-09-18T20:37:24.617' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Da tổng hợp', CAST(N'2024-09-18T20:38:11.400' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Vải canvas', CAST(N'2024-09-18T20:38:19.763' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'Vải dệt kim', CAST(N'2024-09-18T20:38:26.420' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Vải lưới', CAST(N'2024-09-18T20:38:33.303' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'Nylon', CAST(N'2024-09-18T20:38:41.603' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'Polyester', CAST(N'2024-09-18T20:38:48.830' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Gore-Tex', CAST(N'2024-09-18T20:38:56.273' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'Cao su', CAST(N'2024-09-18T20:39:02.790' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'EVA', CAST(N'2024-09-18T20:39:07.850' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'Phylon', CAST(N'2024-09-18T20:39:16.537' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'PU', CAST(N'2024-09-18T20:39:22.380' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'Neoprene', CAST(N'2024-09-18T20:39:28.377' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'Len', CAST(N'2024-09-18T20:39:36.933' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[chat_lieu] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'Sợi dừa', CAST(N'2024-09-18T20:39:43.180' AS DateTime), NULL, N'admin', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[chat_lieu] OFF
GO
SET IDENTITY_INSERT [dbo].[co_giay] ON 
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Cổ thấp', CAST(N'2024-09-18T20:46:36.247' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Cổ trung', CAST(N'2024-09-18T20:46:45.560' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Cổ cao', CAST(N'2024-09-18T20:46:52.157' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'Cổ lửng', CAST(N'2024-09-18T20:46:59.073' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Cổ giày bốt', CAST(N'2024-09-18T20:47:06.357' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'Cổ chữ V', CAST(N'2024-09-18T20:47:13.023' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Cổ gập', CAST(N'2024-09-18T20:47:31.317' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'Cổ len', CAST(N'2024-09-18T20:48:19.903' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'Cổ đệm', CAST(N'2024-09-18T20:48:26.103' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'Cổ chun', CAST(N'2024-09-18T20:48:32.640' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'Cổ da lộn', CAST(N'2024-09-18T20:48:41.207' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[co_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'Cổ quấn', CAST(N'2024-09-18T20:48:47.377' AS DateTime), NULL, N'admin', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[co_giay] OFF
GO
SET IDENTITY_INSERT [dbo].[de_giay] ON 
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Đế cao su', CAST(N'2024-09-18T20:49:07.563' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Đế EVA', CAST(N'2024-09-18T20:49:14.303' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Đế Phylon', CAST(N'2024-09-18T20:49:20.000' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'Đế PU', CAST(N'2024-09-18T20:49:24.460' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Đế Vibram', CAST(N'2024-09-18T20:49:30.743' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'Đế TPR', CAST(N'2024-09-18T20:49:36.427' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'Đế Crepe', CAST(N'2024-09-18T20:49:42.453' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Đế Cork', CAST(N'2024-09-18T20:49:50.803' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'Đế Goodyear Welt', CAST(N'2024-09-18T20:49:58.427' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'Đế Lug', CAST(N'2024-09-18T20:50:04.427' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'Đế TPU', CAST(N'2024-09-18T20:50:11.453' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[de_giay] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'Đế Platform', CAST(N'2024-09-18T20:50:17.057' AS DateTime), NULL, N'admin', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[de_giay] OFF
GO
SET IDENTITY_INSERT [dbo].[dia_chi] ON 
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (4, 3, N'Thành phố Hà Nội', N'Quận Ba Đình', N'Phường Kim Mã', N'Số 21', N'Số 21, Phường Kim Mã, Quận Ba Đình, Thành phố Hà Nội', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (5, 3, N'Thành phố Hà Nội', N'Quận Hoàng Mai', N'Phường Đại Kim', N'Số 22', N'Số 22, Phường Đại Kim, Quận Hoàng Mai, Thành phố Hà Nội', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (6, 3, N'Thành phố Hà Nội', N'Quận Long Biên', N'Phường Ngọc Thụy', N'Số 23', N'Số 23, Phường Ngọc Thụy, Quận Long Biên, Thành phố Hà Nội', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (7, 4, N'Thành phố Hà Nội', N'Quận Thanh Xuân', N'Phường Nhân Chính', N'Số 31', N'Số 31, Phường Nhân Chính, Quận Thanh Xuân, Thành phố Hà Nội', N'Nguyễn Văn C', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (8, 4, N'Thành phố Hà Nội', N'Quận Tây Hồ', N'Phường Nhật Tân', N'Số 32', N'Số 32, Phường Nhật Tân, Quận Tây Hồ, Thành phố Hà Nội', N'Nguyễn Văn C', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (9, 4, N'Thành phố Hà Nội', N'Quận Hoài Đức', N'Phường Đại Mỗ', N'Số 33', N'Số 33, Phường Đại Mỗ, Quận Hoài Đức, Thành phố Hà Nội', N'Nguyễn Văn C', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (10, 5, N'Thành phố Hà Nội', N'Quận Hoàn Kiếm', N'Phường Phan Chu Trinh', N'Số 41', N'Số 41, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', N'Trần Thị D', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (11, 5, N'Thành phố Hà Nội', N'Quận Ba Đình', N'Phường Kim Mã', N'Số 42', N'Số 42, Phường Kim Mã, Quận Ba Đình, Thành phố Hà Nội', N'Trần Thị D', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (12, 5, N'Thành phố Hà Nội', N'Quận Hoàng Mai', N'Phường Đại Kim', N'Số 43', N'Số 43, Phường Đại Kim, Quận Hoàng Mai, Thành phố Hà Nội', N'Trần Thị D', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (13, 6, N'Thành phố Hà Nội', N'Quận Hoàn Kiếm', N'Phường Phan Chu Trinh', N'Số 51', N'Số 51, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', N'Nguyễn Văn An', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (14, 6, N'Thành phố Hà Nội', N'Quận Cầu Giấy', N'Phường Dịch Vọng', N'Số 52', N'Số 52, Phường Dịch Vọng, Quận Cầu Giấy, Thành phố Hà Nội', N'Nguyễn Văn An', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (15, 7, N'Thành phố Hà Nội', N'Quận Đống Đa', N'Phường Khâm Thiên', N'Số 53', N'Số 53, Phường Khâm Thiên, Quận Đống Đa, Thành phố Hà Nội', N'Nguyễn Văn An', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (16, 8, N'Thành phố Hà Nội', N'Quận Ba Đình', N'Phường Kim Mã', N'Số 61', N'Số 61, Phường Kim Mã, Quận Ba Đình, Thành phố Hà Nội', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (17, 9, N'Thành phố Hà Nội', N'Quận Hoàng Mai', N'Phường Đại Kim', N'Số 62', N'Số 62, Phường Đại Kim, Quận Hoàng Mai, Thành phố Hà Nội', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (18, 10, N'Thành phố Hà Nội', N'Quận Long Biên', N'Phường Ngọc Thụy', N'Số 63', N'Số 63, Phường Ngọc Thụy, Quận Long Biên, Thành phố Hà Nội', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (19, 2, N'Thành phố Hà Nội', N'Quận Hoàn Kiếm', N'Phường Phan Chu Trinh', N'Số 11', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', N'Nguyễn Bá Đăng', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (20, 2, N'Thành phố Hà Nội', N'Quận Cầu Giấy', N'Phường Dịch Vọng', N'Số 12', N'Số 12, Phường Dịch Vọng, Quận Cầu Giấy, Thành phố Hà Nội', N'Nguyễn Bá Đăng', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (21, 2, N'Thành phố Hà Nội', N'Quận Đống Đa', N'Phường Khâm Thiên', N'Số 13', N'Số 13, Phường Khâm Thiên, Quận Đống Đa, Thành phố Hà Nội', N'Nguyễn Bá Đăng', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[dia_chi] OFF
GO
SET IDENTITY_INSERT [dbo].[gio_hang] ON 
GO
INSERT [dbo].[gio_hang] ([id], [idTaiKhoan], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat]) VALUES (1, 2, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[gio_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[hoa_don] ON 
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (1, N'HD01', 2, CAST(N'2024-07-18T22:40:27.857' AS DateTime), NULL, N'admin', NULL, NULL, NULL, NULL, CAST(3000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (2, N'HD02', 2, CAST(N'2024-09-11T22:40:29.237' AS DateTime), NULL, N'admin', NULL, NULL, CAST(N'2024-09-15T22:40:30.683' AS DateTime), NULL, CAST(4000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(3860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, 6)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (3, N'HD03', 2, CAST(N'2024-09-12T22:40:29.687' AS DateTime), NULL, N'admin', NULL, NULL, CAST(N'2024-09-13T22:40:29.877' AS DateTime), NULL, CAST(4000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(3860000 AS Decimal(18, 0)), N'Lê Thị Bảo', N'0369852147', N'Số 21, Phường Kim Mã, Quận Ba Đình, Thành phố Hà Nội', NULL, 3, NULL, 3, 6)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (4, N'HD04', 2, CAST(N'2024-09-12T22:40:29.877' AS DateTime), NULL, N'admin', NULL, NULL, CAST(N'2024-09-13T22:40:29.877' AS DateTime), NULL, CAST(3000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, 6)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (5, N'HD05', 2, CAST(N'2024-09-13T22:40:30.037' AS DateTime), NULL, N'admin', NULL, NULL, NULL, NULL, CAST(2000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1880000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, NULL)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (6, N'HD06', 2, CAST(N'2024-09-14T22:40:30.200' AS DateTime), NULL, N'admin', NULL, NULL, NULL, NULL, CAST(2860000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, NULL)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (7, N'HD07', 2, CAST(N'2024-09-14T22:40:30.370' AS DateTime), NULL, N'admin', NULL, NULL, NULL, NULL, CAST(3000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, NULL)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (8, N'HD08', 2, CAST(N'2024-09-15T22:40:30.527' AS DateTime), NULL, N'admin', NULL, NULL, NULL, NULL, CAST(2000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1880000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, NULL)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (9, N'HD09', 2, CAST(N'2024-09-15T22:40:30.683' AS DateTime), NULL, N'admin', NULL, NULL, CAST(N'2024-09-15T22:40:30.683' AS DateTime), NULL, CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(880000 AS Decimal(18, 0)), N'Trần Thị Bình', N'0771234567', N'Số 41, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 1, NULL, 5, 2)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (10, N'HD010', 2, CAST(N'2024-09-15T22:40:30.837' AS DateTime), NULL, N'admin', NULL, NULL, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 1, NULL, 2, NULL)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (11, N'HD011', 1, CAST(N'2024-09-15T22:55:36.100' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2024-09-17T23:17:45.060' AS DateTime), NULL, CAST(1600000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1470000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 12, Phường Dịch Vọng, Quận Cầu Giấy, Thành phố Hà Nội', NULL, 2, NULL, 2, 4)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (12, N'HD012', 1, CAST(N'2024-09-16T22:56:33.617' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2024-09-17T23:17:45.060' AS DateTime), NULL, CAST(2600000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2460000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, 6)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (13, N'HD013', 1, CAST(N'2024-09-17T22:57:41.533' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2024-09-17T23:17:45.060' AS DateTime), NULL, CAST(3700000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(3560000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, 7)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (15, N'HD015', 1, CAST(N'2024-09-18T23:17:22.400' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2024-09-17T23:17:45.060' AS DateTime), NULL, CAST(1200000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1080000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 1, NULL, 2, 6)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (16, N'HD016', 1, CAST(N'2024-09-17T23:17:45.060' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2024-09-17T23:17:45.060' AS DateTime), NULL, CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(880000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 1, NULL, 2, 6)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (17, N'HD017', 1, CAST(N'2024-09-16T23:19:28.273' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2024-09-17T23:17:45.060' AS DateTime), NULL, CAST(6000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(5860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, 5)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (18, N'HD018', 2, CAST(N'2024-09-17T23:19:56.227' AS DateTime), NULL, N'admin', NULL, CAST(N'2024-09-18T23:45:15.300' AS DateTime), NULL, CAST(N'2024-09-22T23:45:15.300' AS DateTime), CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(880000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 1, NULL, 2, 3)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (19, N'HD019', 2, CAST(N'2024-09-17T23:21:08.333' AS DateTime), NULL, N'admin', NULL, NULL, NULL, NULL, CAST(4000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(3860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, NULL)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (20, N'HD020', 2, CAST(N'2024-09-15T23:22:16.843' AS DateTime), NULL, N'admin', NULL, NULL, CAST(N'2024-09-14T23:40:36.367' AS DateTime), NULL, CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, 6)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (21, N'HD021', 2, CAST(N'2024-09-13T23:22:18.140' AS DateTime), NULL, N'admin', NULL, NULL, NULL, NULL, CAST(1100000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(960000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (22, N'HD022', 2, CAST(N'2024-09-13T23:22:18.507' AS DateTime), NULL, N'admin', NULL, NULL, CAST(N'2024-09-14T23:40:36.367' AS DateTime), NULL, CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(880000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 1, NULL, 2, 4)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (23, N'HD023', 2, CAST(N'2024-09-13T23:22:18.710' AS DateTime), NULL, N'admin', NULL, NULL, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), N'Nguyễn Văn Cảnh', N'0912345678', N'Số 31, Phường Nhân Chính, Quận Thanh Xuân, Thành phố Hà Nội', NULL, 3, NULL, 4, NULL)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (25, N'HD025', 2, CAST(N'2024-09-14T23:39:18.923' AS DateTime), NULL, N'admin', NULL, NULL, CAST(N'2024-09-14T23:40:36.367' AS DateTime), NULL, CAST(2000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, 6)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (26, N'HD026', 2, CAST(N'2024-09-14T23:39:20.927' AS DateTime), NULL, N'admin', NULL, NULL, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 3, NULL, 2, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (27, N'HD027', 2, CAST(N'2024-09-14T23:40:36.367' AS DateTime), NULL, N'admin', NULL, NULL, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(860000 AS Decimal(18, 0)), N'Nguyễn Bá Đăng', N'0987654321', N'Số 11, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, 1, NULL, 2, 8)
GO
SET IDENTITY_INSERT [dbo].[hoa_don] OFF
GO
SET IDENTITY_INSERT [dbo].[hoa_don_chi_tiet] ON 
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (1, 1, CAST(1000000 AS Decimal(18, 0)), 67, 1, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (3, 1, CAST(1000000 AS Decimal(18, 0)), 69, 1, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (4, 1, CAST(1000000 AS Decimal(18, 0)), 13, 1, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (5, 1, CAST(1600000 AS Decimal(18, 0)), 22, 11, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (6, 1, CAST(1000000 AS Decimal(18, 0)), 44, 12, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (7, 1, CAST(1600000 AS Decimal(18, 0)), 22, 12, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (8, 1, CAST(1000000 AS Decimal(18, 0)), 44, 13, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (9, 1, CAST(1600000 AS Decimal(18, 0)), 22, 13, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (10, 1, CAST(1100000 AS Decimal(18, 0)), 88, 13, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (12, 3, CAST(1000000 AS Decimal(18, 0)), 101, 2, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (13, 1, CAST(1000000 AS Decimal(18, 0)), 97, 2, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (14, 1, CAST(1000000 AS Decimal(18, 0)), 3, 3, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (15, 3, CAST(1000000 AS Decimal(18, 0)), 7, 3, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (16, 3, CAST(1000000 AS Decimal(18, 0)), 93, 4, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (17, 1, CAST(1000000 AS Decimal(18, 0)), 92, 5, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (18, 1, CAST(1000000 AS Decimal(18, 0)), 77, 5, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (19, 1, CAST(1200000 AS Decimal(18, 0)), 19, 15, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (20, 1, CAST(1000000 AS Decimal(18, 0)), 28, 16, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (21, 3, CAST(2000000 AS Decimal(18, 0)), 37, 17, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (22, 2, CAST(1000000 AS Decimal(18, 0)), 35, 6, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (23, 1, CAST(1000000 AS Decimal(18, 0)), 55, 6, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (24, 3, CAST(1000000 AS Decimal(18, 0)), 97, 19, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (25, 1, CAST(1000000 AS Decimal(18, 0)), 99, 19, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (26, 3, CAST(1000000 AS Decimal(18, 0)), 104, 7, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (28, 2, CAST(1000000 AS Decimal(18, 0)), 104, 8, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (29, 1, CAST(1000000 AS Decimal(18, 0)), 104, 24, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (30, 1, CAST(1000000 AS Decimal(18, 0)), 104, 23, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (32, 1, CAST(1000000 AS Decimal(18, 0)), 92, 9, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (33, 1, CAST(1000000 AS Decimal(18, 0)), 104, 10, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (34, 1, CAST(1000000 AS Decimal(18, 0)), 104, 22, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (35, 1, CAST(1000000 AS Decimal(18, 0)), 92, 18, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (36, 1, CAST(1100000 AS Decimal(18, 0)), 87, 21, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (37, 1, CAST(1000000 AS Decimal(18, 0)), 76, 20, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (38, 1, CAST(1000000 AS Decimal(18, 0)), 97, 26, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (39, 1, CAST(1000000 AS Decimal(18, 0)), 93, 25, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (40, 1, CAST(1000000 AS Decimal(18, 0)), 92, 25, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (41, 1, CAST(1000000 AS Decimal(18, 0)), 103, 27, 1)
GO
SET IDENTITY_INSERT [dbo].[hoa_don_chi_tiet] OFF
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
SET IDENTITY_INSERT [dbo].[khach_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[kich_co] ON 
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'37', CAST(N'2024-09-18T20:53:56.753' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'38', CAST(N'2024-09-18T20:54:00.937' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'39', CAST(N'2024-09-18T20:54:03.333' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'40', CAST(N'2024-09-18T20:54:06.517' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'41', CAST(N'2024-09-18T20:54:09.267' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'42', CAST(N'2024-09-18T20:54:12.713' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'43', CAST(N'2024-09-18T20:54:15.003' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'44', CAST(N'2024-09-18T20:54:17.430' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[kich_co] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'45', CAST(N'2024-09-18T20:54:22.593' AS DateTime), NULL, N'admin', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[kich_co] OFF
GO
SET IDENTITY_INSERT [dbo].[lich_su_hoa_don] ON 
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (1, 11, N'Chờ xác nhận', N'Admin', NULL, CAST(N'2024-09-18T22:55:36.120' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (2, 12, N'Chờ xác nhận', N'Admin', NULL, CAST(N'2024-09-18T22:56:33.633' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (3, 13, N'Chờ xác nhận', N'Admin', NULL, CAST(N'2024-09-18T22:57:41.550' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (4, 11, N'xacnhannananan', N'Admin', NULL, CAST(N'2024-09-18T23:08:29.390' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (5, 11, N'xacnhananana', N'Admin', NULL, CAST(N'2024-09-18T23:08:35.347' AS DateTime), NULL, 3, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (6, 11, N'xacnhananana', N'Admin', NULL, CAST(N'2024-09-18T23:08:37.370' AS DateTime), NULL, 4, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (7, 12, N'xacNhannnnnnnn', N'Admin', NULL, CAST(N'2024-09-18T23:08:51.127' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (8, 12, N'xacnhananana', N'Admin', NULL, CAST(N'2024-09-18T23:08:55.357' AS DateTime), NULL, 3, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (9, 12, N'xacnhananana', N'Admin', NULL, CAST(N'2024-09-18T23:08:57.607' AS DateTime), NULL, 4, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (10, 12, N'xacnhananana', N'Admin', NULL, CAST(N'2024-09-18T23:08:59.300' AS DateTime), NULL, 5, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (11, 12, N'xacnhananana', N'Admin', NULL, CAST(N'2024-09-18T23:09:01.177' AS DateTime), NULL, 6, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (12, 1, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:09:39.757' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (13, 2, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:11:25.447' AS DateTime), NULL, 6, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (14, 3, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:12:49.197' AS DateTime), NULL, 6, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (15, 4, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:14:23.487' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (16, 4, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:14:43.813' AS DateTime), NULL, 6, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (17, 5, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:15:23.717' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (18, 15, N'Chờ xác nhận', N'Admin', NULL, CAST(N'2024-09-18T23:16:22.420' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (19, 15, N'xacnhananan', N'Admin', NULL, CAST(N'2024-09-18T23:17:07.817' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (20, 15, N'xacnhananan', N'Admin', NULL, CAST(N'2024-09-18T23:17:12.473' AS DateTime), NULL, 3, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (21, 15, N'xacnhananan', N'Admin', NULL, CAST(N'2024-09-18T23:17:14.307' AS DateTime), NULL, 4, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (22, 15, N'xacnhananan', N'Admin', NULL, CAST(N'2024-09-18T23:17:15.890' AS DateTime), NULL, 5, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (23, 15, N'xacnhananan', N'Admin', NULL, CAST(N'2024-09-18T23:17:18.140' AS DateTime), NULL, 6, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (24, 16, N'Chờ xác nhận', N'Admin', NULL, CAST(N'2024-09-18T23:17:45.073' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (25, 16, N'xacnhananan', N'Admin', NULL, CAST(N'2024-09-18T23:18:28.013' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (26, 16, N'xacnhananan', N'Admin', NULL, CAST(N'2024-09-18T23:18:32.070' AS DateTime), NULL, 3, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (27, 16, N'xacnhananan', N'Admin', NULL, CAST(N'2024-09-18T23:18:33.903' AS DateTime), NULL, 4, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (28, 16, N'xacnhananan', N'Admin', NULL, CAST(N'2024-09-18T23:18:35.627' AS DateTime), NULL, 5, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (29, 16, N'xacnhananan', N'Admin', NULL, CAST(N'2024-09-18T23:18:37.203' AS DateTime), NULL, 6, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (30, 17, N'Chờ xác nhận', N'Admin', NULL, CAST(N'2024-09-18T23:19:28.293' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (31, 6, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:20:29.717' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (32, 6, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:20:40.847' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (33, 19, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:21:40.467' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (34, 7, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:22:47.773' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (35, 23, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:29:35.780' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (36, 10, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:31:37.320' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (37, 21, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:37:57.327' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (38, 20, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:38:41.010' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (39, 26, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:39:37.290' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (40, 25, N'Hoàn thành', N'Admin', NULL, CAST(N'2024-09-18T23:40:59.977' AS DateTime), NULL, 1, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (41, 25, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:44:08.713' AS DateTime), NULL, 3, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (42, 25, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:44:10.707' AS DateTime), NULL, 4, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (43, 25, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:44:12.013' AS DateTime), NULL, 5, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (44, 25, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:44:13.280' AS DateTime), NULL, 6, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (45, 20, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:44:32.677' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (46, 20, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:44:39.713' AS DateTime), NULL, 3, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (47, 20, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:44:41.247' AS DateTime), NULL, 4, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (48, 20, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:44:42.613' AS DateTime), NULL, 5, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (49, 20, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:44:44.437' AS DateTime), NULL, 6, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (50, 22, N'axacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:44:56.657' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (51, 22, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:45:01.393' AS DateTime), NULL, 3, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (52, 22, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:45:03.493' AS DateTime), NULL, 4, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (53, 18, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:45:11.723' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (54, 18, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:45:15.317' AS DateTime), NULL, 3, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (55, 17, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:45:23.070' AS DateTime), NULL, 2, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (56, 17, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:45:25.893' AS DateTime), NULL, 3, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (57, 17, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:45:27.660' AS DateTime), NULL, 4, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (58, 17, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:45:29.663' AS DateTime), NULL, 5, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (59, 13, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:45:37.100' AS DateTime), NULL, 7, NULL)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (60, 9, N'xacnhannnnn', N'Admin', NULL, CAST(N'2024-09-18T23:45:50.847' AS DateTime), NULL, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[lich_su_hoa_don] OFF
GO
SET IDENTITY_INSERT [dbo].[mau_sac] ON 
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'#000000', N'Đen', CAST(N'2024-09-18T20:55:34.807' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'#FFFFFF', N'Trắng', CAST(N'2024-09-18T20:55:44.893' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'#FF0000', N'Đỏ', CAST(N'2024-09-18T20:55:56.253' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'#008000', N'Xanh lá cây', CAST(N'2024-09-18T20:56:21.227' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'#0000FF', N'Xanh nước biển', CAST(N'2024-09-18T20:56:34.647' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'#FFFF00', N'Vàng', CAST(N'2024-09-18T20:56:45.650' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'#808080', N'Xám', CAST(N'2024-09-18T20:56:54.793' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'#FFA500', N'Cam', CAST(N'2024-09-18T20:57:02.040' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'#800080', N'Tím', CAST(N'2024-09-18T20:57:09.437' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'#A52A2A', N'Nâu', CAST(N'2024-09-18T20:57:18.760' AS DateTime), NULL, N'admin', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[mau_sac] OFF
GO
SET IDENTITY_INSERT [dbo].[nha_san_xuat] ON 
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Nike', CAST(N'2024-09-18T20:58:58.647' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Adidas', CAST(N'2024-09-18T20:59:04.900' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Puma', CAST(N'2024-09-18T20:59:09.830' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'Reebok', CAST(N'2024-09-18T20:59:15.440' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Converse', CAST(N'2024-09-18T20:59:20.847' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'New Balance', CAST(N'2024-09-18T20:59:27.637' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'Asics', CAST(N'2024-09-18T20:59:32.197' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Saucony', CAST(N'2024-09-18T20:59:38.593' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'Under Armour', CAST(N'2024-09-18T20:59:44.787' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'Vans', CAST(N'2024-09-18T20:59:50.260' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'Clarks', CAST(N'2024-09-18T20:59:54.903' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[nha_san_xuat] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'Dr. Martens', CAST(N'2024-09-18T21:00:02.463' AS DateTime), NULL, N'admin', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[nha_san_xuat] OFF
GO
SET IDENTITY_INSERT [dbo].[nhan_vien] ON 
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (1, N'NV01', N'Nguyễn Bá Đăng', N'0961057585', CAST(N'2003-01-06' AS Date), N'dang@gmail.com', 1, N'123123122131', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726672908/ymmdo9bahg6ev1fdw8gc.jpg', N'USaeBXbHr3', 0, 1, NULL, NULL, CAST(N'2024-09-18T22:22:31.643' AS DateTime), CAST(N'2024-09-18T22:22:31.643' AS DateTime), N'Ngõ 88,Phường Phúc Xá,Quận Ba Đình,Thành phố Hà Nội')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (2, N'NV02', N'Vũ Xuân Kiên', N'0912391231', CAST(N'2003-01-02' AS Date), N'kien@gmail.com', 1, N'123123122131', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726672993/dns61qeo57ee9eapeijv.jpg', N'fYExZ2LXIX', 1, 1, NULL, NULL, CAST(N'2024-09-18T22:23:54.803' AS DateTime), CAST(N'2024-09-18T22:23:54.803' AS DateTime), N'17A,Xã Vân Thủy,Huyện Chi Lăng,Tỉnh Lạng Sơn')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (3, N'NV03', N'Nguyễn Bá Tiến', N'0912391212', CAST(N'2000-09-22' AS Date), N'tien@gmail.com', 1, N'932020289', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726673083/kiz2xjgccjpbkynhskpq.jpg', N'LzJfJCH4Vg', 1, 1, NULL, NULL, CAST(N'2024-09-18T22:25:41.783' AS DateTime), CAST(N'2024-09-18T22:25:41.783' AS DateTime), N'Ngõ 98,Thị trấn Tằng Loỏng,Huyện Bảo Thắng,Tỉnh Lào Cai')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (4, N'NV04', N'Nguyễn Như Thắng', N'0912313222', CAST(N'1999-01-02' AS Date), N'thang@gmail.com', 1, N'12312312213', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726673217/b8a70kziodxc7wblprds.jpg', N'SW9xZh0Qkb', 1, 1, NULL, NULL, CAST(N'2024-09-18T22:27:28.337' AS DateTime), CAST(N'2024-09-18T22:27:28.337' AS DateTime), N'Ngõ 29,Xã Minh Quang,Huyện Chiêm Hóa,Tỉnh Tuyên Quang')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (5, N'NV05', N'Lê TiếnTuấn', N'0918290504', CAST(N'1998-01-01' AS Date), N'tuan@gmail.com', 1, N'192028404', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726673286/nyzwajhimuftcl8kn2pm.jpg', N'lfKos7Cd4P', 0, 1, NULL, NULL, CAST(N'2024-09-18T22:28:49.710' AS DateTime), CAST(N'2024-09-18T22:28:49.710' AS DateTime), N'17B,Xã Tiền An,Thị xã Quảng Yên,Tỉnh Quảng Ninh')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (6, N'NV06', N'Nguyễn Thị Uyên', N'0929292922', CAST(N'2003-11-15' AS Date), N'uyen@gmail.com', 0, N'829293222', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726673365/xf34rhhyyg7vharkbbie.jpg', N'l9kvQ6RB4S', 0, 1, NULL, NULL, CAST(N'2024-09-18T22:30:13.000' AS DateTime), CAST(N'2024-09-18T22:30:13.000' AS DateTime), N'Ngõ 14,Thị trấn Si Ma Cai,Huyện Si Ma Cai,Tỉnh Lào Cai')
GO
SET IDENTITY_INSERT [dbo].[nhan_vien] OFF
GO
SET IDENTITY_INSERT [dbo].[phieu_giam_gia] ON 
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'ET380ZN8', N'Phiếu giảm giá bảo vệ SD22_1', 83, 1, CAST(1000000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(120000 AS Decimal(18, 0)), CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(N'2024-09-25T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'5KYDOBFR', N'Phiếu giảm giá bảo vệ SD22_2', 92, 1, CAST(1500000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(130000 AS Decimal(18, 0)), CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(N'2024-09-25T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'IIQPLRG3', N'Phiếu giảm giá bảo vệ SD22_3', 29, 1, CAST(2000000 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(140000 AS Decimal(18, 0)), CAST(N'2024-09-03T00:00:00.000' AS DateTime), CAST(N'2024-09-21T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'ANEFM45Q', N'Phiếu giảm giá bảo vệ SD22_4', 75, 0, CAST(2000000 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), CAST(130000 AS Decimal(18, 0)), CAST(N'2024-09-02T00:00:00.000' AS DateTime), CAST(N'2024-09-04T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'MA01', N'Phiếu giảm giá 01', 100, 1, CAST(10000 AS Decimal(18, 0)), CAST(5000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), N'Admin', N'Admin', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'MA02', N'Phiếu giảm giá 02', 150, 1, CAST(20000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-08-02T00:00:00.000' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), N'Admin', N'Admin', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'MA03', N'Phiếu giảm giá 03', 200, 1, CAST(30000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-08-03T00:00:00.000' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), N'Admin', N'Admin', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'MA04', N'Phiếu giảm giá 04', 250, 1, CAST(40000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(400000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-08-04T00:00:00.000' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), N'Admin', N'Admin', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'MA05', N'Phiếu giảm giá 05', 300, 1, CAST(50000 AS Decimal(18, 0)), CAST(25000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-08-05T00:00:00.000' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), N'Admin', N'Admin', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'MA06', N'Phiếu giảm giá 06', 350, 1, CAST(60000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)), CAST(600000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-08-06T00:00:00.000' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), N'Admin', N'Admin', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'MA07', N'Phiếu giảm giá 07', 400, 1, CAST(70000 AS Decimal(18, 0)), CAST(35000 AS Decimal(18, 0)), CAST(700000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-08-07T00:00:00.000' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), N'Admin', N'Admin', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'MA08', N'Phiếu giảm giá 08', 450, 1, CAST(80000 AS Decimal(18, 0)), CAST(40000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-08-08T00:00:00.000' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), N'Admin', N'Admin', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'MA09', N'Phiếu giảm giá 09', 500, 1, CAST(90000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), CAST(900000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-08-09T00:00:00.000' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), N'Admin', N'Admin', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'MA10', N'Phiếu giảm giá 10', 550, 1, CAST(100000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), CAST(N'2024-09-18T22:19:32.793' AS DateTime), N'Admin', N'Admin', 1)
GO
SET IDENTITY_INSERT [dbo].[phieu_giam_gia] OFF
GO
SET IDENTITY_INSERT [dbo].[phuong_thuc_thanh_toan] ON 
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, 11, N'Tiền mặt', 1, CAST(1470000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T22:55:36.120' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, 12, N'Tiền mặt', 1, CAST(2460000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T22:56:33.633' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, 13, N'Chuyển Khoản', 1, CAST(3560000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T22:57:41.550' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, 1, N'Tiền mặt', 0, CAST(2860000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:09:39.697' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, 2, N'Tiền mặt', 1, CAST(3860000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:11:20.960' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, 3, N'Chuyển Khoản', 1, CAST(3860000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:12:13.817' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, 4, N'Tiền mặt', 0, CAST(2860000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:14:23.457' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, 5, N'Tiền mặt', 0, CAST(1860000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:15:23.683' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, 15, N'Chuyển Khoản', 1, CAST(1080000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:16:22.423' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, 16, N'Tiền mặt', 1, CAST(900000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:17:45.073' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, 17, N'Chuyển Khoản', 1, CAST(5860000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:19:28.293' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, 6, N'Tiền mặt', 0, CAST(2860000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:20:29.687' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, 6, N'Tiền mặt', 0, CAST(3000000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:20:40.800' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, 19, N'Tiền mặt', 0, CAST(3860000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:21:40.433' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, 7, N'Tiền mặt', 0, CAST(2860000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:22:47.743' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, 8, N'Tiền mặt', 0, CAST(1860000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:26:19.763' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, 23, N'Tiền mặt', 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:29:35.753' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, 22, N'Tiền mặt', 0, CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:30:37.933' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, 10, N'Tiền mặt', 0, CAST(900000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:31:37.293' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, 22, N'Tiền mặt', 0, CAST(900000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:34:54.727' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, 18, N'Tiền mặt', 1, CAST(900000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:36:46.307' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, 21, N'Tiền mặt', 0, CAST(990000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:37:57.327' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, 20, N'Tiền mặt', 1, CAST(900000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:38:41.010' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, 26, N'Tiền mặt', 0, CAST(900000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:39:37.290' AS DateTime), NULL, NULL, NULL, 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [tienDaThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, 25, N'Tiền mặt', 1, CAST(1860000 AS Decimal(18, 0)), NULL, CAST(N'2024-09-18T23:40:59.977' AS DateTime), NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[phuong_thuc_thanh_toan] OFF
GO
SET IDENTITY_INSERT [dbo].[san_pham] ON 
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Nike Air Force 1', 1, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Bitis Hunter X Mavel', 15, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Nike Blader', 1, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'Jordan Dior', 1, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Nike Cortez', 1, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'Nike Dunk', 1, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'Nike P-6000', 1, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Nike Pegasus', 1, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'Nike Zoom Vomero', 1, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'Puma Suede Classic', 3, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'Yeezy 700', 2, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'Puma Mercedes-AMG', 3, NULL, NULL, CAST(N'2024-07-18T21:05:06.897' AS DateTime), NULL, N'admin', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[san_pham] OFF
GO
SET IDENTITY_INSERT [dbo].[san_pham_chi_tiet] ON 
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (1, N'SPCT249438', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670754/xwqgsddynpuxjubom0t0.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 11, 2, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (2, N'SPCT285804', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670754/xwqgsddynpuxjubom0t0.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 12, 2, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (3, N'SPCT412396', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670754/xwqgsddynpuxjubom0t0.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 13, 2, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (4, N'SPCT601085', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670754/xwqgsddynpuxjubom0t0.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 14, 2, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (5, N'SPCT146516', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670758/fkfvlkronikixgnq029c.webp', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 11, 3, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (6, N'SPCT768301', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670758/fkfvlkronikixgnq029c.webp', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 12, 3, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (7, N'SPCT253689', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670758/fkfvlkronikixgnq029c.webp', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 13, 3, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (8, N'SPCT680419', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670758/fkfvlkronikixgnq029c.webp', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 14, 3, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (9, N'SPCT416171', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670760/g9marek82c9h4g5c23rc.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 11, 6, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (10, N'SPCT756871', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670760/g9marek82c9h4g5c23rc.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 12, 6, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (11, N'SPCT146670', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670760/g9marek82c9h4g5c23rc.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 13, 6, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (12, N'SPCT180138', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670760/g9marek82c9h4g5c23rc.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 14, 6, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (13, N'SPCT138139', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670764/l3ocdqxn4gbrdazv8xmr.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 11, 11, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (14, N'SPCT779696', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670764/l3ocdqxn4gbrdazv8xmr.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 12, 11, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (15, N'SPCT817339', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670764/l3ocdqxn4gbrdazv8xmr.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 13, 11, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (16, N'SPCT888488', N'Nike Air Force 1', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670764/l3ocdqxn4gbrdazv8xmr.jpg', CAST(1000000 AS Decimal(18, 0)), N'air force 1', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:45:50.050' AS DateTime), NULL, 14, 11, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (17, N'SPCT897419', N'Bitis Hunter X Mavel', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670837/y30jynym7u1dchgo5gju.webp', CAST(1200000 AS Decimal(18, 0)), N'Bitis Humter X Mavel SpiderMan', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:47:02.660' AS DateTime), NULL, 10, 2, 8, 8, 2, 1, 7, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (18, N'SPCT314815', N'Bitis Hunter X Mavel', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670837/y30jynym7u1dchgo5gju.webp', CAST(1200000 AS Decimal(18, 0)), N'Bitis Humter X Mavel SpiderMan', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:47:02.660' AS DateTime), NULL, 11, 2, 8, 8, 2, 1, 7, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (19, N'SPCT691845', N'Bitis Hunter X Mavel', 49, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670837/y30jynym7u1dchgo5gju.webp', CAST(1200000 AS Decimal(18, 0)), N'Bitis Humter X Mavel SpiderMan', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:47:02.660' AS DateTime), NULL, 12, 2, 8, 8, 2, 1, 7, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (20, N'SPCT423031', N'Bitis Hunter X Mavel', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670837/y30jynym7u1dchgo5gju.webp', CAST(1200000 AS Decimal(18, 0)), N'Bitis Humter X Mavel SpiderMan', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:47:02.660' AS DateTime), NULL, 13, 2, 8, 8, 2, 1, 7, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (21, N'SPCT516869', N'Bitis Hunter X Mavel', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670837/y30jynym7u1dchgo5gju.webp', CAST(1200000 AS Decimal(18, 0)), N'Bitis Humter X Mavel SpiderMan', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:47:02.660' AS DateTime), NULL, 14, 2, 8, 8, 2, 1, 7, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (22, N'SPCT837482', N'Nike Blader', 47, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670963/w79qovmm6k4lsqu305bw.webp', CAST(1600000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 10, 2, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (23, N'SPCT645699', N'Nike Blader', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670963/w79qovmm6k4lsqu305bw.webp', CAST(1600000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 11, 2, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (24, N'SPCT437796', N'Nike Blader', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670963/w79qovmm6k4lsqu305bw.webp', CAST(1600000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 12, 2, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (25, N'SPCT534500', N'Nike Blader', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670963/w79qovmm6k4lsqu305bw.webp', CAST(1600000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 13, 2, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (26, N'SPCT614057', N'Nike Blader', 50, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670963/w79qovmm6k4lsqu305bw.webp', CAST(1600000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 14, 2, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (27, N'SPCT502266', N'Nike Blader', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670969/rbweu1cnwvkhlkdbyzcj.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 10, 4, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (28, N'SPCT427751', N'Nike Blader', 9, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670969/rbweu1cnwvkhlkdbyzcj.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 11, 4, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (29, N'SPCT548319', N'Nike Blader', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670969/rbweu1cnwvkhlkdbyzcj.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 12, 4, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (30, N'SPCT271111', N'Nike Blader', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670969/rbweu1cnwvkhlkdbyzcj.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 13, 4, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (31, N'SPCT909388', N'Nike Blader', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670969/rbweu1cnwvkhlkdbyzcj.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 14, 4, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (32, N'SPCT145659', N'Nike Blader', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670973/s78jm4s0zq9dulhiqh8t.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 10, 9, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (33, N'SPCT558379', N'Nike Blader', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670973/s78jm4s0zq9dulhiqh8t.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 11, 9, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (34, N'SPCT994350', N'Nike Blader', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670973/s78jm4s0zq9dulhiqh8t.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 12, 9, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (35, N'SPCT340328', N'Nike Blader', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670973/s78jm4s0zq9dulhiqh8t.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 13, 9, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (36, N'SPCT319330', N'Nike Blader', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726670973/s78jm4s0zq9dulhiqh8t.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Blader', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:49:18.367' AS DateTime), NULL, 14, 9, 2, 4, 3, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (37, N'SPCT775886', N'Jordan Dior', 7, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671115/x68t1mag4dwugwnmobej.jpg', CAST(2000000 AS Decimal(18, 0)), N'Jordan Dior', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:51:40.497' AS DateTime), NULL, 13, 8, 9, 13, 4, 3, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (38, N'SPCT560145', N'Nike Cortez', 60, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671209/aiq8xoe8xzp1mvnv24nt.webp', CAST(950000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 9, 2, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (39, N'SPCT833890', N'Nike Cortez', 60, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671209/aiq8xoe8xzp1mvnv24nt.webp', CAST(950000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 10, 2, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (40, N'SPCT223754', N'Nike Cortez', 60, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671209/aiq8xoe8xzp1mvnv24nt.webp', CAST(950000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 11, 2, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (41, N'SPCT538224', N'Nike Cortez', 60, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671209/aiq8xoe8xzp1mvnv24nt.webp', CAST(950000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 12, 2, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (42, N'SPCT551273', N'Nike Cortez', 60, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671209/aiq8xoe8xzp1mvnv24nt.webp', CAST(950000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 13, 2, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (43, N'SPCT761180', N'Nike Cortez', 60, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671209/aiq8xoe8xzp1mvnv24nt.webp', CAST(950000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 14, 2, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (44, N'SPCT574347', N'Nike Cortez', 8, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671212/hdq7jfcdkptz9z5h52rh.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 9, 3, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (45, N'SPCT204417', N'Nike Cortez', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671212/hdq7jfcdkptz9z5h52rh.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 10, 3, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (46, N'SPCT600844', N'Nike Cortez', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671212/hdq7jfcdkptz9z5h52rh.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 11, 3, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (47, N'SPCT839105', N'Nike Cortez', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671212/hdq7jfcdkptz9z5h52rh.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 12, 3, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (48, N'SPCT413254', N'Nike Cortez', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671212/hdq7jfcdkptz9z5h52rh.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 13, 3, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (49, N'SPCT975873', N'Nike Cortez', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671212/hdq7jfcdkptz9z5h52rh.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Cortez', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:53:18.333' AS DateTime), NULL, 14, 3, 4, 7, 5, 12, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (50, N'SPCT569344', N'Nike Dunk', 79, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671327/mzzrdyhxf4kgkwofnnz5.webp', CAST(1200000 AS Decimal(18, 0)), N'Nike Dunk', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:55:16.007' AS DateTime), NULL, 11, 5, 5, 14, 6, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (51, N'SPCT257483', N'Nike Dunk', 79, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671327/mzzrdyhxf4kgkwofnnz5.webp', CAST(1200000 AS Decimal(18, 0)), N'Nike Dunk', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:55:16.007' AS DateTime), NULL, 12, 5, 5, 14, 6, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (52, N'SPCT713256', N'Nike Dunk', 79, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671327/mzzrdyhxf4kgkwofnnz5.webp', CAST(1200000 AS Decimal(18, 0)), N'Nike Dunk', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:55:16.007' AS DateTime), NULL, 13, 5, 5, 14, 6, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (53, N'SPCT316642', N'Nike Dunk', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671330/ey7chwu2z5p3lt37qqt4.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Dunk', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:55:16.007' AS DateTime), NULL, 11, 9, 5, 14, 6, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (54, N'SPCT934359', N'Nike Dunk', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671330/ey7chwu2z5p3lt37qqt4.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Dunk', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:55:16.007' AS DateTime), NULL, 12, 9, 5, 14, 6, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (55, N'SPCT786822', N'Nike Dunk', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671330/ey7chwu2z5p3lt37qqt4.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Dunk', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:55:16.007' AS DateTime), NULL, 13, 9, 5, 14, 6, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (56, N'SPCT193869', N'Nike P-6000', 153, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671416/y0n6hhjwaklckod6zfmx.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-600', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:56:49.283' AS DateTime), NULL, 12, 4, 3, 7, 7, 1, 10, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (57, N'SPCT557807', N'Nike P-6000', 153, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671416/y0n6hhjwaklckod6zfmx.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-600', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:56:49.283' AS DateTime), NULL, 13, 4, 3, 7, 7, 1, 10, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (58, N'SPCT485911', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671420/njovt1o4bpw4rruwmfvf.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-600', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:56:49.283' AS DateTime), NULL, 12, 6, 3, 7, 7, 1, 10, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (59, N'SPCT639112', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671420/njovt1o4bpw4rruwmfvf.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-600', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:56:49.283' AS DateTime), NULL, 13, 6, 3, 7, 7, 1, 10, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (60, N'SPCT368620', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671423/wzlhhyev2czkrqwct72l.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-600', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:56:49.283' AS DateTime), NULL, 12, 8, 3, 7, 7, 1, 10, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (61, N'SPCT546458', N'Nike P-6000', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671423/wzlhhyev2czkrqwct72l.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike P-600', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:56:49.283' AS DateTime), NULL, 13, 8, 3, 7, 7, 1, 10, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (62, N'SPCT554836', N'Nike Pegasus', 55, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671516/k0ny3mzr9napgbvrksos.jpg', CAST(1000000 AS Decimal(18, 0)), N'Nike Pegasus', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:58:29.117' AS DateTime), NULL, 12, 2, 6, 3, 8, 1, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (63, N'SPCT422084', N'Nike Pegasus', 55, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671516/k0ny3mzr9napgbvrksos.jpg', CAST(1000000 AS Decimal(18, 0)), N'Nike Pegasus', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:58:29.120' AS DateTime), NULL, 15, 2, 6, 3, 8, 1, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (64, N'SPCT160124', N'Nike Pegasus', 55, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671516/k0ny3mzr9napgbvrksos.jpg', CAST(1000000 AS Decimal(18, 0)), N'Nike Pegasus', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:58:29.120' AS DateTime), NULL, 16, 2, 6, 3, 8, 1, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (65, N'SPCT963242', N'Nike Pegasus', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671520/ac4vrqwvxdzhzdo5rgqr.jpg', CAST(1000000 AS Decimal(18, 0)), N'Nike Pegasus', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:58:29.120' AS DateTime), NULL, 12, 5, 6, 3, 8, 1, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (66, N'SPCT955772', N'Nike Pegasus', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671520/ac4vrqwvxdzhzdo5rgqr.jpg', CAST(1000000 AS Decimal(18, 0)), N'Nike Pegasus', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:58:29.120' AS DateTime), NULL, 15, 5, 6, 3, 8, 1, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (67, N'SPCT757506', N'Nike Pegasus', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671520/ac4vrqwvxdzhzdo5rgqr.jpg', CAST(1000000 AS Decimal(18, 0)), N'Nike Pegasus', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:58:29.120' AS DateTime), NULL, 16, 5, 6, 3, 8, 1, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (68, N'SPCT758697', N'Nike Pegasus', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671523/yhdypfzzcjhuccvpjyas.jpg', CAST(1000000 AS Decimal(18, 0)), N'Nike Pegasus', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:58:29.120' AS DateTime), NULL, 12, 6, 6, 3, 8, 1, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (69, N'SPCT745994', N'Nike Pegasus', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671523/yhdypfzzcjhuccvpjyas.jpg', CAST(1000000 AS Decimal(18, 0)), N'Nike Pegasus', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:58:29.120' AS DateTime), NULL, 15, 6, 6, 3, 8, 1, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (70, N'SPCT682643', N'Nike Pegasus', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671523/yhdypfzzcjhuccvpjyas.jpg', CAST(1000000 AS Decimal(18, 0)), N'Nike Pegasus', 500, NULL, N'admin', N'', CAST(N'2024-09-18T21:58:29.120' AS DateTime), NULL, 16, 6, 6, 3, 8, 1, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (71, N'SPCT639652', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671640/b2skwyilqonelnkgqcln.webp', CAST(1400000 AS Decimal(18, 0)), N'Nike Zoom Vomero', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:00:29.220' AS DateTime), NULL, 10, 2, 5, 5, 9, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (72, N'SPCT339626', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671640/b2skwyilqonelnkgqcln.webp', CAST(1400000 AS Decimal(18, 0)), N'Nike Zoom Vomero', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:00:29.220' AS DateTime), NULL, 11, 2, 5, 5, 9, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (73, N'SPCT904523', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671640/b2skwyilqonelnkgqcln.webp', CAST(1400000 AS Decimal(18, 0)), N'Nike Zoom Vomero', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:00:29.220' AS DateTime), NULL, 13, 2, 5, 5, 9, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (74, N'SPCT706222', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671640/b2skwyilqonelnkgqcln.webp', CAST(1400000 AS Decimal(18, 0)), N'Nike Zoom Vomero', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:00:29.220' AS DateTime), NULL, 15, 2, 5, 5, 9, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (75, N'SPCT645049', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671640/b2skwyilqonelnkgqcln.webp', CAST(1400000 AS Decimal(18, 0)), N'Nike Zoom Vomero', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:00:29.220' AS DateTime), NULL, 16, 2, 5, 5, 9, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (76, N'SPCT348020', N'Nike Zoom Vomero', 9, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671643/hoktrtmfwaguh7uiodc2.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:00:29.220' AS DateTime), NULL, 10, 8, 5, 5, 9, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (77, N'SPCT914578', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671643/hoktrtmfwaguh7uiodc2.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:00:29.220' AS DateTime), NULL, 11, 8, 5, 5, 9, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (78, N'SPCT815466', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671643/hoktrtmfwaguh7uiodc2.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:00:29.220' AS DateTime), NULL, 13, 8, 5, 5, 9, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (79, N'SPCT145183', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671643/hoktrtmfwaguh7uiodc2.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:00:29.220' AS DateTime), NULL, 15, 8, 5, 5, 9, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (80, N'SPCT302728', N'Nike Zoom Vomero', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671643/hoktrtmfwaguh7uiodc2.webp', CAST(1000000 AS Decimal(18, 0)), N'Nike Zoom Vomero', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:00:29.220' AS DateTime), NULL, 16, 8, 5, 5, 9, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (81, N'SPCT910466', N'Puma Suede Classic', 89, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671770/fpznucgvykjj3y6us0ha.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede Classic', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:02:38.857' AS DateTime), NULL, 12, 2, 6, 4, 10, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (82, N'SPCT682770', N'Puma Suede Classic', 89, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671770/fpznucgvykjj3y6us0ha.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede Classic', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:02:38.857' AS DateTime), NULL, 15, 2, 6, 4, 10, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (83, N'SPCT769890', N'Puma Suede Classic', 89, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671770/fpznucgvykjj3y6us0ha.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede Classic', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:02:38.857' AS DateTime), NULL, 16, 2, 6, 4, 10, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (84, N'SPCT308091', N'Puma Suede Classic', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671773/mny594hoaqdoxbxatjk5.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede Classic', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:02:38.857' AS DateTime), NULL, 12, 11, 6, 4, 10, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (85, N'SPCT316363', N'Puma Suede Classic', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671773/mny594hoaqdoxbxatjk5.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede Classic', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:02:38.857' AS DateTime), NULL, 15, 11, 6, 4, 10, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (86, N'SPCT990692', N'Puma Suede Classic', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671773/mny594hoaqdoxbxatjk5.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Suede Classic', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:02:38.857' AS DateTime), NULL, 16, 11, 6, 4, 10, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (87, N'SPCT139270', N'Yeezy 700', 54, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671854/lxoowaczjdbhkl170dmj.jpg', CAST(1100000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 11, 5, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (88, N'SPCT954165', N'Yeezy 700', 53, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671854/lxoowaczjdbhkl170dmj.jpg', CAST(1100000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 15, 5, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (89, N'SPCT970735', N'Yeezy 700', 54, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671854/lxoowaczjdbhkl170dmj.jpg', CAST(1100000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 16, 5, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (90, N'SPCT606191', N'Yeezy 700', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671858/nhmsfp3xygwops0gonmy.jpg', CAST(1000000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 11, 6, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (91, N'SPCT701124', N'Yeezy 700', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671858/nhmsfp3xygwops0gonmy.jpg', CAST(1000000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 15, 6, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (92, N'SPCT137038', N'Yeezy 700', 8, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671858/nhmsfp3xygwops0gonmy.jpg', CAST(1000000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 16, 6, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (93, N'SPCT738296', N'Yeezy 700', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671861/fae9tjrydj2qhorzgapo.jpg', CAST(1000000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 11, 7, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (94, N'SPCT517831', N'Yeezy 700', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671861/fae9tjrydj2qhorzgapo.jpg', CAST(1000000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 15, 7, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (95, N'SPCT302413', N'Yeezy 700', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671861/fae9tjrydj2qhorzgapo.jpg', CAST(1000000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 16, 7, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (96, N'SPCT141586', N'Yeezy 700', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671864/mg0fn2ert6io9f4vi6n3.jpg', CAST(1000000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 11, 9, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (97, N'SPCT952893', N'Yeezy 700', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671864/mg0fn2ert6io9f4vi6n3.jpg', CAST(1000000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 15, 9, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (98, N'SPCT431846', N'Yeezy 700', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726671864/mg0fn2ert6io9f4vi6n3.jpg', CAST(1000000 AS Decimal(18, 0)), N'Yeezy 700', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:04:09.593' AS DateTime), NULL, 16, 9, 2, 5, 11, 1, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (99, N'SPCT669198', N'Puma Mercedes-AMG', 82, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726672051/eegsqjix3sqheq8qvjax.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Mercedes-AMG', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:07:19.553' AS DateTime), NULL, 11, 3, 7, 8, 12, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (100, N'SPCT115297', N'Puma Mercedes-AMG', 82, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726672051/eegsqjix3sqheq8qvjax.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Mercedes-AMG', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:07:19.553' AS DateTime), NULL, 15, 3, 7, 8, 12, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (101, N'SPCT406482', N'Puma Mercedes-AMG', 82, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726672051/eegsqjix3sqheq8qvjax.jpg', CAST(1000000 AS Decimal(18, 0)), N'Puma Mercedes-AMG', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:07:19.553' AS DateTime), NULL, 16, 3, 7, 8, 12, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (102, N'SPCT157230', N'Puma Mercedes-AMG', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726672054/xywlxiqjzl17j8ul4tcx.png', CAST(1000000 AS Decimal(18, 0)), N'Puma Mercedes-AMG', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:07:19.553' AS DateTime), NULL, 11, 6, 7, 8, 12, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (103, N'SPCT331813', N'Puma Mercedes-AMG', 10, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726672054/xywlxiqjzl17j8ul4tcx.png', CAST(1000000 AS Decimal(18, 0)), N'Puma Mercedes-AMG', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:07:19.553' AS DateTime), NULL, 15, 6, 7, 8, 12, 1, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (104, N'SPCT301165', N'Puma Mercedes-AMG', 9, N'                              ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1726672054/xywlxiqjzl17j8ul4tcx.png', CAST(1000000 AS Decimal(18, 0)), N'Puma Mercedes-AMG', 500, NULL, N'admin', N'', CAST(N'2024-09-18T22:07:19.553' AS DateTime), NULL, 16, 6, 7, 8, 12, 1, 5, 1)
GO
SET IDENTITY_INSERT [dbo].[san_pham_chi_tiet] OFF
GO
SET IDENTITY_INSERT [dbo].[thuong_hieu] ON 
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Nike', CAST(N'2024-09-18T21:00:28.387' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Adidas', CAST(N'2024-09-18T21:00:33.900' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Puma', CAST(N'2024-09-18T21:00:38.177' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'Reebok', CAST(N'2024-09-18T21:00:43.493' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Converse', CAST(N'2024-09-18T21:00:48.503' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'New Balance', CAST(N'2024-09-18T21:00:54.277' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'Asics', CAST(N'2024-09-18T21:00:59.600' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Saucony', CAST(N'2024-09-18T21:01:05.937' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'Under Armour', CAST(N'2024-09-18T21:01:10.973' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'Vans', CAST(N'2024-09-18T21:01:15.140' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'Clarks', CAST(N'2024-09-18T21:01:20.417' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'Dr. Martens', CAST(N'2024-09-18T21:01:26.850' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'Timberland', CAST(N'2024-09-18T21:01:32.643' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'Skechers', CAST(N'2024-09-18T21:01:37.847' AS DateTime), NULL, N'admin', NULL, 1)
GO
INSERT [dbo].[thuong_hieu] ([id], [tenThuongHieu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'Bitis Hunter', CAST(N'2024-09-18T21:22:17.190' AS DateTime), NULL, N'admin', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[thuong_hieu] OFF
GO
USE [master]
GO
ALTER DATABASE [DATN_PTPM_SD22_FINAL] SET  READ_WRITE 
GO
