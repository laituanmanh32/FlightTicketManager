using System;
using System.Windows.Forms;

namespace OracleConnect
{
    public partial class SignIn : UserControl
    {
        public SignIn()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OracleDatabase od = OracleDatabase.GetInstance();
            string sql = "user id=" + username.Text
                         + ";password=" + password.Text
                         + ";data source=" + dataSource.Text;
            if (od.Connect(sql))
            {
                MessageBox.Show("Success!");
                RootWindow wd = RootWindow.GetWindow();

                wd.CreateSession();
            }
        }
    }
}