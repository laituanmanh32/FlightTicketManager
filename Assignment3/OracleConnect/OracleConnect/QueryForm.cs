using System;
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

        private void btnQuery_Click(object sender, EventArgs e)
        {
            if (odb.Query(sqlString.Text))
            {
                try
                {
                    result.DataSource = odb.DataSet.Tables[0];
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