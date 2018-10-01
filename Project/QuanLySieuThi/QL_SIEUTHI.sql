USE QL_SIEUTHI

CREATE TABLE KhoHang
(
	MaHangHoa nchar (30) not null primary key,
	TenHangHoa nvarchar (50),
	LoaiHangHoa nvarchar (50),
	GiaBan float,
	GiaMua float,
	DonVi nvarchar (20),
	SoluongTrongKho int
)

CREATE TABLE NhanVien
(
	MaNhanVien nchar (20) not null primary key,
	TenNhanVien nvarchar (50),
	NgaySinh date,
	GioiTinh nvarchar (5),
	Luong float,
	Email nchar (20),
	DiaChi nvarchar (50),
	Tuoi int,
	CapNguoiDung nchar (10)
)

CREATE TABLE KhachHang
(
	MaKhachHang nchar (20) not null primary key,
	TenKhachHang nvarchar (50),
	SoDienThoai nchar (20)
)

CREATE TABLE HoaDon
(
	MaHoaDon nchar (20) not null primary key,
	NgayLapHoaDon date,
	GioLapHoaDon time,
	TenNVLapHoaDon nvarchar (50),
	MaNVLapHoaDon nchar (20),
	TenKhachHang nvarchar (50),
	MaKhachHang nchar (20),
	TienHang float,
	PhanTramGiamGia float,
	GiamGia float,
	TongThanhTien float,
	KhachDua float,
	TraLai float,
)

CREATE TABLE ChiTietHoaDon
(
	MaHoaDon nchar (20) not null,
	MaHangHoa nchar (30) not null,
	TenHangHoa nvarchar (30),
	GiaBan float,
	Soluong int,
	ThanhTien float
)
Alter table ChiTietHoaDon
Add constraint  PK_ChiTietHoaDon primary key (MaHoaDon,MaHangHoa)

CREATE TABLE ThongTinSieuThi
(
	TenSieuThi nvarchar (50) not null primary key,
	DiaChiSieuThi nvarchar (50),
	SoDT nchar (20),
	TenChuSieuThi nvarchar (50),
	MaNVChuSieuThi nchar (20),
	CongQuy float,
)

CREATE TABLE Users
(
	UserName nchar (30) not null,
	Passwords nchar (30),
	MaNhanVien nchar (20) not null
)
Alter table Users
Add contraint PK primary key (UserName,MaNhanVien)

CREATE TABLE ThuChi
(
	ThuChi nchar (5),
	TenHangHoa nvarchar (50),
	MaHangHoa nchar (30),
	SoLuong int,
	SoTienThuChi float,
	NgayThuChi date not null,
	GioThuChi date not null,
	TenNhanVienThuChi nvarchar (50),
	MaNhanVienThuChi nchar (20)
)
Alter table ThuChi
Add contraint PK_ThuChi primary key (NgayThuChi,GioThuChi)

/*------------NHẬP LIỆU-----------*/

INSERT INTO KhoHang
VALUES('SUA01',N'BAD Gạo sữa dinh dưỡng',N'SỮA',54.000,45.000,N'bịch',20)
INSERT INTO KhoHang
VALUES('SUA02',N'Sữa Vinasoy nguyên chất',N'SỮA',26.000,20.000,N'bịch',50)
INSERT INTO KhoHang
VALUES('SUA03',N'BAD sữa gạo lức',N'SỮA',54.000,45.000,N'bịch',30)
INSERT INTO KhoHang
VALUES('SUA04',N'sữa Friso Gold 2',N'SỮA',231.000,180.000,N'hộp',28)
INSERT INTO KhoHang
VALUES('SUA05',N'Sữa Kun vị cam 110ml',N'SỮA',4.000,2.500,N'hộp',26)
INSERT INTO KhoHang
VALUES('SUA06',N'Nuti IQ 456 Gold',N'SỮA',282.000,250.000,N'hộp',22)
INSERT INTO KhoHang
VALUES('SUA07',N'BAD lúa mì',N'SỮA',50.000,40.000,N'bịch',20)
INSERT INTO KhoHang
VALUES('SUA08',N'Dielac Gold Step 2 400g',N'SỮA',136.000,105.000,N'hộp',32)
INSERT INTO KhoHang
VALUES('SUA09',N'Sữa ông thọ',N'SỮA',15.500,10.500,N'lon',25)
INSERT INTO KhoHang
VALUES('SUA10',N'Nuti Vita',N'SỮA',206.000,185.500,N'hộp',16)


