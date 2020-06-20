USE [master]
GO
/****** Object:  Database [Condominvs]    Script Date: 20/06/2020 12:18:28 ******/
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
/****** Object:  Table [dbo].[animais]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[animais](
	[animais_id] [int] IDENTITY(1,1) NOT NULL,
	[animais_tipo] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[animais_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ano]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ano](
	[ano_id] [int] IDENTITY(1,1) NOT NULL,
	[ano_nome] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ano_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apartamento]    Script Date: 20/06/2020 12:18:28 ******/
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
/****** Object:  Table [dbo].[bloco]    Script Date: 20/06/2020 12:18:28 ******/
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
/****** Object:  Table [dbo].[condominio]    Script Date: 20/06/2020 12:18:28 ******/
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
/****** Object:  Table [dbo].[empresa]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresa](
	[empresa_id] [int] IDENTITY(1,1) NOT NULL,
	[empresa_nome] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[empresa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[filhos]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filhos](
	[filhos_id] [int] IDENTITY(1,1) NOT NULL,
	[filhos_quantidade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[filhos_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[garagem]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[garagem](
	[garagem_id] [int] IDENTITY(1,1) NOT NULL,
	[garagem_nro] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[garagem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gravacao]    Script Date: 20/06/2020 12:18:28 ******/
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
/****** Object:  Table [dbo].[idade]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idade](
	[idade_id] [int] IDENTITY(1,1) NOT NULL,
	[idade_quantidade] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marca]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marca](
	[marca_id] [int] IDENTITY(1,1) NOT NULL,
	[marca_nome] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[marca_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelo]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelo](
	[modelo_id] [int] IDENTITY(1,1) NOT NULL,
	[modelo_nome] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[modelo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[moradordesde]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[moradordesde](
	[moradordesde_id] [int] IDENTITY(1,1) NOT NULL,
	[moradordesde_data] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[moradordesde_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nome]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nome](
	[nome_id] [int] IDENTITY(1,1) NOT NULL,
	[nome_texto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[nome_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profissao]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profissao](
	[profissao_id] [int] IDENTITY(1,1) NOT NULL,
	[profissao_nome] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[profissao_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salario]    Script Date: 20/06/2020 12:18:28 ******/
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
/****** Object:  Table [dbo].[sexo]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sexo](
	[sexo_id] [int] IDENTITY(1,1) NOT NULL,
	[sexo_nome] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[sexo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sobrenome]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sobrenome](
	[sobrenome_id] [int] IDENTITY(1,1) NOT NULL,
	[sobrenome_texto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sobrenome_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spInsereCond]    Script Date: 20/06/2020 12:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsereCond]
	@Bloco int null,
	@Apartamento int null,
	@Nome varchar(50) null,
	@Sobrenome varchar(50) null,
	@Sexo char(1) null,
	@Idade int,
	@Modelo_veiculo varchar(50) null,
	@Marca_veiculo varchar(50) null,
	@Ano_veiculo int,
	@Animais int,
	@Empresa varchar(50) null,
	@Profissao varchar(50) null,
	@Salario varchar(50) null,
	@Filhos int,
	@Garagem int, 
	@Morador_desde datetime

AS
BEGIN
DECLARE 
	@Gravacao DATETIME = GETDATE(),
	@BlocoId INT = 0,
	@ApartamentoId INT = 0,
	@NomeId INT = 0,
	@SobrenomeId INT = 0,
	@SexoId INT = 0,
	@IdadeId INT = 0,
	@Modelo_veiculoId INT = 0,
	@Marca_veiculoId INT = 0,
	@Ano_veiculoId INT = 0,
	@AnimaisId INT = 0,
	@EmpresaId INT = 0,
	@ProfissaoId INT = 0,
	@SalarioId INT = 0,
	@FilhosId INT = 0,
	@GaragemId INT = 0,
	@Morador_desdeId INT = 0,
	@GravacaoId INT = 0

	IF (SELECT COUNT(*) FROM Condominvs..bloco WHERE bloco_nro = @Bloco) < 1
		INSERT INTO Condominvs..bloco(bloco_nro) VALUES(@Bloco)
	SET @BlocoId = (SELECT DISTINCT bloco_id FROM Condominvs..bloco WHERE bloco_nro = @Bloco)

	IF (SELECT COUNT(*) FROM Condominvs..apartamento WHERE apartamento_nro = @Apartamento) < 1
		INSERT INTO Condominvs..apartamento(apartamento_nro) VALUES(@Apartamento)
	SET @ApartamentoId = (SELECT DISTINCT apartamento_id FROM Condominvs..apartamento WHERE apartamento_nro = @Apartamento)

	IF (SELECT COUNT(*) FROM Condominvs..nome WHERE nome_texto = @Nome) < 1
		INSERT INTO Condominvs..nome(nome_texto) VALUES(@Nome)
	SET @NomeId = (SELECT DISTINCT nome_id FROM Condominvs..nome WHERE nome_texto = @Nome)

	IF (SELECT COUNT(*) FROM Condominvs..sobrenome WHERE sobrenome_texto = @Sobrenome) < 1
		INSERT INTO Condominvs..sobrenome(sobrenome_texto) VALUES(@Sobrenome)
	SET @SobrenomeId = (SELECT DISTINCT sobrenome_id FROM Condominvs..sobrenome WHERE sobrenome_texto = @Sobrenome)

	IF (SELECT COUNT(*) FROM Condominvs..sexo WHERE sexo_nome = @Sexo) < 1
		INSERT INTO Condominvs..sexo(sexo_nome) VALUES(@Sexo)
	SET @SexoId = (SELECT DISTINCT sexo_id FROM Condominvs..sexo WHERE sexo_nome = @Sexo)

	IF (SELECT COUNT(*) FROM Condominvs..idade WHERE idade_quantidade = @Idade) < 1
		INSERT INTO Condominvs..idade(idade_quantidade) VALUES(@Idade)
	SET @IdadeId = (SELECT DISTINCT idade_id FROM Condominvs..idade WHERE idade_quantidade = @Idade)

	IF (SELECT COUNT(*) FROM Condominvs..modelo WHERE modelo_nome = @Modelo_veiculo) < 1
		INSERT INTO Condominvs..modelo(modelo_nome) VALUES(@Modelo_veiculo)
	SET @Modelo_veiculoId = (SELECT DISTINCT modelo_id FROM Condominvs..modelo WHERE modelo_nome = @Modelo_veiculo)

	IF (SELECT COUNT(*) FROM Condominvs..marca WHERE marca_nome = @Marca_veiculo) < 1
		INSERT INTO Condominvs..marca(marca_nome) VALUES(@Marca_veiculo)
	SET @Marca_veiculoId = (SELECT DISTINCT marca_id FROM Condominvs..marca WHERE marca_nome = @Marca_veiculo)

	IF (SELECT COUNT(*) FROM Condominvs..ano WHERE ano_nome = @Ano_veiculo) < 1
		INSERT INTO Condominvs..ano(ano_nome) VALUES(@Ano_veiculo)
	SET @Ano_veiculoId = (SELECT DISTINCT ano_id FROM Condominvs..ano WHERE ano_nome = @Ano_veiculo)

	IF (SELECT COUNT(*) FROM Condominvs..animais WHERE animais_tipo = @Animais) < 1
		INSERT INTO Condominvs..animais(animais_tipo) VALUES(@Animais)
	SET @AnimaisId = (SELECT DISTINCT animais_id FROM Condominvs..animais WHERE animais_tipo = @Animais)

	IF (SELECT COUNT(*) FROM Condominvs..empresa WHERE empresa_nome = @Empresa) < 1
		INSERT INTO Condominvs..empresa(empresa_nome) VALUES(@Empresa)
	SET @EmpresaId = (SELECT DISTINCT empresa_id FROM Condominvs..empresa WHERE empresa_nome = @Empresa)

	IF (SELECT COUNT(*) FROM Condominvs..profissao WHERE profissao_nome = @Profissao) < 1
		INSERT INTO Condominvs..profissao(profissao_nome) VALUES(@Profissao)
	SET @ProfissaoId = (SELECT DISTINCT profissao_id FROM Condominvs..profissao WHERE profissao_nome = @Profissao)

	IF (SELECT COUNT(*) FROM Condominvs..salario WHERE convert(decimal(10,2),salario_valor) = @Salario) < 1
		INSERT INTO Condominvs..salario(salario_valor) VALUES(convert(decimal(10,2),@Salario))
	SET @SalarioId = (SELECT DISTINCT salario_id FROM Condominvs..salario WHERE salario_valor = (convert(decimal(10,2),@Salario)))

	IF (SELECT COUNT(*) FROM Condominvs..salario WHERE salario_valor = @Salario) < 1
		INSERT INTO Condominvs..salario(salario_valor) VALUES(@Salario)
	SET @SalarioId = (SELECT DISTINCT salario_id FROM Condominvs..salario WHERE salario_valor = @Salario)

	IF (SELECT COUNT(*) FROM Condominvs..filhos WHERE filhos_quantidade = @Filhos) < 1
		INSERT INTO Condominvs..filhos(filhos_quantidade) VALUES(@Filhos)
	SET @FilhosId = (SELECT DISTINCT filhos_id FROM Condominvs..filhos WHERE filhos_quantidade = @Filhos)

	IF (SELECT COUNT(*) FROM Condominvs..garagem WHERE garagem_nro = @Garagem) < 1
		INSERT INTO Condominvs..garagem(garagem_nro) VALUES(@Garagem)
	SET @GaragemId = (SELECT DISTINCT garagem_id FROM Condominvs..garagem WHERE garagem_nro = @Garagem)

	IF (SELECT COUNT(*) FROM Condominvs..moradordesde WHERE moradordesde_data = @Morador_desdeId) < 1
		INSERT INTO Condominvs..moradordesde(moradordesde_data) VALUES(@Morador_desdeId)
	SET @Morador_desdeId = (SELECT DISTINCT moradordesde_id FROM Condominvs..moradordesde WHERE moradordesde_data = @Morador_desdeId)

	IF (SELECT COUNT(*) FROM Condominvs..gravacao WHERE gravacao_data = @Gravacao) < 1
		INSERT INTO Condominvs..gravacao(gravacao_data) VALUES(@Gravacao)
	SET @GravacaoId = (SELECT DISTINCT gravacao_id FROM Condominvs..gravacao WHERE gravacao_data = @Gravacao)



END

BEGIN
	INSERT INTO Condominvs..condominio (condominio_bloco_Id, condominio_apartamento_Id, condominio_nome_Id, condominio_sobrenome_Id, condominio_sexo_Id, condominio_idade_Id, condominio_modelo_Id, condominio_marca_Id, condominio_ano_Id, condominio_animais_Id, condominio_empresa_Id, condominio_profissao_Id, condominio_salario_Id,condominio_filhos_Id,condominio_garagem_Id,condominio_gravacao_id) 
	VALUES(@BlocoId, @ApartamentoId, @NomeId, @SobrenomeId, @SexoId, @IdadeId, @Modelo_veiculoId, @Marca_veiculoId, @Ano_veiculoId, @AnimaisId, @EmpresaId, @ProfissaoId, @SalarioId,@FilhosId,@GaragemId,@GravacaoId)
END
GO
USE [master]
GO
ALTER DATABASE [Condominvs] SET  READ_WRITE 
GO
