using System;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.AccessControl;
using System.Security.Cryptography.X509Certificates;
using System.Windows.Forms;

namespace OracleConnect
{
    public partial class QueryForm : UserControl
    {
        private readonly OracleDatabase odb;
        private readonly ListDialog tableName;

        public QueryForm()
        {
            InitializeComponent();
            odb = OracleDatabase.GetInstance();
            tableName = new ListDialog();
            tableName.Update(odb.Connection);
        }

        [DllImport("Kernel32")]
        public static extern void AllocConsole();
        [DllImport("Kernel32")]
        public static extern void FreeConsole();

        private void btnQuery_Click(object sender, EventArgs e)
        {
            if (odb.Query(sqlString.Text))
            {
                try
                {
                    result.DataSource = odb.DataSet.Tables[0];
                    var data = from khachhang in odb.DataSet.Tables[0].AsEnumerable()
                        where khachhang.Field<string>("GIOITINH") == "Nam"
                        select khachhang;

                    AllocConsole();
                    foreach (var dataRow in data)
                    {
                        Console.WriteLine(dataRow.Field<string>("Hoten"));
                    }
                   
                    

                    //MessageBox.Show(odb.DataSet.Tables["KhachHang"].Columns["MSKH"].Ordinal.ToString());
                    //odb.DataSet.Tables["KhachHang"].WriteXmlSchema("Hello.txt");


                }
                catch (Exception)
                {
                }
            }
        }

        private void btnShowTableName_Click(object sender, EventArgs e)
        {
            tableName.Show();
        }
    }
}