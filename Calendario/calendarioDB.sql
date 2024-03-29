USE [master]
GO
/****** Object:  Database [Calendario]    Script Date: 10/03/2020 06:41:58 ******/
CREATE DATABASE [Calendario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Calendario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Calendario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Calendario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Calendario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Calendario] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Calendario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Calendario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Calendario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Calendario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Calendario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Calendario] SET ARITHABORT OFF 
GO
ALTER DATABASE [Calendario] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Calendario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Calendario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Calendario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Calendario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Calendario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Calendario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Calendario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Calendario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Calendario] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Calendario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Calendario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Calendario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Calendario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Calendario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Calendario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Calendario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Calendario] SET RECOVERY FULL 
GO
ALTER DATABASE [Calendario] SET  MULTI_USER 
GO
ALTER DATABASE [Calendario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Calendario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Calendario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Calendario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Calendario] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Calendario', N'ON'
GO
ALTER DATABASE [Calendario] SET QUERY_STORE = OFF
GO
USE [Calendario]
GO
/****** Object:  Table [dbo].[ApplicationRole]    Script Date: 10/03/2020 06:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[NormalizedName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUser]    Script Date: 10/03/2020 06:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[NormalizedUserName] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserRole]    Script Date: 10/03/2020 06:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 10/03/2020 06:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactNome] [varchar](100) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[AddedOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evento]    Script Date: 10/03/2020 06:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evento](
	[Id] [uniqueidentifier] NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[Descricao] [nvarchar](300) NOT NULL,
	[Inicio] [datetime] NOT NULL,
	[Fim] [datetime] NOT NULL,
	[Cor] [nchar](10) NOT NULL,
	[DiaInteiro] [bit] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Habilitado] [bit] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApplicationRole_NormalizedName]    Script Date: 10/03/2020 06:41:59 ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationRole_NormalizedName] ON [dbo].[ApplicationRole]
(
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApplicationUser_NormalizedEmail]    Script Date: 10/03/2020 06:41:59 ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_NormalizedEmail] ON [dbo].[ApplicationUser]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ApplicationUser_NormalizedUserName]    Script Date: 10/03/2020 06:41:59 ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_NormalizedUserName] ON [dbo].[ApplicationUser]
(
	[NormalizedUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplicationUserRole]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[ApplicationRole] ([Id])
GO
ALTER TABLE [dbo].[ApplicationUserRole]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[ApplicationUser] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Calendario] SET  READ_WRITE 
GO
