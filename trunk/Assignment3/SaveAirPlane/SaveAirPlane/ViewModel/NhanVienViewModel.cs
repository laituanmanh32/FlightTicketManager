
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
            
            login log = new login();
            log.ShowDialog();
            string loginString = "user id="+log.txtuser.Text
                                 + ";password=" + log.txtpass.Text
                                 + ";data source=" + log.txtSource.Text;
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
