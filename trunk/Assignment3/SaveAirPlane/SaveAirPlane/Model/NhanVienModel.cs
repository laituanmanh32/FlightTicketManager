using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace SaveAirPlane.Model
{
    class NhanVienDataContext
    {
        public DataTable ChuyenBay { set; get; }
        public DataTable KhachHang { set; get; }
        public DataTable GheKhach  { set; get; }
        public DataTable KhachHangNL { set; get; }
        public DataTable KhachHangTE { set; get; }

        public NhanVienDataContext()
        {
            var da = DatabaseAdapter.DatabaseAdapter.GetInstance();
            ChuyenBay = da.GetDataQuery("Select * from ChuyenBay;");
            KhachHang = da.GetDataQuery("Select * from KhachHang;");
            GheKhach = da.GetDataQuery("Select * from GheKhach;");
            KhachHangNL = da.GetDataQuery("Select * from KhachHangNL;");
            KhachHangTE = da.GetDataQuery("Select * from KhachHangTE;");
        }
    }
}