INSERT INTO KhoHang
VALUES('DOUONG01',N'Coca Cola Nhật 300ml',N'ĐỒ UỐNG',44.900,35.500,N'chai',45)
INSERT INTO KhoHang
VALUES('DOUONG02',N'Yummy Panda Thạch uống trái cây vị xoài',N'ĐỒ UỐNG',14.900,8.500,N'gói',38)
INSERT INTO KhoHang
VALUES('DOUONG03',N'Nước giải khát Latte Đào 345ml',N'ĐỒ UỐNG',9.900,4.500,N'chai',25)
INSERT INTO KhoHang
VALUES('DOUONG04',N'Wonderfarm Trà bí đao',N'ĐỒ UỐNG',5.500,2.500,N'chai',50)
INSERT INTO KhoHang
VALUES('DOUONG05',N'Trà Ô Long Tea Plus 500ml',N'ĐỒ UỐNG',9.500,5.500,N'chai',45)
INSERT INTO KhoHang
VALUES('DOUONG06',N'Nước khoáng AVIAN 500ml',N'ĐỒ UỐNG',31.500,24.500,N'chai',60)
INSERT INTO KhoHang
VALUES('DOUONG07',N'Sinh Tố Phúc Bồn Tử 350ml',N'ĐỒ UỐNG',117.900,96.500,N'chai',45)
INSERT INTO KhoHang
VALUES('DOUONG08',N'Fanta Saxi 390ml',N'ĐỒ UỐNG',6.500,2.500,N'chai',24)
INSERT INTO KhoHang
VALUES('DOUONG09',N'Ice Đào',N'ĐỒ UỐNG',7.500,3.500,N'chai',35)
INSERT INTO KhoHang
VALUES('DOUONG10',N'Pepsi chai 1.5l',N'ĐỒ UỐNG',14.700,8.300,N'chai',64)


INSERT INTO KhoHang
VALUES('MP01',N'Dầu gội đầu Tresemme Detox',N'MỸ PHẨM',169.000,105.800,N'chai',38)
INSERT INTO KhoHang
VALUES('MP02',N'Sữa rửa mặt Nivia tẩy trang',N'MỸ PHẨM',34.000,28.000,N'lọ',18)
INSERT INTO KhoHang
VALUES('MP03',N'Sữa tắm Enchanter 650',N'MỸ PHẨM',131.000,118.500,N'chai',48)
INSERT INTO KhoHang
VALUES('MP04',N'Nước tẩy trang Bioderma hồng 100ml',N'MỸ PHẨM',246.000,230.500,N'lọ',24)
INSERT INTO KhoHang
VALUES('MP05',N'Sữa rửa mặt Laroche-Posay Pháp 200ml',N'MỸ PHẨM',345.000,320.500,N'lọ',15)
INSERT INTO KhoHang
VALUES('MP06',N'Toner Bioderma 100ml da nhạy cảm',N'MỸ PHẨM',280.000,255.000,N'lọ',45)
INSERT INTO KhoHang
VALUES('MP07',N'Son dưỡng môi lemonade đỏ cam',N'MỸ PHẨM',230.000,185.000,N'lọ',14)
INSERT INTO KhoHang
VALUES('MP08',N'Nước hoa Enchater hương hoa oải hương',N'MỸ PHẨM',250.000,190.500,N'lọ',42)
INSERT INTO KhoHang
VALUES('MP09',N'Sữa dưỡng thể Nivia',N'MỸ PHẨM',158.000,125.000,N'lọ',12)
INSERT INTO KhoHang
VALUES('MP10',N'Gel lột mặt Nha đam',N'MỸ PHẨM',50.000,40.500,N'lọ',18)

