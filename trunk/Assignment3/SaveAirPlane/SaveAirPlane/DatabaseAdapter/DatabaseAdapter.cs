using System;
using System.Data;
using System.Windows;
using Oracle.DataAccess.Client;
using SaveAirPlane.Misc;
using SaveAirPlane.Model;

namespace SaveAirPlane.DatabaseAdapter
{
    public class DatabaseAdapter
    {
        private static DatabaseAdapter mDatabaseAdapter;
        private readonly OracleCommand cmd;
        private readonly OracleConnection con;
        private OracleDataAdapter da;
        private readonly DataSet ds;
        private OracleCommandBuilder cb;

        private DatabaseAdapter()
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

        public static DatabaseAdapter GetInstance()
        {
            if (mDatabaseAdapter == null)
            {
                mDatabaseAdapter = new DatabaseAdapter();
            }
            return mDatabaseAdapter;
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

        public DataTable GetDataQuery(string sql)
        {
            try
            {
                var tmp = new DataSet();
                cmd.CommandText = sql;
                da.Fill(tmp);
                return tmp.Tables[0];
            }
            catch
            {
            }
            return null;
        }

    }
}
