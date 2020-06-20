using System;

namespace Condominvs
{
    public class Condominio
    {
        private int bloco;
        private int apartamento;
        private string nome;
        private string sobrenome;
        private string sexo;
        private int idade;
        private string modelo_veiculo;
        private string marca_veiculo;
        private int ano_veiculo;
        private string animais;
        private string empresa;
        private string profissao;
        private string salario;
        private int filhos;
        private int garagem;
        private DateTime morador_desde;

        public Condominio()
        {
        }     

        public int Bloco { get => bloco; set => bloco = value; }
        public int Apartamento { get => apartamento; set => apartamento = value; }
        public string Nome { get => nome; set => nome = value; }
        public string Sobrenome { get => sobrenome; set => sobrenome = value; }
        public string Sexo { get => sexo; set => sexo = value; }
        public int Idade { get => idade; set => idade = value; }
        public string Modelo_veiculo { get => modelo_veiculo; set => modelo_veiculo = value; }
        public string Marca_veiculo { get => marca_veiculo; set => marca_veiculo = value; }
        public int Ano_veiculo { get => ano_veiculo; set => ano_veiculo = value; }
        public string Animais { get => animais; set => animais = value; }
        public string Empresa { get => empresa; set => empresa = value; }
        public string Profissao { get => profissao; set => profissao = value; }
        public string Salario { get => salario; set => salario = value; }
        public int Filhos { get => filhos; set => filhos = value; }
        public int Garagem { get => garagem; set => garagem = value; }
        public DateTime Morador_desde { get => morador_desde; set => morador_desde = value; }
    }


}