using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Text;
using SaveAirPlane.Annotations;

namespace SaveAirPlane.Model
{
    internal class KhachHangDataContext : INotifyPropertyChanged
    {
        private DataTable mChuyenBay;
        private DataTable mKhachHang;
        private DataTable mTuyenbay;

        public DataTable ChuyenBay
        {
            set { mChuyenBay = value;
                OnPropertyChanged("ChuyenBay");
            }
            get { return mChuyenBay; }
        }
        public DataTable KhachHang
        {
            set
            {
                mKhachHang = value;
                OnPropertyChanged("KhachHang");
            }
            get { return mKhachHang; }
        }
        public DataTable TuyenBay
        {
            set
            {
                mTuyenbay = value;
                OnPropertyChanged("TuyenBay");
            }
            get { return mTuyenbay; }
        }

        public KhachHangDataContext()
        {
            var da = DatabaseAdapter.DatabaseAdapter.GetInstance();

        }

        public event PropertyChangedEventHandler PropertyChanged;

        [NotifyPropertyChangedInvocator]
        protected virtual void OnPropertyChanged(string propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
