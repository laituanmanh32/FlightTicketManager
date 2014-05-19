using System;
using System.Data;
using System.Text;
using Oracle.DataAccess.Client;

namespace ConnectOracle
{
    internal class Program
    {
        private void Connect()
        {
        }

        private static void Main(string[] args)
        {
            Console.OutputEncoding = Encoding.Unicode;
            var con = new OracleConnection();

            try
            {
                con.ConnectionString = "User Id=C##Manh;Password=123456;Data Source=orcl";
                con.Open();
                Console.WriteLine("Server version: " + con.ServerVersion);

                string sql = "Select * from KhachHang";
                var cmd = new OracleCommand(sql, con);
                cmd.CommandType = CommandType.Text;

                OracleDataReader dr = cmd.ExecuteReader();
                int count = 0;
                while (dr.Read())
                {
                    if (count == 0)
                    {
                        for (int i = 0; i < dr.FieldCount; i++)
                        {
                            Console.Write(dr.GetName(i) + '\t');
                        }
                        Console.WriteLine();
                    }
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        Console.Write(dr[i].ToString() + '\t');
                    }
                    Console.WriteLine();
                    count++;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}