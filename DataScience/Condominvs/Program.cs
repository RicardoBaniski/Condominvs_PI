using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Text;

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
                            string[] separacaoEmColunas = line.Split(',');
                            if (count > 1)
                                InsertObj(separacaoEmColunas);
                            header = separacaoEmColunas;
                        }
                        count++;
                        Console.WriteLine("Line: " + count + " - File: " + file);
                    }
                }
            }
            Console.WriteLine(">>>>>>>>>>>>>  SUCCESSFULLY COMPLETED  <<<<<<<<<<<<<\nENTER PARA SAIR!!!");
            Console.ReadKey();
        }

        public static void InsertObj(string[] separacaoEmColunas)
        {
            NumberFormatInfo provider = new NumberFormatInfo();
            provider.NumberDecimalSeparator = ".";
            cond.Bloco = Convert.ToInt32(separacaoEmColunas[1].Trim());
            cond.Apartamento = Convert.ToInt32(separacaoEmColunas[2].Trim());
            cond.Nome = separacaoEmColunas[3].Trim();
            cond.Sobrenome = separacaoEmColunas[4].Trim();
            cond.Sexo = separacaoEmColunas[5].Trim();
            cond.Idade = Convert.ToInt32(separacaoEmColunas[6].Trim());
            cond.Modelo_veiculo = separacaoEmColunas[7].Trim();
            cond.Marca_veiculo = separacaoEmColunas[8].Trim();
            cond.Ano_veiculo = Convert.ToInt32((separacaoEmColunas[9] == "" ? "0" : separacaoEmColunas[9]).Trim());
            cond.Animais = separacaoEmColunas[10];
            cond.Empresa = separacaoEmColunas[11];
            cond.Profissao = separacaoEmColunas[12];
            cond.Salario = Convert.ToDouble((separacaoEmColunas[13] == "" ? "0" : separacaoEmColunas[13]), provider);
            cond.Filhos = Convert.ToInt32((separacaoEmColunas[14] == "" ? "0" : separacaoEmColunas[14]).Trim());
            cond.Garagem = Convert.ToInt32((separacaoEmColunas[15] == "" ? "0" : separacaoEmColunas[15]).Trim());
            cond.Morador_desde = Convert.ToDateTime(separacaoEmColunas[16]);
            InsertSQL(conn, ref cmd, cond);
        }

        public static void InsertSQL(SqlConnection conn, ref SqlCommand cmd, Condominio cond)
        {
            conn.Open();
            cmd = new SqlCommand("spInsereCond", conn)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.Add("@bloco", SqlDbType.Int).Value = cond.Bloco;
            cmd.Parameters.Add("@apartamento", SqlDbType.Int).Value = cond.Apartamento;
            cmd.Parameters.Add("@nome", SqlDbType.VarChar).Value = cond.Nome;
            cmd.Parameters.Add("@sobrenome", SqlDbType.VarChar).Value = cond.Sobrenome;
            cmd.Parameters.Add("@sexo", SqlDbType.VarChar).Value = cond.Sexo;
            cmd.Parameters.Add("@Idade", SqlDbType.Int).Value = cond.Idade;
            cmd.Parameters.Add("@modelo_veiculo", SqlDbType.VarChar).Value = cond.Modelo_veiculo;
            cmd.Parameters.Add("@marca_veiculo", SqlDbType.VarChar).Value = cond.Marca_veiculo;
            cmd.Parameters.Add("@ano_veiculo", SqlDbType.Int).Value = cond.Ano_veiculo;
            cmd.Parameters.Add("@animais", SqlDbType.VarChar).Value = cond.Animais;
            cmd.Parameters.Add("@empresa", SqlDbType.VarChar).Value = cond.Empresa;
            cmd.Parameters.Add("@profissao", SqlDbType.VarChar).Value = cond.Profissao;
            cmd.Parameters.Add("@salario", SqlDbType.Decimal).Value = cond.Salario;
            cmd.Parameters.Add("@filhos", SqlDbType.Int).Value = cond.Filhos;
            cmd.Parameters.Add("@garagem", SqlDbType.Int).Value = cond.Garagem;
            cmd.Parameters.Add("@morador_desde", SqlDbType.Date).Value = cond.Morador_desde;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}
