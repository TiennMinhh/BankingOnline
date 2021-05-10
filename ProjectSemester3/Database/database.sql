USE [master]
GO
/****** Object:  Database [ProjectSemester]    Script Date: 10/05/2021 9:35:13 SA ******/
CREATE DATABASE [ProjectSemester]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectSemester', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProjectSemester.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProjectSemester_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProjectSemester_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProjectSemester] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectSemester].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectSemester] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectSemester] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectSemester] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectSemester] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectSemester] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectSemester] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectSemester] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectSemester] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectSemester] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectSemester] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectSemester] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectSemester] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectSemester] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectSemester] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectSemester] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectSemester] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectSemester] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectSemester] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectSemester] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectSemester] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectSemester] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectSemester] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectSemester] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectSemester] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectSemester] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectSemester] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectSemester] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectSemester] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProjectSemester] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProjectSemester]
GO
/****** Object:  Table [dbo].[AccountObject]    Script Date: 10/05/2021 9:35:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountObject](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Birthday] [date] NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](250) NOT NULL,
	[Job] [varchar](100) NULL,
	[Gender] [varchar](50) NOT NULL,
	[IdNum] [varchar](20) NOT NULL,
	[Staff] [bit] NOT NULL,
	[PositionId] [int] NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[Locked] [bit] NOT NULL,
	[isAuthentication] [bit] NOT NULL,
 CONSTRAINT [PK_AccountObject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 10/05/2021 9:35:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 10/05/2021 9:35:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankAccount](
	[Id] [uniqueidentifier] NOT NULL,
	[UserAccountId] [uniqueidentifier] NOT NULL,
	[Balance] [money] NOT NULL,
	[BankCode] [varchar](100) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[ExpiredDate] [date] NOT NULL,
	[BankId] [int] NOT NULL,
	[Locked] [bit] NOT NULL,
	[CurrencyId] [int] NOT NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Check]    Script Date: 10/05/2021 9:35:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Check](
	[Id] [int] NOT NULL,
	[BankAccountId] [uniqueidentifier] NOT NULL,
	[Bearer] [varchar](250) NOT NULL,
	[Amount] [money] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[Valid] [bit] NOT NULL,
 CONSTRAINT [PK_Check] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 10/05/2021 9:35:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Fullname] [varchar](100) NOT NULL,
	[ExchangeRate] [float] NOT NULL,
	[Default] [bit] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Help]    Script Date: 10/05/2021 9:35:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Help](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactNumber1] [varchar](50) NOT NULL,
	[ContactNumber2] [varchar](50) NULL,
	[Address] [varchar](250) NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Help] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Problem]    Script Date: 10/05/2021 9:35:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Problem](
	[Id] [int] NOT NULL,
	[Question] [varchar](250) NOT NULL,
	[Answer] [varchar](250) NULL,
	[ReceivedDate] [datetime] NOT NULL,
	[AnswerDate] [datetime] NULL,
	[AnswererId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Problem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 10/05/2021 9:35:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Result](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Success] [bit] NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/05/2021 9:35:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 10/05/2021 9:35:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Setting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[DefaultNumOfShowedTransaction] [int] NOT NULL,
	[DefaultCurrencyId] [int] NOT NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 10/05/2021 9:35:13 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [int] NOT NULL,
	[BankAccountIdFrom] [uniqueidentifier] NOT NULL,
	[BankAccountIdTo] [uniqueidentifier] NOT NULL,
	[Time] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[Content] [varchar](250) NULL,
	[ResultId] [int] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication]) VALUES (N'ffbdb467-1359-41db-aa7d-ba9694937cfa', N'James', CAST(N'2000-12-28' AS Date), N'0123456789', N'mail2@gmail.com', N'address 2', N'job 2', N'Male', N'123456789', 0, 1, N'userJame1', N'$2b$10$85rgAnzLQY6rXZfuSllmduzvMUFqdDqZgmEOteWWFCxLEXV.u2m.q', CAST(N'2021-05-06' AS Date), 0, 0)
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication]) VALUES (N'dda4eeed-5fc2-4320-8564-bcd9c418b2eb', N'Maria', CAST(N'2000-01-01' AS Date), N'0123456789', N'mail3@gmail.com', N'address 3', N'job 3', N'Female', N'123456789', 0, 1, N'username3', N'$2b$10$QI/C7pD8H0Rlzl283k.H7eq2DEFau0Q7bd3wfl7D98J4veFQV6cQS', CAST(N'2021-05-06' AS Date), 0, 0)
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication]) VALUES (N'ebd92a0b-1198-48e1-b3b2-d12f50cec3ff', N'Master', CAST(N'1999-01-01' AS Date), N'0123456789', N'mail6@gmail.com', N'address 6', N'job 6', N'Other', N'123456789', 1, 2, N'superAdmin', N'$2b$10$jA2k24vqxC1HruecVnDeMuMK3QP8ApyLSDuJus/nyn21u1egWJhIK', CAST(N'2021-05-06' AS Date), 0, 0)
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication]) VALUES (N'a90387cd-0aa7-400c-a80c-d216716533d9', N'Sam', CAST(N'1999-10-25' AS Date), N'0123456789', N'mail5@gmail.com', N'address 5', N'job 5', N'Male', N'123456789', 1, 2, N'admin1', N'$2b$10$IfQdE5C1M4XRHHSjNYu6S.iEEn.tsEhj6IqT0hACUtwFilgwRy4Ua', CAST(N'2021-05-06' AS Date), 0, 1)
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication]) VALUES (N'62bba49b-1b5d-4b03-bd36-d7658698e31f', N'Zelda', CAST(N'2000-12-06' AS Date), N'012346789', N'mail4@gmail.com', N'address 4', N'job 4', N'Female', N'123456789', 1, 2, N'admin2', N'$2b$10$VtuoeUGFoRcgg6980BGvnuhQbx4XR2KtFP.uqt4mtUywpR/8uBfEq', CAST(N'2021-05-06' AS Date), 0, 0)
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication]) VALUES (N'68e3dcca-146e-4131-a7d4-f0701a657400', N'Jack', CAST(N'2000-12-28' AS Date), N'0123456789', N'mail1@gmail.com', N'address 1', N'job 1', N'Male', N'123456789', 0, 1, N'username1', N'$2b$10$lgT4l1aFe30Mgx3zfefdfuQAdK/WRJ7ob1gH1YGI5MF5bOLmP5lee', CAST(N'2021-05-06' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (1, N'Vietcombank', N'address 1', N'description 1', 1)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (2, N'Agribank', N'address 2', N'description 2', 1)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (3, N'VCB', N'address 3', N'description 3', 1)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (4, N'MB', N'address 4', N'description 4', 1)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (5, N'NetBank', N'address 5', N'description 5', 0)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (6, N'Silver State Bank', N'address 6', N'description 6', 0)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (8, N'Oceanbank', N'Address o', N'Description o', 1)
SET IDENTITY_INSERT [dbo].[Bank] OFF
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'08661eb7-1ea1-4d6d-b4a5-0f527467e2eb', N'dda4eeed-5fc2-4320-8564-bcd9c418b2eb', 1500.0000, N'3d30b5', CAST(N'2021-05-06' AS Date), CAST(N'2023-05-06' AS Date), 1, 0, 1)
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'6901554c-9325-47a1-a639-1fb454c7e364', N'68e3dcca-146e-4131-a7d4-f0701a657400', 1000000.0000, N'daa783', CAST(N'2021-05-06' AS Date), CAST(N'2023-05-06' AS Date), 2, 0, 1)
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'b5065a5a-5779-47f0-8b8e-5fcfb73fb23d', N'dda4eeed-5fc2-4320-8564-bcd9c418b2eb', 100.0000, N'3008a2', CAST(N'2021-05-06' AS Date), CAST(N'2023-05-06' AS Date), 2, 0, 2)
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'5b33b459-ec1a-4bb0-843b-cc864f2ad901', N'68e3dcca-146e-4131-a7d4-f0701a657400', 2500.0000, N'5a2fd9', CAST(N'2021-05-06' AS Date), CAST(N'2023-05-06' AS Date), 3, 1, 3)
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'a1b73ac2-7755-4f23-9b2c-d581cf9ba77d', N'ffbdb467-1359-41db-aa7d-ba9694937cfa', 1000.0000, N'17087e', CAST(N'2021-05-06' AS Date), CAST(N'2023-05-06' AS Date), 4, 1, 2)
SET IDENTITY_INSERT [dbo].[Currency] ON 

INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (1, N'VND', N'Vienamese dong', 1, 1)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (2, N'USD', N'United States dollar', 23.5, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (3, N'EUR', N'	Euro', 26.9, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (4, N'GBP', N'British pound sterling', 31.2, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (5, N'AUD', N'Australian dollar', 17.4, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (6, N'CAD', N'Canadian Dollar', 18.3, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (7, N'JPY', N'Japanese yen', 4.74, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (8, N'CHF', N'Confoederatio Helvetica franc', 24.7, 0)
SET IDENTITY_INSERT [dbo].[Currency] OFF
SET IDENTITY_INSERT [dbo].[Help] ON 

INSERT [dbo].[Help] ([Id], [ContactNumber1], [ContactNumber2], [Address], [Email]) VALUES (1, N'Null123', N'Null', N'Null', N'Null')
SET IDENTITY_INSERT [dbo].[Help] OFF
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([Id], [Description], [Success]) VALUES (1, N'Success for no reason', 1)
INSERT [dbo].[Result] ([Id], [Description], [Success]) VALUES (2, N'Failed for some reasons', 0)
SET IDENTITY_INSERT [dbo].[Result] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [Grade]) VALUES (1, N'Customer', 1)
INSERT [dbo].[Role] ([Id], [Name], [Grade]) VALUES (2, N'Admin', 2)
INSERT [dbo].[Role] ([Id], [Name], [Grade]) VALUES (3, N'SuperAdmin', 3)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Setting] ON 

INSERT [dbo].[Setting] ([Id], [Title], [DefaultNumOfShowedTransaction], [DefaultCurrencyId]) VALUES (1, N'Banking Online', 1, 1)
SET IDENTITY_INSERT [dbo].[Setting] OFF
ALTER TABLE [dbo].[AccountObject]  WITH CHECK ADD  CONSTRAINT [FK_Object_Role] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[AccountObject] CHECK CONSTRAINT [FK_Object_Role]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_AccountObject] FOREIGN KEY([UserAccountId])
REFERENCES [dbo].[AccountObject] ([Id])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_AccountObject]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_Bank] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([Id])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_Bank]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_Currency]
GO
ALTER TABLE [dbo].[Check]  WITH CHECK ADD  CONSTRAINT [FK_Check_BankAccount] FOREIGN KEY([BankAccountId])
REFERENCES [dbo].[BankAccount] ([Id])
GO
ALTER TABLE [dbo].[Check] CHECK CONSTRAINT [FK_Check_BankAccount]
GO
ALTER TABLE [dbo].[Problem]  WITH CHECK ADD  CONSTRAINT [FK_Problem_AccountObject] FOREIGN KEY([AnswererId])
REFERENCES [dbo].[AccountObject] ([Id])
GO
ALTER TABLE [dbo].[Problem] CHECK CONSTRAINT [FK_Problem_AccountObject]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BankAccount] FOREIGN KEY([BankAccountIdFrom])
REFERENCES [dbo].[BankAccount] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_BankAccount]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BankAccount1] FOREIGN KEY([BankAccountIdTo])
REFERENCES [dbo].[BankAccount] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_BankAccount1]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Result] FOREIGN KEY([ResultId])
REFERENCES [dbo].[Result] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Result]
GO
USE [master]
GO
ALTER DATABASE [ProjectSemester] SET  READ_WRITE 
GO
