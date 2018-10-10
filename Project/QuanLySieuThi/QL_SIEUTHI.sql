USE QL_SIEUTHI

CREATE TABLE LoaiHangHoa
(
	MaLoaiHangHoa nchar (20) not null,
	TenLoaiHangHoa nvarchar(50) not null primary key
)

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
	TenNhanVien nvarchar (50) not null,
	NgaySinh date,
	GioiTinh nvarchar (5),
	Luong float,
	Email nchar (20),
	DiaChi nvarchar (50),
	Tuoi int,
	UserName nchar (30) not null,
	Passwords nchar (30) not null,
	CapNguoiDung nchar (10) not null
)

CREATE TABLE KhachHang
(
	MaKhachHang nchar (20) not null primary key,
	TenKhachHang nvarchar (50) not null,
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
	MaHoaDon nchar (20) not null ,
	MaHangHoa nchar (30) not null ,
	TenHangHoa nvarchar (50),
	GiaBan float,
	Soluong int,
	ThanhTien float
)
alter table ChiTietHoaDon
add constraint pk_chitiethoadon primary key (MaHoaDon, MaHangHoa)

CREATE TABLE ThongTinSieuThi
(
	TenSieuThi nvarchar (50) not null primary key,
	DiaChiSieuThi nvarchar (50),
	SoDT nchar (20),
	TenChuSieuThi nvarchar (50),
	MaNVChuSieuThi nchar (20),
	CongQuy float,
)

CREATE TABLE ThuChi
(
	Stt int identity ,
	ThuChi nchar (5),
	TenHangHoa nvarchar (50),
	MaHangHoa nchar (30),
	SoLuong int,
	SoTienThuChi float,
	NgayThuChi date ,
	GioThuChi date ,
	TenNhanVienThuChi nvarchar (50),
	MaNhanVienThuChi nchar (20)
)
/*	THIẾT LẬP KHÓA NGOẠI	*/
Alter table KhoHang
Add constraint FK_LoaiHangHoa_KhoHang foreign key (LoaiHangHoa) references LoaiHangHoa(LoaiHangHoa) 
Alter table HoaDon
Add constraint FK_HoaDon_NhanVien foreign key (MaNVLapHoaDon) references NhanVien(MaNhanVien)
Alter table HoaDon
Add constraint FK_HoaDon_KhachHang foreign key (MaKhachHang) references KhachHang(MaKhachHang)
Alter table ThongTinSieuThi
Add constraint FK_ThongTinSieuThi foreign key (MaNVChuSieuThi) references NhanVien(MaNhanVien)
Alter table ChiTietHoaDon
Add constraint FK_ChiTietHoaDon_HoaDon foreign key (MaHoaDon) references HoaDon(MaHoaDon)
Alter table ChiTietHoaDon
Add constraint FK_ChiTietHoaDon_Khohang foreign key (MaHangHoa) references KhoHang(MaHangHoa)
Alter table ThuChi
Add constraint FK_ThuChi_Khohang foreign key (MaHangHoa) references KhoHang(MaHangHoa)
Alter table ThuChi
Add constraint FK_ThuChi_NhanVien foreign key (MaNhanVienThuChi) references NhanVien(MaNhanVien)
/*------------NHẬP LIỆU-----------*/

