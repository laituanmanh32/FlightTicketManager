using System.Windows.Forms;
using Oracle.DataAccess.Client;

namespace OracleConnect
{
    public partial class ListDialog : Form
    {
        public ListDialog()
        {
            InitializeComponent();
        }

        public void Update(OracleConnection con)
        {
            string sql = "select table_name from user_tables";
            var cmd = new OracleCommand(sql, con);

            OracleDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lstTableName.Items.Add(dr.GetString(0));
            }
        }

        protected override void OnFormClosed(FormClosedEventArgs e)
        {
            Hide();
        }
    }
}