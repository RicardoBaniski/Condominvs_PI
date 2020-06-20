using System;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Data;

namespace Condominvs
{
    class Program
    {
        public static string path = @"C:\Users\rbani\Documents\OPET\Condominvs_PI\DataScience";
        public static SqlConnection conn = new SqlConnection(@"Data Source=AVELL\SQLEXPRESS;Initial Catalog=Condominvs;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        public static SqlCommand cmd = new SqlCommand();
        public static Condominio cond = new Condominio();
        public static string[] header;
        public static void Main(string[] args)
        {
            string[] files = Directory.GetFiles(path, "*.csv");
            foreach (var file in files)
            {
                int count = 1;
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
                            if (count == 1)
                            {
                                header = separationColumns;
                            }
                            else
                            {
                                InsertObj(separationColumns);
                            }
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
            cond.Bloco = Convert.ToInt32(separationColumns[1]);
            cond.Apartamento = Convert.ToInt32(separationColumns[2]);
            cond.Nome = separationColumns[3] == "" ? null : separationColumns[3];
            cond.Sobrenome = separationColumns[4] == "" ? null : separationColumns[4];
            cond.Sexo = separationColumns[5] == "" ? null : separationColumns[5];
            cond.Idade = Convert.ToInt32(separationColumns[6] == "" ? null : separationColumns[6]);
            cond.Modelo_veiculo = separationColumns[7] == "" ? null : separationColumns[7];
            cond.Marca_veiculo = separationColumns[8] == "" ? null : separationColumns[8];
            cond.Ano_veiculo = Convert.ToInt32(separationColumns[9] == "" ? null : separationColumns[9]);
            cond.Animais = separationColumns[10] == "" ? null : separationColumns[10];
            cond.Empresa = separationColumns[11] == "" ? null : separationColumns[11];
            cond.Profissao = separationColumns[12] == "" ? null : separationColumns[12];
            cond.Salario = separationColumns[13] == "" ? "0.00" : separationColumns[13];
            cond.Filhos = Convert.ToInt32(separationColumns[14] == "" ? null : separationColumns[14]);
            cond.Garagem = Convert.ToInt32(separationColumns[15] == "" ? "0" : separationColumns[15]);
            cond.Morador_desde = Convert.ToDateTime(separationColumns[16] == "" ? null : separationColumns[16]);
            //InsertSQL(conn, ref cmd, cond);
        }

        private static void InsertSQL(SqlConnection conn, ref SqlCommand cmd, Condominio cond)
        {
            conn.Open();
            cmd = new SqlCommand("spInserecond", conn)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.Add("@Bloco", SqlDbType.Int).Value = cond.Bloco;
            cmd.Parameters.Add("@Apartamento", SqlDbType.Int).Value = cond.Apartamento;
            cmd.Parameters.Add("@Nome", SqlDbType.VarChar).Value = cond.Nome;
            cmd.Parameters.Add("@Sobrenome", SqlDbType.VarChar).Value = cond.Sobrenome;
            cmd.Parameters.Add("@Sexo", SqlDbType.VarChar).Value = cond.Sexo;
            cmd.Parameters.Add("@Idade", SqlDbType.Int).Value = cond.Idade;
            cmd.Parameters.Add("@Modelo_veiculo", SqlDbType.VarChar).Value = cond.Modelo_veiculo;
            cmd.Parameters.Add("@Marca_veiculo", SqlDbType.VarChar).Value = cond.Marca_veiculo;
            cmd.Parameters.Add("@Ano_veiculo", SqlDbType.Int).Value = cond.Ano_veiculo;
            cmd.Parameters.Add("@Animais", SqlDbType.VarChar).Value = cond.Animais;
            cmd.Parameters.Add("@Empresa", SqlDbType.VarChar).Value = cond.Empresa;
            cmd.Parameters.Add("@Profissao", SqlDbType.VarChar).Value = cond.Profissao;
            cmd.Parameters.Add("@Salario", SqlDbType.Decimal).Value = cond.Salario;
            cmd.Parameters.Add("@Filhos", SqlDbType.Int).Value = cond.Filhos;
            cmd.Parameters.Add("@Garagem", SqlDbType.Int).Value = cond.Garagem;
            cmd.Parameters.Add("@Morador_desde", SqlDbType.DateTime).Value = cond.Morador_desde;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}