/*---1---Nhập nhân viên-----*/
INSERT INTO NhanVien
VALUES('2001160343',N'Kiều Hữu Thành','6/23/1998',N'Nam',8000000,'kieuhuuthanh23698','TP HCM',20,'2001160343','23061998','Admin')
INSERT INTO NhanVien
VALUES('2001160205',N'Huỳnh Thị Thùy Dương','01/19/1998',N'Nữ',6000000,'huynhduong1901',N'TP Bến Tre',20,'2001160205','19011998','User')
INSERT INTO NhanVien
VALUES('2001160222',N'Lê Thị Ngọc Hiền','05/22/1998',N'Nữ',6000000,'lethingochiencntp',N'TP Đồng Nai',20,'2001160222','22051998','User')
/*----2----Nhập khách hàng----------*/
INSERT INTO KhachHang
VALUES('KHACHHANG0',N'Khách vãng lai','0000000000')
INSERT INTO KhachHang
VALUES('KHACHHANG1',N'Nguyễn Văn A','0123456789')
INSERT INTO KhachHang
VALUES('KHACHHANG2',N'Nguyễn Văn B','0123785648')
/*-----3----Nhập loại hàng hóa---------*/
insert into LoaiHangHoa
values('SUA',N'SỮA')
insert into LoaiHangHoa
values('DOUONG',N'ĐỒ UỐNG')
insert into LoaiHangHoa
values('MP',N'MỸ PHẨM')
insert into LoaiHangHoa
values('DH',N'ĐỒ HỘP')
insert into LoaiHangHoa
values('KEO',N'KẸO')
insert into LoaiHangHoa
values('BG',N'BỘT GIẶT')
insert into LoaiHangHoa
values('BANH',N'BÁNH')
insert into LoaiHangHoa
values('DAN',N'ĐỒ ĂN NHANH')
insert into LoaiHangHoa
values('GIAVI',N'GIA VỊ')
insert into LoaiHangHoa
values('RAUCU',N'RAU CỦ')
insert into LoaiHangHoa
values('KHAC',N'KHÁC')
/*-----4-----Nhập kho hàng-----------*/
INSERT INTO KhoHang
VALUES('SUA01',N'BAD Gạo sữa dinh dưỡng',N'SỮA',54000,45000,N'bịch',20)
INSERT INTO KhoHang
VALUES('SUA02',N'Sữa Vinasoy nguyên chất',N'SỮA',26000,20000,N'bịch',50)
INSERT INTO KhoHang
VALUES('SUA03',N'BAD sữa gạo lức',N'SỮA',54000,45000,N'bịch',30)
INSERT INTO KhoHang
VALUES('SUA04',N'sữa Friso Gold 2',N'SỮA',231000,180000,N'hộp',28)
INSERT INTO KhoHang
VALUES('SUA05',N'Sữa Kun vị cam 110ml',N'SỮA',4000,2500,N'hộp',26)
INSERT INTO KhoHang
VALUES('SUA06',N'Nuti IQ 456 Gold',N'SỮA',282000,250000,N'hộp',22)
INSERT INTO KhoHang
VALUES('SUA07',N'BAD lúa mì',N'SỮA',50000,40000,N'bịch',20)
INSERT INTO KhoHang
VALUES('SUA08',N'Dielac Gold Step 2 400g',N'SỮA',136000,105000,N'hộp',32)
INSERT INTO KhoHang
VALUES('SUA09',N'Sữa ông thọ',N'SỮA',15500,10500,N'lon',25)
INSERT INTO KhoHang
VALUES('SUA10',N'Nuti Vita',N'SỮA',206000,185500,N'hộp',16)


INSERT INTO KhoHang
VALUES('DOUONG01',N'Coca Cola Nhật 300ml',N'ĐỒ UỐNG',44900,35500,N'chai',45)
INSERT INTO KhoHang
VALUES('DOUONG02',N'Yummy Panda Thạch uống trái cây vị xoài',N'ĐỒ UỐNG',14900,8500,N'gói',38)
INSERT INTO KhoHang
VALUES('DOUONG03',N'Nước giải khát Latte Đào 345ml',N'ĐỒ UỐNG',9900,4500,N'chai',25)
INSERT INTO KhoHang
VALUES('DOUONG04',N'Wonderfarm Trà bí đao',N'ĐỒ UỐNG',5500,2500,N'chai',50)
INSERT INTO KhoHang
VALUES('DOUONG05',N'Trà Ô Long Tea Plus 500ml',N'ĐỒ UỐNG',9500,5500,N'chai',45)
INSERT INTO KhoHang
VALUES('DOUONG06',N'Nước khoáng AVIAN 500ml',N'ĐỒ UỐNG',31500,24500,N'chai',60)
INSERT INTO KhoHang
VALUES('DOUONG07',N'Sinh Tố Phúc Bồn Tử 350ml',N'ĐỒ UỐNG',117900,96500,N'chai',45)
INSERT INTO KhoHang
VALUES('DOUONG08',N'Fanta Saxi 390ml',N'ĐỒ UỐNG',6500,2500,N'chai',24)
INSERT INTO KhoHang
VALUES('DOUONG09',N'Ice Đào',N'ĐỒ UỐNG',7500,3500,N'chai',35)
INSERT INTO KhoHang
VALUES('DOUONG10',N'Pepsi chai 15l',N'ĐỒ UỐNG',14700,8300,N'chai',64)


