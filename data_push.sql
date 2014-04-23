---------KhachHang------------
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Võ Văn Nhàn', '30/06/1994', 'Nam', 'Việt Nam', +841688456987, 'KTX Khu B', '1', '1', 'SA0000001', 10);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Lại Tuấn Mạnh', '16/02/1994', 'Nam', 'Việt Nam', +841699109825, 'KTX Khu B', '2', '2', 'SA0000002', 0);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Nguyễn Văn A', '08/02/1987', 'Nam', 'Việt Nam', +841699109824, 'Lý Thường Kiệt', '3', '4', 'SA0000003', 10);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Nguyễn Văn B', '16/01/1988', 'Nam', 'Việt Nam', +841699109823, 'Lý Thường Kiệt', '2', '2', 'SA0000004', 0);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Võ Trần Hải Anh', '16/02/2002', 'Nu', 'Việt Nam', +84199489562, '05 Hải Đường', '3', '3', 'SA0000001', 10);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Trần Thiên Tú', '11/11/1997', 'Nam', 'Trung Quốc', +841888888888, '05 ABC', '4','5', 'SA0000002', 0);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Chang Chê Hiếp', '02/11/2014', 'Nam', 'Hàn Quốc', +841888888887, '05 ABC', '4','5', 'SA0000003', 0);
Insert into KhachHang(HoTen, NgaySinh, GioiTinh, QuocTich, SoDT, DiaChi, MSTTTG, MSPHH, 
MSCB, KhoiLuongVuot)
values ('Leo Tủ Ăn Đu Đủ', '11/11/1997', 'Nam', 'Lào', +841888888886, '05 ABC', '4','5', 'SA0000004', 0);

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
VALUES ('PT',10,100000,current_date);
INSERT INTO PhiVCHH(LoaiVe, TrongLuongDM, DonGia_Kg, ThoiDiemApDung)
VALUES ('VIP',20,100000,current_date);
INSERT INTO PhiVCHH(LoaiVe, TrongLuongDM, DonGia_Kg, ThoiDiemApDung)
VALUES ('PT',30,100000,current_date);
INSERT INTO PhiVCHH(LoaiVe, TrongLuongDM, DonGia_Kg, ThoiDiemApDung)
VALUES ('VIP',50,100000,current_date);

------------ ChuyenBay ---------------------
INSERT INTO ChuyenBay(MSCB, TrangThai, SoGheTrong, ThoiDiemDi, ThoiDiemDen, MSMB, MSTB)
VALUES ('SA1234567','CB',0,to_date('31/05/1998-12:00', 'dd/mm/yyyy-hh:mi'),to_date('31/05/1998-12:00', 'dd/mm/yyyy-hh:mi'),'123','123');


------------- GheKhach ----------------------
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('NL0000000001',1,1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('TE0000000001',2,1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('NL0000000002',3,1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('TE0000000002',4,1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('TE0000000003',6,1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('NL0000000004',7,1000000);
Insert into GheKhach(MSKH, GheSo, Gia)
VALUES ('NL0000000004',8,1000000);

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