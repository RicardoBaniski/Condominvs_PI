USE [master]
GO
/****** Object:  Database [Condominvs]    Script Date: 20/06/2020 19:42:39 ******/
CREATE DATABASE [Condominvs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Condominvs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Condominvs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Condominvs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Condominvs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Condominvs] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Condominvs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Condominvs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Condominvs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Condominvs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Condominvs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Condominvs] SET ARITHABORT OFF 
GO
ALTER DATABASE [Condominvs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Condominvs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Condominvs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Condominvs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Condominvs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Condominvs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Condominvs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Condominvs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Condominvs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Condominvs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Condominvs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Condominvs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Condominvs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Condominvs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Condominvs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Condominvs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Condominvs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Condominvs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Condominvs] SET  MULTI_USER 
GO
ALTER DATABASE [Condominvs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Condominvs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Condominvs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Condominvs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Condominvs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Condominvs] SET QUERY_STORE = OFF
GO
USE [Condominvs]
GO
/****** Object:  Table [dbo].[animais]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[animais](
	[animais_id] [int] IDENTITY(1,1) NOT NULL,
	[animais_texto] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[animais_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ano]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ano](
	[ano_id] [int] IDENTITY(1,1) NOT NULL,
	[ano_valor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ano_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apartamento]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apartamento](
	[apartamento_id] [int] IDENTITY(1,1) NOT NULL,
	[apartamento_nro] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[apartamento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bloco]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bloco](
	[bloco_id] [int] IDENTITY(1,1) NOT NULL,
	[bloco_nro] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bloco_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[condominio]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[condominio](
	[condominio_Id] [int] IDENTITY(1,1) NOT NULL,
	[condominio_bloco_Id] [int] NOT NULL,
	[condominio_apartamento_Id] [int] NOT NULL,
	[condominio_nome_Id] [int] NOT NULL,
	[condominio_sobrenome_Id] [int] NOT NULL,
	[condominio_sexo_Id] [int] NOT NULL,
	[condominio_idade_Id] [int] NOT NULL,
	[condominio_modelo_Id] [int] NOT NULL,
	[condominio_marca_Id] [int] NOT NULL,
	[condominio_ano_Id] [int] NOT NULL,
	[condominio_animais_Id] [int] NOT NULL,
	[condominio_empresa_Id] [int] NOT NULL,
	[condominio_profissao_Id] [int] NOT NULL,
	[condominio_salario_Id] [int] NOT NULL,
	[condominio_filhos_Id] [int] NOT NULL,
	[condominio_garagem_Id] [int] NOT NULL,
	[condominio_morador_desde_id] [int] NOT NULL,
	[condominio_gravacao_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[condominio_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresa]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresa](
	[empresa_id] [int] IDENTITY(1,1) NOT NULL,
	[empresa_texto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[empresa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[filhos]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filhos](
	[filhos_id] [int] IDENTITY(1,1) NOT NULL,
	[filhos_valor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[filhos_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[garagem]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[garagem](
	[garagem_id] [int] IDENTITY(1,1) NOT NULL,
	[garagem_valor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[garagem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gravacao]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gravacao](
	[gravacao_id] [int] IDENTITY(1,1) NOT NULL,
	[gravacao_data] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[gravacao_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idade]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idade](
	[idade_id] [int] IDENTITY(1,1) NOT NULL,
	[idade_valor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marca]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marca](
	[marca_id] [int] IDENTITY(1,1) NOT NULL,
	[marca_texto] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[marca_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelo]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelo](
	[modelo_id] [int] IDENTITY(1,1) NOT NULL,
	[modelo_texto] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[modelo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[morador_desde]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[morador_desde](
	[morador_desde_id] [int] IDENTITY(1,1) NOT NULL,
	[morador_desde_data] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[morador_desde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nome]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nome](
	[nome_id] [int] IDENTITY(1,1) NOT NULL,
	[nome_texto] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[nome_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profissao]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profissao](
	[profissao_id] [int] IDENTITY(1,1) NOT NULL,
	[profissao_texto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[profissao_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salario]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salario](
	[salario_id] [int] IDENTITY(1,1) NOT NULL,
	[salario_valor] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[salario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sexo]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sexo](
	[sexo_id] [int] IDENTITY(1,1) NOT NULL,
	[sexo_texto] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[sexo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sobrenome]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sobrenome](
	[sobrenome_id] [int] IDENTITY(1,1) NOT NULL,
	[sobrenome_texto] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[sobrenome_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condominio_animais] FOREIGN KEY([condominio_animais_Id])
REFERENCES [dbo].[animais] ([animais_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condominio_animais]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condominio_filhos] FOREIGN KEY([condominio_filhos_Id])
REFERENCES [dbo].[filhos] ([filhos_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condominio_filhos]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condominio_garagem] FOREIGN KEY([condominio_garagem_Id])
REFERENCES [dbo].[garagem] ([garagem_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condominio_garagem]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condominio_gravacao] FOREIGN KEY([condominio_gravacao_id])
REFERENCES [dbo].[gravacao] ([gravacao_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condominio_gravacao]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condominio_sobrenome] FOREIGN KEY([condominio_sobrenome_Id])
REFERENCES [dbo].[sobrenome] ([sobrenome_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condominio_sobrenome]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_ano] FOREIGN KEY([condominio_ano_Id])
REFERENCES [dbo].[ano] ([ano_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_ano]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_apartamento] FOREIGN KEY([condominio_apartamento_Id])
REFERENCES [dbo].[apartamento] ([apartamento_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_apartamento]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_bloco] FOREIGN KEY([condominio_bloco_Id])
REFERENCES [dbo].[bloco] ([bloco_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_bloco]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_empresa] FOREIGN KEY([condominio_empresa_Id])
REFERENCES [dbo].[empresa] ([empresa_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_empresa]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_idade] FOREIGN KEY([condominio_idade_Id])
REFERENCES [dbo].[idade] ([idade_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_idade]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_marca] FOREIGN KEY([condominio_marca_Id])
REFERENCES [dbo].[marca] ([marca_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_marca]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_modelo] FOREIGN KEY([condominio_modelo_Id])
REFERENCES [dbo].[modelo] ([modelo_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_modelo]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_morador] FOREIGN KEY([condominio_morador_desde_id])
REFERENCES [dbo].[morador_desde] ([morador_desde_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_morador]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_nome] FOREIGN KEY([condominio_nome_Id])
REFERENCES [dbo].[nome] ([nome_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_nome]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_profissao] FOREIGN KEY([condominio_profissao_Id])
REFERENCES [dbo].[profissao] ([profissao_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_profissao]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_salario] FOREIGN KEY([condominio_salario_Id])
REFERENCES [dbo].[salario] ([salario_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_salario]
GO
ALTER TABLE [dbo].[condominio]  WITH CHECK ADD  CONSTRAINT [fk_condomomio_sexo] FOREIGN KEY([condominio_sexo_Id])
REFERENCES [dbo].[sexo] ([sexo_id])
GO
ALTER TABLE [dbo].[condominio] CHECK CONSTRAINT [fk_condomomio_sexo]
GO
/****** Object:  StoredProcedure [dbo].[spInsereCond]    Script Date: 20/06/2020 19:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsereCond]
	@bloco int null,
	@apartamento int null,
	@nome varchar(30) null,
	@sobrenome varchar(30) null,
	@sexo varchar(30) null,
	@idade int null,
	@modelo_veiculo varchar(30) null,
	@marca_veiculo varchar(30) null,
	@ano_veiculo int null,
	@animais varchar(30) null,
	@empresa varchar(50) null,
	@profissao varchar(50) null,
	@salario decimal(10,2) null,
	@filhos int null,
	@garagem int null, 
	@morador_desde datetime null
AS
BEGIN
DECLARE 
	@gravacao DATETIME = GETDATE(),
	@blocoId INT = 0,
	@apartamentoId INT = 0,
	@nomeId INT = 0,
	@sobrenomeId INT = 0,
	@sexoId INT = 0,
	@idadeId INT = 0,
	@modelo_veiculoId INT = 0,
	@marca_veiculoId INT = 0,
	@ano_veiculoId INT = 0,
	@animaisId INT = 0,
	@empresaId INT = 0,
	@profissaoId INT = 0,
	@salarioId INT = 0,
	@filhosId INT = 0,
	@garagemId INT = 0,
	@morador_desdeId INT = 0,
	@gravacaoId INT = 0

	IF (SELECT COUNT(*) FROM Condominvs..bloco WHERE bloco_nro = @bloco) < 1
		INSERT INTO Condominvs..bloco(bloco_nro) VALUES(@bloco)
	SET @blocoId = (SELECT DISTINCT bloco_id FROM Condominvs..bloco WHERE bloco_nro = @bloco)

	IF (SELECT COUNT(*) FROM Condominvs..apartamento WHERE apartamento_nro = @apartamento) < 1
		INSERT INTO Condominvs..apartamento(apartamento_nro) VALUES(@apartamento)
	SET @apartamentoId = (SELECT DISTINCT apartamento_id FROM Condominvs..apartamento WHERE apartamento_nro = @apartamento)

	IF (SELECT COUNT(*) FROM Condominvs..nome WHERE nome_texto = @nome) < 1
		INSERT INTO Condominvs..nome(nome_texto) VALUES(@nome)
	SET @nomeId = (SELECT DISTINCT nome_id FROM Condominvs..nome WHERE nome_texto = @nome)

	IF (SELECT COUNT(*) FROM sobrenome WHERE sobrenome_texto = @sobrenome) < 1
		INSERT INTO Condominvs..sobrenome(sobrenome_texto) VALUES(@sobrenome)
	SET @sobrenomeId = (SELECT DISTINCT sobrenome_id FROM Condominvs..sobrenome WHERE sobrenome_texto = @sobrenome)

	IF (SELECT COUNT(*) FROM Condominvs..sexo WHERE sexo_texto = @sexo) < 1
		INSERT INTO Condominvs..sexo(sexo_texto) VALUES(@sexo)
	SET @sexoId = (SELECT DISTINCT sexo_id FROM Condominvs..sexo WHERE sexo_texto = @sexo)

	IF (SELECT COUNT(*) FROM Condominvs..idade WHERE idade_valor = @idade) < 1
		INSERT INTO Condominvs..idade(idade_valor) VALUES(@idade)
	SET @idadeId = (SELECT DISTINCT idade_id FROM Condominvs..idade WHERE idade_valor = @idade)

	IF (SELECT COUNT(*) FROM Condominvs..modelo WHERE modelo_texto = @modelo_veiculo) < 1
		INSERT INTO Condominvs..modelo(modelo_texto) VALUES(@modelo_veiculo)
	SET @modelo_veiculoId = (SELECT DISTINCT modelo_id FROM Condominvs..modelo WHERE modelo_texto = @modelo_veiculo)

	IF (SELECT COUNT(*) FROM Condominvs..marca WHERE marca_texto = @marca_veiculo) < 1
		INSERT INTO Condominvs..marca(marca_texto) VALUES(@marca_veiculo)
	SET @marca_veiculoId = (SELECT DISTINCT marca_id FROM Condominvs..marca WHERE marca_texto = @marca_veiculo)

	IF (SELECT COUNT(*) FROM Condominvs..ano WHERE ano_valor = @ano_veiculo) < 1
		INSERT INTO Condominvs..ano(ano_valor) VALUES(@ano_veiculo)
	SET @ano_veiculoId = (SELECT DISTINCT ano_id FROM Condominvs..ano WHERE ano_valor = @ano_veiculo)

	IF (SELECT COUNT(*) FROM Condominvs..animais WHERE animais_texto = @animais) < 1
		INSERT INTO Condominvs..animais(animais_texto) VALUES(@animais)
	SET @animaisId = (SELECT DISTINCT animais_id FROM Condominvs..animais WHERE animais_texto = @animais)

	IF (SELECT COUNT(*) FROM Condominvs..empresa WHERE empresa_texto = @empresa) < 1
		INSERT INTO Condominvs..empresa(empresa_texto) VALUES(@empresa)
	SET @empresaId = (SELECT DISTINCT empresa_id FROM Condominvs..empresa WHERE empresa_texto = @empresa)

	IF (SELECT COUNT(*) FROM Condominvs..profissao WHERE profissao_texto = @profissao) < 1
		INSERT INTO Condominvs..profissao(profissao_texto) VALUES(@profissao)
	SET @profissaoId = (SELECT DISTINCT profissao_id FROM Condominvs..profissao WHERE profissao_texto = @profissao)

	IF (SELECT COUNT(*) FROM Condominvs..salario WHERE salario_valor = @salario) < 1
		INSERT INTO Condominvs..salario(salario_valor) VALUES(@salario)
	SET @salarioId = (SELECT DISTINCT salario_id FROM Condominvs..salario WHERE salario_valor = @salario)

	IF (SELECT COUNT(*) FROM Condominvs..filhos WHERE filhos_valor = @filhos) < 1
		INSERT INTO Condominvs..filhos(filhos_valor) VALUES(@filhos)
	SET @filhosId = (SELECT DISTINCT filhos_id FROM Condominvs..filhos WHERE filhos_valor = @filhos)

	IF (SELECT COUNT(*) FROM Condominvs..garagem WHERE garagem_valor = @garagem) < 1
		INSERT INTO Condominvs..garagem(garagem_valor) VALUES(@garagem)
	SET @garagemId = (SELECT DISTINCT garagem_id FROM Condominvs..garagem WHERE garagem_valor = @garagem)

	IF (SELECT COUNT(*) FROM Condominvs..morador_desde WHERE morador_desde_data = @morador_desde) < 1
		INSERT INTO Condominvs..morador_desde(morador_desde_data) VALUES(@morador_desde)
	SET @morador_desdeId = (SELECT DISTINCT morador_desde_id FROM Condominvs..morador_desde WHERE morador_desde_data = @morador_desde)

	IF (SELECT COUNT(*) FROM Condominvs..gravacao WHERE gravacao_data = @gravacao) < 1
		INSERT INTO Condominvs..gravacao(gravacao_data) VALUES(@gravacao)
	SET @gravacaoId = (SELECT DISTINCT gravacao_id FROM Condominvs..gravacao WHERE gravacao_data = @gravacao)

END

BEGIN
	INSERT INTO Condominvs..condominio (condominio_bloco_Id,condominio_apartamento_Id,	condominio_nome_Id,	condominio_sobrenome_Id,condominio_sexo_Id, condominio_idade_Id,condominio_modelo_Id,	condominio_marca_Id,condominio_ano_Id,	condominio_animais_Id,	condominio_empresa_Id, condominio_profissao_Id, condominio_salario_Id,	condominio_filhos_Id,	condominio_garagem_Id,	condominio_morador_desde_id,condominio_gravacao_id) 
	VALUES(								@blocoId,			@apartamentoId,				@nomeId,			@sobrenomeId,			@sexoId,			@idadeId,			@modelo_veiculoId,		@marca_veiculoId,	@ano_veiculoId,		@animaisId,				@empresaId,				@profissaoId,			@salarioId,				@filhosId,				@garagemId,				@morador_desdeId,			@gravacaoId)
END
GO
USE [master]
GO
ALTER DATABASE [Condominvs] SET  READ_WRITE 
GO