INSERT INTO KhoHang
VALUES('MP01',N'Dầu gội đầu Tresemme Detox',N'MỸ PHẨM',169000,105800,N'chai',38)
INSERT INTO KhoHang
VALUES('MP02',N'Sữa rửa mặt Nivia tẩy trang',N'MỸ PHẨM',34000,28000,N'lọ',18)
INSERT INTO KhoHang
VALUES('MP03',N'Sữa tắm Enchanter 650',N'MỸ PHẨM',131000,118500,N'chai',48)
INSERT INTO KhoHang
VALUES('MP04',N'Nước tẩy trang Bioderma hồng 100ml',N'MỸ PHẨM',246000,230500,N'lọ',24)
INSERT INTO KhoHang
VALUES('MP05',N'Sữa rửa mặt Laroche-Posay Pháp 200ml',N'MỸ PHẨM',345000,320500,N'lọ',15)
INSERT INTO KhoHang
VALUES('MP06',N'Toner Bioderma 100ml da nhạy cảm',N'MỸ PHẨM',280000,255000,N'lọ',45)
INSERT INTO KhoHang
VALUES('MP07',N'Son dưỡng môi lemonade đỏ cam',N'MỸ PHẨM',230000,185000,N'lọ',14)
INSERT INTO KhoHang
VALUES('MP08',N'Nước hoa Enchater hương hoa oải hương',N'MỸ PHẨM',250000,190500,N'lọ',42)
INSERT INTO KhoHang
VALUES('MP09',N'Sữa dưỡng thể Nivia',N'MỸ PHẨM',158000,125000,N'lọ',12)
INSERT INTO KhoHang
VALUES('MP10',N'Gel lột mặt Nha đam',N'MỸ PHẨM',50000,40500,N'lọ',18)

INSERT INTO KhoHang
VALUES('DH01',N'Xúc xích dinh dưỡng bò',N'ĐỒ HỘP',20000,13700,N'hộp',58)
INSERT INTO KhoHang
VALUES('DH02',N'Khô gà cay lá chanh',N'ĐỒ HỘP',155000,105000,N'hộp',48)
INSERT INTO KhoHang
VALUES('DH03',N'Thập cẩm sấy',N'ĐỒ HỘP',99000,70500,N'hộp',18)
INSERT INTO KhoHang
VALUES('DH04',N'Chuối sấy dẻo',N'ĐỒ HỘP',69000,45500,N'hộp',32)
INSERT INTO KhoHang
VALUES('DH05',N'Hạt điều sấy rang tỏi ớt',N'ĐỒ HỘP',58000,35000,N'hộp',42)
INSERT INTO KhoHang
VALUES('DH06',N'Mứt dừa sấy giòn',N'ĐỒ HỘP',100000,75500,N'hộp',34)
INSERT INTO KhoHang
VALUES('DH07',N'Lương khô bô binh BB702',N'ĐỒ HỘP',65000,43500,N'hộp',14)
INSERT INTO KhoHang
VALUES('DH08',N'Cá mực Rim me cán Nha Trang',N'ĐỒ HỘP',95000,68500,N'hộp',36)
INSERT INTO KhoHang
VALUES('DH09',N'Chà bông gà Hương Việt 60g',N'ĐỒ HỘP',21500,12500,N'hộp',45)
INSERT INTO KhoHang
VALUES('DH10',N'Cá sốt cà Hạ Long 175g',N'ĐỒ HỘP',37800,30700,N'hộp',18)

