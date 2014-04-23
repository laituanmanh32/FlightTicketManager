------------1. Bang Khach Hang---------------------
create table KhachHang
(MSKH           char(12)        NOT NULL     PRIMARY KEY,
constraint      check_MSKH check (regexp_like (MSKH, '^(NL|TE)[0-9]{10}$')),
HoTen           VARCHAR2(25)    NOT NULL,
NgaySinh        date            NOT NULL,
GioiTinh        VARCHAR(3)      NOT NULL,
constraint      check_GioiTinh check (regexp_like(GioiTinh,'(Nam|Nu)')), 
QuocTich        VARCHAR(15)     NOT NULL,
SoDT            number     NOT NULL check (regexp_like (SoDT,'^(+84)[0-9]{9}[0-9|]?$')),
DiaChi          VARCHAR(50)     NOT NULL,
MSTTTG          VARCHAR(10)     NOT NULL, /*Foreign key*/
MSPHH           VARCHAR(10)     NOT NULL, /*Foreign key*/
MSCB            VARCHAR(10)     NOT NULL, /*Foreign key*/
KhoiLuongVuot   number          NOT NULL
);
------------ Generate auto increase ID ---------------
CREATE or REPLACE FUNCTION ID_GEN(seed in number, precious in number)
RETURN VARCHAR2 IS
loop_index  number(2);
loop_limit      number(2);
temp		varchar(100);
BEGIN
	temp := to_char(seed);
  loop_limit := precious - length(temp);
	<<gen_loop>>
	for loop_index in 1..loop_limit loop
		temp := '0'||temp;
	end loop gen_loop;
	RETURN temp;
END ID_GEN;
/
------------ Calculator age from birthday -------------
CREATE or REPLACE FUNCTION GET_AGE(birthdate in date)
RETURN number IS
AGE number(10);
BEGIN
  AGE := extract(year from current_date) - extract(year from birthdate);
  RETURN AGE;
END GET_AGE;
/
------------ Sequence for ID increment ----------------
CREATE sequence KhachHang_MSKH_NL_sq;
CREATE sequence KhachHang_MSKH_TE_sq;

------------ Trigger to handler everything in KhachHangTable --------
CREATE or REPLACE TRIGGER KhachHang_Handler_trg
BEFORE INSERT on KhachHang
FOR EACH ROW
BEGIN
  IF (get_age(:new.NgaySinh) >= 18) THEN
    SELECT 'NL'||ID_GEN(KhachHang_MSKH_NL_sq.nextval,10)
    INTO	:new.MSKH
    FROM	dual;
  ELSE
    SELECT 'TE'||ID_GEN(KhachHang_MSKH_TE_sq.nextval,10)
    INTO	:new.MSKH
    FROM	dual;
  END IF;
END;
/
/* DONE! */


-------------2. Bang KhachHangNL-------------
create table KhachHangNL
(
MSKH           	char(12)    NOT NULL,		/*Foreign key reference to KhachHang*/
CMND         	number      NOT NULL UNIQUE,
Passport     	VARCHAR     NOT NULL,
constraint      check_Passport check(regexp_like(Passport,'^[A-Z][0-9]{7}$'))
);

-------------3. KhachHangTE-----------------
create table KhachHangTE
(
MSKH           	char(12)    NOT NULL,		/*Foreign key reference to KhachHang*/
constraint      check_MSKH 	check (regexp_like (MSKH, '^(TE)[0-9]{10}$')),
MSNGH       	VARCHAR(10)	NOT NULL,
ThongTinKSinh   VARCHAR(50) NOT NULL,
);
------------4. Trangthai TG------------------
create table TrangThaiTG
(
MSTTTG    		int 		NOT NULL,		/* Auto increment */
TenTT 	  		varchar(2) 	NOT NULL	 check(regexp_like(TenTT,'(TG|HH|DD)')),
PhanTramTP		float	  	NOT NULL,
primary key(MSTTTG)
);

create sequence TrangThai_seq;

CREATE OR REPLACE TRIGGER dept_bir 
BEFORE INSERT ON TrangThaiTG 
FOR EACH ROW

BEGIN
  SELECT TrangThai_seq.nextval
  INTO   :new.MSTTTG
  FROM   dual;
END;
/* DONE! */


