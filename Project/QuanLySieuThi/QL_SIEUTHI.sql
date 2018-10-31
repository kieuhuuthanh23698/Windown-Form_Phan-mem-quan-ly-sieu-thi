USE [master]
GO
/****** Object:  Database [QL_SIEUTHI]    Script Date: 10/31/18 12:23:34 PM ******/
CREATE DATABASE [QL_SIEUTHI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_SIEUTHI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_SIEUTHI.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_SIEUTHI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_SIEUTHI_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_SIEUTHI] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_SIEUTHI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_SIEUTHI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_SIEUTHI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_SIEUTHI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_SIEUTHI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_SIEUTHI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_SIEUTHI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_SIEUTHI] SET  MULTI_USER 
GO
ALTER DATABASE [QL_SIEUTHI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_SIEUTHI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_SIEUTHI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_SIEUTHI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QL_SIEUTHI]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 10/31/18 12:23:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHoaDon] [nchar](20) NOT NULL,
	[MaHangHoa] [nchar](30) NOT NULL,
	[TenHangHoa] [nvarchar](50) NULL,
	[GiaBan] [float] NULL,
	[Soluong] [int] NULL,
	[ThanhTien] [float] NULL,
 CONSTRAINT [pk_chitiethoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC,
	[MaHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/31/18 12:23:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [nchar](20) NOT NULL,
	[NgayLapHoaDon] [date] NULL,
	[GioLapHoaDon] [time](7) NULL,
	[TenNVLapHoaDon] [nvarchar](50) NULL,
	[MaNVLapHoaDon] [nchar](20) NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[MaKhachHang] [nchar](20) NULL,
	[TienHang] [float] NULL,
	[PhanTramGiamGia] [float] NULL,
	[GiamGia] [float] NULL,
	[TongThanhTien] [float] NULL,
	[KhachDua] [float] NULL,
	[TraLai] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/31/18 12:23:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [nchar](20) NOT NULL,
	[TenKhachHang] [nvarchar](50) NOT NULL,
	[SoDienThoai] [nchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoHang]    Script Date: 10/31/18 12:23:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoHang](
	[MaHangHoa] [nchar](30) NOT NULL,
	[TenHangHoa] [nvarchar](50) NULL,
	[LoaiHangHoa] [nvarchar](50) NULL,
	[GiaBan] [float] NULL,
	[GiaMua] [float] NULL,
	[DonVi] [nvarchar](20) NULL,
	[SoluongTrongKho] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiHangHoa]    Script Date: 10/31/18 12:23:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHangHoa](
	[MaLoaiHangHoa] [nchar](20) NOT NULL,
	[TenLoaiHangHoa] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenLoaiHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/31/18 12:23:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [nchar](20) NOT NULL,
	[TenNhanVien] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[Luong] [float] NULL,
	[Email] [nchar](20) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Tuoi] [int] NULL,
	[UserName] [nchar](30) NOT NULL,
	[Passwords] [nchar](30) NOT NULL,
	[CapNguoiDung] [nchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinSieuThi]    Script Date: 10/31/18 12:23:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinSieuThi](
	[TenSieuThi] [nvarchar](50) NOT NULL,
	[DiaChiSieuThi] [nvarchar](50) NULL,
	[SoDT] [nchar](20) NULL,
	[TenChuSieuThi] [nvarchar](50) NULL,
	[MaNVChuSieuThi] [nchar](20) NULL,
	[CongQuy] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[TenSieuThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuChi]    Script Date: 10/31/18 12:23:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuChi](
	[Stt] [int] IDENTITY(1,1) NOT NULL,
	[ThuChi] [nchar](5) NULL,
	[TenHangHoa] [nvarchar](50) NULL,
	[MaHangHoa] [nchar](30) NULL,
	[SoLuong] [int] NULL,
	[SoTienThuChi] [float] NULL,
	[NgayThuChi] [date] NULL,
	[GioThuChi] [date] NULL,
	[TenNhanVienThuChi] [nvarchar](50) NULL,
	[MaNhanVienThuChi] [nchar](20) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_0            ', N'DH06                          ', N'Mứt dừa sấy giòn', 100000, 1, 100000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_0            ', N'DH09                          ', N'Chà bông gà Hương Việt 60g', 21500, 1, 21500)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_1            ', N'DH06                          ', N'Mứt dừa sấy giòn', 100000, 1, 100000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_10           ', N'DH08                          ', N'Cá mực Rim me cán Nha Trang', 95000, 1, 95000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_11           ', N'DOUONG01                      ', N'Coca Cola Nhật 300ml', 44900, 2, 89800)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_11           ', N'DOUONG02                      ', N'Yummy Panda Thạch uống trái cây vị xoài', 14900, 1, 14900)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_12           ', N'DH08                          ', N'Cá mực Rim me cán Nha Trang', 95000, 1, 95000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_13           ', N'DH04                          ', N'Chuối sấy dẻo', 69000, 1, 69000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_13           ', N'DH09                          ', N'Chà bông gà Hương Việt 60g', 21500, 1, 21500)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_14           ', N'DH01                          ', N'Xúc xích dinh dưỡng bò', 20000, 1, 20000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_15           ', N'DH09                          ', N'Chà bông gà Hương Việt 60g', 21500, 1, 21500)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_16           ', N'DOUONG07                      ', N'Sinh Tố Phúc Bồn Tử 350ml', 117900, 1, 117900)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_17           ', N'DH06                          ', N'Mứt dừa sấy giòn', 100000, 1, 100000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_18           ', N'DH10                          ', N'Cá sốt cà Hạ Long 175g', 37800, 1, 37800)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_19           ', N'DH03                          ', N'Thập cẩm sấy', 99000, 1, 99000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_2            ', N'DH07                          ', N'Lương khô bô binh BB702', 65000, 1, 65000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_2            ', N'DOUONG02                      ', N'Yummy Panda Thạch uống trái cây vị xoài', 14900, 1, 14900)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_20           ', N'DOUONG01                      ', N'Coca Cola Nhật 300ml', 44900, 1, 44900)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_21           ', N'DH10                          ', N'Cá sốt cà Hạ Long 175g', 37800, 1, 37800)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_22           ', N'DOUONG03                      ', N'Nước giải khát Latte Đào 345ml', 9900, 1, 9900)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_23           ', N'DH09                          ', N'Chà bông gà Hương Việt 60g', 21500, 1, 21500)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_3            ', N'DH07                          ', N'Lương khô bô binh BB702', 65000, 1, 65000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_3            ', N'DH08                          ', N'Cá mực Rim me cán Nha Trang', 95000, 1, 95000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_4            ', N'DH06                          ', N'Mứt dừa sấy giòn', 100000, 1, 100000)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_4            ', N'DOUONG01                      ', N'Coca Cola Nhật 300ml', 44900, 1, 44900)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_5            ', N'DH09                          ', N'Chà bông gà Hương Việt 60g', 21500, 1, 21500)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_6            ', N'DH10                          ', N'Cá sốt cà Hạ Long 175g', 37800, 1, 37800)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_7            ', N'DH10                          ', N'Cá sốt cà Hạ Long 175g', 37800, 1, 37800)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_8            ', N'DH09                          ', N'Chà bông gà Hương Việt 60g', 21500, 1, 21500)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon], [MaHangHoa], [TenHangHoa], [GiaBan], [Soluong], [ThanhTien]) VALUES (N'HOADON_9            ', N'DH09                          ', N'Chà bông gà Hương Việt 60g', 21500, 1, 21500)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_0            ', CAST(N'2018-10-27' AS Date), CAST(N'14:50:32.4000000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 121500, 0, 0, 121500, 500000, 378500)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_1            ', CAST(N'2018-10-31' AS Date), CAST(N'10:51:47.5230000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 100000, 0, 0, 100000, 500000, 400000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_10           ', CAST(N'2018-10-27' AS Date), CAST(N'15:01:53.7730000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 95000, 0, 0, 95000, 500000, 405000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_11           ', CAST(N'2018-10-27' AS Date), CAST(N'15:01:44.3830000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 104700, 0, 0, 104700, 500000, 395300)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_12           ', CAST(N'2018-10-27' AS Date), CAST(N'15:01:57.9130000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 95000, 0, 0, 95000, 500000, 405000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_13           ', CAST(N'2018-10-29' AS Date), CAST(N'23:51:06.0700000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 90500, 0, 0, 90500, 500000, 409500)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_14           ', CAST(N'2018-10-29' AS Date), CAST(N'23:52:20.2400000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 20000, 0, 0, 20000, 500000, 480000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_15           ', CAST(N'2018-10-29' AS Date), CAST(N'23:53:15.0870000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 21500, 0, 0, 21500, 500000, 478500)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_16           ', CAST(N'2018-10-29' AS Date), CAST(N'23:54:07.7000000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 117900, 0, 0, 117900, 500000, 382100)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_17           ', CAST(N'2018-10-29' AS Date), CAST(N'23:56:27.6870000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 100000, 0, 0, 100000, 500000, 400000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_18           ', CAST(N'2018-10-29' AS Date), CAST(N'23:58:31.0500000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 37800, 0, 0, 37800, 500000, 462200)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_19           ', CAST(N'2018-10-29' AS Date), CAST(N'00:00:03.9470000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 99000, 0, 0, 99000, 500000, 401000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_2            ', CAST(N'2018-10-27' AS Date), CAST(N'14:50:43.2330000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 79900, 0, 0, 79900, 500000, 420100)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_20           ', CAST(N'2018-10-31' AS Date), CAST(N'10:36:11.9670000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 44900, 0, 0, 44900, 500000, 455100)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_21           ', CAST(N'2018-10-31' AS Date), CAST(N'10:39:02.5400000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 37800, 0, 0, 37800, 500000, 462200)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_22           ', CAST(N'2018-10-31' AS Date), CAST(N'10:39:52.6330000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 9900, 0, 0, 9900, 500000, 490100)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_23           ', CAST(N'2018-10-31' AS Date), CAST(N'10:47:12.5730000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 21500, 0, 0, 21500, 500000, 478500)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_3            ', CAST(N'2018-10-27' AS Date), CAST(N'14:52:07.7900000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 160000, 0, 0, 160000, 500000, 340000)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_4            ', CAST(N'2018-10-27' AS Date), CAST(N'14:52:15.7570000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 144900, 0, 0, 144900, 500000, 355100)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_5            ', CAST(N'2018-10-27' AS Date), CAST(N'14:52:20.9500000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 21500, 0, 0, 21500, 500000, 478500)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_6            ', CAST(N'2018-10-27' AS Date), CAST(N'14:53:34.0930000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 37800, 0, 0, 37800, 500000, 462200)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_7            ', CAST(N'2018-10-27' AS Date), CAST(N'14:53:40.1430000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 37800, 0, 0, 37800, 500000, 462200)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_8            ', CAST(N'2018-10-27' AS Date), CAST(N'14:55:44.4830000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 21500, 0, 0, 21500, 500000, 478500)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayLapHoaDon], [GioLapHoaDon], [TenNVLapHoaDon], [MaNVLapHoaDon], [TenKhachHang], [MaKhachHang], [TienHang], [PhanTramGiamGia], [GiamGia], [TongThanhTien], [KhachDua], [TraLai]) VALUES (N'HOADON_9            ', CAST(N'2018-10-27' AS Date), CAST(N'15:01:49.5830000' AS Time), N'Kiều Hữu Thành', N'2001160343          ', N'Khách vãng lai', N'KHACHHANG0          ', 21500, 0, 0, 21500, 500000, 478500)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [SoDienThoai]) VALUES (N'KHACHHANG0          ', N'Khách vãng lai', N'0000000000          ')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [SoDienThoai]) VALUES (N'KHACHHANG1          ', N'Nguyễn Văn A', N'0123456789          ')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [SoDienThoai]) VALUES (N'KHACHHANG2          ', N'Nguyễn Văn B', N'0123785648          ')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [SoDienThoai]) VALUES (N'KHACHHANG3          ', N'54354', N'123                 ')
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BANH01                        ', N'Bánh tráng', N'BÁNH', 1000, 28600, N'cái', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BANH02                        ', N'Bánh quế Cosy nhân kem phô mai 462g', N'BÁNH', 5000, 2600, N'hộp', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BANH03                        ', N'Bánh kem sữa hạt chia Rosio 276g', N'BÁNH', 55800, 42600, N'gói', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BANH04                        ', N'Bánh bông lan Apollo cốm hộp 360g', N'BÁNH', 63600, 51200, N'hộp', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BANH05                        ', N'Bánh quy Cosy dừa Marie 320g', N'BÁNH', 41400, 29600, N'hộp', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BANH6                         ', N'Bánh đậu xanh Tiên Dung', N'BÁNH', 1500, 1000, N'Hộp', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BANH7                         ', N'Chocobie', N'BÁNH', 6000, 5500, N'Cái', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BG01                          ', N'Bột Giặt APA 3kg', N'BỘT GIẶT', 101000, 80500, N'bịch', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BG02                          ', N'Nước giặt khử mùi Attack hương anh đào 14kg', N'BỘT GIẶT', 89000, 76800, N'túi', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BG03                          ', N'Nước giặt Surf hương cỏ hoa 18kg', N'BỘT GIẶT', 54900, 45600, N'bịch', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BG04                          ', N'Nước xả vải Comfort hương nước hoa', N'BỘT GIẶT', 167800, 145500, N'bịch', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'BG05                          ', N'Bột giặt Lix hương nước hoa 55kg', N'BỘT GIẶT', 219000, 180800, N'bịch', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'CD1                           ', N'Đĩa phim hoạt hình Conan', N'ĐĨA PHIM', 10000, 8000, N'Cái', 3)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DAN01                         ', N'Phở bò Như Ý', N'ĐỒ ĂN NHANH', 4000, 2300, N'gói', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DH01                          ', N'Xúc xích dinh dưỡng bò', N'ĐỒ HỘP', 20000, 13700, N'hộp', 50)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DH02                          ', N'Khô gà cay lá chanh', N'ĐỒ HỘP', 155000, 105000, N'hộp', 44)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DH03                          ', N'Thập cẩm sấy', N'ĐỒ HỘP', 99000, 70500, N'hộp', 9)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DH04                          ', N'Chuối sấy dẻo', N'ĐỒ HỘP', 69000, 45500, N'hộp', 26)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DH05                          ', N'Hạt điều sấy rang tỏi ớt', N'ĐỒ HỘP', 58000, 35000, N'hộp', 35)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DH06                          ', N'Mứt dừa sấy giòn', N'ĐỒ HỘP', 100000, 75500, N'hộp', 22)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DH07                          ', N'Lương khô bô binh BB702', N'ĐỒ HỘP', 65000, 43500, N'hộp', 0)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DH08                          ', N'Cá mực Rim me cán Nha Trang', N'ĐỒ HỘP', 95000, 68500, N'hộp', 22)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DH09                          ', N'Chà bông gà Hương Việt 60g', N'ĐỒ HỘP', 21500, 12500, N'hộp', 29)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DH10                          ', N'Cá sốt cà Hạ Long 175g', N'ĐỒ HỘP', 37800, 30700, N'hộp', 9)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DOUONG01                      ', N'Coca Cola Nhật 300ml', N'ĐỒ UỐNG', 44900, 35500, N'chai', 33)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DOUONG02                      ', N'Yummy Panda Thạch uống trái cây vị xoài', N'ĐỒ UỐNG', 14900, 8500, N'gói', 29)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DOUONG03                      ', N'Nước giải khát Latte Đào 345ml', N'ĐỒ UỐNG', 9900, 4500, N'chai', 18)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DOUONG04                      ', N'Wonderfarm Trà bí đao', N'ĐỒ UỐNG', 5500, 2500, N'chai', 46)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DOUONG05                      ', N'Trà Ô Long Tea Plus 500ml', N'ĐỒ UỐNG', 9500, 5500, N'chai', 40)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DOUONG06                      ', N'Nước khoáng AVIAN 500ml', N'ĐỒ UỐNG', 31500, 24500, N'chai', 56)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DOUONG07                      ', N'Sinh Tố Phúc Bồn Tử 350ml', N'ĐỒ UỐNG', 117900, 96500, N'chai', 40)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DOUONG08                      ', N'Fanta Saxi 390ml', N'ĐỒ UỐNG', 6500, 2500, N'chai', 21)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DOUONG09                      ', N'Ice Đào', N'ĐỒ UỐNG', 7500, 3500, N'chai', 32)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'DOUONG10                      ', N'Pepsi chai 15l', N'ĐỒ UỐNG', 14700, 8300, N'chai', 61)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'GIAVI01                       ', N'Nước mắm rồng vàng', N'GIA VỊ', 15000, 9200, N'chai', 14)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'GIAVI02                       ', N'Tương ớt chisu', N'GIA VỊ', 9000, 4200, N'chai', 17)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'GIAVI03                       ', N'Bột canh ajinomoto', N'GIA VỊ', 46500, 34200, N'bịch', 34)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'GIAVI04                       ', N'Nước tương Maggi đậm đặc 300ml', N'GIA VỊ', 11700, 5200, N'chai', 23)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'GIAVI05                       ', N'Bột bánh  chuối Hương Xưa 250g', N'GIA VỊ', 23000, 14500, N'bịch', 13)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'GIAVI06                       ', N'Bột tẩm khô chiên giòn Aji-Quick 84g', N'GIA VỊ', 11000, 5500, N'bịch', 28)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'GIAVI07                       ', N'Sa tế Vị Hảo 250g', N'GIA VỊ', 20200, 12400, N'chai', 9)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'KEO01                         ', N'Kẹo mận Thái Lan', N'KẸO', 37500, 29000, N'gói', 25)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'KEO02                         ', N'Kẹo Lotte Anytime Bluemarine 74g', N'KẸO', 32300, 24700, N'gói', 16)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'KEO03                         ', N'Kẹo cứng hương Cherry Bonbon 80g', N'KẸO', 5600, 2400, N'gói', 35)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'KEO04                         ', N'Kẹo Socola viên bi Choco-Rock-Marble 65g', N'KẸO', 24800, 15600, N'gói', 44)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'KEO05                         ', N'Kẹo ngậm ho không đường Pulmoll Krish', N'KẸO', 56100, 42400, N'gói', 14)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'KEO06                         ', N'Kẹo nhai Mentos hương trái cây 40 viên', N'KẸO', 13200, 6400, N'gói', 14)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'KEO07                         ', N'Kẹo Chupa Chups vitamin C 100g', N'KẸO', 9200, 3400, N'gói', 58)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'KEO08                         ', N'Kẹo Socola nhân hạt hạnh nhân Choco-Rock-Almond', N'KẸO', 35500, 26800, N'gói', 34)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'KEO09                         ', N'Kẹo Socola Trà xanh Dars Morinaga 21g', N'KẸO', 10200, 4600, N'gói', 21)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'KEO10                         ', N'Kẹo mận Thái Lan', N'KẸO', 307500, 29000, N'gói', 25)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'MP01                          ', N'Dầu gội đầu Tresemme Detox', N'MỸ PHẨM', 169000, 105800, N'chai', 38)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'MP02                          ', N'Sữa rửa mặt Nivia tẩy trang', N'MỸ PHẨM', 34000, 28000, N'lọ', 18)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'MP03                          ', N'Sữa tắm Enchanter 650', N'MỸ PHẨM', 131000, 118500, N'chai', 48)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'MP04                          ', N'Nước tẩy trang Bioderma hồng 100ml', N'MỸ PHẨM', 246000, 230500, N'lọ', 24)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'MP05                          ', N'Sữa rửa mặt Laroche-Posay Pháp 200ml', N'MỸ PHẨM', 345000, 320500, N'lọ', 15)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'MP06                          ', N'Toner Bioderma 100ml da nhạy cảm', N'MỸ PHẨM', 280000, 255000, N'lọ', 45)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'MP07                          ', N'Son dưỡng môi lemonade đỏ cam', N'MỸ PHẨM', 230000, 185000, N'lọ', 13)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'MP08                          ', N'Nước hoa Enchater hương hoa oải hương', N'MỸ PHẨM', 250000, 190500, N'lọ', 41)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'MP09                          ', N'Sữa dưỡng thể Nivia', N'MỸ PHẨM', 158000, 125000, N'lọ', 12)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'MP10                          ', N'Gel lột mặt Nha đam', N'MỸ PHẨM', 50000, 40500, N'lọ', 18)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'RAUCU01                       ', N'Bắp Mỹ siêu ngọt', N'RAU CỦ', 17500, 9400, N'05kg', 10)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'RAUCU02                       ', N'Cam Úc', N'RAU CỦ', 49000, 39400, N'1kg', 20)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'RAUCU03                       ', N'Kiwi xanh New Zealand', N'RAU CỦ', 105000, 86500, N'1kg', 15)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'RAUCU04                       ', N'Nho xanh không hạt Mỹ', N'RAU CỦ', 185900, 140600, N'1kg', 26)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'RAUCU05                       ', N'Cherry đỏ Mỹ', N'RAU CỦ', 180500, 145600, N'1kg', 8)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'RAUCU06                       ', N'Táo Jazz New Zealand', N'RAU CỦ', 79000, 58600, N'1kg', 14)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'SUA01                         ', N'BAD Gạo sữa dinh dưỡng', N'SỮA', 54000, 45000, N'bịch', 20)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'SUA02                         ', N'Sữa Vinasoy nguyên chất', N'SỮA', 26000, 20000, N'bịch', 49)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'SUA03                         ', N'BAD sữa gạo lức', N'SỮA', 54000, 45000, N'bịch', 30)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'SUA04                         ', N'sữa Friso Gold 2', N'SỮA', 231000, 180000, N'hộp', 28)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'SUA05                         ', N'Sữa Kun vị cam 110ml', N'SỮA', 4000, 2500, N'hộp', 26)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'SUA06                         ', N'Nuti IQ 456 Gold', N'SỮA', 282000, 250000, N'hộp', 22)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'SUA07                         ', N'BAD lúa mì', N'SỮA', 50000, 40000, N'bịch', 20)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'SUA08                         ', N'Dielac Gold Step 2 400g', N'SỮA', 136000, 105000, N'hộp', 31)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'SUA09                         ', N'Sữa ông thọ', N'SỮA', 15500, 10500, N'lon', 25)
INSERT [dbo].[KhoHang] ([MaHangHoa], [TenHangHoa], [LoaiHangHoa], [GiaBan], [GiaMua], [DonVi], [SoluongTrongKho]) VALUES (N'SUA10                         ', N'Nuti Vita', N'SỮA', 206000, 185500, N'hộp', 16)
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'BANH                ', N'BÁNH')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'BG                  ', N'BỘT GIẶT')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'CD                  ', N'ĐĨA PHIM')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'DAN                 ', N'ĐỒ ĂN NHANH')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'DH                  ', N'ĐỒ HỘP')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'DOUONG              ', N'ĐỒ UỐNG')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'GIAVI               ', N'GIA VỊ')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'KEO                 ', N'KẸO')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'KHAC                ', N'KHÁC')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'MP                  ', N'MỸ PHẨM')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'NC                  ', N'NƯỚC UỐNG')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'QUANAO              ', N'QUẦN ÁO')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'RAUCU               ', N'RAU CỦ')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'SACH                ', N'SÁCH VỞ')
INSERT [dbo].[LoaiHangHoa] ([MaLoaiHangHoa], [TenLoaiHangHoa]) VALUES (N'SUA                 ', N'SỮA')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [NgaySinh], [GioiTinh], [Luong], [Email], [DiaChi], [Tuoi], [UserName], [Passwords], [CapNguoiDung]) VALUES (N'2001160205          ', N'Huỳnh Thị Thùy Dương', CAST(N'1998-01-19' AS Date), N'Nữ', 9000000, N'huynhduong1901@gmail', N'TP Bến Tre', 20, N'2001160205                    ', N'19011998                      ', N'Admin     ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [NgaySinh], [GioiTinh], [Luong], [Email], [DiaChi], [Tuoi], [UserName], [Passwords], [CapNguoiDung]) VALUES (N'2001160222          ', N'Lê Thị Ngọc Hiền', CAST(N'1998-05-22' AS Date), N'Nữ', 9000000, N'lethingochien@gmail ', N'TP.HCM', 20, N'2001160222                    ', N'22051998                      ', N'Admin     ')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [NgaySinh], [GioiTinh], [Luong], [Email], [DiaChi], [Tuoi], [UserName], [Passwords], [CapNguoiDung]) VALUES (N'2001160343          ', N'Kiều Hữu Thành', CAST(N'1998-06-23' AS Date), N'Nam', 9000000, N'kieuhuuthanh@gmail  ', N'TP HCM', 20, N'2001160343                    ', N'23061998                      ', N'Admin     ')
INSERT [dbo].[ThongTinSieuThi] ([TenSieuThi], [DiaChiSieuThi], [SoDT], [TenChuSieuThi], [MaNVChuSieuThi], [CongQuy]) VALUES (N'Siêu thị Hiền Dương', N'140 - Lê Trọng Tấn - Q.Tân Phú - TP.HCM', N'1919 2222           ', N'Kiều Hữu Thành', N'2001160343          ', 100000)
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_Khohang] FOREIGN KEY([MaHangHoa])
REFERENCES [dbo].[KhoHang] ([MaHangHoa])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_Khohang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNVLapHoaDon])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[KhoHang]  WITH CHECK ADD  CONSTRAINT [FK_KhoHang_LoaiHangHoa] FOREIGN KEY([LoaiHangHoa])
REFERENCES [dbo].[LoaiHangHoa] ([TenLoaiHangHoa])
GO
ALTER TABLE [dbo].[KhoHang] CHECK CONSTRAINT [FK_KhoHang_LoaiHangHoa]
GO
ALTER TABLE [dbo].[ThongTinSieuThi]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinSieuThi] FOREIGN KEY([MaNVChuSieuThi])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[ThongTinSieuThi] CHECK CONSTRAINT [FK_ThongTinSieuThi]
GO
ALTER TABLE [dbo].[ThuChi]  WITH CHECK ADD  CONSTRAINT [FK_ThuChi_Khohang] FOREIGN KEY([MaHangHoa])
REFERENCES [dbo].[KhoHang] ([MaHangHoa])
GO
ALTER TABLE [dbo].[ThuChi] CHECK CONSTRAINT [FK_ThuChi_Khohang]
GO
ALTER TABLE [dbo].[ThuChi]  WITH CHECK ADD  CONSTRAINT [FK_ThuChi_NhanVien] FOREIGN KEY([MaNhanVienThuChi])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[ThuChi] CHECK CONSTRAINT [FK_ThuChi_NhanVien]
GO
USE [master]
GO
ALTER DATABASE [QL_SIEUTHI] SET  READ_WRITE 
GO