INSERT INTO KhoHang
VALUES('KEO01',N'Kẹo mận Thái Lan',N'KẸO',37500,29000,N'gói',26)
INSERT INTO KhoHang
VALUES('KEO02',N'Kẹo Lotte Anytime Bluemarine 74g',N'KẸO',32300,24700,N'gói',16)
INSERT INTO KhoHang
VALUES('KEO03',N'Kẹo cứng hương Cherry Bonbon 80g',N'KẸO',5600,2400,N'gói',36)
INSERT INTO KhoHang
VALUES('KEO04',N'Kẹo Socola viên bi Choco-Rock-Marble 65g',N'KẸO',24800,15600,N'gói',45)
INSERT INTO KhoHang
VALUES('KEO05',N'Kẹo ngậm ho không đường Pulmoll Krish',N'KẸO',56100,42400,N'gói',14)
INSERT INTO KhoHang
VALUES('KEO06',N'Kẹo nhai Mentos hương trái cây 40 viên',N'KẸO',13200,6400,N'gói',14)
INSERT INTO KhoHang
VALUES('KEO07',N'Kẹo Chupa Chups vitamin C 100g',N'KẸO',9200,3400,N'gói',58)
INSERT INTO KhoHang
VALUES('KEO08',N'Kẹo Socola nhân hạt hạnh nhân Choco-Rock-Almond',N'KẸO',35500,26800,N'gói',34)
INSERT INTO KhoHang
VALUES('KEO09',N'Kẹo Socola Trà xanh Dars Morinaga 21g',N'KẸO',10200,4600,N'gói',22)
INSERT INTO KhoHang
VALUES('KEO10',N'Kẹo mận Thái Lan',N'KẸO',307500,29000,N'gói',26)

INSERT INTO KhoHang
VALUES('BG01',N'Bột Giặt APA 3kg',N'BỘT GIẶT',101000,80500,N'bịch',34)
INSERT INTO KhoHang
VALUES('BG02',N'Nước giặt khử mùi Attack hương anh đào 14kg',N'BỘT GIẶT',89000,76800,N'túi',48)
INSERT INTO KhoHang
VALUES('BG03',N'Nước giặt Surf hương cỏ hoa 18kg',N'BỘT GIẶT',54900,45600,N'bịch',12)
INSERT INTO KhoHang
VALUES('BG04',N'Nước xả vải Comfort hương nước hoa',N'BỘT GIẶT',167800,145500,N'bịch',18)
INSERT INTO KhoHang
VALUES('BG05',N'Bột giặt Lix hương nước hoa 55kg',N'BỘT GIẶT',219000,180800,N'bịch',24)


INSERT INTO KhoHang
VALUES('BANH01',N'Bánh gạo want want vị phô mai 108g',N'BÁNH',39900,28600,N'gói',18)
INSERT INTO KhoHang
VALUES('BANH02',N'Bánh quế Cosy nhân kem phô mai 462g',N'BÁNH',5000,2600,N'hộp',34)
INSERT INTO KhoHang
VALUES('BANH03',N'Bánh kem sữa hạt chia Rosio 276g',N'BÁNH',55800,42600,N'gói',20)
INSERT INTO KhoHang
VALUES('BANH04',N'Bánh bông lan Apollo cốm hộp 360g',N'BÁNH',63600,51200,N'hộp',46)
INSERT INTO KhoHang
VALUES('BANH05',N'Bánh quy Cosy dừa Marie 320g',N'BÁNH',41400,29600,N'hộp',14)


INSERT INTO KhoHang
VALUES('DAN01',N'Phở bò Như Ý',N'ĐỒ ĂN NHANH',4000,2300,N'gói',46)

