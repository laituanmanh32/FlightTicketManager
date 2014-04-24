

------------ TrangThaiTG ------------------
INSERT INTO TrangThaiTG(TenTT, PhanTramTP)
VALUES ('TG',100);
INSERT INTO TrangThaiTG(TenTT, PhanTramTP)
VALUES ('TG',100);
INSERT INTO TrangThaiTG(TenTT, PhanTramTP)
VALUES ('DD',100);
INSERT INTO TrangThaiTG(TenTT, PhanTramTP)
VALUES ('HH',100);

------------ PhiVCHH ----------------------
INSERT INTO PhiVCHH(LoaiVe, TrongLuongDM, DonGia_Kg, ThoiDiemApDung)
VALUES ('PT',20,100000,current_date);
INSERT INTO PhiVCHH(LoaiVe, TrongLuongDM, DonGia_Kg, ThoiDiemApDung)
VALUES ('VIP',30,100000,current_date);
INSERT INTO PhiVCHH(LoaiVe, TrongLuongDM, DonGia_Kg, ThoiDiemApDung)
VALUES ('PT',20,100000,current_date);
INSERT INTO PhiVCHH(LoaiVe, TrongLuongDM, DonGia_Kg, ThoiDiemApDung)
VALUES ('VIP',30,100000,current_date);

---------- LoaiMayBay ----------------
INSERT INTO LoaiMayBay(MSLMB, HangSX, Model_, SoGheVip, SoGhePT, TongSoGhe)
VALUES ('1','Boeing','777',100,600,700);
INSERT INTO LoaiMayBay(MSLMB, HangSX, Model_, SoGheVip, SoGhePT, TongSoGhe)
VALUES ('2','Boeing','888',70,100,170);
INSERT INTO LoaiMayBay(MSLMB, HangSX, Model_, SoGheVip, SoGhePT, TongSoGhe)
VALUES ('3','Boeing','999',50,200,250);
INSERT INTO LoaiMayBay(MSLMB, HangSX, Model_, SoGheVip, SoGhePT, TongSoGhe)
VALUES ('4','Boeing','666',100,1000,1100);

----------- MayBay -------------------
INSERT INTO MayBay(MSMB, TongGioBay, NamSX, ThoiDiemSD, MSLMB)
VALUES ('SAP001',0,2000,current_date,'1');
INSERT INTO MayBay(MSMB, TongGioBay, NamSX, ThoiDiemSD, MSLMB)
VALUES ('SAP002',0,2001,current_date,'2');
INSERT INTO MayBay(MSMB, TongGioBay, NamSX, ThoiDiemSD, MSLMB)
VALUES ('SAP003',0,2014,current_date,'3');
INSERT INTO MayBay(MSMB, TongGioBay, NamSX, ThoiDiemSD, MSLMB)
VALUES ('SAP004',0,2014,current_date,'4');

---------- Ga ----------------------------
INSERT INTO Ga(TenSB, ThanhPho, QuocGia)
VALUES ('Tân Sơn Nhất', 'Hồ Chí Minh', 'Việt Nam');
INSERT INTO Ga(TenSB, ThanhPho, QuocGia)
VALUES ('Nội Bài', 'Hà Nội', 'Việt Nam');
INSERT INTO Ga(TenSB, ThanhPho, QuocGia)
VALUES ('Pleiku', 'Pleiku', 'Việt Nam');
INSERT INTO Ga(TenSB, ThanhPho, QuocGia)
VALUES ('Cát Bi', 'Hải Phòng', 'Việt Nam');

--------- TuyenBay ----------------------
INSERT INTO TuyenBay( MSG_Di, MSG_Den)
VALUES (1,2);
INSERT INTO TuyenBay( MSG_Di, MSG_Den)
VALUES (1,3);
INSERT INTO TuyenBay( MSG_Di, MSG_Den)
VALUES (1,4);
INSERT INTO TuyenBay( MSG_Di, MSG_Den)
VALUES (2,3);

