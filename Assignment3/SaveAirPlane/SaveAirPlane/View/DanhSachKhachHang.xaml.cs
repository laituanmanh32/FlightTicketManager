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
using SaveAirPlane.Model;
using SaveAirPlane.ViewModel;

namespace SaveAirPlane.View
{
    /// <summary>
    /// Interaction logic for DanhSachKhachHang.xaml
    /// </summary>
    public partial class DanhSachKhachHang : Page
    {
        private NhanVienViewModel db = NhanVienViewModel.GetInstance();
        public DanhSachKhachHang()
        {
            InitializeComponent();
        }

        private void ComboBox_Loaded(object sender, RoutedEventArgs e)
        {
            ComboBox cbx = (ComboBox)sender;
            cbx.ItemsSource = from chuyenbay in db.NhanVien.ChuyenBay.AsEnumerable()
                select chuyenbay.Field<string>("MSCB");

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string MSCB = cbxMSCB.Text;
            if (MSCB != null)
            {
                var tmp = (from khachhang in db.NhanVien.KhachHang.AsEnumerable()
                    join chuyenbay in db.NhanVien.ChuyenBay.AsEnumerable() on khachhang.Field<string>("MSCB") equals chuyenbay.Field<string>("MSCB")
                    join ghekhach in db.NhanVien.GheKhach.AsEnumerable() on khachhang.Field<string>("MSKH") equals  ghekhach.Field<string>("MSKH")
                    where chuyenbay.Field<string>("MSCB") == MSCB
                    select new
                    {
                        MSKH = khachhang.Field<string>("MSKH"),
                        HOTEN = khachhang.Field<string>("HOTEN"),
                        MSCB = chuyenbay.Field<string>("MSCB"),
                        MSGHE = ghekhach.Field<string>("GHESO")
                    })
                ;
                    

                ;
                if (tmp.Count() == 0)
                {
                    MessageBox.Show("Chuyến bay trống hoặc không tồn tại!");
                }
                else
                {
                    lstDanhSachKhachHang.ItemsSource = tmp;
                }
                
            }
        }

        private void MenuItem_OnClick(object sender, RoutedEventArgs e)
        {
            MenuItem mi = (MenuItem) sender;
            MessageBox.Show(e.Source.ToString());
        }
    }
}