INSERT INTO KhoHang
VALUES('GIAVI01',N'Nước mắm rồng vàng',N'GIA VỊ',15000,9200,N'chai',14)
INSERT INTO KhoHang
VALUES('GIAVI02',N'Tương ớt chisu',N'GIA VỊ',9000,4200,N'chai',18)
INSERT INTO KhoHang
VALUES('GIAVI03',N'Bột canh ajinomoto',N'GIA VỊ',46500,34200,N'bịch',34)
INSERT INTO KhoHang
VALUES('GIAVI04',N'Nước tương Maggi đậm đặc 300ml',N'GIA VỊ',11700,5200,N'chai',24)
INSERT INTO KhoHang
VALUES('GIAVI05',N'Bột bánh  chuối Hương Xưa 250g',N'GIA VỊ',23000,14500,N'bịch',14)
INSERT INTO KhoHang
VALUES('GIAVI06',N'Bột tẩm khô chiên giòn Aji-Quick 84g',N'GIA VỊ',11000,5500,N'bịch',28)
INSERT INTO KhoHang
VALUES('GIAVI07',N'Sa tế Vị Hảo 250g',N'GIA VỊ',20200,12400,N'chai',10)

INSERT INTO KhoHang
VALUES('RAUCU01',N'Bắp Mỹ siêu ngọt',N'RAU CỦ',17500,9400,N'05kg',10)
INSERT INTO KhoHang
VALUES('RAUCU02',N'Cam Úc',N'RAU CỦ',49000,39400,N'1kg',20)
INSERT INTO KhoHang
VALUES('RAUCU03',N'Kiwi xanh New Zealand',N'RAU CỦ',105000,86500,N'1kg',15)
INSERT INTO KhoHang
VALUES('RAUCU04',N'Nho xanh không hạt Mỹ',N'RAU CỦ',185900,140600,N'1kg',26)
INSERT INTO KhoHang
VALUES('RAUCU05',N'Cherry đỏ Mỹ',N'RAU CỦ',180500,145600,N'1kg',8)
INSERT INTO KhoHang
VALUES('RAUCU06',N'Táo Jazz New Zealand',N'RAU CỦ',79000,58600,N'1kg',14)

/*----Nhập hóa đơn----*/
insert into HoaDon
values('HOADON_1','10/7/2018',GETDATE(),N'Kiều Hữu Thành','2001160343',N'Khách vãng lai','KHACHHANG0',123.321,5,12,101.321,200000,98.212)

select MaKhachHang
from KhachHang
where TenKhachHang = N'Khách vãng lai'

select LoaiHangHoa
from LoaiHangHoa

select * 
from NhanVien 
where UserName = '2001160343' and Passwords = '23061998'


select MaHangHoa as N'Mã hàng hóa', TenHangHoa as N'Tên hàng hóa', GiaBan as N'Giá bán', DonVi as N'Đơn vị', SoluongTrongKho as N'Tồn kho' 
from KhoHang


select distinct LoaiHangHoa as N'Loại hàng hóa'
from KhoHang

select MaHangHoa as N'Mã hàng hóa', TenHangHoa as N'Tên hàng hóa', GiaBan as N'Giá bán', DonVi as N'Đơn vị', SoluongTrongKho as N'Tồn kho' from KhoHang


select MaHangHoa
from KhoHang
where TenHangHoa = N'BAD Gạo sữa dinh dưỡng'

insert into ChiTietHoaDon 
values('HOADON_1','BANH02',N'Bánh quế Cosy nhân kem phô mai 462g',5000,1,5000)

insert into LoaiHangHoa
values('ma nhom mat hang',N'tên nhóm mặt hàng')

select MaHangHoa as N'Mã hàng hóa', TenHangHoa as N'Tên hàng hóa', GiaBan as N'Giá bán', DonVi as N'Đơn vị' ,SoluongTrongKho as N'Số lượng' from KhoHang

select SoluongTrongKho
from KhoHang
where TenHangHoa = N'Bánh gạo want want vị phô mai 108g'

update KhoHang
set SoluongTrongKho = 12
where TenHangHoa = N''



