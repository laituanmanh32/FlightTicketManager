
------------1. Bang Khach Hang---------------------
create table KhachHang
(MSKH           char(12)        NOT NULL     PRIMARY KEY,
constraint      check_MSKH check (regexp_like (MSKH, '[NL|TE][0-9]{10}')),
HoTen           VARCHAR2(25)    NOT NULL,
NgaySinh        date            NOT NULL,
GioiTinh        VARCHAR(3)      NOT NULL check (regexp_like(GioiTinh,'[Nam|Nu]')), 
QuocTich        VARCHAR(15)     NOT NULL,
SoDT            number     NOT NULL check (regexp_like (SoDT,'[+84([0-9]){9}[0-9|]')),
DiaChi          VARCHAR(50)     NOT NULL,
MSTTTG          VARCHAR(10)     NOT NULL,
MSPHH           VARCHAR(10)     NOT NULL,
MSCB            VARCHAR(10)     NOT NULL,
KhoiLuongVuot   number           NOT NULL
);

-------------2. Bang KhachHangNL-------------
create table KhachHangNL
(
MSKH           	char(12)        NOT NULL     PRIMARY KEY,
constraint      check_MSKH check (regexp_like (MSKH, '[NL][0-9]{10}')),
CMND         	number      NOT NULL UNIQUE,
Passport     	VARCHAR     NOT NULL,
constraint      check_Passport check(regexp_like(Passport,'[B[0-9]{7}]'))
);

-------------3. KhachHangTE-----------------
create table KhachHangTE
(
MSKH           	char(12)        NOT NULL     PRIMARY KEY,
constraint      check_MSKH check (regexp_like (MSKH, '[TE][0-9]{10}')),
MSNGH       	VARCHAR(10)       NOT NULL,
ThongTinKSinh   VARCHAR(50) NOT NULL,
);
------------4. Trangthai TG------------------
create table TrangThaiTG
(
MSTTTG    		int NULL,
TenTT 	  		varchar(2) NOT NULL	 check(regexp_like(TenTT,'[TG|HH|DD]')),
PhanTramTP		float	  NOT NULL,
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

---------------5. Phi VCHH-------------------
create table PhiVCHH
(
MSPHH         	int          NOT NULL       AUTO_INCREMENT,
LoaiVe        	CHAR(3)      NOT NULL       check(LoaiVe IN ('VIP','PT')), 
TrongLuongDM  	number       NOT NULL,
DonGia_Kg     	number       NOT NULL,
ThoiDiemApDung 	date       	 NOT NULL,
);

----------------6. Chuyen Bay----------------
create table ChuyenBay
(
MSCB        varchar(9)          not null      primary key,
constraint check_Chuyenbay      check (regexp_like(MSCB,'SA[0-9]{7}')),
TrangThai   varchar(2)          not null      check(TrangThai in ('CB','DB','HB')),
SoGheTrong  int                 not null,
ThoiDiemDi  date time           not null,
ThoiDiemDen date time           not null,
MSMB        varchar(10)         not null,
MSTB        varchar(10)         not null,
)

---------------7. Ghe Khach-------------------
create table GheKhach
(
MSKH           	char(12)        NOT NULL     PRIMARY KEY,
constraint      check_MSKH check (regexp_like (MSKH, '[NL|TE][0-9]{10}')),
GheSo       	int         NOT NULL,
Gia         	number      NOT NULL,
CONSTRAINT 		PR_KEY_GheKhach Primary key (MSKH,Gheso) ENABLE
);

create table MayBay
(
)

-----------------9. Loai May bay--------------
create table LoaiMayBay
(
MSLMB       int       Auto_increment        NOT NULL        primary key,
HangSX      char(20)                        not null,
Moden       char                            not null,
SoGheVip    int                             not null,
SoGhePT     int                             not null,
TongSoGhe   int                             not null,
);

-----------------10. Ghe Ngoi----------------
create table GheNgoi
(
)


-------------------11. Tuyen bay-------------
create table TuyenBay
(
MSTB          int          auto_increment         not null          primary key,
MSG_Di        char(10)                            not null,
MSG_Den       char(10)                            not null,
);

----------
create table Ga
(
)

----------------------13. Thucpham
create table ThucPham
(
MSTP        char(10)        not null        primary key,
Ten         char(20)        not null       ,
MoTa        char(50)        not null       ,
);

create table GiaThucPham
(
)

-------------------15.chuyen bay thuc pham--------
create table ChuyenBayThucPham
(
MSTB          int          auto_increment         not null,
MSTP          char(10)        not null,
constraint 	PR_key_ChuyenBayThucPham primary key (MSTB,MSTP)     enable
);

-------------------16. Nhan vien ------------------
create table NhanVien
(
MSNV        varchar(20)          not null        primary key,
constraint  check_NhanVien check (regexp_like (MSNV, '[PC|TV|KT|DH|KS][0-9]{10}')),
HoTen       varchar(20)          not null,
NgaySinh    date              not null,
GioiTinh    varchar(3)           not null      check(GioiTinh in ('NAM','NU')),
QuocTich    varchar(20)          not null,
CMND        varchar(15)          not null       unique,
Passport    varchar(8),
constraint      check_Passport check(regexp_like(Passport,'[B[0-9]{7}]')),
NgayVaoLam  date              not null,
DiaChi      varchar(50)          not null, 
SoDT        varchar(15)          not null        check (regexp_like (SoDT,'[+84([0-9]){9}[0-9|]')),
TienLuong   number(15)        not null,
);


-------------------17. Bang cap---------------------
create table BangCap
(
MSBC               varchar(10)        not null         primary key,
TenBangCap         varchar(20)        not null,
TruongDaoTao       varchar(20)        not null,
NamDat             varchar(20)        not null,
MSNV               varchar(20)        not null,
);

create table PhiCong
(
MSNV                varchar(20) reference NhanVien(MSNV)      foreign key ,
LoaiPhiCong         varchar(2)  not null  check(LoaiPhiCong in('CT','PL')),
);

create table TiepVien
(
MSNV                varchar (20) reference NhanVien(MSNV)      foreign key,
NgoaiNguThongThao   varchar(15)  not null,
)

create table CaLamViec
(MSCLV      varchar(2)      not null      primary key,
constraint      check_CaLamViec check (regexp_like (MSCLV, '[C][1-3]')),
TuGio          time         not null,
DenGio         time         not null,
);

create table NhanVienMD
(
MSNV                varchar (20) reference NhanVien(MSNV)      foreign key,
MSCN                varchar (20)          not null,
MSNV_Truong         varchar (20)          not null,
);

create table NVMatDat_CaLV
(
)

create table VanHanh
(
)

create table Lai
(
)

create table KiemTra
(
)

create table ChuyenMonBD
(
)
