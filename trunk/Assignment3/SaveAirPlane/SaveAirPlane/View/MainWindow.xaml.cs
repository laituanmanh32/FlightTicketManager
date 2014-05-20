using FirstFloor.ModernUI.Windows.Controls;
using SaveAirPlane.ViewModel;

namespace SaveAirPlane
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : ModernWindow
    {
        //private NhanVienViewModel x = new NhanVienViewModel();
        public MainWindow()
        {
            InitializeComponent();
            //var sz = (from data in x.NhanVien.ChuyenBay.AsEnumerable()
            //    where data.Field<DateTime>("THOIDIEMDI") < DateTime.Now
            //    select data);
            //ListView1.ItemsSource = sz.AsDataView();
        }

    }
}