------------ ChuyenBay ---------------------
INSERT INTO ChuyenBay(MSCB, TrangThai, SoGheTrong, ThoiDiemDi, ThoiDiemDen, MSMB, MSTB)
VALUES ('SA1234567','DB',0,to_date('31/05/1998-12:00', 'dd/mm/yyyy-hh:mi'),to_date('31/05/1998-12:00', 'dd/mm/yyyy-hh:mi'),'SAP001',1);
INSERT INTO ChuyenBay(MSCB, TrangThai, SoGheTrong, ThoiDiemDi, ThoiDiemDen, MSMB, MSTB)
VALUES ('SA1234566','CB',0,to_date('31/05/1998-12:00', 'dd/mm/yyyy-hh:mi'),to_date('31/05/1998-12:00', 'dd/mm/yyyy-hh:mi'),'SAP002',2);
INSERT INTO ChuyenBay(MSCB, TrangThai, SoGheTrong, ThoiDiemDi, ThoiDiemDen, MSMB, MSTB)
VALUES ('SA1234565','CB',0,to_date('31/05/1998-12:00', 'dd/mm/yyyy-hh:mi'),to_date('31/05/1998-12:00', 'dd/mm/yyyy-hh:mi'),'SAP003',3);
INSERT INTO ChuyenBay(MSCB, TrangThai, SoGheTrong, ThoiDiemDi, ThoiDiemDen, MSMB, MSTB)
VALUES ('SA1234564','CB',0,to_date('31/05/1998-12:00', 'dd/mm/yyyy-hh:mi'),to_date('31/05/1998-12:00', 'dd/mm/yyyy-hh:mi'),'SAP004',4);


---------KhachHang------------
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Võ Văn Nhàn', '30/06/1994', 'Nam', 'Việt Nam', +841688456987, 'KTX Khu B', '1', 1, 'SA1234567', 10);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Lại Tuấn Mạnh', '16/02/1994', 'Nam', 'Việt Nam', +841699109825, 'KTX Khu B', '2', 2, 'SA1234566', 0);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Nguyễn Văn A', '08/02/1987', 'Nam', 'Việt Nam', +841699109824, 'Lý Thường Kiệt', '3', 4, 'SA1234566', 10);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Nguyễn Văn B', '16/01/1988', 'Nam', 'Việt Nam', +841699109823, 'Lý Thường Kiệt', '2', 2, 'SA1234566', 0);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Võ Trần Hải Anh', '16/02/2002', 'Nu', 'Việt Nam', +84199489562, '05 Hải Đường', '3', 4, 'SA1234564', 10);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Trần Thiên Tú', '11/11/1997', 'Nam', 'Trung Quốc', +841888888888, '05 ABC', '4',2, 'SA1234564', 0);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Chang Chê Hiếp', '02/11/2014', 'Nam', 'Hàn Quốc', +841888888887, '05 ABC', '4',2, 'SA1234564', 0);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Leo Tủ Ăn Đu Đủ', '11/11/1997', 'Nam', 'Lào', +841888888886, '05 ABC', '4',2, 'SA1234564', 0);

------------ KhachHangNL-----------------
INSERT INTO KhachHangNL(MSKH, CMND, Passport)
VALUES('NL0000000001',123456789,'B1234567');
INSERT INTO KhachHangNL(MSKH, CMND, Passport)
VALUES('NL0000000002',123456788,'B1234566');
INSERT INTO KhachHangNL(MSKH, CMND, Passport)
VALUES('NL0000000003',123456786,'B1234565');
INSERT INTO KhachHangNL(MSKH, CMND, Passport)
VALUES('NL0000000004',123456785,'B1234564');

------------ KHACHHANGTE -----------------
INSERT INTO KhachHangTE(MSKH, ThongTinKSinh, MSNGH)
VALUES ('TE0000000001','','NL0000000001');
INSERT INTO KhachHangTE(MSKH, ThongTinKSinh, MSNGH)
VALUES ('TE0000000002','Teo Hẳn Mông Bên Phải','NL0000000002');
INSERT INTO KhachHangTE(MSKH, ThongTinKSinh, MSNGH)
VALUES ('TE0000000003','Trần Như Nhộng','NL0000000003');
INSERT INTO KhachHangTE(MSKH, ThongTinKSinh, MSNGH)
VALUES ('TE0000000004','','NL0000000004');



