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
    /// Interaction logic for DanhSachChuyenBay.xaml
    /// </summary>
    public partial class DanhSachChuyenBay : Page
    {
        private NhanVienViewModel db = NhanVienViewModel.GetInstance();
        public DanhSachChuyenBay()
        {
            InitializeComponent();
            lstChuyenBay.ItemsSource = (from dataRow in db.NhanVien.ChuyenBay.AsEnumerable()
                                        where dataRow.Field<DateTime>("THOIDIEMDI") >= DateTime.Now
                                        select dataRow).AsDataView();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (dateFrom.SelectedDate != null && dateTo.SelectedDate != null)
            lstChuyenBay.ItemsSource = (from dataRow in db.NhanVien.ChuyenBay.AsEnumerable()
                                        where dataRow.Field<DateTime>("THOIDIEMDI") >= dateFrom.SelectedDate && dataRow.Field<DateTime>("THOIDIEMDI") <= dateTo.SelectedDate
                                           select dataRow).AsDataView();
        }
    }
}
