using System;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Globalization;
using System.Configuration;

namespace Condominvs
{
    class Program
    {
        public static string path = @"C:\Users\rbani\Documents\OPET\Condominvs_PI\DataScience";
        public static SqlConnection conn = new SqlConnection(@"Data Source=AVELL\SQLEXPRESS;Initial Catalog=Condominvs;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        public static SqlCommand cmd = new SqlCommand();
        public static Condominio cond = new Condominio();
        public static string[] header;
        public static string[] formattedColumn;
        public static string archive;
        public static void Main(string[] args)
        {
            string[] files = Directory.GetFiles(path, "*.csv");
            foreach (var file in files)
            {
                int count = 1;
                archive = file;
                if (File.Exists(file))
                {
                    var reader = new StreamReader(file, Encoding.UTF8, true);
                    while (true)
                    {
                        string line = reader.ReadLine();
                        if (line == null)
                        {
                            break;
                        }
                        else
                        {
                            string[] separationColumns = line.Split(',');
                            //if (count == 1)
                            //{
                            //    header = separationColumns;
                            //}                           
                        }
                        count++;
                        Console.WriteLine("Line: " + count + " - File: " + file);
                    }
                }
            }
            Console.WriteLine(">>>>>>>>>>>>>  SUCCESSFULLY COMPLETED  <<<<<<<<<<<<<");
            Console.ReadKey();
        }

        public static void InsertObj(string[] separationColumns)
        {
            cond.First_name = separationColumns[1];
            cond.Last_name = separationColumns[2];
            cond.Photo = separationColumns[3];
            cond.Block = separationColumns[4];
            cond.Apt = separationColumns[5];
            cond.Car = separationColumns[6];
            cond.Garage = separationColumns[7];
            cond.Pet = separationColumns[8];
            cond.Gender = separationColumns[9];
            cond.Phone = separationColumns[10];
            cond.Salary = separationColumns[11];
            cond.Job = separationColumns[12];
            cond.Birthday = separationColumns[13];
            cond.Older = separationColumns[14];
            cond.Age = separationColumns[15];
            cond.Email = separationColumns[16];
            cond.Obs = separationColumns[17];
            InsertSQL(conn, ref cmd, cond);
        }

        private static void InsertSQL(SqlConnection conn, ref SqlCommand cmd, Condominio cond)
        {
            
        }
    }
}
