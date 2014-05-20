using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace SaveAirPlane.Model
{
    internal class KhachHangModel
    {
        public DataTable ChuyenBay { set; get; }
        public DataTable KhachHang { set; get; }
        public DataTable TuyenBay { set; get; }

        public KhachHangModel()
        {
            var da = DatabaseAdapter.DatabaseAdapter.GetInstance();

        }
    }
}
