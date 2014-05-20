
using System.Data;
using System.Windows;
using SaveAirPlane.Annotations;
using SaveAirPlane.Model;

namespace SaveAirPlane.ViewModel
{
    class NhanVienViewModel
    {
        private static NhanVienViewModel mInstance;
        private DatabaseAdapter.DatabaseAdapter da = DatabaseAdapter.DatabaseAdapter.GetInstance();
        private NhanVienDataContext mNhanVien;

        private NhanVienViewModel()
        {
            string loginString = "user id=C##NhanVien"
                                 + ";password=123456"
                                 + ";data source=orcl";
            if (da.Connect(loginString))
                mNhanVien = new NhanVienDataContext();
            else
            {
                MessageBox.Show("Erro");
            }
        }

        public static NhanVienViewModel GetInstance()
        {
            if (mInstance == null)
            {
                mInstance = new NhanVienViewModel();
            }
            return mInstance;
        }

        public NhanVienDataContext NhanVien
        {
            get { return mNhanVien; }
        }

    }
}
