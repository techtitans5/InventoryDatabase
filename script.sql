USE [master]
go
/****** Object:  Database [Inventory]    Script Date: 11/6/2024 6:11:09 PM ******/
CREATE DATABASE [Inventory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inventory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Inventory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Inventory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Inventory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
go
ALTER DATABASE [Inventory] SET COMPATIBILITY_LEVEL = 150
go
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inventory].[dbo].[sp_fulltext_database] @action = 'enable'
end
go
ALTER DATABASE [Inventory] SET ANSI_NULL_DEFAULT OFF 
go
ALTER DATABASE [Inventory] SET ANSI_NULLS OFF 
go
ALTER DATABASE [Inventory] SET ANSI_PADDING OFF 
go
ALTER DATABASE [Inventory] SET ANSI_WARNINGS OFF 
go
ALTER DATABASE [Inventory] SET ARITHABORT OFF 
go
ALTER DATABASE [Inventory] SET AUTO_CLOSE ON 
go
ALTER DATABASE [Inventory] SET AUTO_SHRINK OFF 
go
ALTER DATABASE [Inventory] SET AUTO_UPDATE_STATISTICS ON 
go
ALTER DATABASE [Inventory] SET CURSOR_CLOSE_ON_COMMIT OFF 
go
ALTER DATABASE [Inventory] SET CURSOR_DEFAULT  GLOBAL 
go
ALTER DATABASE [Inventory] SET CONCAT_NULL_YIELDS_NULL OFF 
go
ALTER DATABASE [Inventory] SET NUMERIC_ROUNDABORT OFF 
go
ALTER DATABASE [Inventory] SET QUOTED_IDENTIFIER OFF 
go
ALTER DATABASE [Inventory] SET RECURSIVE_TRIGGERS OFF 
go
ALTER DATABASE [Inventory] SET  ENABLE_BROKER 
go
ALTER DATABASE [Inventory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
go
ALTER DATABASE [Inventory] SET DATE_CORRELATION_OPTIMIZATION OFF 
go
ALTER DATABASE [Inventory] SET TRUSTWORTHY OFF 
go
ALTER DATABASE [Inventory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
go
ALTER DATABASE [Inventory] SET PARAMETERIZATION SIMPLE 
go
ALTER DATABASE [Inventory] SET READ_COMMITTED_SNAPSHOT ON 
go
ALTER DATABASE [Inventory] SET HONOR_BROKER_PRIORITY OFF 
go
ALTER DATABASE [Inventory] SET RECOVERY SIMPLE 
go
ALTER DATABASE [Inventory] SET  MULTI_USER 
go
ALTER DATABASE [Inventory] SET PAGE_VERIFY CHECKSUM  
go
ALTER DATABASE [Inventory] SET DB_CHAINING OFF 
go
ALTER DATABASE [Inventory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
go
ALTER DATABASE [Inventory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
go
ALTER DATABASE [Inventory] SET DELAYED_DURABILITY = DISABLED 
go
ALTER DATABASE [Inventory] SET ACCELERATED_DATABASE_RECOVERY = OFF  
go
ALTER DATABASE [Inventory] SET QUERY_STORE = OFF
go
USE [Inventory]
go
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/6/2024 6:11:09 PM ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
go
/****** Object:  Table [dbo].[Category]    Script Date: 11/6/2024 6:11:09 PM ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
go
/****** Object:  Table [dbo].[Orderss]    Script Date: 11/6/2024 6:11:09 PM ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
CREATE TABLE [dbo].[Orderss](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Orderss] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
go
/****** Object:  Table [dbo].[Products]    Script Date: 11/6/2024 6:11:09 PM ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[SKU] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[StockLevel] [int] NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[SupplierId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
go
/****** Object:  Table [dbo].[Role]    Script Date: 11/6/2024 6:11:09 PM ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
go
/****** Object:  Table [dbo].[Suppliers]    Script Date: 11/6/2024 6:11:09 PM ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ContactInfo] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
go
/****** Object:  Table [dbo].[Users]    Script Date: 11/6/2024 6:11:09 PM ******/
SET ANSI_NULLS ON
go
SET QUOTED_IDENTIFIER ON
go
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
go
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241106122853_InitialCreate', N'8.0.10')
go
/****** Object:  Index [IX_Orderss_ProductId]    Script Date: 11/6/2024 6:11:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orderss_ProductId] ON [dbo].[Orderss]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
go
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 11/6/2024 6:11:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
go
/****** Object:  Index [IX_Products_SupplierId]    Script Date: 11/6/2024 6:11:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_SupplierId] ON [dbo].[Products]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
go
/****** Object:  Index [IX_Users_RoleId]    Script Date: 11/6/2024 6:11:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
go
ALTER TABLE [dbo].[Orderss]  WITH CHECK ADD  CONSTRAINT [FK_Orderss_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
go
ALTER TABLE [dbo].[Orderss] CHECK CONSTRAINT [FK_Orderss_Products_ProductId]
go
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON DELETE CASCADE
go
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category_CategoryId]
go
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
go
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers_SupplierId]
go
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
ON DELETE CASCADE
go
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role_RoleId]
go
USE [master]
go
ALTER DATABASE [Inventory] SET  READ_WRITE 
go
