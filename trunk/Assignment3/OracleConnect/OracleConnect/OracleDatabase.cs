using System;
using System.Data;
using System.Windows.Forms;
using Oracle.DataAccess.Client;

namespace OracleConnect
{
    internal class OracleDatabase
    {
        private static OracleDatabase mInstance;
        private readonly OracleCommand cmd;
        private readonly OracleConnection con;
        private readonly OracleDataAdapter da;
        private readonly DataSet ds;
        private OracleCommandBuilder cb;

        private OracleDatabase()
        {
            con = new OracleConnection();
            cmd = new OracleCommand();
            da = new OracleDataAdapter(cmd);
            cb = new OracleCommandBuilder(da);
            ds = new DataSet();
        }

        public DataSet DataSet
        {
            get { return ds; }
        }

        public OracleConnection Connection
        {
            get { return con; }
        }

        public static OracleDatabase GetInstance()
        {
            if (mInstance == null)
            {
                mInstance = new OracleDatabase();
            }
            return mInstance;
        }

        public bool Connect(string connectString)
        {
            try
            {
                con.ConnectionString = connectString;
                con.Open();
                cmd.Connection = con;
                return true;
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                return false;
            }
        }

        public bool Query(string sqlQuery)
        {
            try
            {
                cmd.CommandText = sqlQuery;
                ds.Reset();
                da.Fill(ds);
                return true;
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                return false;
            }
        }

        public void Close()
        {
            try
            {
                con.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }

        public void Update()
        {
            da.Update(ds.Tables[0]);
        }
    }
}