INSERT INTO KhoHang
VALUES('DH01',N'Xúc xích dinh dưỡng bò',N'ĐỒ HỘP',20.000,13.700,N'hộp',58)
INSERT INTO KhoHang
VALUES('DH02',N'Khô gà cay lá chanh',N'ĐỒ HỘP',155.000,105.000,N'hộp',48)
INSERT INTO KhoHang
VALUES('DH03',N'Thập cẩm sấy',N'ĐỒ HỘP',99.000,70.500,N'hộp',18)
INSERT INTO KhoHang
VALUES('DH04',N'Chuối sấy dẻo',N'ĐỒ HỘP',69.000,45.500,N'hộp',32)
INSERT INTO KhoHang
VALUES('DH05',N'Hạt điều sấy rang tỏi ớt',N'ĐỒ HỘP',58.000,35.000,N'hộp',42)
INSERT INTO KhoHang
VALUES('DH06',N'Mứt dừa sấy giòn',N'ĐỒ HỘP',100.000,75.500,N'hộp',34)
INSERT INTO KhoHang
VALUES('DH07',N'Lương khô bô binh BB702',N'ĐỒ HỘP',65.000,43.500,N'hộp',14)
INSERT INTO KhoHang
VALUES('DH08',N'Cá mực Rim me cán Nha Trang',N'ĐỒ HỘP',95.000,68.500,N'hộp',36)
INSERT INTO KhoHang
VALUES('DH09',N'Chà bông gà Hương Việt 60g',N'ĐỒ HỘP',21.500,12.500,N'hộp',45)
INSERT INTO KhoHang
VALUES('DH10',N'Cá sốt cà Hạ Long 175g',N'ĐỒ HỘP',37.800,30.700,N'hộp',18)

INSERT INTO KhoHang
VALUES('KEO01',N'Kẹo mận Thái Lan',N'KẸO',37.500,29.000,N'gói',26)
INSERT INTO KhoHang
VALUES('KEO02',N'Kẹo Lotte Anytime Bluemarine 74g',N'KẸO',32.300,24.700,N'gói',16)
INSERT INTO KhoHang
VALUES('KEO03',N'Kẹo cứng hương Cherry Bonbon 80g',N'KẸO',5.600,2.400,N'gói',36)
INSERT INTO KhoHang
VALUES('KEO04',N'Kẹo Socola viên bi Choco-Rock-Marble 65g',N'KẸO',24.800,15.600,N'gói',45)
INSERT INTO KhoHang
VALUES('KEO05',N'Kẹo ngậm ho không đường Pulmoll Krish',N'KẸO',56.100,42.400,N'gói',14)
INSERT INTO KhoHang
VALUES('KEO06',N'Kẹo nhai Mentos hương trái cây 40 viên',N'KẸO',13.200,6.400,N'gói',14)
INSERT INTO KhoHang
VALUES('KEO07',N'Kẹo Chupa Chups vitamin C 100g',N'KẸO',9.200,3.400,N'gói',58)
INSERT INTO KhoHang
VALUES('KEO08',N'Kẹo Socola nhân hạt hạnh nhân Choco-Rock-Almond',N'KẸO',35.500,26.800,N'gói',34)
INSERT INTO KhoHang
VALUES('KEO09',N'Kẹo Socola Trà xanh Dars Morinaga 21g',N'KẸO',10.200,4.600,N'gói',22)
INSERT INTO KhoHang
VALUES('KEO10',N'Kẹo mận Thái Lan',N'KẸO',307.500,29.000,N'gói',26)

INSERT INTO KhoHang
VALUES('BG01',N'Bột Giặt APA 3kg',N'BỘT GIẶT',101.000,80.500,N'bịch',34)
INSERT INTO KhoHang
VALUES('BG02',N'Nước giặt khử mùi Attack hương anh đào 1.4kg',N'BỘT GIẶT',89.000,76.800,N'túi',48)
INSERT INTO KhoHang
VALUES('BG03',N'Nước giặt Surf hương cỏ hoa 1.8kg',N'BỘT GIẶT',54.900,45.600,N'bịch',12)
INSERT INTO KhoHang
VALUES('BG04',N'Nước xả vải Comfort hương nước hoa',N'BỘT GIẶT',167.800,145.500,N'bịch',18)
INSERT INTO KhoHang
VALUES('BG05',N'Bột giặt Lix hương nước hoa 5.5kg',N'BỘT GIẶT',219.000,180.800,N'bịch',24)