---------------5. Phi VCHH-------------------
create table PhiVCHH
(
MSPHH         	int          	NOT NULL,		/* Auto increment */
LoaiVe        	VARCHAR(3)      NOT NULL       check(LoaiVe IN ('VIP','PT')), 
TrongLuongDM  	number       	NOT NULL,
DonGia_Kg     	number       	NOT NULL,
ThoiDiemApDung 	date       		NOT NULL,
primary key(MSPHH),
);

----------------6. Chuyen Bay----------------
create table ChuyenBay
(
MSCB        varchar(9)          not null,
constraint check_Chuyenbay      check (regexp_like(MSCB,'SA[0-9]{7}')),
TrangThai   varchar(2)          not null      check(TrangThai in ('CB','DB','HB')),
SoGheTrong  int                 not null,
ThoiDiemDi  date time           not null,
ThoiDiemDen date time           not null,
MSMB        varchar(20)         not null,
MSTB        varchar(20)         not null,
primary key (MSCB),
);

---------------7. Ghe Khach-------------------
create table GheKhach
(
MSKH           	char(12)        not null,
GheSo       	int        		not null,
Gia         	number      	not null,
CONSTRAINT 		PR_KEY_GheKhach primary key (MSKH,Gheso) ENABLE
);

---------------8. May bay--------------------
create table MayBay
(
MSMB        	varchar(20)       	not null,
constraint      check_Maybay		check (regexp_like (MSMB, 'SAP[0-9]{3}')),
TongGioBay      number        		not null,
NamSX           int           		not null,
ThoiDiemSD      date          		not null,
MSLMB           varchar(20)   		not null,
primary key		(MSMB),
);

-----------------9. Loai May bay--------------
create table LoaiMayBay
(
MSLMB       int               				not null,
HangSX      char(20)                        not null,
Moden       char                            not null,
SoGheVip    int                             not null,
SoGhePT     int                             not null,
TongSoGhe   int                             not null,
primary key(MSLMB),
);

-----------------10. Ghe Ngoi----------------
create table GheNgoi
(
MSG         int        	   not null ,
Gheso       varchar(3)     not null           unique,
constraint  check_GheNgoi  check(regexp_like(GheSo,'')), /*Thieu regexp*/
LoaiGhe     varchar(3)     not null           check(LoaiGhe in ('VIP','PT')),
MSLMB       varchar(20)    not null, 
)


-------------------11. Tuyen bay-------------
create table TuyenBay
(
MSTB          int          not null, /* Auto increment */
MSG_Di        char(10)     not null,
MSG_Den       char(10)     not null,
primary key   (MSTB),
);

-------------------12. Ga---------------------
create table Ga
(
MSGa      number          not null, /* Thay viet trung Ma So GA va Ma So Ghe */
TenSB     varchar(15)     not null,
ThanhPho  varchar(15)     not null,
QuocGia   varchar(15)     not null,
primary key ( MSGa),
);

----------------------13. Thucpham----------------
create table ThucPham
(
MSTP        char(20)        not null,
Ten         char(20)        not null,
MoTa        char(50)        not null,
primary key (MSTP),
);

----------------------14. GiaThucPham---------------
create table GiaThucPham
(
MSGTP		  varchar(20)  not null,    /* Auto_increment*/
Gia			  number	   not null,
NgayApDung	  date		   not null,
MoTa          varchar(20)  not null,
primary key(MSGTP),
)

-------------------15.Chuyen bay thuc pham--------
create table ChuyenBayThucPham
(
MSTB          int          not null, /* Auto increment */
MSTP          char(20)     not null,
constraint 	PR_key_ChuyenBayThucPham primary key (MSTB,MSTP)     enable
);

-------------------16. Nhan vien ------------------
create table NhanVien
(
MSNV        varchar(20)          not null,
constraint  check_NhanVien 		 check (regexp_like (MSNV, '[PC|TV|KT|DH|KS][0-9]{10}')),/* regexp sai*/
HoTen       varchar(20)          not null,
NgaySinh    date              	 not null,
GioiTinh    varchar(3)           not null      check(GioiTinh in ('NAM','NU')),
QuocTich    varchar(20)          not null,
CMND        varchar(20)          not null       unique,
Passport    varchar(8),
constraint      check_Passport 	check(regexp_like(Passport,'[B[0-9]{7}]')),
NgayVaoLam  date              	not null,
DiaChi      varchar(50)         not null, 
SoDT        varchar(15)         not null        check (regexp_like (SoDT,'[+84([0-9]){9}[0-9|]')),/*regexp*/
TienLuong   number(15)        	not null,
primary key ( MSNV),
);


