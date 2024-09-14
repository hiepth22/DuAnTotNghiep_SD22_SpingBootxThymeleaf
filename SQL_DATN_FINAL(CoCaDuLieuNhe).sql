/****** DB Có cả dữ liệu Ctrl A chạy là đc nhé ae :V ******/
CREATE DATABASE [DATN_PTPM_SD22_FINAL]
GO
USE [DATN_PTPM_SD22_FINAL]
GO
/****** Object:  Table [dbo].[chat_lieu]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[co_giay]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[de_giay]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[dia_chi]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[gio_hang]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[gio_hang_chi_tiet]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[hoa_don]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[hoa_don_chi_tiet]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[khach_hang]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[kich_co]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[lich_su_hoa_don]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[mau_sac]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[nha_san_xuat]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[nhan_vien]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[phieu_giam_gia]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[phuong_thuc_thanh_toan]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[san_pham]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[san_pham_chi_tiet]    Script Date: 8/23/2024 2:32:46 AM ******/
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
/****** Object:  Table [dbo].[thuong_hieu]    Script Date: 8/23/2024 2:32:46 AM ******/
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
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (1, 2, N'TP Hà Nội', N'Quận Hoàn Kiếm', N'Phan Chu Trinh', N'Ngõ 11', N'Nhà số 123, đường Phan Chu Trinh, Quận Hoàn Kiếm', N'Nguyễn Thị A', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (2, 2, N'TP Hà Nội', N'Quận Cầu Giấy', N'Dịch Vọng', N'Ngõ 12', N'Nhà số 456, đường Dịch Vọng, Quận Cầu Giấy', N'Nguyễn Thị A', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (3, 2, N'TP Hà Nội', N'Quận Đống Đa', N'Khâm Thiên', N'Ngõ 13', N'Nhà số 789, đường Khâm Thiên, Quận Đống Đa', N'Nguyễn Thị A', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (4, 3, N'TP Hà Nội', N'Quận Ba Đình', N'Kim Mã', N'Ngõ 21', N'Nhà số 321, đường Kim Mã, Quận Ba Đình', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (5, 3, N'TP Hà Nội', N'Quận Hoàng Mai', N'Đại Kim', N'Ngõ 22', N'Nhà số 654, đường Đại Kim, Quận Hoàng Mai', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (6, 3, N'TP Hà Nội', N'Quận Long Biên', N'Ngọc Thụy', N'Ngõ 23', N'Nhà số 987, đường Ngọc Thụy, Quận Long Biên', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (7, 4, N'TP Hà Nội', N'Quận Thanh Xuân', N'Nhân Chính', N'Ngõ 31', N'Nhà số 246, đường Nhân Chính, Quận Thanh Xuân', N'Nguyễn Văn C', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (8, 4, N'TP Hà Nội', N'Quận Tây Hồ', N'Nhật Tân', N'Ngõ 32', N'Nhà số 579, đường Nhật Tân, Quận Tây Hồ', N'Nguyễn Văn C', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (9, 4, N'TP Hà Nội', N'Quận Hoài Đức', N'Đại Mỗ', N'Ngõ 33', N'Nhà số 891, đường Đại Mỗ, Quận Hoài Đức', N'Nguyễn Văn C', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (10, 5, N'TP Hà Nội', N'Quận Hoàn Kiếm', N'Phan Chu Trinh', N'Ngõ 41', N'Nhà số 357, đường Phan Chu Trinh, Quận Hoàn Kiếm', N'Trần Thị D', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (11, 5, N'TP Hà Nội', N'Quận Ba Đình', N'Kim Mã', N'Ngõ 42', N'Nhà số 684, đường Kim Mã, Quận Ba Đình', N'Trần Thị D', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (12, 5, N'TP Hà Nội', N'Quận Hoàng Mai', N'Đại Kim', N'Ngõ 43', N'Nhà số 987, đường Đại Kim, Quận Hoàng Mai', N'Trần Thị D', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (13, 6, N'TP Hà Nội', N'Quận Hoàn Kiếm', N'Phan Chu Trinh', N'Ngõ 51', N'Nhà số 123, đường Phan Chu Trinh, Quận Hoàn Kiếm', N'Nguyễn Văn An', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (14, 6, N'TP Hà Nội', N'Quận Cầu Giấy', N'Dịch Vọng', N'Ngõ 52', N'Nhà số 456, đường Dịch Vọng, Quận Cầu Giấy', N'Nguyễn Văn An', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (15, 7, N'TP Hà Nội', N'Quận Đống Đa', N'Khâm Thiên', N'Ngõ 53', N'Nhà số 789, đường Khâm Thiên, Quận Đống Đa', N'Nguyễn Văn An', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (16, 8, N'TP Hà Nội', N'Quận Ba Đình', N'Kim Mã', N'Ngõ 61', N'Nhà số 321, đường Kim Mã, Quận Ba Đình', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (17, 9, N'TP Hà Nội', N'Quận Hoàng Mai', N'Đại Kim', N'Ngõ 62', N'Nhà số 654, đường Đại Kim, Quận Hoàng Mai', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[dia_chi] ([id], [idKhachHang], [thanhPho], [quanHuyen], [phuongXa], [soNha], [moTaChiTiet], [tenNguoiNhan], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [trangThai]) VALUES (18, 10, N'TP Hà Nội', N'Quận Long Biên', N'Ngọc Thụy', N'Ngõ 63', N'Nhà số 987, đường Ngọc Thụy, Quận Long Biên', N'Trần Văn B', N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[dia_chi] OFF
GO
SET IDENTITY_INSERT [dbo].[hoa_don] ON 
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (1, N'HD001', 1, CAST(N'2024-07-15T00:00:00.000' AS DateTime), CAST(N'2024-07-15T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(1000 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), CAST(950 AS Decimal(18, 0)), N'Nguyễn Văn A', N'0987654321', N'Ngõ 48 Văn Trì, Minh Khai, Bắc Từ Liêm, Hà Nội', N'Notes for order 1', 1, 1, 1, 6)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (2, N'HD002', 1, CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-07-16T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-07-19T00:00:00.000' AS DateTime), CAST(1500 AS Decimal(18, 0)), CAST(75 AS Decimal(18, 0)), CAST(1425 AS Decimal(18, 0)), N'Nguyễn Thị B', N'0987654322', N'12 Ngõ Trạm, Hoàn Kiếm, Hà Nội', N'Notes for order 2', 2, 2, 2, 2)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (3, N'HD003', 1, CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-17T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-07-19T00:00:00.000' AS DateTime), CAST(N'2024-07-20T00:00:00.000' AS DateTime), CAST(2000 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), CAST(1900 AS Decimal(18, 0)), N'Nguyễn Văn C', N'0987654323', N'15 Giải Phóng, Hai Bà Trưng, Hà Nội', N'Notes for order 3', 3, 3, 3, 3)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (4, N'HD004', 1, CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-07-18T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-19T00:00:00.000' AS DateTime), CAST(N'2024-07-20T00:00:00.000' AS DateTime), CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(2500 AS Decimal(18, 0)), CAST(125 AS Decimal(18, 0)), CAST(2375 AS Decimal(18, 0)), N'Nguyễn Thị D', N'0987654324', N'20 Cầu Giấy, Cầu Giấy, Hà Nội', N'Notes for order 4', 4, 4, 4, 6)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (5, N'HD005', 1, CAST(N'2024-07-19T00:00:00.000' AS DateTime), CAST(N'2024-07-19T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-20T00:00:00.000' AS DateTime), CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(N'2024-07-22T00:00:00.000' AS DateTime), CAST(3000 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), CAST(2850 AS Decimal(18, 0)), N'Nguyễn Văn E', N'0987654325', N'25 Nguyễn Chí Thanh, Đống Đa, Hà Nội', N'Notes for order 5', 5, 5, 5, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (6, N'HD006', 1, CAST(N'2024-07-20T00:00:00.000' AS DateTime), CAST(N'2024-07-20T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(N'2024-07-22T00:00:00.000' AS DateTime), CAST(N'2024-07-23T00:00:00.000' AS DateTime), CAST(3500 AS Decimal(18, 0)), CAST(175 AS Decimal(18, 0)), CAST(3325 AS Decimal(18, 0)), N'Nguyễn Thị F', N'0987654326', N'30 Hoàng Diệu, Ba Đình, Hà Nội', N'Notes for order 6', 6, 6, 6, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (7, N'HD007', 1, CAST(N'2024-07-21T00:00:00.000' AS DateTime), CAST(N'2024-07-21T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-22T00:00:00.000' AS DateTime), CAST(N'2024-07-23T00:00:00.000' AS DateTime), CAST(N'2024-07-24T00:00:00.000' AS DateTime), CAST(4000 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), CAST(3800 AS Decimal(18, 0)), N'Nguyễn Văn G', N'0987654327', N'35 Láng Hạ, Đống Đa, Hà Nội', N'Notes for order 7', 7, 7, 7, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (8, N'HD008', 1, CAST(N'2024-07-22T00:00:00.000' AS DateTime), CAST(N'2024-07-22T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-23T00:00:00.000' AS DateTime), CAST(N'2024-07-24T00:00:00.000' AS DateTime), CAST(N'2024-07-25T00:00:00.000' AS DateTime), CAST(4500 AS Decimal(18, 0)), CAST(225 AS Decimal(18, 0)), CAST(4275 AS Decimal(18, 0)), N'Nguyễn Thị H', N'0987654328', N'40 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', N'Notes for order 8', 7, 8, 8, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (9, N'HD009', 1, CAST(N'2024-07-23T00:00:00.000' AS DateTime), CAST(N'2024-07-23T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-24T00:00:00.000' AS DateTime), CAST(N'2024-07-25T00:00:00.000' AS DateTime), CAST(N'2024-07-26T00:00:00.000' AS DateTime), CAST(5000 AS Decimal(18, 0)), CAST(250 AS Decimal(18, 0)), CAST(4750 AS Decimal(18, 0)), N'Nguyễn Văn I', N'0987654329', N'45 Kim Mã, Ba Đình, Hà Nội', N'Notes for order 9', 8, 9, 9, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (10, N'HD010', 1, CAST(N'2024-07-24T00:00:00.000' AS DateTime), CAST(N'2024-07-24T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-25T00:00:00.000' AS DateTime), CAST(N'2024-07-26T00:00:00.000' AS DateTime), CAST(N'2024-07-27T00:00:00.000' AS DateTime), CAST(5500 AS Decimal(18, 0)), CAST(275 AS Decimal(18, 0)), CAST(5225 AS Decimal(18, 0)), N'Nguyễn Thị J', N'0987654330', N'50 Lê Văn Lương, Thanh Xuân, Hà Nội', N'Notes for order 10', 9, 10, 10, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (11, N'HD011', 1, CAST(N'2024-07-25T00:00:00.000' AS DateTime), CAST(N'2024-07-25T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-26T00:00:00.000' AS DateTime), CAST(N'2024-07-27T00:00:00.000' AS DateTime), CAST(N'2024-07-28T00:00:00.000' AS DateTime), CAST(6000 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(5700 AS Decimal(18, 0)), N'Nguyễn Văn K', N'0987654331', N'55 Trung Kính, Cầu Giấy, Hà Nội', N'Notes for order 11', 1, 11, 11, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (12, N'HD012', 1, CAST(N'2024-07-26T00:00:00.000' AS DateTime), CAST(N'2024-07-26T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-27T00:00:00.000' AS DateTime), CAST(N'2024-07-28T00:00:00.000' AS DateTime), CAST(N'2024-07-29T00:00:00.000' AS DateTime), CAST(6500 AS Decimal(18, 0)), CAST(325 AS Decimal(18, 0)), CAST(6175 AS Decimal(18, 0)), N'Nguyễn Thị L', N'0987654332', N'60 Xuân Thủy, Cầu Giấy, Hà Nội', N'Notes for order 12', 2, 12, 12, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (13, N'HD013', 1, CAST(N'2024-07-27T00:00:00.000' AS DateTime), CAST(N'2024-07-27T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-28T00:00:00.000' AS DateTime), CAST(N'2024-07-29T00:00:00.000' AS DateTime), CAST(N'2024-07-30T00:00:00.000' AS DateTime), CAST(7000 AS Decimal(18, 0)), CAST(350 AS Decimal(18, 0)), CAST(6650 AS Decimal(18, 0)), N'Nguyễn Văn M', N'0987654333', N'65 Hoàng Hoa Thám, Ba Đình, Hà Nội', N'Notes for order 13', 3, 13, 13, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (14, N'HD014', 1, CAST(N'2024-07-28T00:00:00.000' AS DateTime), CAST(N'2024-07-28T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-29T00:00:00.000' AS DateTime), CAST(N'2024-07-30T00:00:00.000' AS DateTime), CAST(N'2024-07-31T00:00:00.000' AS DateTime), CAST(7500 AS Decimal(18, 0)), CAST(375 AS Decimal(18, 0)), CAST(7125 AS Decimal(18, 0)), N'Nguyễn Thị N', N'0987654334', N'70 Nguyễn Trãi, Thanh Xuân, Hà Nội', N'Notes for order 14', 3, 14, 14, 6)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (15, N'HD015', 1, CAST(N'2024-07-29T00:00:00.000' AS DateTime), CAST(N'2024-07-29T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-30T00:00:00.000' AS DateTime), CAST(N'2024-07-31T00:00:00.000' AS DateTime), CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(8000 AS Decimal(18, 0)), CAST(400 AS Decimal(18, 0)), CAST(7600 AS Decimal(18, 0)), N'Nguyễn Văn O', N'0987654335', N'75 Tây Sơn, Đống Đa, Hà Nội', N'Notes for order 15', 4, 15, 15, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (16, N'HD016', 1, CAST(N'2024-07-30T00:00:00.000' AS DateTime), CAST(N'2024-07-30T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-31T00:00:00.000' AS DateTime), CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-08-02T00:00:00.000' AS DateTime), CAST(8500 AS Decimal(18, 0)), CAST(425 AS Decimal(18, 0)), CAST(8075 AS Decimal(18, 0)), N'Nguyễn Thị P', N'0987654336', N'80 Tôn Đức Thắng, Đống Đa, Hà Nội', N'Notes for order 16', 4, 16, 16, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (17, N'HD017', 1, CAST(N'2024-07-31T00:00:00.000' AS DateTime), CAST(N'2024-07-31T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-08-02T00:00:00.000' AS DateTime), CAST(N'2024-08-03T00:00:00.000' AS DateTime), CAST(9000 AS Decimal(18, 0)), CAST(450 AS Decimal(18, 0)), CAST(8550 AS Decimal(18, 0)), N'Nguyễn Văn Q', N'0987654337', N'85 Chùa Bộc, Đống Đa, Hà Nội', N'Notes for order 17', 5, 17, 17, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (18, N'HD018', 1, CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-08-01T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-02T00:00:00.000' AS DateTime), CAST(N'2024-08-03T00:00:00.000' AS DateTime), CAST(N'2024-08-04T00:00:00.000' AS DateTime), CAST(9500 AS Decimal(18, 0)), CAST(475 AS Decimal(18, 0)), CAST(9025 AS Decimal(18, 0)), N'Nguyễn Thị R', N'0987654338', N'90 Hàng Bài, Hoàn Kiếm, Hà Nội', N'Notes for order 18', 5, 18, 18, 4)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (19, N'HD019', 1, CAST(N'2024-08-02T00:00:00.000' AS DateTime), CAST(N'2024-08-02T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-03T00:00:00.000' AS DateTime), CAST(N'2024-08-04T00:00:00.000' AS DateTime), CAST(N'2024-08-05T00:00:00.000' AS DateTime), CAST(10000 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(9500 AS Decimal(18, 0)), N'Nguyễn Văn S', N'0987654339', N'95 Hàng Bông, Hoàn Kiếm, Hà Nội', N'Notes for order 19', 6, 19, 19, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (20, N'HD020', 1, CAST(N'2024-08-03T00:00:00.000' AS DateTime), CAST(N'2024-08-03T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-04T00:00:00.000' AS DateTime), CAST(N'2024-08-05T00:00:00.000' AS DateTime), CAST(N'2024-08-06T00:00:00.000' AS DateTime), CAST(10500 AS Decimal(18, 0)), CAST(525 AS Decimal(18, 0)), CAST(9975 AS Decimal(18, 0)), N'Nguyễn Thị T', N'0987654340', N'100 Hàng Cót, Hoàn Kiếm, Hà Nội', N'Notes for order 20', 6, 20, 20, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (21, N'HD021', 1, CAST(N'2024-08-04T00:00:00.000' AS DateTime), CAST(N'2024-08-04T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-05T00:00:00.000' AS DateTime), CAST(N'2024-08-06T00:00:00.000' AS DateTime), CAST(N'2024-08-07T00:00:00.000' AS DateTime), CAST(11000 AS Decimal(18, 0)), CAST(550 AS Decimal(18, 0)), CAST(10450 AS Decimal(18, 0)), N'Nguyễn Văn U', N'0987654341', N'105 Hàng Da, Hoàn Kiếm, Hà Nội', N'Notes for order 21', 7, 21, 21, 3)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (22, N'HD022', 1, CAST(N'2024-08-05T00:00:00.000' AS DateTime), CAST(N'2024-08-05T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-06T00:00:00.000' AS DateTime), CAST(N'2024-08-07T00:00:00.000' AS DateTime), CAST(N'2024-08-08T00:00:00.000' AS DateTime), CAST(11500 AS Decimal(18, 0)), CAST(575 AS Decimal(18, 0)), CAST(10925 AS Decimal(18, 0)), N'Nguyễn Thị V', N'0987654342', N'110 Hàng Gai, Hoàn Kiếm, Hà Nội', N'Notes for order 22', 7, 22, 22, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (23, N'HD023', 1, CAST(N'2024-08-06T00:00:00.000' AS DateTime), CAST(N'2024-08-06T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-07T00:00:00.000' AS DateTime), CAST(N'2024-08-08T00:00:00.000' AS DateTime), CAST(N'2024-08-09T00:00:00.000' AS DateTime), CAST(12000 AS Decimal(18, 0)), CAST(600 AS Decimal(18, 0)), CAST(11400 AS Decimal(18, 0)), N'Nguyễn Văn W', N'0987654343', N'115 Hàng Mã, Hoàn Kiếm, Hà Nội', N'Notes for order 23', 8, 23, 23, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (24, N'HD024', 1, CAST(N'2024-08-07T00:00:00.000' AS DateTime), CAST(N'2024-08-07T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-08T00:00:00.000' AS DateTime), CAST(N'2024-08-09T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(12500 AS Decimal(18, 0)), CAST(625 AS Decimal(18, 0)), CAST(11875 AS Decimal(18, 0)), N'Nguyễn Thị X', N'0987654344', N'120 Hàng Than, Hoàn Kiếm, Hà Nội', N'Notes for order 24', 8, 24, 24, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (25, N'HD025', 1, CAST(N'2024-08-08T00:00:00.000' AS DateTime), CAST(N'2024-08-08T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-09T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-11T00:00:00.000' AS DateTime), CAST(13000 AS Decimal(18, 0)), CAST(650 AS Decimal(18, 0)), CAST(12350 AS Decimal(18, 0)), N'Nguyễn Văn Y', N'0987654345', N'125 Hàng Tre, Hoàn Kiếm, Hà Nội', N'Notes for order 25', 9, 25, 25, 4)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (26, N'HD026', 1, CAST(N'2024-08-09T00:00:00.000' AS DateTime), CAST(N'2024-08-09T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-11T00:00:00.000' AS DateTime), CAST(N'2024-08-12T00:00:00.000' AS DateTime), CAST(13500 AS Decimal(18, 0)), CAST(675 AS Decimal(18, 0)), CAST(12825 AS Decimal(18, 0)), N'Nguyễn Thị Z', N'0987654346', N'130 Hàng Vải, Hoàn Kiếm, Hà Nội', N'Notes for order 26', 9, 26, 26, 7)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (27, N'HD027', 1, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-08-10T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-11T00:00:00.000' AS DateTime), CAST(N'2024-08-12T00:00:00.000' AS DateTime), CAST(N'2024-08-13T00:00:00.000' AS DateTime), CAST(14000 AS Decimal(18, 0)), CAST(700 AS Decimal(18, 0)), CAST(13300 AS Decimal(18, 0)), N'Nguyễn Văn AA', N'0987654347', N'135 Hàng Muối, Hoàn Kiếm, Hà Nội', N'Notes for order 27', 10, 27, 27, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (28, N'HD028', 1, CAST(N'2024-08-11T00:00:00.000' AS DateTime), CAST(N'2024-08-11T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-12T00:00:00.000' AS DateTime), CAST(N'2024-08-13T00:00:00.000' AS DateTime), CAST(N'2024-08-14T00:00:00.000' AS DateTime), CAST(14500 AS Decimal(18, 0)), CAST(725 AS Decimal(18, 0)), CAST(13775 AS Decimal(18, 0)), N'Nguyễn Thị BB', N'0987654348', N'140 Hàng Điếu, Hoàn Kiếm, Hà Nội', N'Notes for order 28', 10, 28, 28, 4)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (29, N'HD029', 1, CAST(N'2024-08-12T00:00:00.000' AS DateTime), CAST(N'2024-08-12T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-13T00:00:00.000' AS DateTime), CAST(N'2024-08-14T00:00:00.000' AS DateTime), CAST(N'2024-08-15T00:00:00.000' AS DateTime), CAST(15000 AS Decimal(18, 0)), CAST(750 AS Decimal(18, 0)), CAST(14250 AS Decimal(18, 0)), N'Nguyễn Văn CC', N'0987654349', N'145 Hàng Đồng, Hoàn Kiếm, Hà Nội', N'Notes for order 29', 1, 29, 29, 1)
GO
INSERT [dbo].[hoa_don] ([id], [ma], [loai], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [ngayGiaoHang], [ngayThanhToan], [ngayNhan], [tongTien], [tienShip], [tongTienSauGiam], [nguoiNhan], [sdtNguoiNhan], [diaChiNguoiNhan], [ghiChu], [idPhieuGiamGia], [idNhanVien], [idKhachHang], [trangThai]) VALUES (30, N'HD030', 1, CAST(N'2024-08-13T00:00:00.000' AS DateTime), CAST(N'2024-08-13T00:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-14T00:00:00.000' AS DateTime), CAST(N'2024-08-15T00:00:00.000' AS DateTime), CAST(N'2024-08-16T00:00:00.000' AS DateTime), CAST(15500 AS Decimal(18, 0)), CAST(775 AS Decimal(18, 0)), CAST(14725 AS Decimal(18, 0)), N'Nguyễn Thị DD', N'0987654350', N'150 Hàng Quạt, Hoàn Kiếm, Hà Nội', N'Notes for order 30', 1, 30, 30, 2)
GO
SET IDENTITY_INSERT [dbo].[hoa_don] OFF
GO
SET IDENTITY_INSERT [dbo].[hoa_don_chi_tiet] ON 
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (1, 2, CAST(500000 AS Decimal(18, 0)), 1, 1, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (2, 1, CAST(800000 AS Decimal(18, 0)), 2, 1, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (3, 3, CAST(1200000 AS Decimal(18, 0)), 3, 2, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (4, 1, CAST(1500000 AS Decimal(18, 0)), 4, 2, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (5, 2, CAST(700000 AS Decimal(18, 0)), 5, 3, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (6, 1, CAST(900000 AS Decimal(18, 0)), 6, 3, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (7, 1, CAST(1100000 AS Decimal(18, 0)), 7, 4, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (8, 2, CAST(600000 AS Decimal(18, 0)), 8, 4, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (9, 3, CAST(1300000 AS Decimal(18, 0)), 9, 5, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (10, 1, CAST(1000000 AS Decimal(18, 0)), 10, 5, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (11, 2, CAST(750000 AS Decimal(18, 0)), 11, 6, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (12, 1, CAST(950000 AS Decimal(18, 0)), 12, 6, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (13, 1, CAST(850000 AS Decimal(18, 0)), 13, 7, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (14, 2, CAST(620000 AS Decimal(18, 0)), 14, 7, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (15, 3, CAST(1150000 AS Decimal(18, 0)), 15, 8, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (16, 1, CAST(1350000 AS Decimal(18, 0)), 16, 8, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (17, 2, CAST(680000 AS Decimal(18, 0)), 17, 9, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (18, 1, CAST(880000 AS Decimal(18, 0)), 18, 9, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (19, 1, CAST(1050000 AS Decimal(18, 0)), 19, 10, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (20, 2, CAST(720000 AS Decimal(18, 0)), 20, 10, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (21, 3, CAST(1250000 AS Decimal(18, 0)), 21, 11, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (22, 1, CAST(980000 AS Decimal(18, 0)), 22, 11, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (23, 2, CAST(770000 AS Decimal(18, 0)), 23, 12, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (24, 1, CAST(920000 AS Decimal(18, 0)), 24, 12, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (25, 1, CAST(800000 AS Decimal(18, 0)), 25, 13, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (26, 2, CAST(640000 AS Decimal(18, 0)), 26, 13, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (27, 3, CAST(1180000 AS Decimal(18, 0)), 27, 14, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (28, 1, CAST(1420000 AS Decimal(18, 0)), 28, 14, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (29, 2, CAST(690000 AS Decimal(18, 0)), 29, 15, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (30, 1, CAST(870000 AS Decimal(18, 0)), 30, 15, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (31, 1, CAST(1070000 AS Decimal(18, 0)), 30, 16, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (32, 2, CAST(730000 AS Decimal(18, 0)), 29, 16, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (33, 3, CAST(1280000 AS Decimal(18, 0)), 28, 17, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (34, 1, CAST(990000 AS Decimal(18, 0)), 27, 17, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (35, 2, CAST(780000 AS Decimal(18, 0)), 26, 18, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (36, 1, CAST(930000 AS Decimal(18, 0)), 25, 18, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (37, 1, CAST(820000 AS Decimal(18, 0)), 24, 19, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (38, 2, CAST(660000 AS Decimal(18, 0)), 23, 19, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (39, 3, CAST(1205000 AS Decimal(18, 0)), 22, 20, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (40, 1, CAST(1480000 AS Decimal(18, 0)), 21, 20, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (41, 2, CAST(710000 AS Decimal(18, 0)), 20, 21, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (42, 1, CAST(860000 AS Decimal(18, 0)), 19, 21, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (43, 1, CAST(1080000 AS Decimal(18, 0)), 18, 22, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (44, 2, CAST(740000 AS Decimal(18, 0)), 17, 22, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (45, 3, CAST(1290000 AS Decimal(18, 0)), 16, 23, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (46, 1, CAST(1005000 AS Decimal(18, 0)), 15, 23, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (47, 2, CAST(790000 AS Decimal(18, 0)), 14, 24, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (48, 1, CAST(940000 AS Decimal(18, 0)), 13, 24, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (49, 1, CAST(830000 AS Decimal(18, 0)), 12, 25, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (50, 2, CAST(670000 AS Decimal(18, 0)), 11, 25, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (51, 3, CAST(1220000 AS Decimal(18, 0)), 10, 26, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (52, 1, CAST(1540000 AS Decimal(18, 0)), 9, 26, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (53, 2, CAST(730000 AS Decimal(18, 0)), 8, 27, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (54, 1, CAST(890000 AS Decimal(18, 0)), 7, 27, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (55, 1, CAST(1100000 AS Decimal(18, 0)), 6, 28, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (56, 2, CAST(760000 AS Decimal(18, 0)), 5, 28, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (57, 3, CAST(1320000 AS Decimal(18, 0)), 4, 29, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (58, 1, CAST(1020000 AS Decimal(18, 0)), 3, 29, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (59, 2, CAST(800000 AS Decimal(18, 0)), 2, 30, 1)
GO
INSERT [dbo].[hoa_don_chi_tiet] ([id], [soLuong], [gia], [idChiTietSanPham], [idHoaDon], [trangThai]) VALUES (60, 1, CAST(960000 AS Decimal(18, 0)), 1, 30, 1)
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
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (11, N'KH011', N'Trần Thị Lan', N'0369852147', CAST(N'1999-11-28' AS Date), N'tranthi.lan@example.com', 0, N'369852147', N'', N'tranlan2000', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (12, N'KH012', N'Lê Văn Minh', N'0912345678', CAST(N'2000-10-15' AS Date), N'levan.minh@example.com', 1, N'912345678', N'', N'mklevan123', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (13, N'KH013', N'Phạm Thị Nhung', N'0771234567', CAST(N'2001-09-02' AS Date), N'phamthi.nhung@example.com', 0, N'771234567', N'', N'nhung123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (14, N'KH014', N'Trần Văn Oanh', N'0987654321', CAST(N'2002-08-19' AS Date), N'tranvan.oanh@example.com', 1, N'987654321', N'', N'mkoanh2002', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (15, N'KH015', N'Lê Thị Phương', N'0369852147', CAST(N'2003-07-06' AS Date), N'lethi.phuong@example.com', 0, N'369852147', N'', N'phuong123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (16, N'KH016', N'Nguyễn Văn Quân', N'0912345678', CAST(N'2004-06-23' AS Date), N'nguyenvan.quan@example.com', 1, N'912345678', N'', N'mkquan2004', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (17, N'KH017', N'Hoàng Thị Rạng', N'0771234567', CAST(N'2005-05-10' AS Date), N'hoangthi.rang@example.com', 0, N'771234567', N'', N'rang123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (18, N'KH018', N'Trần Văn Sơn', N'0987654321', CAST(N'2006-04-27' AS Date), N'tranvan.son@example.com', 1, N'987654321', N'', N'son123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (19, N'KH019', N'Lê Thị Tâm', N'0369852147', CAST(N'2007-03-14' AS Date), N'lethi.tam@example.com', 0, N'369852147', N'', N'tam123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (20, N'KH020', N'Phạm Văn Uyên', N'0912345678', CAST(N'2008-02-01' AS Date), N'phamvan.uyen@example.com', 1, N'912345678', N'', N'uyen123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (21, N'KH021', N'Nguyễn Thị Vân', N'0771234567', CAST(N'2009-01-18' AS Date), N'nguyenthiv.van@example.com', 0, N'771234567', N'', N'van123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (22, N'KH022', N'Trần Văn Xuân', N'0987654321', CAST(N'2010-12-06' AS Date), N'tranvan.xuan@example.com', 1, N'987654321', N'', N'xuan123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (23, N'KH023', N'Lê Thị Yến', N'0369852147', CAST(N'2011-10-24' AS Date), N'lethi.yen@example.com', 0, N'369852147', N'', N'yen123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (24, N'KH024', N'Hoàng Văn Zai', N'0912345678', CAST(N'2012-09-10' AS Date), N'hoangvan.zai@example.com', 1, N'912345678', N'', N'zai123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (25, N'KH025', N'Trần Thị Mỹ', N'0771234567', CAST(N'2013-08-28' AS Date), N'tranthi.my@example.com', 0, N'771234567', N'', N'mythi456', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (26, N'KH026', N'Nguyễn Văn Đạt', N'0987654321', CAST(N'2014-07-15' AS Date), N'nguyenvan.dat@example.com', 1, N'987654321', N'', N'dat123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (27, N'KH027', N'Phạm Thị Lan', N'0369852147', CAST(N'2015-06-02' AS Date), N'phamthi.lan@example.com', 0, N'369852147', N'', N'lan123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (28, N'KH028', N'Trần Văn Thành', N'0912345678', CAST(N'2016-05-20' AS Date), N'tranvan.thanh@example.com', 1, N'912345678', N'', N'thanh123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (29, N'KH029', N'Lê Thị Hương', N'0771234567', CAST(N'2017-04-07' AS Date), N'lethi.huong@example.com', 0, N'771234567', N'', N'huong123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[khach_hang] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat]) VALUES (30, N'KH030', N'Nguyễn Văn Phúc', N'0987654321', CAST(N'2018-03-25' AS Date), N'nguyenvan.phuc@example.com', 1, N'987654321', N'', N'phuc123mk', 2, 1, N'admin', N'admin', CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-01T00:00:00.000' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[lich_su_hoa_don] ON 
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (1, 1, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-01T08:00:00.000' AS DateTime), CAST(N'2024-05-01T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (2, 2, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-02T08:00:00.000' AS DateTime), CAST(N'2024-05-02T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (3, 3, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-03T08:00:00.000' AS DateTime), CAST(N'2024-05-03T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (4, 4, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-04T08:00:00.000' AS DateTime), CAST(N'2024-05-04T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (5, 5, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-05T08:00:00.000' AS DateTime), CAST(N'2024-05-05T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (6, 6, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-06T08:00:00.000' AS DateTime), CAST(N'2024-05-06T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (7, 7, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-07T08:00:00.000' AS DateTime), CAST(N'2024-05-07T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (8, 8, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-08T08:00:00.000' AS DateTime), CAST(N'2024-05-08T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (9, 9, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-09T08:00:00.000' AS DateTime), CAST(N'2024-05-09T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (10, 10, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-10T08:00:00.000' AS DateTime), CAST(N'2024-05-10T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (11, 11, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-11T08:00:00.000' AS DateTime), CAST(N'2024-05-11T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (12, 12, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-12T08:00:00.000' AS DateTime), CAST(N'2024-05-12T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (13, 13, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-13T08:00:00.000' AS DateTime), CAST(N'2024-05-13T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (14, 14, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-14T08:00:00.000' AS DateTime), CAST(N'2024-05-14T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (15, 15, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-15T08:00:00.000' AS DateTime), CAST(N'2024-05-15T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (16, 16, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-16T08:00:00.000' AS DateTime), CAST(N'2024-05-16T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (17, 17, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-17T08:00:00.000' AS DateTime), CAST(N'2024-05-17T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (18, 18, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-18T08:00:00.000' AS DateTime), CAST(N'2024-05-18T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (19, 19, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-19T08:00:00.000' AS DateTime), CAST(N'2024-05-19T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (20, 20, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-20T08:00:00.000' AS DateTime), CAST(N'2024-05-20T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (21, 21, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-21T08:00:00.000' AS DateTime), CAST(N'2024-05-21T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (22, 22, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-22T08:00:00.000' AS DateTime), CAST(N'2024-05-22T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (23, 23, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-23T08:00:00.000' AS DateTime), CAST(N'2024-05-23T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (24, 24, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-24T08:00:00.000' AS DateTime), CAST(N'2024-05-24T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (25, 25, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-25T08:00:00.000' AS DateTime), CAST(N'2024-05-25T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (26, 26, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-26T08:00:00.000' AS DateTime), CAST(N'2024-05-26T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (27, 27, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-27T08:00:00.000' AS DateTime), CAST(N'2024-05-27T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (28, 28, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-28T08:00:00.000' AS DateTime), CAST(N'2024-05-28T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (29, 29, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-29T08:00:00.000' AS DateTime), CAST(N'2024-05-29T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (30, 30, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-05-30T08:00:00.000' AS DateTime), CAST(N'2024-05-30T08:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (31, 1, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-01T08:00:00.000' AS DateTime), CAST(N'2024-06-01T08:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (32, 1, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-02T08:00:00.000' AS DateTime), CAST(N'2024-06-02T08:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (33, 1, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-03T08:00:00.000' AS DateTime), CAST(N'2024-06-03T08:00:00.000' AS DateTime), 4, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (34, 1, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-04T08:00:00.000' AS DateTime), CAST(N'2024-06-04T08:00:00.000' AS DateTime), 5, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (35, 1, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-05T08:00:00.000' AS DateTime), CAST(N'2024-06-05T08:00:00.000' AS DateTime), 6, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (36, 2, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-06T08:00:00.000' AS DateTime), CAST(N'2024-06-06T08:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (37, 3, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-07T08:00:00.000' AS DateTime), CAST(N'2024-06-07T08:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (38, 3, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-08T08:00:00.000' AS DateTime), CAST(N'2024-06-08T08:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (39, 4, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-09T08:00:00.000' AS DateTime), CAST(N'2024-06-09T08:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (40, 4, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-10T08:00:00.000' AS DateTime), CAST(N'2024-06-10T08:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (41, 4, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-11T08:00:00.000' AS DateTime), CAST(N'2024-06-11T08:00:00.000' AS DateTime), 4, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (42, 4, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-12T08:00:00.000' AS DateTime), CAST(N'2024-06-12T08:00:00.000' AS DateTime), 5, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (43, 4, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-13T08:00:00.000' AS DateTime), CAST(N'2024-06-13T08:00:00.000' AS DateTime), 6, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (44, 14, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-14T08:00:00.000' AS DateTime), CAST(N'2024-06-14T08:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (45, 14, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-15T08:00:00.000' AS DateTime), CAST(N'2024-06-15T08:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (46, 14, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-16T08:00:00.000' AS DateTime), CAST(N'2024-06-16T08:00:00.000' AS DateTime), 4, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (47, 14, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-17T08:00:00.000' AS DateTime), CAST(N'2024-06-17T08:00:00.000' AS DateTime), 5, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (48, 18, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-18T08:00:00.000' AS DateTime), CAST(N'2024-06-18T08:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (49, 18, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-19T08:00:00.000' AS DateTime), CAST(N'2024-06-19T08:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (50, 18, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-20T08:00:00.000' AS DateTime), CAST(N'2024-06-20T08:00:00.000' AS DateTime), 4, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (51, 21, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-21T08:00:00.000' AS DateTime), CAST(N'2024-06-21T08:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (52, 21, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-22T08:00:00.000' AS DateTime), CAST(N'2024-06-22T08:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (53, 25, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-23T08:00:00.000' AS DateTime), CAST(N'2024-06-23T08:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (54, 25, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-24T08:00:00.000' AS DateTime), CAST(N'2024-06-24T08:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (55, 25, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-25T08:00:00.000' AS DateTime), CAST(N'2024-06-25T08:00:00.000' AS DateTime), 4, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (56, 26, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-26T08:00:00.000' AS DateTime), CAST(N'2024-06-26T08:00:00.000' AS DateTime), 7, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (57, 28, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-27T08:00:00.000' AS DateTime), CAST(N'2024-06-27T08:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (58, 28, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-28T08:00:00.000' AS DateTime), CAST(N'2024-06-28T08:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (59, 28, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-29T08:00:00.000' AS DateTime), CAST(N'2024-06-29T08:00:00.000' AS DateTime), 4, 1)
GO
INSERT [dbo].[lich_su_hoa_don] ([id], [idHoaDon], [ghiChu], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [hanhDong], [trangThai]) VALUES (60, 30, N'Xác nh?n don hàng', N'admin', N'admin', CAST(N'2024-06-30T08:00:00.000' AS DateTime), CAST(N'2024-06-30T08:00:00.000' AS DateTime), 2, 1)
GO
SET IDENTITY_INSERT [dbo].[lich_su_hoa_don] OFF
GO
SET IDENTITY_INSERT [dbo].[mau_sac] ON 
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'#000000', CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'#FFFFFF', CAST(N'2024-01-02T08:00:00.000' AS DateTime), CAST(N'2024-01-02T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'#FF0000', CAST(N'2024-01-03T08:00:00.000' AS DateTime), CAST(N'2024-01-03T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'#00FF00', CAST(N'2024-01-04T08:00:00.000' AS DateTime), CAST(N'2024-01-04T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'#0000FF', CAST(N'2024-01-05T08:00:00.000' AS DateTime), CAST(N'2024-01-05T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'#FFFF00', CAST(N'2024-01-06T08:00:00.000' AS DateTime), CAST(N'2024-01-06T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'#808080', CAST(N'2024-01-07T08:00:00.000' AS DateTime), CAST(N'2024-01-07T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'#FFC0CB', CAST(N'2024-01-08T08:00:00.000' AS DateTime), CAST(N'2024-01-08T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'#FFA500', CAST(N'2024-01-09T08:00:00.000' AS DateTime), CAST(N'2024-01-09T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'#800080', CAST(N'2024-01-10T08:00:00.000' AS DateTime), CAST(N'2024-01-10T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'#A52A2A', CAST(N'2024-01-11T08:00:00.000' AS DateTime), CAST(N'2024-01-11T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'#008000', CAST(N'2024-01-12T08:00:00.000' AS DateTime), CAST(N'2024-01-12T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'#FFFFE0', CAST(N'2024-01-13T08:00:00.000' AS DateTime), CAST(N'2024-01-13T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'#FAEBD7', CAST(N'2024-01-14T08:00:00.000' AS DateTime), CAST(N'2024-01-14T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'#FFD700', CAST(N'2024-01-15T08:00:00.000' AS DateTime), CAST(N'2024-01-15T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'#FF6347', CAST(N'2024-01-16T08:00:00.000' AS DateTime), CAST(N'2024-01-16T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, N'#40E0D0', CAST(N'2024-01-17T08:00:00.000' AS DateTime), CAST(N'2024-01-17T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, N'#9370DB', CAST(N'2024-01-18T08:00:00.000' AS DateTime), CAST(N'2024-01-18T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, N'#00FFFF', CAST(N'2024-01-19T08:00:00.000' AS DateTime), CAST(N'2024-01-19T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, N'#FA8072', CAST(N'2024-01-20T08:00:00.000' AS DateTime), CAST(N'2024-01-20T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, N'#FFDAB9', CAST(N'2024-01-21T08:00:00.000' AS DateTime), CAST(N'2024-01-21T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, N'#FFEFD5', CAST(N'2024-01-22T08:00:00.000' AS DateTime), CAST(N'2024-01-22T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, N'#E6E6FA', CAST(N'2024-01-23T08:00:00.000' AS DateTime), CAST(N'2024-01-23T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, N'#FFA07A', CAST(N'2024-01-24T08:00:00.000' AS DateTime), CAST(N'2024-01-24T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, N'#98FB98', CAST(N'2024-01-25T08:00:00.000' AS DateTime), CAST(N'2024-01-25T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (26, N'#FF69B4', CAST(N'2024-01-26T08:00:00.000' AS DateTime), CAST(N'2024-01-26T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (27, N'#FFE4E1', CAST(N'2024-01-27T08:00:00.000' AS DateTime), CAST(N'2024-01-27T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (28, N'#B0C4DE', CAST(N'2024-01-28T08:00:00.000' AS DateTime), CAST(N'2024-01-28T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (29, N'#FF00FF', CAST(N'2024-01-29T08:00:00.000' AS DateTime), CAST(N'2024-01-29T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[mau_sac] ([id], [ten], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (30, N'#00FA9A', CAST(N'2024-01-30T08:00:00.000' AS DateTime), CAST(N'2024-01-30T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
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
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (1, N'dungdt', N'Đặng Thị Dung', N'0987654331', CAST(N'1993-04-04' AS Date), N'dtdung@example.com', 0, N'246813579', NULL, N'passwordabc', 0, 1, N'admin', N'admin', CAST(N'2024-01-04T08:00:00.000' AS DateTime), CAST(N'2024-01-04T08:00:00.000' AS DateTime), N'101 Đường GHI, Quận 4')
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
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (16, N'thaopt', N'Phạm Thị Thảo', N'0987654347', CAST(N'2009-08-20' AS Date), N'thao@example.com', 0, N'246813579', NULL, N'passwordxyz', 0, 1, N'admin', N'admin', CAST(N'2024-01-20T08:00:00.000' AS DateTime), CAST(N'2024-01-20T08:00:00.000' AS DateTime), N'1717 Đường DEF, Quận 2')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (17, N'hoanv', N'Vũ Hoàng Anh', N'0987654348', CAST(N'2010-09-21' AS Date), N'hoan@example.com', 1, N'357924681', NULL, N'password123', 1, 1, N'admin', N'admin', CAST(N'2024-01-21T08:00:00.000' AS DateTime), CAST(N'2024-01-21T08:00:00.000' AS DateTime), N'1818 Đường GHI, Quận 3')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (18, N'phungt', N'Trần Văn Phụng', N'0987654349', CAST(N'2011-10-22' AS Date), N'tvphung@example.com', 1, N'468135792', NULL, N'password456', 0, 1, N'admin', N'admin', CAST(N'2024-01-22T08:00:00.000' AS DateTime), CAST(N'2024-01-22T08:00:00.000' AS DateTime), N'1919 Đường KLM, Quận 4')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (19, N'thietk', N'Kiều Thị Thanh Thúy', N'0987654350', CAST(N'2012-11-23' AS Date), N'kttthuy@example.com', 0, N'579246813', NULL, N'password789', 1, 1, N'admin', N'admin', CAST(N'2024-01-23T08:00:00.000' AS DateTime), CAST(N'2024-01-23T08:00:00.000' AS DateTime), N'2020 Đường NOP, Quận 5')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (20, N'binhan', N'Nguyễn Bình An', N'0987654351', CAST(N'2013-12-24' AS Date), N'nban@example.com', 1, N'681357924', NULL, N'passwordabc', 0, 1, N'admin', N'admin', CAST(N'2024-01-24T08:00:00.000' AS DateTime), CAST(N'2024-01-24T08:00:00.000' AS DateTime), N'2121 Đường QRS, Quận 6')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (21, N'khant', N'Trần Văn Khanh', N'0987654352', CAST(N'2014-01-25' AS Date), N'tvkhanh@example.com', 1, N'792468135', NULL, N'passwordxyz', 1, 1, N'admin', N'admin', CAST(N'2024-01-25T08:00:00.000' AS DateTime), CAST(N'2024-01-25T08:00:00.000' AS DateTime), N'2222 Đường TUV, Quận 7')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (22, N'anhpt', N'Phạm Thanh Anh', N'0987654353', CAST(N'2015-02-26' AS Date), N'pthanh@example.com', 0, N'813579246', NULL, N'password123', 0, 1, N'admin', N'admin', CAST(N'2024-01-26T08:00:00.000' AS DateTime), CAST(N'2024-01-26T08:00:00.000' AS DateTime), N'2323 Đường WXY, Quận 8')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (23, N'trungt', N'Trần Minh Trung', N'0987654354', CAST(N'2016-03-27' AS Date), N'tmtrung@example.com', 1, N'924681357', NULL, N'password456', 1, 1, N'admin', N'admin', CAST(N'2024-01-27T08:00:00.000' AS DateTime), CAST(N'2024-01-27T08:00:00.000' AS DateTime), N'2424 Đường ZAB, Quận 9')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (24, N'chauth', N'Hồ Thị Châu', N'0987654355', CAST(N'2017-04-28' AS Date), N'htchau@example.com', 0, N'135792468', NULL, N'password789', 0, 1, N'admin', N'admin', CAST(N'2024-01-28T08:00:00.000' AS DateTime), CAST(N'2024-01-28T08:00:00.000' AS DateTime), N'2525 Đường CDE, Quận 10')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (25, N'ducnt', N'Nguyễn Thanh Đức', N'0987654356', CAST(N'2018-05-29' AS Date), N'ntduc@example.com', 1, N'246813579', NULL, N'passwordabc', 1, 1, N'admin', N'admin', CAST(N'2024-01-29T08:00:00.000' AS DateTime), CAST(N'2024-01-29T08:00:00.000' AS DateTime), N'2626 Đường FGH, Quận 11')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (26, N'dungtv', N'Trần Văn Dũng', N'0987654357', CAST(N'2019-06-30' AS Date), N'tvdung@example.com', 1, N'357924681', NULL, N'passwordxyz', 0, 1, N'admin', N'admin', CAST(N'2024-01-30T08:00:00.000' AS DateTime), CAST(N'2024-01-30T08:00:00.000' AS DateTime), N'2727 Đường IJK, Quận Bình Tân')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (27, N'thanhnq', N'Nguyễn Quang Thành', N'0987654358', CAST(N'2020-07-31' AS Date), N'nqthanh@example.com', 1, N'468135792', NULL, N'password123', 1, 1, N'admin', N'admin', CAST(N'2024-01-31T08:00:00.000' AS DateTime), CAST(N'2024-01-31T08:00:00.000' AS DateTime), N'2828 Đường LMN, Quận Bình Chánh')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (28, N'hangpt', N'Phạm Thị Hằng', N'0987654359', CAST(N'2021-08-01' AS Date), N'pthang@example.com', 0, N'579246813', NULL, N'password456', 0, 1, N'admin', N'admin', CAST(N'2024-02-01T08:00:00.000' AS DateTime), CAST(N'2024-02-01T08:00:00.000' AS DateTime), N'2929 Đường OPQ, Quận Gò Vấp')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (29, N'manhhn', N'Hồ Ngọc Mạnh', N'0987654360', CAST(N'2022-09-02' AS Date), N'hnmanh@example.com', 1, N'681357924', NULL, N'password789', 1, 1, N'admin', N'admin', CAST(N'2024-02-02T08:00:00.000' AS DateTime), CAST(N'2024-02-02T08:00:00.000' AS DateTime), N'3030 Đường RST, Quận Tân Bình')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (30, N'duytk', N'Trần Khắc Duy', N'0987654361', CAST(N'2023-10-03' AS Date), N'tkduy@example.com', 1, N'792468135', NULL, N'passwordabc', 0, 1, N'admin', N'admin', CAST(N'2024-02-03T08:00:00.000' AS DateTime), CAST(N'2024-02-03T08:00:00.000' AS DateTime), N'3131 Đường UVW, Quận Tân Phú')
GO
INSERT [dbo].[nhan_vien] ([id], [ma], [ten], [sdt], [ngaySinh], [email], [gioiTinh], [cccd], [anh], [matKhau], [vaiTro], [trangThai], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [diaChi]) VALUES (31, N'hanglv', N'Lê Thị Hằng', N'0987654362', CAST(N'2024-11-04' AS Date), N'lthang@example.com', 0, N'813579246', NULL, N'passwordxyz', 1, 1, N'admin', N'admin', CAST(N'2024-02-04T08:00:00.000' AS DateTime), CAST(N'2024-02-04T08:00:00.000' AS DateTime), N'3232 Đường XYZ, Quận Thủ Đức')
GO
SET IDENTITY_INSERT [dbo].[nhan_vien] OFF
GO
SET IDENTITY_INSERT [dbo].[phieu_giam_gia] ON 
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'PGG202401', N'Phiếu giảm giá tháng 1', 100, 1, CAST(1000000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-31T23:59:59.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'PGG202402', N'Phiếu giảm giá tháng 2', 150, 0, CAST(800000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), CAST(N'2024-02-01T00:00:00.000' AS DateTime), CAST(N'2024-02-29T23:59:59.000' AS DateTime), CAST(N'2024-02-01T08:00:00.000' AS DateTime), CAST(N'2024-02-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'PGG202403', N'Phiếu giảm giá tháng 3', 120, 1, CAST(1200000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-31T23:59:59.000' AS DateTime), CAST(N'2024-03-01T08:00:00.000' AS DateTime), CAST(N'2024-03-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'PGG202404', N'Phiếu giảm giá tháng 4', 200, 0, CAST(1500000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), CAST(350000 AS Decimal(18, 0)), CAST(N'2024-04-01T00:00:00.000' AS DateTime), CAST(N'2024-04-30T23:59:59.000' AS DateTime), CAST(N'2024-04-01T08:00:00.000' AS DateTime), CAST(N'2024-04-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'PGG202405', N'Phiếu giảm giá tháng 5', 180, 1, CAST(1100000 AS Decimal(18, 0)), CAST(55000 AS Decimal(18, 0)), CAST(180000 AS Decimal(18, 0)), CAST(N'2024-05-01T00:00:00.000' AS DateTime), CAST(N'2024-05-31T23:59:59.000' AS DateTime), CAST(N'2024-05-01T08:00:00.000' AS DateTime), CAST(N'2024-05-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'PGG202406', N'Phiếu giảm giá tháng 6', 160, 0, CAST(1300000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-06-30T23:59:59.000' AS DateTime), CAST(N'2024-06-01T08:00:00.000' AS DateTime), CAST(N'2024-06-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'PGG202407', N'Phiếu giảm giá tháng 7', 140, 1, CAST(900000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), CAST(N'2024-07-01T00:00:00.000' AS DateTime), CAST(N'2024-07-31T23:59:59.000' AS DateTime), CAST(N'2024-07-01T08:00:00.000' AS DateTime), CAST(N'2024-07-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'PGG202408', N'Phiếu giảm giá tháng 8', 130, 0, CAST(1000000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-08-31T23:59:59.000' AS DateTime), CAST(N'2024-08-01T08:00:00.000' AS DateTime), CAST(N'2024-08-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'PGG202409', N'Phiếu giảm giá tháng 9', 170, 1, CAST(1400000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), CAST(280000 AS Decimal(18, 0)), CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-09-30T23:59:59.000' AS DateTime), CAST(N'2024-09-01T08:00:00.000' AS DateTime), CAST(N'2024-09-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'PGG202410', N'Phiếu giảm giá tháng 10', 190, 0, CAST(1600000 AS Decimal(18, 0)), CAST(85000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-10-31T23:59:59.000' AS DateTime), CAST(N'2024-10-01T08:00:00.000' AS DateTime), CAST(N'2024-10-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'PGG202411', N'Phiếu giảm giá tháng 11', 110, 1, CAST(950000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(170000 AS Decimal(18, 0)), CAST(N'2024-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-30T23:59:59.000' AS DateTime), CAST(N'2024-11-01T08:00:00.000' AS DateTime), CAST(N'2024-11-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'PGG202412', N'Phiếu giảm giá tháng 12', 125, 0, CAST(1100000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2024-12-01T00:00:00.000' AS DateTime), CAST(N'2024-12-31T23:59:59.000' AS DateTime), CAST(N'2024-12-01T08:00:00.000' AS DateTime), CAST(N'2024-12-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'PGG202501', N'Phiếu giảm giá tháng 1/2025', 105, 1, CAST(800000 AS Decimal(18, 0)), CAST(40000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), CAST(N'2025-01-01T00:00:00.000' AS DateTime), CAST(N'2025-01-31T23:59:59.000' AS DateTime), CAST(N'2025-01-01T08:00:00.000' AS DateTime), CAST(N'2025-01-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'PGG202502', N'Phiếu giảm giá tháng 2/2025', 135, 0, CAST(1200000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), CAST(N'2025-02-01T00:00:00.000' AS DateTime), CAST(N'2025-02-28T23:59:59.000' AS DateTime), CAST(N'2025-02-01T08:00:00.000' AS DateTime), CAST(N'2025-02-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'PGG202503', N'Phiếu giảm giá tháng 3/2025', 115, 1, CAST(900000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), CAST(180000 AS Decimal(18, 0)), CAST(N'2025-03-01T00:00:00.000' AS DateTime), CAST(N'2025-03-31T23:59:59.000' AS DateTime), CAST(N'2025-03-01T08:00:00.000' AS DateTime), CAST(N'2025-03-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'PGG202504', N'Phiếu giảm giá tháng 4/2025', 155, 0, CAST(1400000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), CAST(N'2025-04-01T00:00:00.000' AS DateTime), CAST(N'2025-04-30T23:59:59.000' AS DateTime), CAST(N'2025-04-01T08:00:00.000' AS DateTime), CAST(N'2025-04-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, N'PGG202505', N'Phiếu giảm giá tháng 5/2025', 145, 1, CAST(1000000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2025-05-01T00:00:00.000' AS DateTime), CAST(N'2025-05-31T23:59:59.000' AS DateTime), CAST(N'2025-05-01T08:00:00.000' AS DateTime), CAST(N'2025-05-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, N'PGG202506', N'Phiếu giảm giá tháng 6/2025', 175, 0, CAST(1600000 AS Decimal(18, 0)), CAST(90000 AS Decimal(18, 0)), CAST(350000 AS Decimal(18, 0)), CAST(N'2025-06-01T00:00:00.000' AS DateTime), CAST(N'2025-06-30T23:59:59.000' AS DateTime), CAST(N'2025-06-01T08:00:00.000' AS DateTime), CAST(N'2025-06-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, N'PGG202507', N'Phiếu giảm giá tháng 7/2025', 195, 1, CAST(1200000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), CAST(N'2025-07-01T00:00:00.000' AS DateTime), CAST(N'2025-07-31T23:59:59.000' AS DateTime), CAST(N'2025-07-01T08:00:00.000' AS DateTime), CAST(N'2025-07-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, N'PGG202508', N'Phiếu giảm giá tháng 8/2025', 185, 0, CAST(1400000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), CAST(280000 AS Decimal(18, 0)), CAST(N'2025-08-01T00:00:00.000' AS DateTime), CAST(N'2025-08-31T23:59:59.000' AS DateTime), CAST(N'2025-08-01T08:00:00.000' AS DateTime), CAST(N'2025-08-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, N'PGG202509', N'Phiếu giảm giá tháng 9/2025', 115, 1, CAST(900000 AS Decimal(18, 0)), CAST(40000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), CAST(N'2025-09-01T00:00:00.000' AS DateTime), CAST(N'2025-09-30T23:59:59.000' AS DateTime), CAST(N'2025-09-01T08:00:00.000' AS DateTime), CAST(N'2025-09-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, N'PGG202510', N'Phiếu giảm giá tháng 10/2025', 125, 0, CAST(1000000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2025-10-01T00:00:00.000' AS DateTime), CAST(N'2025-10-31T23:59:59.000' AS DateTime), CAST(N'2025-10-01T08:00:00.000' AS DateTime), CAST(N'2025-10-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, N'PGG202511', N'Phiếu giảm giá tháng 11/2025', 165, 1, CAST(1300000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), CAST(N'2025-11-01T00:00:00.000' AS DateTime), CAST(N'2025-11-30T23:59:59.000' AS DateTime), CAST(N'2025-11-01T08:00:00.000' AS DateTime), CAST(N'2025-11-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, N'PGG202512', N'Phiếu giảm giá tháng 12/2025', 145, 0, CAST(1100000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), CAST(N'2025-12-01T00:00:00.000' AS DateTime), CAST(N'2025-12-31T23:59:59.000' AS DateTime), CAST(N'2025-12-01T08:00:00.000' AS DateTime), CAST(N'2025-12-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, N'PGG202601', N'Phiếu giảm giá tháng 1/2026', 155, 1, CAST(1200000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), CAST(N'2026-01-01T00:00:00.000' AS DateTime), CAST(N'2026-01-31T23:59:59.000' AS DateTime), CAST(N'2026-01-01T08:00:00.000' AS DateTime), CAST(N'2026-01-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (26, N'PGG202602', N'Phiếu giảm giá tháng 2/2026', 185, 0, CAST(1400000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), CAST(280000 AS Decimal(18, 0)), CAST(N'2026-02-01T00:00:00.000' AS DateTime), CAST(N'2026-02-28T23:59:59.000' AS DateTime), CAST(N'2026-02-01T08:00:00.000' AS DateTime), CAST(N'2026-02-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (27, N'PGG202603', N'Phiếu giảm giá tháng 3/2026', 165, 1, CAST(1300000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), CAST(270000 AS Decimal(18, 0)), CAST(N'2026-03-01T00:00:00.000' AS DateTime), CAST(N'2026-03-31T23:59:59.000' AS DateTime), CAST(N'2026-03-01T08:00:00.000' AS DateTime), CAST(N'2026-03-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (28, N'PGG202604', N'Phiếu giảm giá tháng 4/2026', 195, 0, CAST(1500000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), CAST(N'2026-04-01T00:00:00.000' AS DateTime), CAST(N'2026-04-30T23:59:59.000' AS DateTime), CAST(N'2026-04-01T08:00:00.000' AS DateTime), CAST(N'2026-04-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (29, N'PGG202605', N'Phiếu giảm giá tháng 5/2026', 175, 1, CAST(1400000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), CAST(280000 AS Decimal(18, 0)), CAST(N'2026-05-01T00:00:00.000' AS DateTime), CAST(N'2026-05-31T23:59:59.000' AS DateTime), CAST(N'2026-05-01T08:00:00.000' AS DateTime), CAST(N'2026-05-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phieu_giam_gia] ([id], [ma], [ten], [soLuong], [hinhThucGiam], [donToiThieu], [giaTriGiam], [giamToiDa], [ngayBatdau], [ngayKetThuc], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (30, N'PGG202606', N'Phiếu giảm giá tháng 6/2026', 115, 0, CAST(900000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), CAST(N'2026-06-01T00:00:00.000' AS DateTime), CAST(N'2026-06-30T23:59:59.000' AS DateTime), CAST(N'2026-06-01T08:00:00.000' AS DateTime), CAST(N'2026-06-01T08:00:00.000' AS DateTime), N'1', N'1', 1)
GO
SET IDENTITY_INSERT [dbo].[phieu_giam_gia] OFF
GO
SET IDENTITY_INSERT [dbo].[phuong_thuc_thanh_toan] ON 
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, 1, N'Tiền mặt', 1, N'Ghi chú 1', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, 2, N'Tiền mặt', 1, N'Ghi chú 2', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, 3, N'Tiền mặt', 1, N'Ghi chú 3', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, 4, N'Tiền mặt', 1, N'Ghi chú 4', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, 5, N'Tiền mặt', 1, N'Ghi chú 5', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, 6, N'Tiền mặt', 1, N'Ghi chú 6', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, 7, N'Tiền mặt', 1, N'Ghi chú 7', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, 8, N'Tiền mặt', 1, N'Ghi chú 8', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, 9, N'Tiền mặt', 1, N'Ghi chú 9', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, 10, N'Tiền mặt', 1, N'Ghi chú 10', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, 11, N'Tiền mặt', 1, N'Ghi chú 11', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, 12, N'Tiền mặt', 1, N'Ghi chú 12', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, 13, N'Tiền mặt', 1, N'Ghi chú 13', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, 14, N'Tiền mặt', 1, N'Ghi chú 14', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, 15, N'Tiền mặt', 1, N'Ghi chú 15', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, 16, N'Tiền mặt', 1, N'Ghi chú 16', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, 17, N'Tiền mặt', 1, N'Ghi chú 17', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, 18, N'Tiền mặt', 1, N'Ghi chú 18', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, 19, N'Tiền mặt', 1, N'Ghi chú 19', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, 20, N'Tiền mặt', 1, N'Ghi chú 20', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, 21, N'Tiền mặt', 1, N'Ghi chú 21', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, 22, N'Tiền mặt', 1, N'Ghi chú 22', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, 23, N'Tiền mặt', 1, N'Ghi chú 23', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, 24, N'Tiền mặt', 1, N'Ghi chú 24', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, 25, N'Tiền mặt', 1, N'Ghi chú 25', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (26, 26, N'Tiền mặt', 1, N'Ghi chú 26', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (27, 27, N'Tiền mặt', 1, N'Ghi chú 27', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (28, 28, N'Tiền mặt', 1, N'Ghi chú 28', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (29, 29, N'Tiền mặt', 1, N'Ghi chú 29', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
INSERT [dbo].[phuong_thuc_thanh_toan] ([id], [idHoaDon], [tenThanhToan], [loaiThanhToan], [ghiChu], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (30, 30, N'Tiền mặt', 1, N'Ghi chú 30', CAST(N'2024-08-23T01:55:52.147' AS DateTime), CAST(N'2024-08-23T01:55:52.147' AS DateTime), N'1', N'1', 1)
GO
SET IDENTITY_INSERT [dbo].[phuong_thuc_thanh_toan] OFF
GO
SET IDENTITY_INSERT [dbo].[san_pham] ON 
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (1, N'Nike Air Force 1', 1, NULL, N'Giày thể thao phổ biến của Nike', CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (2, N'Adidas Ultraboost 22', 2, NULL, N'Giày chạy bộ hiệu suất cao của Adidas', CAST(N'2024-01-02T08:00:00.000' AS DateTime), CAST(N'2024-01-02T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (3, N'Converse Chuck Taylor All Star', 3, NULL, N'Giày vải cổ điển của Converse', CAST(N'2024-01-03T08:00:00.000' AS DateTime), CAST(N'2024-01-03T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (4, N'Puma Suede Classic', 4, NULL, N'Mẫu giày cổ điển của Puma', CAST(N'2024-01-04T08:00:00.000' AS DateTime), CAST(N'2024-01-04T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (5, N'Vans Old Skool', 5, NULL, N'Mẫu giày trượt ván biểu tượng của Vans', CAST(N'2024-01-05T08:00:00.000' AS DateTime), CAST(N'2024-01-05T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (6, N'New Balance 574', 6, NULL, N'Giày thể thao phong cách của New Balance', CAST(N'2024-01-06T08:00:00.000' AS DateTime), CAST(N'2024-01-06T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (7, N'Reebok Club C 85', 7, NULL, N'Mẫu giày thể thao cổ điển của Reebok', CAST(N'2024-01-07T08:00:00.000' AS DateTime), CAST(N'2024-01-07T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (8, N'Asics Gel-Kayano 29', 8, NULL, N'Giày chạy bộ hỗ trợ của Asics', CAST(N'2024-01-08T08:00:00.000' AS DateTime), CAST(N'2024-01-08T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (9, N'Jordan 1 Retro High', 9, NULL, N'Mẫu giày bóng rổ nổi tiếng của Jordan', CAST(N'2024-01-09T08:00:00.000' AS DateTime), CAST(N'2024-01-09T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (10, N'Fila Disruptor II', 10, NULL, N'Giày thể thao thời trang của Fila', CAST(N'2024-01-10T08:00:00.000' AS DateTime), CAST(N'2024-01-10T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (11, N'Skechers D’Lites', 11, NULL, N'Giày thể thao đế dày của Skechers', CAST(N'2024-01-11T08:00:00.000' AS DateTime), CAST(N'2024-01-11T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (12, N'Saucony Jazz Original', 12, NULL, N'Giày thể thao cổ điển của Saucony', CAST(N'2024-01-12T08:00:00.000' AS DateTime), CAST(N'2024-01-12T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (13, N'Under Armour HOVR Phantom 2', 13, NULL, N'Giày chạy bộ hiệu suất cao của Under Armour', CAST(N'2024-01-13T08:00:00.000' AS DateTime), CAST(N'2024-01-13T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (14, N'Balenciaga Triple S', 14, NULL, N'Giày thể thao đế dày cao cấp của Balenciaga', CAST(N'2024-01-14T08:00:00.000' AS DateTime), CAST(N'2024-01-14T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (15, N'Gucci Ace Sneaker', 15, NULL, N'Giày thể thao thời trang cao cấp của Gucci', CAST(N'2024-01-15T08:00:00.000' AS DateTime), CAST(N'2024-01-15T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (16, N'Common Projects Achilles Low', 16, NULL, N'Giày thể thao tối giản của Common Projects', CAST(N'2024-01-16T08:00:00.000' AS DateTime), CAST(N'2024-01-16T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (17, N'Golden Goose Superstar', 17, NULL, N'Giày thể thao thời trang đặc trưng của Golden Goose', CAST(N'2024-01-17T08:00:00.000' AS DateTime), CAST(N'2024-01-17T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (18, N'Onitsuka Tiger Mexico 66', 18, NULL, N'Mẫu giày cổ điển của Onitsuka Tiger', CAST(N'2024-01-18T08:00:00.000' AS DateTime), CAST(N'2024-01-18T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (19, N'Hoka One One Bondi 7', 19, NULL, N'Giày chạy bộ đệm dày của Hoka One One', CAST(N'2024-01-19T08:00:00.000' AS DateTime), CAST(N'2024-01-19T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (20, N'Lacoste Carnaby Evo', 20, NULL, N'Giày thể thao phong cách của Lacoste', CAST(N'2024-01-20T08:00:00.000' AS DateTime), CAST(N'2024-01-20T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (21, N'Timberland 6-Inch Premium Boot', 21, NULL, N'Giày boot cổ điển của Timberland', CAST(N'2024-01-21T08:00:00.000' AS DateTime), CAST(N'2024-01-21T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (22, N'Toms Alpargata', 22, NULL, N'Giày vải thoải mái của Toms', CAST(N'2024-01-22T08:00:00.000' AS DateTime), CAST(N'2024-01-22T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (23, N'Ugg Classic Mini II', 23, NULL, N'Giày boot da cừu của Ugg', CAST(N'2024-01-23T08:00:00.000' AS DateTime), CAST(N'2024-01-23T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (24, N'Superga 2750 Cotu Classic', 24, NULL, N'Giày thể thao vải của Superga', CAST(N'2024-01-24T08:00:00.000' AS DateTime), CAST(N'2024-01-24T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (25, N'Birkenstock Arizona', 25, NULL, N'Dép sandal nổi tiếng của Birkenstock', CAST(N'2024-01-25T08:00:00.000' AS DateTime), CAST(N'2024-01-25T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (26, N'Veja V-10', 26, NULL, N'Giày thể thao thân thiện môi trường của Veja', CAST(N'2024-01-26T08:00:00.000' AS DateTime), CAST(N'2024-01-26T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (27, N'New Balance 990v5', 27, NULL, N'Giày thể thao phong cách của New Balance', CAST(N'2024-01-27T08:00:00.000' AS DateTime), CAST(N'2024-01-27T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (28, N'Tehva Original Universal', 28, NULL, N'Dép sandal tiện dụng của Tehva', CAST(N'2024-01-28T08:00:00.000' AS DateTime), CAST(N'2024-01-28T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (29, N'Cole Haan Original Grand', 29, NULL, N'Giày tây thể thao lịch lãm của Cole Haan', CAST(N'2024-01-29T08:00:00.000' AS DateTime), CAST(N'2024-01-29T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
INSERT [dbo].[san_pham] ([id], [ten], [idThuongHieu], [soLuong], [moTa], [ngayTao], [ngayCapNhat], [nguoiTao], [nguoiCapNhat], [trangThai]) VALUES (30, N'Clarks Wallabee', 30, NULL, N'Giày lười cổ điển của Clarks', CAST(N'2024-01-30T08:00:00.000' AS DateTime), CAST(N'2024-01-30T08:00:00.000' AS DateTime), N'admin', N'admin', 1)
GO
SET IDENTITY_INSERT [dbo].[san_pham] OFF
GO
SET IDENTITY_INSERT [dbo].[san_pham_chi_tiet] ON 
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (1, N'MA001', N'Nike Air Max 1', 100, N'1234567890101                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/baavy2lphangr8rzsivl', CAST(800000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 1', 400, CAST(N'2024-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-01-01T08:00:00.000' AS DateTime), CAST(N'2024-01-01T08:00:00.000' AS DateTime), 1, 1, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (2, N'MA002', N'Nike Air Max 270', 120, N'1234567890102                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/baavy2lphangr8rzsivl', CAST(850000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 270', 420, CAST(N'2024-01-10T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-01-10T08:00:00.000' AS DateTime), CAST(N'2024-01-10T08:00:00.000' AS DateTime), 2, 1, 2, 2, 1, 2, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (3, N'MA003', N'Nike Air Force 1', 150, N'1234567890103                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/baavy2lphangr8rzsivl', CAST(900000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Force 1', 430, CAST(N'2024-01-20T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-01-20T08:00:00.000' AS DateTime), CAST(N'2024-01-20T08:00:00.000' AS DateTime), 3, 1, 3, 3, 1, 3, 3, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (4, N'MA004', N'Puma RS-X', 130, N'1234567890104                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/udnxjtxdtwfqx4dx1udy', CAST(750000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X', 310, CAST(N'2024-01-30T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-01-30T08:00:00.000' AS DateTime), CAST(N'2024-01-30T08:00:00.000' AS DateTime), 4, 2, 4, 4, 2, 4, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (5, N'MA005', N'Puma Suede Classic', 140, N'1234567890105                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/udnxjtxdtwfqx4dx1udy', CAST(700000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Suede Classic', 320, CAST(N'2024-02-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-02-05T08:00:00.000' AS DateTime), CAST(N'2024-02-05T08:00:00.000' AS DateTime), 5, 2, 5, 5, 2, 5, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (6, N'MA006', N'Nike SB Dunk Low', 160, N'1234567890106                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/udnxjtxdtwfqx4dx1udy', CAST(950000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike SB Dunk Low', 440, CAST(N'2024-02-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-02-15T08:00:00.000' AS DateTime), CAST(N'2024-02-15T08:00:00.000' AS DateTime), 6, 2, 6, 6, 2, 6, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (7, N'MA007', N'Puma Future Rider', 170, N'1234567890107                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/sv5by0nan2buq8gkabnj', CAST(780000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Future Rider', 350, CAST(N'2024-02-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-02-25T08:00:00.000' AS DateTime), CAST(N'2024-02-25T08:00:00.000' AS DateTime), 7, 4, 7, 7, 3, 7, 7, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (8, N'MA008', N'Nike React Element 55', 180, N'1234567890108                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/sv5by0nan2buq8gkabnj', CAST(870000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike React Element 55', 460, CAST(N'2024-03-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-03-05T08:00:00.000' AS DateTime), CAST(N'2024-03-05T08:00:00.000' AS DateTime), 8, 4, 8, 8, 3, 8, 8, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (9, N'MA009', N'Puma Clyde', 190, N'1234567890109                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/sv5by0nan2buq8gkabnj', CAST(820000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Clyde', 470, CAST(N'2024-03-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-03-15T08:00:00.000' AS DateTime), CAST(N'2024-03-15T08:00:00.000' AS DateTime), 9, 4, 9, 9, 3, 9, 9, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (10, N'MA010', N'Nike Air Zoom Pegasus 37', 200, N'1234567890110                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/sv5by0nan2buq8gkabnj', CAST(900000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Zoom Pegasus 37', 480, CAST(N'2024-03-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-03-25T08:00:00.000' AS DateTime), CAST(N'2024-03-25T08:00:00.000' AS DateTime), 10, 4, 10, 10, 3, 10, 10, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (11, N'MA011', N'Puma RS 2K', 210, N'1234567890111                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/sv5by0nan2buq8gkabnj', CAST(740000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS 2K', 490, CAST(N'2024-04-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-04-05T08:00:00.000' AS DateTime), CAST(N'2024-04-05T08:00:00.000' AS DateTime), 11, 4, 11, 11, 3, 11, 11, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (12, N'MA012', N'Nike Air Max 97', 220, N'1234567890112                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/xdhldhnqoxctj5b2i06s', CAST(950000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 97', 500, CAST(N'2024-04-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-04-15T08:00:00.000' AS DateTime), CAST(N'2024-04-15T08:00:00.000' AS DateTime), 12, 6, 12, 12, 4, 12, 12, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (13, N'MA013', N'Puma Thunder Spectra', 230, N'1234567890113                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/xdhldhnqoxctj5b2i06s', CAST(790000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Thunder Spectra', 510, CAST(N'2024-04-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-04-25T08:00:00.000' AS DateTime), CAST(N'2024-04-25T08:00:00.000' AS DateTime), 13, 6, 13, 13, 4, 13, 13, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (14, N'MA014', N'Nike Air Max Plus', 240, N'1234567890114                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/xdhldhnqoxctj5b2i06s', CAST(870000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max Plus', 520, CAST(N'2024-05-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-05-05T08:00:00.000' AS DateTime), CAST(N'2024-05-05T08:00:00.000' AS DateTime), 14, 6, 14, 14, 4, 14, 14, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (15, N'MA015', N'Puma Cali', 250, N'1234567890115                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/xdhldhnqoxctj5b2i06s', CAST(800000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Cali', 530, CAST(N'2024-05-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-05-15T08:00:00.000' AS DateTime), CAST(N'2024-05-15T08:00:00.000' AS DateTime), 15, 6, 15, 15, 4, 15, 15, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (16, N'MA016', N'Nike Air Max 2090', 260, N'1234567890116                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/shxv7cn16hbdzjfxzh9x', CAST(920000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 2090', 540, CAST(N'2024-05-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-05-25T08:00:00.000' AS DateTime), CAST(N'2024-05-25T08:00:00.000' AS DateTime), 16, 8, 16, 16, 5, 16, 16, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (17, N'MA017', N'Puma Roma', 270, N'1234567890117                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/shxv7cn16hbdzjfxzh9x', CAST(710000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Roma', 550, CAST(N'2024-06-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-06-05T08:00:00.000' AS DateTime), CAST(N'2024-06-05T08:00:00.000' AS DateTime), 17, 8, 17, 17, 5, 17, 17, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (18, N'MA018', N'Nike Air Huarache', 280, N'1234567890118                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/shxv7cn16hbdzjfxzh9x', CAST(890000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Huarache', 560, CAST(N'2024-06-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-06-15T08:00:00.000' AS DateTime), CAST(N'2024-06-15T08:00:00.000' AS DateTime), 18, 8, 18, 18, 5, 18, 18, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (19, N'MA019', N'Puma Ignite', 290, N'1234567890119                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/shxv7cn16hbdzjfxzh9x', CAST(830000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Ignite', 570, CAST(N'2024-06-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-06-25T08:00:00.000' AS DateTime), CAST(N'2024-06-25T08:00:00.000' AS DateTime), 19, 8, 19, 19, 5, 19, 19, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (20, N'MA020', N'Nike Air Zoom Structure', 300, N'1234567890120                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/shxv7cn16hbdzjfxzh9x', CAST(910000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Zoom Structure', 580, CAST(N'2024-07-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-05T08:00:00.000' AS DateTime), CAST(N'2024-07-05T08:00:00.000' AS DateTime), 1, 8, 20, 20, 5, 20, 20, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (21, N'MA021', N'Puma Slipstream', 310, N'1234567890121                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/shxv7cn16hbdzjfxzh9x', CAST(770000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Slipstream', 590, CAST(N'2024-07-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-15T08:00:00.000' AS DateTime), CAST(N'2024-07-15T08:00:00.000' AS DateTime), 2, 8, 21, 21, 5, 21, 21, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (22, N'MA022', N'Nike Air Max 720', 320, N'1234567890122                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/rzynr8ehiar7wvhiezlg', CAST(930000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 720', 600, CAST(N'2024-07-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-07-25T08:00:00.000' AS DateTime), CAST(N'2024-07-25T08:00:00.000' AS DateTime), 3, 8, 22, 22, 6, 22, 22, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (23, N'MA023', N'Puma Basket Heart', 330, N'1234567890123                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/rzynr8ehiar7wvhiezlg', CAST(820000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Basket Heart', 610, CAST(N'2024-08-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-05T08:00:00.000' AS DateTime), CAST(N'2024-08-05T08:00:00.000' AS DateTime), 4, 8, 23, 23, 6, 23, 23, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (24, N'MA024', N'Nike Air Max 90', 340, N'1234567890124                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/rzynr8ehiar7wvhiezlg', CAST(880000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 90', 620, CAST(N'2024-08-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-15T08:00:00.000' AS DateTime), CAST(N'2024-08-15T08:00:00.000' AS DateTime), 5, 8, 24, 24, 6, 24, 24, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (25, N'MA025', N'Puma Cali Bold', 350, N'1234567890125                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/yuijr9oiczfobvkjocyi', CAST(790000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Cali Bold', 630, CAST(N'2024-08-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-08-25T08:00:00.000' AS DateTime), CAST(N'2024-08-25T08:00:00.000' AS DateTime), 6, 15, 25, 25, 7, 25, 25, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (26, N'MA026', N'Nike Air Max 200', 360, N'1234567890126                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/yuijr9oiczfobvkjocyi', CAST(910000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 200', 640, CAST(N'2024-09-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-09-05T08:00:00.000' AS DateTime), CAST(N'2024-09-05T08:00:00.000' AS DateTime), 7, 15, 26, 26, 7, 26, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (27, N'MA027', N'Puma RS 9.8', 370, N'1234567890127                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/yuijr9oiczfobvkjocyi', CAST(740000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS 9.8', 650, CAST(N'2024-09-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-09-15T08:00:00.000' AS DateTime), CAST(N'2024-09-15T08:00:00.000' AS DateTime), 8, 15, 27, 27, 7, 27, 27, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (28, N'MA028', N'Nike Air Max 95', 380, N'1234567890128                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/yuijr9oiczfobvkjocyi', CAST(940000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 95', 660, CAST(N'2024-09-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-09-25T08:00:00.000' AS DateTime), CAST(N'2024-09-25T08:00:00.000' AS DateTime), 9, 15, 28, 28, 7, 28, 28, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (29, N'MA029', N'Puma Ultra', 390, N'1234567890129                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/yuijr9oiczfobvkjocyi', CAST(780000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Ultra', 670, CAST(N'2024-10-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-10-05T08:00:00.000' AS DateTime), CAST(N'2024-10-05T08:00:00.000' AS DateTime), 10, 15, 29, 29, 7, 29, 29, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (30, N'MA030', N'Nike Air Zoom Fly', 400, N'1234567890130                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/yuijr9oiczfobvkjocyi', CAST(960000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Zoom Fly', 680, CAST(N'2024-10-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-10-15T08:00:00.000' AS DateTime), CAST(N'2024-10-15T08:00:00.000' AS DateTime), 11, 15, 30, 30, 7, 30, 30, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (31, N'MA031', N'Nike Air Max 1', 110, N'1234567890131                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/yuijr9oiczfobvkjocyi', CAST(810000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 1', 405, CAST(N'2024-10-20T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-10-20T08:00:00.000' AS DateTime), CAST(N'2024-10-20T08:00:00.000' AS DateTime), 1, 15, 1, 1, 7, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (32, N'MA032', N'Nike Air Max 270', 130, N'1234567890132                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/tbs9wm76rflvxugxiatx', CAST(860000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 270', 425, CAST(N'2024-10-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-10-25T08:00:00.000' AS DateTime), CAST(N'2024-10-25T08:00:00.000' AS DateTime), 2, 16, 2, 2, 7, 2, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (33, N'MA033', N'Nike Air Force 1', 140, N'1234567890133                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/tbs9wm76rflvxugxiatx', CAST(910000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Force 1', 435, CAST(N'2024-11-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-11-05T08:00:00.000' AS DateTime), CAST(N'2024-11-05T08:00:00.000' AS DateTime), 3, 16, 3, 3, 7, 3, 3, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (34, N'MA034', N'Puma RS-X', 150, N'1234567890134                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/tbs9wm76rflvxugxiatx', CAST(760000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X', 315, CAST(N'2024-11-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-11-15T08:00:00.000' AS DateTime), CAST(N'2024-11-15T08:00:00.000' AS DateTime), 4, 16, 4, 4, 7, 4, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (35, N'MA035', N'Puma Suede Classic', 160, N'1234567890135                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/tbs9wm76rflvxugxiatx', CAST(710000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Suede Classic', 325, CAST(N'2024-11-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-11-25T08:00:00.000' AS DateTime), CAST(N'2024-11-25T08:00:00.000' AS DateTime), 5, 16, 5, 5, 7, 5, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (36, N'MA036', N'Nike SB Dunk Low', 170, N'1234567890136                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/tbs9wm76rflvxugxiatx', CAST(960000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike SB Dunk Low', 445, CAST(N'2024-12-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-12-05T08:00:00.000' AS DateTime), CAST(N'2024-12-05T08:00:00.000' AS DateTime), 6, 16, 6, 6, 7, 6, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (37, N'MA037', N'Puma Future Rider', 180, N'1234567890137                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/tbs9wm76rflvxugxiatx', CAST(790000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Future Rider', 355, CAST(N'2024-12-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-12-15T08:00:00.000' AS DateTime), CAST(N'2024-12-15T08:00:00.000' AS DateTime), 7, 16, 7, 7, 7, 7, 7, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (38, N'MA038', N'Nike React Element 55', 190, N'1234567890138                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/xhryemywsu7ihv3ctlfa', CAST(880000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike React Element 55', 465, CAST(N'2024-12-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2024-12-25T08:00:00.000' AS DateTime), CAST(N'2024-12-25T08:00:00.000' AS DateTime), 8, 28, 8, 8, 8, 8, 8, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (39, N'MA039', N'Puma Clyde', 200, N'1234567890139                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/xhryemywsu7ihv3ctlfa', CAST(830000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Clyde', 470, CAST(N'2025-01-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-01-05T08:00:00.000' AS DateTime), CAST(N'2025-01-05T08:00:00.000' AS DateTime), 9, 28, 9, 9, 8, 9, 9, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (40, N'MA040', N'Nike Air Zoom Pegasus 37', 210, N'1234567890140                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/xhryemywsu7ihv3ctlfa', CAST(920000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Zoom Pegasus 37', 480, CAST(N'2025-01-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-01-15T08:00:00.000' AS DateTime), CAST(N'2025-01-15T08:00:00.000' AS DateTime), 10, 29, 10, 10, 8, 10, 10, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (41, N'MA041', N'Puma RS 2K', 220, N'1234567890141                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/mxaqxectzzx5y87dyy4w', CAST(740000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS 2K', 490, CAST(N'2025-01-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-01-25T08:00:00.000' AS DateTime), CAST(N'2025-01-25T08:00:00.000' AS DateTime), 11, 11, 11, 11, 9, 11, 11, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (42, N'MA042', N'Nike Air Max 97', 230, N'1234567890142                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/mxaqxectzzx5y87dyy4w', CAST(960000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 97', 500, CAST(N'2025-02-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-02-05T08:00:00.000' AS DateTime), CAST(N'2025-02-05T08:00:00.000' AS DateTime), 12, 11, 12, 12, 9, 12, 12, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (43, N'MA043', N'Puma Thunder Spectra', 240, N'1234567890143                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/mxaqxectzzx5y87dyy4w', CAST(800000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Thunder Spectra', 510, CAST(N'2025-02-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-02-15T08:00:00.000' AS DateTime), CAST(N'2025-02-15T08:00:00.000' AS DateTime), 13, 11, 13, 13, 9, 13, 13, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (44, N'MA044', N'Nike Air Max Plus', 250, N'1234567890144                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/mxaqxectzzx5y87dyy4w', CAST(890000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max Plus', 520, CAST(N'2025-02-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-02-25T08:00:00.000' AS DateTime), CAST(N'2025-02-25T08:00:00.000' AS DateTime), 14, 11, 14, 14, 9, 14, 14, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (45, N'MA045', N'Puma Cali', 260, N'1234567890145                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/mxaqxectzzx5y87dyy4w', CAST(810000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Cali', 530, CAST(N'2025-03-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-03-05T08:00:00.000' AS DateTime), CAST(N'2025-03-05T08:00:00.000' AS DateTime), 15, 11, 15, 15, 9, 15, 15, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (46, N'MA046', N'Nike Air Max 2090', 270, N'1234567890146                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ef5dauf53l7ndlbxqgsp', CAST(930000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 2090', 540, CAST(N'2025-03-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-03-15T08:00:00.000' AS DateTime), CAST(N'2025-03-15T08:00:00.000' AS DateTime), 16, 16, 16, 16, 10, 16, 16, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (47, N'MA047', N'Puma Slipstream Lo', 280, N'1234567890147                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ef5dauf53l7ndlbxqgsp', CAST(750000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Slipstream Lo', 550, CAST(N'2025-03-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-03-25T08:00:00.000' AS DateTime), CAST(N'2025-03-25T08:00:00.000' AS DateTime), 17, 16, 17, 17, 10, 17, 17, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (48, N'MA048', N'Nike Air Max 1 Premium', 290, N'1234567890148                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/cglbjzqzh4sheeiyor3z', CAST(920000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 1 Premium', 560, CAST(N'2025-04-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-04-05T08:00:00.000' AS DateTime), CAST(N'2025-04-05T08:00:00.000' AS DateTime), 18, 18, 18, 18, 11, 18, 18, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (49, N'MA049', N'Puma Thunder', 300, N'1234567890149                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/cglbjzqzh4sheeiyor3z', CAST(780000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Thunder', 570, CAST(N'2025-04-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-04-15T08:00:00.000' AS DateTime), CAST(N'2025-04-15T08:00:00.000' AS DateTime), 19, 18, 19, 19, 11, 19, 19, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (50, N'MA050', N'Nike Air Zoom', 310, N'1234567890150                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/cglbjzqzh4sheeiyor3z', CAST(960000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Zoom', 580, CAST(N'2025-04-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-04-25T08:00:00.000' AS DateTime), CAST(N'2025-04-25T08:00:00.000' AS DateTime), 1, 18, 20, 20, 11, 20, 20, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (51, N'MA051', N'Puma RS-9', 320, N'1234567890151                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/crn89mnaewwryjln884y', CAST(740000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-9', 590, CAST(N'2025-05-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-05-05T08:00:00.000' AS DateTime), CAST(N'2025-05-05T08:00:00.000' AS DateTime), 2, 21, 22, 21, 12, 21, 21, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (52, N'MA052', N'Nike Air Max 270 React', 330, N'1234567890152                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/crn89mnaewwryjln884y', CAST(900000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 270 React', 600, CAST(N'2025-05-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-05-15T08:00:00.000' AS DateTime), CAST(N'2025-05-15T08:00:00.000' AS DateTime), 3, 22, 22, 22, 12, 22, 22, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (53, N'MA053', N'Puma Trailfox', 340, N'1234567890153                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/crn89mnaewwryjln884y', CAST(780000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Trailfox', 610, CAST(N'2025-05-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-05-25T08:00:00.000' AS DateTime), CAST(N'2025-05-25T08:00:00.000' AS DateTime), 4, 23, 22, 23, 12, 23, 23, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (54, N'MA054', N'Nike Air Max 1', 350, N'1234567890154                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/crn89mnaewwryjln884y', CAST(950000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 1', 620, CAST(N'2025-06-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-06-05T08:00:00.000' AS DateTime), CAST(N'2025-06-05T08:00:00.000' AS DateTime), 5, 24, 22, 24, 12, 24, 24, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (55, N'MA055', N'Puma RS', 360, N'1234567890155                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/crn89mnaewwryjln884y', CAST(760000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS', 630, CAST(N'2025-06-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-06-15T08:00:00.000' AS DateTime), CAST(N'2025-06-15T08:00:00.000' AS DateTime), 15, 25, 22, 25, 12, 25, 25, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (56, N'MA056', N'Nike Air VaporMax', 370, N'1234567890156                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ql5do62og6fmqpizwpuz', CAST(940000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air VaporMax', 640, CAST(N'2025-06-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-06-25T08:00:00.000' AS DateTime), CAST(N'2025-06-25T08:00:00.000' AS DateTime), 6, 26, 26, 26, 12, 26, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (57, N'MA057', N'Puma Clyde Court', 380, N'1234567890157                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ql5do62og6fmqpizwpuz', CAST(850000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Clyde Court', 650, CAST(N'2025-07-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-07-05T08:00:00.000' AS DateTime), CAST(N'2025-07-05T08:00:00.000' AS DateTime), 7, 26, 27, 27, 12, 27, 27, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (58, N'MA058', N'Nike Air Force 1 Low', 390, N'1234567890158                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ql5do62og6fmqpizwpuz', CAST(900000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Force 1 Low', 660, CAST(N'2025-07-15T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-07-15T08:00:00.000' AS DateTime), CAST(N'2025-07-15T08:00:00.000' AS DateTime), 8, 26, 28, 28, 12, 28, 28, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (59, N'MA059', N'Puma Smash', 400, N'1234567890159                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ql5do62og6fmqpizwpuz', CAST(720000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Smash', 670, CAST(N'2025-07-25T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-07-25T08:00:00.000' AS DateTime), CAST(N'2025-07-25T08:00:00.000' AS DateTime), 9, 26, 29, 29, 12, 29, 29, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (60, N'MA060', N'Nike Air Max 720', 410, N'1234567890160                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ql5do62og6fmqpizwpuz', CAST(950000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 720', 680, CAST(N'2025-08-05T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-08-05T08:00:00.000' AS DateTime), CAST(N'2025-08-05T08:00:00.000' AS DateTime), 10, 26, 30, 30, 12, 30, 30, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (61, N'MA061', N'Nike Air Max 90', 300, N'1234567890131                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ashnha2adnbbvuevuxv0', CAST(850000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 90', 350, CAST(N'2025-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-01-01T08:00:00.000' AS DateTime), CAST(N'2025-01-01T08:00:00.000' AS DateTime), 1, 27, 1, 1, 12, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (62, N'MA062', N'Nike Air Force 1', 320, N'1234567890132                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ashnha2adnbbvuevuxv0', CAST(900000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Force 1', 370, CAST(N'2025-02-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-02-01T08:00:00.000' AS DateTime), CAST(N'2025-02-01T08:00:00.000' AS DateTime), 2, 27, 2, 2, 12, 2, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (63, N'MA063', N'Nike React Element 55', 340, N'1234567890133                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ashnha2adnbbvuevuxv0', CAST(950000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike React Element 55', 390, CAST(N'2025-03-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-03-01T08:00:00.000' AS DateTime), CAST(N'2025-03-01T08:00:00.000' AS DateTime), 3, 27, 3, 3, 12, 3, 3, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (64, N'MA064', N'Nike Air Vapormax', 360, N'1234567890134                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ashnha2adnbbvuevuxv0', CAST(1000000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Vapormax', 410, CAST(N'2025-04-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-04-01T08:00:00.000' AS DateTime), CAST(N'2025-04-01T08:00:00.000' AS DateTime), 4, 27, 4, 4, 12, 4, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (65, N'MA065', N'Nike SB Dunk Low', 380, N'1234567890135                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ashnha2adnbbvuevuxv0', CAST(1100000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike SB Dunk Low', 430, CAST(N'2025-05-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-05-01T08:00:00.000' AS DateTime), CAST(N'2025-05-01T08:00:00.000' AS DateTime), 5, 27, 5, 5, 12, 5, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (66, N'MA066', N'Puma RS-X³', 400, N'1234567890136                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ja4rod9ds9mcbpqbgxza', CAST(800000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X³', 350, CAST(N'2025-06-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-06-01T08:00:00.000' AS DateTime), CAST(N'2025-06-01T08:00:00.000' AS DateTime), 6, 6, 6, 6, 13, 6, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (67, N'MA067', N'Puma Future Rider', 420, N'1234567890137                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ja4rod9ds9mcbpqbgxza', CAST(850000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Future Rider', 370, CAST(N'2025-07-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-07-01T08:00:00.000' AS DateTime), CAST(N'2025-07-01T08:00:00.000' AS DateTime), 7, 6, 7, 7, 13, 7, 7, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (68, N'MA068', N'Puma Cell Alien', 440, N'1234567890138                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ja4rod9ds9mcbpqbgxza', CAST(880000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Cell Alien', 390, CAST(N'2025-08-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-08-01T08:00:00.000' AS DateTime), CAST(N'2025-08-01T08:00:00.000' AS DateTime), 8, 6, 8, 8, 13, 8, 8, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (69, N'MA069', N'Puma Clyde', 460, N'1234567890139                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ja4rod9ds9mcbpqbgxza', CAST(920000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Clyde', 410, CAST(N'2025-09-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-09-01T08:00:00.000' AS DateTime), CAST(N'2025-09-01T08:00:00.000' AS DateTime), 9, 6, 9, 9, 13, 9, 9, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (70, N'MA070', N'Puma Thunder Spectra', 480, N'1234567890140                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/eqljgenvwjx8x4ghxbxg', CAST(950000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Thunder Spectra', 430, CAST(N'2025-10-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-10-01T08:00:00.000' AS DateTime), CAST(N'2025-10-01T08:00:00.000' AS DateTime), 10, 11, 10, 10, 13, 10, 10, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (71, N'MA071', N'Puma Suede Classic', 500, N'1234567890141                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/eqljgenvwjx8x4ghxbxg', CAST(850000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Suede Classic', 450, CAST(N'2025-11-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-11-01T08:00:00.000' AS DateTime), CAST(N'2025-11-01T08:00:00.000' AS DateTime), 11, 11, 11, 11, 13, 11, 11, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (72, N'MA072', N'Puma X-RAY', 520, N'1234567890142                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/eqljgenvwjx8x4ghxbxg', CAST(870000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma X-RAY', 470, CAST(N'2025-12-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2025-12-01T08:00:00.000' AS DateTime), CAST(N'2025-12-01T08:00:00.000' AS DateTime), 12, 11, 12, 12, 13, 12, 12, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (73, N'MA073', N'Puma Wild Rider', 540, N'1234567890143                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/eqljgenvwjx8x4ghxbxg', CAST(890000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Wild Rider', 490, CAST(N'2026-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-01-01T08:00:00.000' AS DateTime), CAST(N'2026-01-01T08:00:00.000' AS DateTime), 13, 11, 13, 13, 13, 13, 13, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (74, N'MA074', N'Puma RS-Fast', 560, N'1234567890144                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/kqpeoviktq5yxyewy8n9', CAST(910000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-Fast', 510, CAST(N'2026-02-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-02-01T08:00:00.000' AS DateTime), CAST(N'2026-02-01T08:00:00.000' AS DateTime), 14, 14, 14, 14, 13, 14, 14, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (75, N'MA075', N'Puma Enzo', 580, N'1234567890145                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/kqpeoviktq5yxyewy8n9', CAST(930000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Enzo', 530, CAST(N'2026-03-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-03-01T08:00:00.000' AS DateTime), CAST(N'2026-03-01T08:00:00.000' AS DateTime), 15, 14, 15, 15, 13, 15, 15, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (76, N'MA076', N'Puma BMW MMS Drift Cat 5', 600, N'1234567890146                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/mbqevzhgfahosbjudb3m', CAST(950000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma BMW MMS Drift Cat 5', 550, CAST(N'2026-04-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-04-01T08:00:00.000' AS DateTime), CAST(N'2026-04-01T08:00:00.000' AS DateTime), 1, 16, 16, 16, 14, 16, 16, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (77, N'MA077', N'Puma Ferrari Drift Cat 7', 620, N'1234567890147                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/u1jfafocg0djtvnhapyj', CAST(970000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Ferrari Drift Cat 7', 570, CAST(N'2026-05-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-05-01T08:00:00.000' AS DateTime), CAST(N'2026-05-01T08:00:00.000' AS DateTime), 17, 17, 17, 17, 15, 17, 17, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (78, N'MA078', N'Puma Basket Classic', 640, N'1234567890148                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/u1jfafocg0djtvnhapyj', CAST(990000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Basket Classic', 590, CAST(N'2026-06-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-06-01T08:00:00.000' AS DateTime), CAST(N'2026-06-01T08:00:00.000' AS DateTime), 18, 17, 18, 18, 15, 18, 18, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (79, N'MA079', N'Puma LQDCELL', 660, N'1234567890149                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/bqopklbfodg45adr0o3c', CAST(1010000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma LQDCELL', 610, CAST(N'2026-07-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-07-01T08:00:00.000' AS DateTime), CAST(N'2026-07-01T08:00:00.000' AS DateTime), 19, 19, 19, 19, 15, 19, 19, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (80, N'MA080', N'Puma RS-X Toys', 680, N'1234567890150                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/bqopklbfodg45adr0o3c', CAST(1030000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Toys', 630, CAST(N'2026-08-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-08-01T08:00:00.000' AS DateTime), CAST(N'2026-08-01T08:00:00.000' AS DateTime), 1, 19, 20, 20, 15, 20, 20, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (81, N'MA081', N'Puma RS-X Reinvent', 700, N'1234567890151                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/d1me6rws3ute1djwo06x', CAST(1050000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Reinvent', 650, CAST(N'2026-09-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-09-01T08:00:00.000' AS DateTime), CAST(N'2026-09-01T08:00:00.000' AS DateTime), 2, 21, 21, 21, 15, 21, 21, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (82, N'MA082', N'Puma RS-X Softcase', 720, N'1234567890152                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/fu5hzxw0amvzgvhedeoq', CAST(1070000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Softcase', 670, CAST(N'2026-10-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-10-01T08:00:00.000' AS DateTime), CAST(N'2026-10-01T08:00:00.000' AS DateTime), 3, 22, 22, 22, 16, 22, 22, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (83, N'MA083', N'Puma RS-X Tracks', 740, N'1234567890153                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ffycmerpvupitgqe9p7v', CAST(1090000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Tracks', 690, CAST(N'2026-11-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-11-01T08:00:00.000' AS DateTime), CAST(N'2026-11-01T08:00:00.000' AS DateTime), 4, 13, 23, 23, 17, 23, 23, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (84, N'MA084', N'Puma RS-X Energy', 760, N'1234567890154                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ffycmerpvupitgqe9p7v', CAST(1110000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Energy', 710, CAST(N'2026-12-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2026-12-01T08:00:00.000' AS DateTime), CAST(N'2026-12-01T08:00:00.000' AS DateTime), 5, 13, 24, 24, 17, 24, 24, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (85, N'MA085', N'Puma RS-X Racer', 780, N'1234567890155                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ffycmerpvupitgqe9p7v', CAST(1130000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Racer', 730, CAST(N'2027-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-01-01T08:00:00.000' AS DateTime), CAST(N'2027-01-01T08:00:00.000' AS DateTime), 6, 13, 25, 25, 17, 25, 25, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (86, N'MA086', N'Puma RS-X Custom', 800, N'1234567890156                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/dpnny8kguepvz007y4kd', CAST(1150000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Custom', 750, CAST(N'2027-02-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-02-01T08:00:00.000' AS DateTime), CAST(N'2027-02-01T08:00:00.000' AS DateTime), 6, 14, 26, 26, 17, 26, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (87, N'MA087', N'Puma RS-X Premium', 820, N'1234567890157                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/pbiihhobqwjzawwfye8i', CAST(1170000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Premium', 770, CAST(N'2027-03-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-03-01T08:00:00.000' AS DateTime), CAST(N'2027-03-01T08:00:00.000' AS DateTime), 8, 28, 27, 27, 18, 27, 27, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (88, N'MA088', N'Puma RS-X Original', 840, N'1234567890158                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/pbiihhobqwjzawwfye8i', CAST(1190000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Original', 790, CAST(N'2027-04-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-04-01T08:00:00.000' AS DateTime), CAST(N'2027-04-01T08:00:00.000' AS DateTime), 9, 28, 28, 28, 18, 28, 28, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (89, N'MA089', N'Puma RS-X Limitless', 860, N'1234567890159                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/xfwhzspbin9i4im4rohq', CAST(1210000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Limitless', 810, CAST(N'2027-05-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-05-01T08:00:00.000' AS DateTime), CAST(N'2027-05-01T08:00:00.000' AS DateTime), 9, 29, 29, 29, 18, 29, 29, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (90, N'MA090', N'Puma RS-X Fade', 880, N'1234567890160                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ngmefzz9e2ujdzayv6is', CAST(1230000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Fade', 830, CAST(N'2027-06-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-06-01T08:00:00.000' AS DateTime), CAST(N'2027-06-01T08:00:00.000' AS DateTime), 15, 30, 30, 30, 19, 30, 30, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (91, N'MA091', N'Nike Air Max 270', 100, N'1234567890161                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/tme6kydmpnqfhi9o1iix', CAST(860000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 270', 350, CAST(N'2027-07-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-07-01T08:00:00.000' AS DateTime), CAST(N'2027-07-01T08:00:00.000' AS DateTime), 1, 5, 1, 1, 20, 1, 1, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (92, N'MA092', N'Nike Air Max 95', 110, N'1234567890162                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/tme6kydmpnqfhi9o1iix', CAST(870000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 95', 360, CAST(N'2027-08-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-08-01T08:00:00.000' AS DateTime), CAST(N'2027-08-01T08:00:00.000' AS DateTime), 2, 5, 2, 2, 20, 2, 2, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (93, N'MA093', N'Nike Air Max 97', 120, N'1234567890163                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/tme6kydmpnqfhi9o1iix', CAST(880000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 97', 370, CAST(N'2027-09-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-09-01T08:00:00.000' AS DateTime), CAST(N'2027-09-01T08:00:00.000' AS DateTime), 4, 5, 3, 3, 20, 3, 3, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (94, N'MA094', N'Nike Air Max 2021', 130, N'1234567890164                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/jxvbt4i2atftol2jae16', CAST(890000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 2021', 380, CAST(N'2027-10-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-10-01T08:00:00.000' AS DateTime), CAST(N'2027-10-01T08:00:00.000' AS DateTime), 4, 6, 4, 4, 20, 4, 4, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (95, N'MA095', N'Nike Air Max 2022', 140, N'1234567890165                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ajg5sfcpzfa92uwt8nwl', CAST(900000 AS Decimal(18, 0)), N'Mô tả sản phẩm Nike Air Max 2022', 390, CAST(N'2027-11-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-11-01T08:00:00.000' AS DateTime), CAST(N'2027-11-01T08:00:00.000' AS DateTime), 4, 7, 5, 5, 20, 5, 5, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (96, N'MA096', N'Puma Future Rider Sport', 150, N'1234567890166                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ttlfzed8w6dxfaxo3itk', CAST(810000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma Future Rider Sport', 350, CAST(N'2027-12-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2027-12-01T08:00:00.000' AS DateTime), CAST(N'2027-12-01T08:00:00.000' AS DateTime), 6, 8, 6, 6, 21, 6, 6, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (97, N'MA097', N'Puma RS-X Turbo', 160, N'1234567890167                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ttlfzed8w6dxfaxo3itk', CAST(830000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Turbo', 370, CAST(N'2028-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-01-01T08:00:00.000' AS DateTime), CAST(N'2028-01-01T08:00:00.000' AS DateTime), 7, 8, 7, 7, 21, 7, 7, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (98, N'MA098', N'Puma RS-X 3', 170, N'1234567890168                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ipuz7nxemro9jkkerpnh', CAST(850000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X 3', 390, CAST(N'2028-02-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-02-01T08:00:00.000' AS DateTime), CAST(N'2028-02-01T08:00:00.000' AS DateTime), 8, 10, 8, 8, 21, 8, 8, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (99, N'MA099', N'Puma RS-X Lights', 180, N'1234567890169                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ipuz7nxemro9jkkerpnh', CAST(870000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Lights', 410, CAST(N'2028-03-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-03-01T08:00:00.000' AS DateTime), CAST(N'2028-03-01T08:00:00.000' AS DateTime), 9, 10, 9, 9, 21, 9, 9, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (100, N'MA100', N'Puma RS-X Edge', 190, N'1234567890170                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ipuz7nxemro9jkkerpnh', CAST(890000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Edge', 430, CAST(N'2028-04-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-04-01T08:00:00.000' AS DateTime), CAST(N'2028-04-01T08:00:00.000' AS DateTime), 10, 10, 10, 10, 21, 10, 10, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (101, N'MA101', N'Puma RS-X Mesh', 200, N'1234567890171                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/tyr89xmmnzmd8ilruu7k', CAST(910000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Mesh', 450, CAST(N'2028-05-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-05-01T08:00:00.000' AS DateTime), CAST(N'2028-05-01T08:00:00.000' AS DateTime), 11, 11, 11, 11, 21, 11, 11, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (102, N'MA102', N'Puma RS-X Stitch', 210, N'1234567890172                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/kfxuonciu5qyzi1vtv6h', CAST(930000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Stitch', 470, CAST(N'2028-06-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-06-01T08:00:00.000' AS DateTime), CAST(N'2028-06-01T08:00:00.000' AS DateTime), 12, 12, 12, 12, 22, 12, 12, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (103, N'MA103', N'Puma RS-X Reflection', 220, N'1234567890173                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/kfxuonciu5qyzi1vtv6h', CAST(950000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Reflection', 490, CAST(N'2028-07-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-07-01T08:00:00.000' AS DateTime), CAST(N'2028-07-01T08:00:00.000' AS DateTime), 13, 12, 13, 13, 22, 13, 13, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (104, N'MA104', N'Puma RS-X Pattern', 230, N'1234567890174                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/kfxuonciu5qyzi1vtv6h', CAST(970000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Pattern', 510, CAST(N'2028-08-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-08-01T08:00:00.000' AS DateTime), CAST(N'2028-08-01T08:00:00.000' AS DateTime), 14, 12, 14, 14, 22, 14, 14, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (105, N'MA105', N'Puma RS-X Utility', 240, N'1234567890175                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/kfxuonciu5qyzi1vtv6h', CAST(990000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Utility', 530, CAST(N'2028-09-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-09-01T08:00:00.000' AS DateTime), CAST(N'2028-09-01T08:00:00.000' AS DateTime), 15, 12, 15, 15, 22, 15, 15, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (106, N'MA106', N'Puma RS-X Advance', 250, N'1234567890176                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/wpifzmmduxzwkhkjzkal', CAST(1010000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Advance', 550, CAST(N'2028-10-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-10-01T08:00:00.000' AS DateTime), CAST(N'2028-10-01T08:00:00.000' AS DateTime), 16, 16, 16, 16, 22, 16, 16, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (107, N'MA107', N'Puma RS-X Flex', 260, N'1234567890177                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/wpifzmmduxzwkhkjzkal', CAST(1030000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Flex', 570, CAST(N'2028-11-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-11-01T08:00:00.000' AS DateTime), CAST(N'2028-11-01T08:00:00.000' AS DateTime), 17, 16, 17, 17, 22, 17, 17, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (108, N'MA108', N'Puma RS-X Graph', 270, N'1234567890178                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/wpifzmmduxzwkhkjzkal', CAST(1050000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Graph', 590, CAST(N'2028-12-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2028-12-01T08:00:00.000' AS DateTime), CAST(N'2028-12-01T08:00:00.000' AS DateTime), 18, 16, 18, 18, 22, 18, 18, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (109, N'MA109', N'Puma RS-X Drive', 280, N'1234567890179                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/krrhxt4njeingn9jdhuf', CAST(1070000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Drive', 610, CAST(N'2029-01-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-01-01T08:00:00.000' AS DateTime), CAST(N'2029-01-01T08:00:00.000' AS DateTime), 19, 19, 19, 19, 22, 19, 19, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (110, N'MA110', N'Puma RS-X Revive', 290, N'1234567890180                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/krrhxt4njeingn9jdhuf', CAST(1090000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Revive', 630, CAST(N'2029-02-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-02-01T08:00:00.000' AS DateTime), CAST(N'2029-02-01T08:00:00.000' AS DateTime), 1, 19, 20, 20, 22, 20, 20, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (111, N'MA111', N'Puma RS-X Boost', 300, N'1234567890181                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/krrhxt4njeingn9jdhuf', CAST(1110000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Boost', 650, CAST(N'2029-03-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-03-01T08:00:00.000' AS DateTime), CAST(N'2029-03-01T08:00:00.000' AS DateTime), 2, 19, 21, 21, 22, 21, 21, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (112, N'MA112', N'Puma RS-X Precision', 310, N'1234567890182                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/krrhxt4njeingn9jdhuf', CAST(1130000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Precision', 670, CAST(N'2029-04-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-04-01T08:00:00.000' AS DateTime), CAST(N'2029-04-01T08:00:00.000' AS DateTime), 3, 19, 22, 22, 22, 22, 22, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (113, N'MA113', N'Puma RS-X Impact', 320, N'1234567890183                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/krrhxt4njeingn9jdhuf', CAST(1150000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Impact', 690, CAST(N'2029-05-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-05-01T08:00:00.000' AS DateTime), CAST(N'2029-05-01T08:00:00.000' AS DateTime), 4, 19, 23, 23, 22, 23, 23, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (114, N'MA114', N'Puma RS-X Legend', 330, N'1234567890184                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/w0nr8cc9intb5w40mnwe', CAST(1170000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Legend', 710, CAST(N'2029-06-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-06-01T08:00:00.000' AS DateTime), CAST(N'2029-06-01T08:00:00.000' AS DateTime), 5, 20, 24, 24, 22, 24, 24, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (115, N'MA115', N'Puma RS-X Master', 340, N'1234567890185                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/w0nr8cc9intb5w40mnwe', CAST(1190000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Master', 730, CAST(N'2029-07-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-07-01T08:00:00.000' AS DateTime), CAST(N'2029-07-01T08:00:00.000' AS DateTime), 6, 20, 25, 25, 22, 25, 25, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (116, N'MA116', N'Puma RS-X Pro', 350, N'1234567890186                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/w0nr8cc9intb5w40mnwe', CAST(1210000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Pro', 750, CAST(N'2029-08-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-08-01T08:00:00.000' AS DateTime), CAST(N'2029-08-01T08:00:00.000' AS DateTime), 7, 20, 26, 26, 22, 26, 26, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (117, N'MA117', N'Puma RS-X Vision', 360, N'1234567890187                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/d4etronzllkm3tre3t72', CAST(1230000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Vision', 770, CAST(N'2029-09-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-09-01T08:00:00.000' AS DateTime), CAST(N'2029-09-01T08:00:00.000' AS DateTime), 8, 29, 27, 27, 23, 27, 27, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (118, N'MA118', N'Puma RS-X Wave', 370, N'1234567890188                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/d4etronzllkm3tre3t72', CAST(1250000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Wave', 790, CAST(N'2029-10-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-10-01T08:00:00.000' AS DateTime), CAST(N'2029-10-01T08:00:00.000' AS DateTime), 9, 29, 28, 28, 23, 28, 28, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (119, N'MA119', N'Puma RS-X Echo', 380, N'1234567890189                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/d4etronzllkm3tre3t72', CAST(1270000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Echo', 810, CAST(N'2029-11-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-11-01T08:00:00.000' AS DateTime), CAST(N'2029-11-01T08:00:00.000' AS DateTime), 10, 29, 29, 29, 23, 29, 29, 1)
GO
INSERT [dbo].[san_pham_chi_tiet] ([id], [ma], [ten], [soLuong], [barcode], [anh], [giaBan], [moTa], [canNang], [ngaySanXuat], [nguoiTao], [nguoiCapNhat], [ngayTao], [ngayCapNhat], [idKichCo], [idMauSac], [idDeGiay], [idChatLieu], [idSanPham], [idCoGiay], [idNhaSanXuat], [trangThai]) VALUES (120, N'MA120', N'Puma RS-X Surge', 390, N'1234567890190                 ', N'https://res.cloudinary.com/deapopcoc/image/upload/v1724269607/ha8ytydllswdwk6umjiw', CAST(1290000 AS Decimal(18, 0)), N'Mô tả sản phẩm Puma RS-X Surge', 830, CAST(N'2029-12-01T08:00:00.000' AS DateTime), N'admin', N'admin', CAST(N'2029-12-01T08:00:00.000' AS DateTime), CAST(N'2029-12-01T08:00:00.000' AS DateTime), 11, 30, 30, 30, 23, 30, 30, 1)
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
SET IDENTITY_INSERT [dbo].[thuong_hieu] OFF
GO
ALTER TABLE [dbo].[dia_chi]  WITH CHECK ADD  CONSTRAINT [FK_dia_chi_khach_hang] FOREIGN KEY([idKhachHang])
REFERENCES [dbo].[khach_hang] ([id])
GO
ALTER TABLE [dbo].[dia_chi] CHECK CONSTRAINT [FK_dia_chi_khach_hang]
GO
ALTER TABLE [dbo].[gio_hang]  WITH CHECK ADD  CONSTRAINT [FK_gio_hang_tai_khoan] FOREIGN KEY([idTaiKhoan])
REFERENCES [dbo].[nhan_vien] ([id])
GO
ALTER TABLE [dbo].[gio_hang] CHECK CONSTRAINT [FK_gio_hang_tai_khoan]
GO
ALTER TABLE [dbo].[gio_hang_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_gio_hang_chi_tiet_gio_hang] FOREIGN KEY([idGioHang])
REFERENCES [dbo].[gio_hang] ([id])
GO
ALTER TABLE [dbo].[gio_hang_chi_tiet] CHECK CONSTRAINT [FK_gio_hang_chi_tiet_gio_hang]
GO
ALTER TABLE [dbo].[gio_hang_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_gio_hang_chi_tiet_san_pham_chi_tiet] FOREIGN KEY([idSanPhamChiTiet])
REFERENCES [dbo].[san_pham_chi_tiet] ([id])
GO
ALTER TABLE [dbo].[gio_hang_chi_tiet] CHECK CONSTRAINT [FK_gio_hang_chi_tiet_san_pham_chi_tiet]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_khach_hang] FOREIGN KEY([idKhachHang])
REFERENCES [dbo].[khach_hang] ([id])
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [FK_hoa_don_khach_hang]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_nhan_vien] FOREIGN KEY([idNhanVien])
REFERENCES [dbo].[nhan_vien] ([id])
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [FK_hoa_don_nhan_vien]
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_phieu_giam_gia] FOREIGN KEY([idPhieuGiamGia])
REFERENCES [dbo].[phieu_giam_gia] ([id])
GO
ALTER TABLE [dbo].[hoa_don] CHECK CONSTRAINT [FK_hoa_don_phieu_giam_gia]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_chi_tiet_chi_tiet_san_pham] FOREIGN KEY([idChiTietSanPham])
REFERENCES [dbo].[san_pham_chi_tiet] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] CHECK CONSTRAINT [FK_hoa_don_chi_tiet_chi_tiet_san_pham]
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_hoa_don_chi_tiet_hoa_don] FOREIGN KEY([idHoaDon])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[hoa_don_chi_tiet] CHECK CONSTRAINT [FK_hoa_don_chi_tiet_hoa_don]
GO
ALTER TABLE [dbo].[lich_su_hoa_don]  WITH CHECK ADD  CONSTRAINT [FK_lich_su_hoa_don_hoa_don] FOREIGN KEY([idHoaDon])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[lich_su_hoa_don] CHECK CONSTRAINT [FK_lich_su_hoa_don_hoa_don]
GO
ALTER TABLE [dbo].[phuong_thuc_thanh_toan]  WITH CHECK ADD  CONSTRAINT [FK_phuong_thuc_thanh_toan_hoa_don] FOREIGN KEY([idHoaDon])
REFERENCES [dbo].[hoa_don] ([id])
GO
ALTER TABLE [dbo].[phuong_thuc_thanh_toan] CHECK CONSTRAINT [FK_phuong_thuc_thanh_toan_hoa_don]
GO
ALTER TABLE [dbo].[san_pham]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_thuong_hieu] FOREIGN KEY([idThuongHieu])
REFERENCES [dbo].[thuong_hieu] ([id])
GO
ALTER TABLE [dbo].[san_pham] CHECK CONSTRAINT [FK_san_pham_thuong_hieu]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_chi_tiet_chat_lieu] FOREIGN KEY([idChatLieu])
REFERENCES [dbo].[chat_lieu] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [FK_san_pham_chi_tiet_chat_lieu]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_chi_tiet_co_giay] FOREIGN KEY([idCoGiay])
REFERENCES [dbo].[co_giay] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [FK_san_pham_chi_tiet_co_giay]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_chi_tiet_de_giay] FOREIGN KEY([idDeGiay])
REFERENCES [dbo].[de_giay] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [FK_san_pham_chi_tiet_de_giay]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_chi_tiet_kich_co] FOREIGN KEY([idKichCo])
REFERENCES [dbo].[kich_co] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [FK_san_pham_chi_tiet_kich_co]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_chi_tiet_mau_sac] FOREIGN KEY([idMauSac])
REFERENCES [dbo].[mau_sac] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [FK_san_pham_chi_tiet_mau_sac]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_chi_tiet_nha_san_xuat] FOREIGN KEY([idNhaSanXuat])
REFERENCES [dbo].[nha_san_xuat] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [FK_san_pham_chi_tiet_nha_san_xuat]
GO
ALTER TABLE [dbo].[san_pham_chi_tiet]  WITH CHECK ADD  CONSTRAINT [FK_san_pham_chi_tiet_san_pham] FOREIGN KEY([idSanPham])
REFERENCES [dbo].[san_pham] ([id])
GO
ALTER TABLE [dbo].[san_pham_chi_tiet] CHECK CONSTRAINT [FK_san_pham_chi_tiet_san_pham]


select * from phieu_giam_gia