select *
from ChiTietHoaDon, KhoHang
where LoaiHangHoa = N'SỮA'





delete
from KhoHang
where LoaiHangHoa = N'SỮA'
delete
from LoaiHangHoa
where LoaiHangHoa = N'SỮA'

insert into LoaiHangHoa
values('SUA',N'SỮA')
INSERT INTO KhoHang
VALUES('SUA01',N'BAD Gạo sữa dinh dưỡng',N'SỮA',54000,45000,N'bịch',20)
INSERT INTO KhoHang
VALUES('SUA02',N'Sữa Vinasoy nguyên chất',N'SỮA',26000,20000,N'bịch',50)
INSERT INTO KhoHang
VALUES('SUA03',N'BAD sữa gạo lức',N'SỮA',54000,45000,N'bịch',30)
INSERT INTO KhoHang
VALUES('SUA04',N'sữa Friso Gold 2',N'SỮA',231000,180000,N'hộp',28)
INSERT INTO KhoHang
VALUES('SUA05',N'Sữa Kun vị cam 110ml',N'SỮA',4000,2500,N'hộp',26)
INSERT INTO KhoHang
VALUES('SUA06',N'Nuti IQ 456 Gold',N'SỮA',282000,250000,N'hộp',22)
INSERT INTO KhoHang
VALUES('SUA07',N'BAD lúa mì',N'SỮA',50000,40000,N'bịch',20)
INSERT INTO KhoHang
VALUES('SUA08',N'Dielac Gold Step 2 400g',N'SỮA',136000,105000,N'hộp',32)
INSERT INTO KhoHang
VALUES('SUA09',N'Sữa ông thọ',N'SỮA',15500,10500,N'lon',25)
INSERT INTO KhoHang
VALUES('SUA10',N'Nuti Vita',N'SỮA',206000,185500,N'hộp',16)


/*tính tiền lời dựa vào chi tiết hóa đơn và các thông tin của hàng hóa trong kho hàng*/
select (kq.gb - kq.gm) as N'Tiền Lời'
from
(
select SUM(KhoHang.GiaBan) as gb , SUM(KhoHang.GiaMua) as gm
from ChiTietHoaDon,KhoHang
where ChiTietHoaDon.MaHangHoa = KhoHang.MaHangHoa
) as kq


select LoaiHangHoa.LoaiHangHoa, KhoHang.TenHangHoa, KhoHang.SoluongTrongKho
from LoaiHangHoa, KhoHang
where LoaiHangHoa.LoaiHangHoa = KhoHang.LoaiHangHoa

update KhoHang set SoluongTrongKho = 0 where LoaiHangHoa = N'Bánh'


update LoaiHangHoa set TenLoaiHangHoa = N'XỬA' where TenLoaiHangHoa = N'SỮA'


/*UPDATE 2 BẢNG DỮ LIỆU KHO HÀNG VÀ LOẠI MẶT HÀNG, ĐỔI TÊN LOẠI MẶT HÀNG*/
select MaLoaiHangHoa
from LoaiHangHoa
where TenLoaiHangHoa = N'XỬA'
INSERT INTO LoaiHangHoa
VALUES((select MaLoaiHangHoa
from LoaiHangHoa
where TenLoaiHangHoa = N'SỮA'),N'XỬA')
update KhoHang set LoaiHangHoa = N'XỬA' where LoaiHangHoa = N'SỮA'
DELETE LoaiHangHoa
WHERE TenLoaiHangHoa = N'SỮA'
/*ĐỔI SỮA THÀNH XỬA*/

SELECT *
FROM LoaiHangHoa
WHERE TenLoaiHangHoa = N''


insert into LoaiHangHoa values('SUA',N'SỮA')

select MaLoaiHangHoa
from LoaiHangHoa 
where TenLoaiHangHoa = N'BÁnh'




select TenNhanVien
from NhanVien
select MaNhanVien
from NhanVien
where MaNhanVien=N'thành'

insert into NhanVien
values('r','r','','',,,,,'r','r','r')
