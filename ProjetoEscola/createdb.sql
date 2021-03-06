USE [master]
GO
/****** Object:  Database [dbEnsino]    Script Date: 30/07/2021 10:40:18 ******/
CREATE DATABASE [dbEnsino]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbEnsino', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\dbEnsino.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbEnsino_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\dbEnsino_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbEnsino] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbEnsino].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbEnsino] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbEnsino] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbEnsino] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbEnsino] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbEnsino] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbEnsino] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbEnsino] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbEnsino] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbEnsino] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbEnsino] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbEnsino] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbEnsino] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbEnsino] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbEnsino] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbEnsino] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbEnsino] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbEnsino] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbEnsino] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbEnsino] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbEnsino] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbEnsino] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbEnsino] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbEnsino] SET RECOVERY FULL 
GO
ALTER DATABASE [dbEnsino] SET  MULTI_USER 
GO
ALTER DATABASE [dbEnsino] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbEnsino] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbEnsino] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbEnsino] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbEnsino] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbEnsino', N'ON'
GO
ALTER DATABASE [dbEnsino] SET QUERY_STORE = OFF
GO
USE [dbEnsino]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [dbEnsino]
GO
/****** Object:  Table [dbo].[ALUNO]    Script Date: 30/07/2021 10:40:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALUNO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](100) NULL,
	[DATA_NASCIMENTO] [date] NULL,
	[GENERO] [varchar](1) NULL,
 CONSTRAINT [PK_ALUNO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTRATO]    Script Date: 30/07/2021 10:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRATO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[INSTITUICAO_ID] [int] NULL,
	[DATA] [datetime] NULL,
	[ALUNO_ID] [int] NULL,
	[ATIVO] [bit] NULL,
	[VALOR_MENSALIDADE] [decimal](18, 2) NULL,
	[DIA_VENCIMENTO] [smallint] NULL,
 CONSTRAINT [PK_CONTRATO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISCIPLINA]    Script Date: 30/07/2021 10:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISCIPLINA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](50) NULL,
	[ATIVO] [bit] NULL,
 CONSTRAINT [PK_DISCIPLINA_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INSTITUICAO]    Script Date: 30/07/2021 10:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSTITUICAO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](50) NULL,
 CONSTRAINT [PK_INSTITUICAO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROFESSOR]    Script Date: 30/07/2021 10:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROFESSOR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](50) NULL,
	[INSTITUICAO_ID] [int] NULL,
	[ATIVO] [bit] NULL,
 CONSTRAINT [PK_PROFESSOR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TURMA]    Script Date: 30/07/2021 10:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TURMA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DISCIPLINA_ID] [int] NULL,
	[PROFESSOR_ID] [int] NULL,
	[ATIVO] [bit] NULL,
	[ANO] [smallint] NULL,
	[NOME] [varchar](50) NULL,
 CONSTRAINT [PK_DISCIPLINA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TURMA_ALUNO]    Script Date: 30/07/2021 10:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TURMA_ALUNO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TURMA_ID] [int] NOT NULL,
	[ALUNO_ID] [int] NOT NULL,
	[ATIVO] [bit] NULL,
	[DATA_INGRESSO] [date] NULL,
 CONSTRAINT [PK_TURMA_ALUNOS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ALUNO] ON 

INSERT [dbo].[ALUNO] ([ID], [NOME], [DATA_NASCIMENTO], [GENERO]) VALUES (2, N'nome testes', CAST(N'1986-12-11' AS Date), N'M')
INSERT [dbo].[ALUNO] ([ID], [NOME], [DATA_NASCIMENTO], [GENERO]) VALUES (3, N'drere', CAST(N'1986-12-12' AS Date), N'm')
SET IDENTITY_INSERT [dbo].[ALUNO] OFF
SET IDENTITY_INSERT [dbo].[CONTRATO] ON 

INSERT [dbo].[CONTRATO] ([ID], [INSTITUICAO_ID], [DATA], [ALUNO_ID], [ATIVO], [VALOR_MENSALIDADE], [DIA_VENCIMENTO]) VALUES (3, 1, NULL, 2, 0, CAST(0.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[CONTRATO] OFF
SET IDENTITY_INSERT [dbo].[DISCIPLINA] ON 

INSERT [dbo].[DISCIPLINA] ([ID], [NOME], [ATIVO]) VALUES (2, N'Matematica', 1)
SET IDENTITY_INSERT [dbo].[DISCIPLINA] OFF
SET IDENTITY_INSERT [dbo].[INSTITUICAO] ON 

INSERT [dbo].[INSTITUICAO] ([ID], [NOME]) VALUES (1, N'faculdade 1')
SET IDENTITY_INSERT [dbo].[INSTITUICAO] OFF
SET IDENTITY_INSERT [dbo].[PROFESSOR] ON 

INSERT [dbo].[PROFESSOR] ([ID], [NOME], [INSTITUICAO_ID], [ATIVO]) VALUES (1, N'joao', 1, 0)
INSERT [dbo].[PROFESSOR] ([ID], [NOME], [INSTITUICAO_ID], [ATIVO]) VALUES (2, N'33333', NULL, 0)
SET IDENTITY_INSERT [dbo].[PROFESSOR] OFF
SET IDENTITY_INSERT [dbo].[TURMA] ON 

INSERT [dbo].[TURMA] ([ID], [DISCIPLINA_ID], [PROFESSOR_ID], [ATIVO], [ANO], [NOME]) VALUES (1, 2, 1, 0, 0, N'primeiro ano')
SET IDENTITY_INSERT [dbo].[TURMA] OFF
SET IDENTITY_INSERT [dbo].[TURMA_ALUNO] ON 

INSERT [dbo].[TURMA_ALUNO] ([ID], [TURMA_ID], [ALUNO_ID], [ATIVO], [DATA_INGRESSO]) VALUES (1, 1, 2, 0, CAST(N'0001-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[TURMA_ALUNO] OFF
ALTER TABLE [dbo].[CONTRATO]  WITH CHECK ADD  CONSTRAINT [FK_CONTRATO_INSTITUICAO] FOREIGN KEY([INSTITUICAO_ID])
REFERENCES [dbo].[INSTITUICAO] ([ID])
GO
ALTER TABLE [dbo].[CONTRATO] CHECK CONSTRAINT [FK_CONTRATO_INSTITUICAO]
GO
ALTER TABLE [dbo].[PROFESSOR]  WITH CHECK ADD  CONSTRAINT [FK_PROFESSOR_INSTITUICAO] FOREIGN KEY([INSTITUICAO_ID])
REFERENCES [dbo].[INSTITUICAO] ([ID])
GO
ALTER TABLE [dbo].[PROFESSOR] CHECK CONSTRAINT [FK_PROFESSOR_INSTITUICAO]
GO
ALTER TABLE [dbo].[PROFESSOR]  WITH CHECK ADD  CONSTRAINT [FK_PROFESSOR_INSTITUICAO1] FOREIGN KEY([INSTITUICAO_ID])
REFERENCES [dbo].[INSTITUICAO] ([ID])
GO
ALTER TABLE [dbo].[PROFESSOR] CHECK CONSTRAINT [FK_PROFESSOR_INSTITUICAO1]
GO
ALTER TABLE [dbo].[TURMA]  WITH CHECK ADD  CONSTRAINT [FK_TURMA_DISCIPLINA] FOREIGN KEY([DISCIPLINA_ID])
REFERENCES [dbo].[DISCIPLINA] ([ID])
GO
ALTER TABLE [dbo].[TURMA] CHECK CONSTRAINT [FK_TURMA_DISCIPLINA]
GO
ALTER TABLE [dbo].[TURMA]  WITH CHECK ADD  CONSTRAINT [FK_TURMA_PROFESSOR] FOREIGN KEY([PROFESSOR_ID])
REFERENCES [dbo].[PROFESSOR] ([ID])
GO
ALTER TABLE [dbo].[TURMA] CHECK CONSTRAINT [FK_TURMA_PROFESSOR]
GO
USE [master]
GO
ALTER DATABASE [dbEnsino] SET  READ_WRITE 
GO
