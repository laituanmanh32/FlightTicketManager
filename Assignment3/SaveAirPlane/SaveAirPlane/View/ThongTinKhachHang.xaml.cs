using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using SaveAirPlane.ViewModel;

namespace SaveAirPlane.View
{
    /// <summary>
    /// Interaction logic for ThongTinKhachHang.xaml
    /// </summary>
    public partial class ThongTinKhachHang : Page
    {

        private NhanVienViewModel db = NhanVienViewModel.GetInstance();
        public ThongTinKhachHang()
        {
            InitializeComponent();
        }

        private void BtnTimKiem_OnClick(object sender, RoutedEventArgs e)
        {
            var tmp = from khachhang in db.NhanVien.KhachHang.AsEnumerable()
                join chuyenbay in db.NhanVien.ChuyenBay.AsEnumerable() on khachhang.Field<string>("MSCB") equals chuyenbay.Field<string>("MSCB")
                join ghekhach in db.NhanVien.GheKhach.AsEnumerable() on khachhang.Field<string>("MSKH") equals ghekhach.Field<string>("MSKH")
                where khachhang.Field<string>("MSKH") == txtMSKH.Text
                select new
                {
                    MSKH = khachhang.Field<string>("MSKH"),
                    HOTEN = khachhang.Field<string>("HOTEN"),
                    NGAYSINH = khachhang.Field<DateTime>("NGAYSINH").ToString("dd/mm/yyyy"),
                    SDT = khachhang.Field<decimal>("SODT"),
                    DIACHI = khachhang.Field<string>("DIACHI"),
                    QUOCTICH = khachhang.Field<string>("QUOCTICH"),
                    MSCB = khachhang.Field<string>("MSCB"),
                    MSGHE = ghekhach.Field<string>("GHESO"),
                    THOIDIEMDI = chuyenbay.Field<DateTime>("THOIDIEMDI").ToString("dd/mm/yyyy"),
                    THOIDIEMDEN = chuyenbay.Field<DateTime>("THOIDIEMDEN").ToString("dd/mm/yyyy")
                };
            gridInfo.DataContext = tmp;
        }
    }
}