-------------------17. Bang cap---------------------
create table BangCap
(
MSBC               varchar(10)        not null,
TenBangCap         varchar(20)        not null,
TruongDaoTao       varchar(20)        not null,
NamDat             varchar(20)        not null,
MSNV               varchar(20)        not null,
primary key(MSBC),
);

------------------18.PhiCong-------------------
create table PhiCong
(
MSNV                varchar(20) not null,
LoaiPhiCong         varchar(2)  not null  check(LoaiPhiCong in('CT','PL')),
primary key ( MSNV),
);

------------------19. Tiep Vien-------------
create table TiepVien
(
MSNV                varchar (20)  not null,
NgoaiNguThongThao   varchar (20)  not null,
primary key (MSNV),
);

------------------20. Ca lam viec----------------
create table CaLamViec
(MSCLV      varchar(3)      not null,
constraint      check_CaLamViec check (regexp_like (MSCLV, '[C][1-3]')), /* regexp*/
TuGio          time         not null,
DenGio         time         not null,
primary key ( MSCLV),
);

-------------------21. Nhan vien MD----------------------
create table NhanVienMD
(
MSNV                varchar (20) 		  not null,
MSCN                varchar (20)          not null,
MSNV_Truong         varchar (20)          not null,
primary key(MSNV),
);

------------------22.NVMatDat_CaLV------------------
create table NVMatDat_CaLV
(
MSNV				varchar(20)			  not null,
MSCLV				varchar(20)			  not null,
NgayBatDau			date				  not null,
primary key(MSNV,MSCLV),
);
------------------23. Van Hanh-------------------
create table VanHanh
(
MSNV        varchar(20)       not null,
MSCB        varchar(9)        not null,
primary key(MSNV,MSCB),
);

------------------24. Lai----------------------
create table Lai
(
MSNV        varchar(20)       not null,
MSLMB       varchar(20)       not null,
primary key (MSNV,MSLMB),
);

-------------------25. Kiem tra------------------
create table KiemTra
(
MSNV        varchar(20)       not null,
MSCB        varchar(9)        not null,
primary key(MSNV,MSCB),
);

--------------------26. Chuyen mon BD-----------------
create table ChuyenMonBD
(
MSNV        varchar(20)       not null,
MSLMB       varchar(20)       not null,
primary key (MSNV, MSLMB),
)

/*		MAPPING FOREIGN KEY 	*/
-- code here
--KhachHang--->TrangThaiTG,PhiVCHH,MSCB
ALTER TABLE KhachHang ADD CONSTRAINT KhachHang_MSTTTG_FK FOREIGN KEY (MSTTTG) REFERENCES TrangThaiTG(MSTTTG);
ALTER TABLE KhachHang ADD CONSTRAINT KhachHang_MSPHH_FK  FOREIGN KEY (MSPHH)  REFERENCES PhiVCHH(MSPHH);
ALTER TABLE KhachHang ADD CONSTRAINT KhachHang_MSCB_FK   FOREIGN KEY (MSCB)   REFERENCES ChuyenBay(MSCB);


--KhachHangNL ----> KhachHang
ALTER TABLE KhachHangNL ADD CONSTRAINT KhachHangNL_FK FOREIGN KEY (MSKH) REFERENCES KhachHang(MSKH);

--KhachHangTE-----> KhachHang
ALTER TABLE KhachHangTE ADD CONSTRAINT KhachHangTE_FK FOREIGN KEY (MSKH) REFERENCES KhachHang(MSKH);

--ChuyenBay--->MayBay,TuyenBay
ALTER TABLE ChuyenBay ADD CONSTRAINT ChuyenBay_MSMB_FK FOREIGN KEY (MSMB) REFERENCES MayBay(MSMB);
ALTER TABLE ChuyenBay ADD CONSTRAINT ChuyenBay_MSTB_FK FOREIGN KEY (MSTB) REFERENCES TuyenBay(MSTB);

--GheKhach--->KhachHang
ALTER TABLE GheKhach ADD CONSTRAINT GheKhach_MSKH_FK FOREIGN KEY (MSKH) REFERENCES KhachHang(MSKH);
ALTER TABLE GheKhach ADD CONSTRAINT GheKhach_PK  PRIMARY KEY (MSKH,GheSo);	

--MayBay--->LoaiMayBay
ALTER TABLE MayBay ADD CONSTRAINT MayBay_MSLMB_FK_FK FOREIGN KEY (MSLMB) REFERENCES LoaiMayBay(MSLMB);	