------------- GheKhach ----------------------
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('NL0000000001','A01',1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('TE0000000001','A02',1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('NL0000000002','A03',1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('TE0000000002','A04',1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('TE0000000003','A05',1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('NL0000000004','A06',1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('NL0000000004','A07',1000000);




---------- Ghe Ngoi --------------------
INSERT INTO GheNgoi(GheSo, LoaiGhe, MSLMB)
VALUES ('A01','VIP','1');
INSERT INTO GheNgoi(GheSo, LoaiGhe, MSLMB)
VALUES ('A02','VIP','1');
INSERT INTO GheNgoi(GheSo, LoaiGhe, MSLMB)
VALUES ('A03','PT','2');
INSERT INTO GheNgoi(GheSo, LoaiGhe, MSLMB)
VALUES ('A04','PT','2');
INSERT INTO GheNgoi(GheSo, LoaiGhe, MSLMB)
VALUES ('A05','PT','2');
INSERT INTO GheNgoi(GheSo, LoaiGhe, MSLMB)
VALUES ('A06','PT','2');
INSERT INTO GheNgoi(GheSo, LoaiGhe, MSLMB)
VALUES ('A07','PT','2');


---------- ThucPham ---------------------
INSERT INTO ThucPham(Ten, MoTa)
VALUES ('Bánh Mì', 'Làm từ bột mì nguyên chất' );
INSERT INTO ThucPham(Ten, MoTa)
VALUES ('Coca-cola','Xoá tan mọi cơn khát');
INSERT INTO ThucPham(Ten, MoTa)
VALUES ('Mì tôm', 'Dân dã đến bất ngờ');
INSERT INTO ThucPham(Ten, MoTa)
VALUES ('Heo quay', 'Quay heo tại chỗ, bán ra ăn liền');

---------- GiaThucPham -------------------
INSERT INTO GiaThucPham(Gia, NgayApDung, MSTP)
VALUES ('10000',current_date, 1);
INSERT INTO GiaThucPham(Gia, NgayApDung, MSTP)
VALUES ('7000',current_date,2);
INSERT INTO GiaThucPham(Gia, NgayApDung, MSTP)
VALUES ('3000',current_date,3);
INSERT INTO GiaThucPham(Gia, NgayApDung, MSTP)
VALUES ('100000',current_date,4);

---------- ChuyenBayThucPham -------------
INSERT INTO ChuyenBayThucPham(MSCB,MSTP)
VALUES ('SA1234567',1);
INSERT INTO ChuyenBayThucPham(MSCB,MSTP)
VALUES ('SA1234567',2);
INSERT INTO ChuyenBayThucPham(MSCB,MSTP)
VALUES ('SA1234567',3);
INSERT INTO ChuyenBayThucPham(MSCB,MSTP)
VALUES ('SA1234567',4);

---------- NhanVien -----------------------
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('PC','Xăm Thủng Kêu Van Hỏng', '01/01/1991','Nam', 'Việt Nam', '245698075', 'B6549235','30/10/2010',
'30 Xa lộ Hà Nội','+841999999991', 30000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('TV','Ôm Phản Lao Ra Biển', '01/01/1992','Nam', 'Việt Nam', '245698074', 'B6549234','30/10/2010',
'31 Xa lộ Hà Nội','+841999999992', 10000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('KT','Ngâm Sỏi Phun Ra Lửa', '01/02/1991','Nu', 'Việt Nam', '245698073', 'B6549233','30/10/2010',
'32 Xa lộ Hà Nội','+841999999993', 30000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('DH','Y Chang Heo', '02/01/1991','Nu', 'Việt Nam', '245698072', 'B6549232','30/10/2010',
'33 Xa lộ Hà Nội','+841999999999', 30000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('KS','XiLip Văng Đi', '02/02/1991','Nam', 'Ấn Độ', '245698071', 'B6549236','30/10/2010',
'30 Xa lộ Hà Nội','+841999999995', 15000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('PC','Henry Tèo', '16/02/1994','Nam', 'Việt Nam', '245698076', 'B6549237','30/10/2010',
'30 Xa lộ Hà Nội','+841999999995', 15000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('PC','Johny Nhàn', '02/02/1991','Nam', 'Ấn Độ', '245698077', 'B6549238','30/10/2010',
'30 Xa lộ Hà Nội','+841999999995', 15000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('PC','Đậu Như Phụng', '02/02/1991','Nu', 'Thái Lan', '245698078', 'B6549239','30/10/2010',
'30 Xa lộ Hà Nội','+841999999995', 15000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('TV','Lý Thị Nhàn', '02/02/1991','Nu', 'Việt Nam', '245698079', 'B6549240','30/10/2010',
'30 Xa lộ Hà Nội','+841999999995', 15000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('TV','Bành Văn Nhàn', '02/02/1991','Nam', 'Việt Nam', '245698080', 'B6549241','30/10/2010',
'30 Xa lộ Hà Nội','+841999999995', 15000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('TV','Trần Thị Nhàn', '02/02/1991','Nu', 'Việt Nam', '245698081', 'B6549242','30/10/2010',
'30 Xa lộ Hà Nội','+841999999995', 15000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('KT','Mai Thu Phí', '02/02/1991','Nu', 'Việt Nam', '245698082', 'B6549243','30/10/2010',
'30 Xa lộ Hà Nội','+841999999996', 15000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('KT','Mai Thanh Toán', '02/02/1991','Nu', 'Việt Nam', '245698083', 'B6549244','30/10/2010',
'30 Xa lộ Hà Nội','+841999999997', 15000000);
INSERT INTO NhanVien(MSNV, HoTen, NgaySinh, GioiTinh, QuocTich, CMND, Passport, NgayVaoLam, DiaChi, 
SoDT, TienLuong)
VALUES ('KT','Đinh Bằng Sắt', '02/02/1991','Nu', 'Việt Nam', '245698084', 'B6549245','30/10/2010',
'30 Xa lộ Hà Nội','+841999999998', 15000000);


-------------- BangCap -----------------------
INSERT INTO BangCap(TenBangCap, TruongDaoTao, NamDat, MSNV)
VALUES('Cao Đẳng', 'Bách Khoa', '2010','PC0000000001');
INSERT INTO BangCap(TenBangCap, TruongDaoTao, NamDat, MSNV)
VALUES('Trung Cấp', 'Bách Khoa', '2010','TV0000000001');
INSERT INTO BangCap(TenBangCap, TruongDaoTao, NamDat, MSNV)
VALUES('Đại Học', 'Bách Khoa', '2010','KT0000000001');
INSERT INTO BangCap(TenBangCap, TruongDaoTao, NamDat, MSNV)
VALUES('Đại Học', 'Bách Khoa', '2010','DH0000000001');
INSERT INTO BangCap(TenBangCap, TruongDaoTao, NamDat, MSNV)
VALUES('Đại Học', 'Bách Khoa', '2010','KS0000000001');

------------- PhiCong ------------------------
INSERT INTO PhiCong(MSNV, LoaiPhiCong)
VALUES ('PC0000000001','PL');
INSERT INTO PhiCong(MSNV, LoaiPhiCong)
VALUES ('PC0000000002','CT');
INSERT INTO PhiCong(MSNV, LoaiPhiCong)
VALUES ('PC0000000003','PL');
INSERT INTO PhiCong(MSNV, LoaiPhiCong)
VALUES ('PC0000000004','PL');

------------ TiepVien ------------------------
INSERT INTO TiepVien(MSNV, NgoaiNguThongThao)
VALUES ('TV0000000001', 'Tiếng Anh');
INSERT INTO TiepVien(MSNV, NgoaiNguThongThao)
VALUES ('TV0000000002', 'Tiếng Việt');
INSERT INTO TiepVien(MSNV, NgoaiNguThongThao)
VALUES ('TV0000000003', 'Tiếng Việt');
INSERT INTO TiepVien(MSNV, NgoaiNguThongThao)
VALUES ('TV0000000004', 'Tiếng Việt');

------------ CaLamViec ------------------------
INSERT INTO CaLamViec(MSCLV,TuGio, DenGio)
VALUES ('C1','7','11');
INSERT INTO CaLamViec(MSCLV,TuGio, DenGio)
VALUES ('C2','13','17');
INSERT INTO CaLamViec(MSCLV,TuGio, DenGio)
VALUES ('C3','19','23');

----------- ChiNhanh -------------------------
INSERT INTO ChiNhanh(TenChiNhanh, ThanhPho, QuocGia)
VALUES ('Quận 1','Hồ Chí Minh','Việt Nam');
INSERT INTO ChiNhanh(TenChiNhanh, ThanhPho, QuocGia)
VALUES ('Quận 2','Hồ Chí Minh','Việt Nam');
INSERT INTO ChiNhanh(TenChiNhanh, ThanhPho, QuocGia)
VALUES ('Quận 3','Hồ Chí Minh','Việt Nam');
INSERT INTO ChiNhanh(TenChiNhanh, ThanhPho, QuocGia)
VALUES ('Quận 4','Hồ Chí Minh','Việt Nam');



----------- NhanVienMD ------------------------
INSERT INTO NhanVienMD(MSNV, MSCN, MSNV_Truong)
VALUES ('KT0000000001',1, 'KT0000000001');
INSERT INTO NhanVienMD(MSNV, MSCN, MSNV_Truong)
VALUES ('KS0000000001',1, 'KT0000000001');
INSERT INTO NhanVienMD(MSNV, MSCN, MSNV_Truong)
VALUES ('DH0000000001',1, 'KT0000000001');
INSERT INTO NhanVienMD(MSNV, MSCN, MSNV_Truong)
VALUES ('KT0000000002',1, 'KT0000000001');

----------- NhanVienMD_CaLV -------------------
INSERT INTO NVMatDat_CaLV(MSNV, MSCLV, NgayBatDau)
VALUES ('PC0000000001','C1','08/03/2014');
INSERT INTO NVMatDat_CaLV(MSNV, MSCLV, NgayBatDau)
VALUES ('TV0000000001','C2','08/03/2014');
INSERT INTO NVMatDat_CaLV(MSNV, MSCLV, NgayBatDau)
VALUES ('KT0000000001','C3','08/03/2014');
INSERT INTO NVMatDat_CaLV(MSNV, MSCLV, NgayBatDau)
VALUES ('DH0000000001','C1','08/03/2014');

---------- VanHanh -----------------------------
INSERT INTO VanHanh(MSNV, MSCB)
VAlUES ('TV0000000001','SA1234567');
INSERT INTO VanHanh(MSNV, MSCB)
VAlUES ('PC0000000002','SA1234567');
INSERT INTO VanHanh(MSNV, MSCB)
VAlUES ('TV0000000002','SA1234567');
INSERT INTO VanHanh(MSNV, MSCB)
VAlUES ('TV0000000003','SA1234567');

----------- Lai --------------------------------
INSERT INTO Lai(MSNV, MSLMB)
VALUES ('PC0000000001',1);
INSERT INTO Lai(MSNV, MSLMB)
VALUES ('PC0000000002',1);
INSERT INTO Lai(MSNV, MSLMB)
VALUES ('PC0000000003',2);
INSERT INTO Lai(MSNV, MSLMB)
VALUES ('PC0000000004',2);

---------- KiemTra -----------------------------
INSERT INTO KiemTra(MSNV, MSCB)
VALUES ('KT0000000001', 'SA1234567');
INSERT INTO KiemTra(MSNV, MSCB)
VALUES ('KT0000000002', 'SA1234567');
INSERT INTO KiemTra(MSNV, MSCB)
VALUES ('KT0000000003', 'SA1234567');
INSERT INTO KiemTra(MSNV, MSCB)
VALUES ('KT0000000004', 'SA1234567');

--------- ChuyenMonBD ------------------------
INSERT INTO ChuyenMonBD(MSNV, MSLMB)
VALUES ('KT0000000001',1);
INSERT INTO ChuyenMonBD(MSNV, MSLMB)
VALUES ('KT0000000004',2);
INSERT INTO ChuyenMonBD(MSNV, MSLMB)
VALUES ('KT0000000002',3);
INSERT INTO ChuyenMonBD(MSNV, MSLMB)
VALUES ('KT0000000003',4);