INSERT INTO KhoHang
VALUES('BANH01',N'Bánh gạo want want vị phô mai 108g',N'BÁNH',39.900,28.600,N'gói',18)
INSERT INTO KhoHang
VALUES('BANH02',N'Bánh quế Cosy nhân kem phô mai 46.2g',N'BÁNH',5.000,2.600,N'hộp',34)
INSERT INTO KhoHang
VALUES('BANH03',N'Bánh kem sữa hạt chia Rosio 276g',N'BÁNH',55.800,42.600,N'gói',20)
INSERT INTO KhoHang
VALUES('BANH04',N'Bánh bông lan Apollo cốm hộp 360g',N'BÁNH',63.600,51.200,N'hộp',46)
INSERT INTO KhoHang
VALUES('BANH05',N'Bánh quy Cosy dừa Marie 320g',N'BÁNH',41.400,29.600,N'hộp',14)


INSERT INTO KhoHang
VALUES('DAN01',N'Phở bò Như Ý',N'ĐỒ ĂN NHANH',4.000,2.300,N'gói',46)

INSERT INTO KhoHang
VALUES('GIAVI01',N'Nước mắm rồng vàng',N'GIA VỊ',15.000,9.200,N'chai',14)
INSERT INTO KhoHang
VALUES('GIAVI02',N'Tương ớt chisu',N'GIA VỊ',9.000,4.200,N'chai',18)
INSERT INTO KhoHang
VALUES('GIAVI03',N'Bột canh ajinomoto',N'GIA VỊ',46.500,34.200,N'bịch',34)
INSERT INTO KhoHang
VALUES('GIAVI04',N'Nước tương Maggi đậm đặc 300ml',N'GIA VỊ',11.700,5.200,N'chai',24)
INSERT INTO KhoHang
VALUES('GIAVI05',N'Bột bánh  chuối Hương Xưa 250g',N'GIA VỊ',23.000,14.500,N'bịch',14)
INSERT INTO KhoHang
VALUES('GIAVI06',N'Bột tẩm khô chiên giòn Aji-Quick 84g',N'GIA VỊ',11.000,5.500,N'bịch',28)
INSERT INTO KhoHang
VALUES('GIAVI07',N'Sa tế Vị Hảo 250g',N'GIA VỊ',20.200,12.400,N'chai',10)

INSERT INTO KhoHang
VALUES('RAUCU01',N'Bắp Mỹ siêu ngọt',N'RAU CỦ',17.500,9.400,N'0.5kg',10)
INSERT INTO KhoHang
VALUES('RAUCU02',N'Cam Úc',N'RAU CỦ',49.000,39.400,N'1kg',20)
INSERT INTO KhoHang
VALUES('RAUCU03',N'Kiwi xanh New Zealand',N'RAU CỦ',105.000,86.500,N'1kg',15)
INSERT INTO KhoHang
VALUES('RAUCU04',N'Nho xanh không hạt Mỹ',N'RAU CỦ',185.900,140.600,N'1kg',26)
INSERT INTO KhoHang
VALUES('RAUCU05',N'Cherry đỏ Mỹ',N'RAU CỦ',180.500,145.600,N'1kg',8)
INSERT INTO KhoHang
VALUES('RAUCU06',N'Táo Jazz New Zealand',N'RAU CỦ',79.000,58.600,N'1kg',14)

INSERT INTO NhanVien
VALUES('2001160343',N'Kiều Hữu Thành','6/23/1998',N'Nam',8000000,'kieuhuuthanh23698','TP HCM',20,'Admin')
INSERT INTO NhanVien
VALUES('2001160205',N'Huỳnh Thị Thùy Dương','01/19/1998',N'Nữ',6000000,'huynhduong1901',N'TP Bến Tre',20,'user')
INSERT INTO NhanVien
VALUES('2001160222',N'Lê Thị Ngọc Hiền','05/22/1998',N'Nữ',6000000,'lethingochiencntp',N'TP Đồng Nai',20,'user')

INSERT INTO Users
VALUES('2001160343','230698','2001160343')
INSERT INTO Users
VALUES('2001160205','19011998','2001160205')
INSERT INTO Users
VALUES('2001160222','22051998','2001160222')






select MaHangHoa as N'Mã hàng hóa', TenHangHoa as N'Tên hàng hóa', GiaBan as N'Giá bán', DonVi as N'Đơn vị', SoluongTrongKho as N'Tồn kho' from KhoHang


select distinct LoaiHangHoa as N'Loại hàng hóa'
from KhoHang