--GheNgoi--->GheKhach,LoaiMayBay
ALTER TABLE GheNgoi ADD CONSTRAINT GheNgoi_GheSo_FK FOREIGN KEY (GheSo) REFERENCES GheKhach(GheSo);
ALTER TABLE GheNgoi ADD CONSTRAINT GheNgoi_MSLMB_FK FOREIGN KEY (MSLMB) REFERENCES LoaiMayBay(MSLMB);

--GiaThucPham--->ThucPham
ALTER TABLE GiaThucPham ADD CONSTRAINT GiaThucPham_MSTP_FK FOREIGN KEY (MSTP) REFERENCES ThucPham(MSTP);

--ChuyenBayThucPham--->ChuyenBay,ThucPham
ALTER TABLE ChuyenBayThucPham ADD CONSTRAINT ChuyenBayThucPham_MSCB_FK FOREIGN KEY (MSCB) REFERENCES ChuyenBay(MSCB);
ALTER TABLE ChuyenBayThucPham ADD CONSTRAINT ChuyenBayThucPham_MSTP_FK FOREIGN KEY (MSTP) REFERENCES ThucPham(MSTP);

--BangCap-----> Nhanvien
ALTER TABLE BangCap ADD CONSTRAINT BangCap_MSNV_FK FOREIGN KEY (MSNV) REFERENCES NhanVien(MSNV);

--PhiCong-----> NhanVien
ALTER TABLE PhiCong ADD CONSTRAINT PhiCong_MSNV_FK FOREIGN KEY (MSNV) REFERENCES NhanVien(MSNV);

--TiepVien-----> NhanVien
ALTER TABLE TiepVien ADD CONSTRAINT TiepVien_MSNV_FK FOREIGN KEY (MSNV) REFERENCES NhanVien(MSNV);

--NhanVienMD-----> NhanVien,ChiNhanh
ALTER TABLE NhanVienMD ADD CONSTRAINT NhanVienMD_MSNV_FK FOREIGN KEY (MSNV) REFERENCES NhanVien(MSNV);
ALTER TABLE NhanVienMD ADD CONSTRAINT NhanVienMD_MSCN_FK FOREIGN KEY (MSCN) REFERENCES ChiNhanh(MSCN);

--NhanVienMD_CaLV----->NhanVien, CaLamViec
ALTER TABLE NhanVienMD_CaLV ADD CONSTRAINT NhanVienMD_CaLV_MSNV_FK FOREIGN KEY (MSNV) REFERENCES NhanVien(MSNV);
ALTER TABLE NhanVienMD_CaLV ADD CONSTRAINT NhanVienMD_CaLV_MSCLV_FK FOREIGN KEY (MSCLV) REFERENCES CaLamViec(MSCLV);

--VanHanh----------> NhanVien,ChuyenBay
ALTER TABLE VanHanh ADD CONSTRAINT VanHanh_MSNV_FK FOREIGN KEY (MSNV) REFERENCES NhanVien(MSNV);
ALTER TABLE	VanHanh ADD CONSTRAINT VanHanh_MSCB_FK FOREIGN KEY (MSCB) REFERENCES ChuyenBay(MSCB);

--Lai-------------->NhanVien,LoaiMayBay
ALTER TABLE Lai ADD CONSTRAINT Lai_MSNV_FK FOREIGN KEY (MSNV) REFERENCES NhanVien(MSNV);
ALTER TABLE Lai ADD CONSTRAINT Lai_MSLMB_FK FOREIGN KEY (MSLMB) REFERENCES LoaiMayBay(MSLMB);

--KiemTra---------->NhanVien,ChuyenBay
ALTER TABLE KiemTra ADD CONSTRAINT KiemTra_MSNV_FK FOREIGN KEY (MSNV) REFERENCES NhanVien(MSNV);
ALTER TABLE KiemTra ADD CONSTRAINT KiemTra_MSCB_FK FOREIGN KEY (MSCB) REFERENCES ChuyenBay(MSCB);

--ChuyenMonBD--------> NhanVien,LoaiMayBay
ALTER TABLE ChuyenMonBD ADD CONSTRAINT ChuyenMonBD_MSNV_FK FOREIGN KEY (MSNV) REFERENCES NhanVien(MSNV);
ALTER TABLE ChuyenMonBD ADD CONSTRAINT ChuyenMonBD_MSLMB_FK FOREIGN KEY (MSLMB) REFERENCES LoaiMayBay(MSLMB);