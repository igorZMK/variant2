USE [master]
GO
/****** Object:  Database [user1]    Script Date: 08.09.2023 0:11:22 ******/
CREATE DATABASE [user1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.LOCALDB\MSSQL\DATA\user1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'user1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.LOCALDB\MSSQL\DATA\user1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [user1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user1] SET ARITHABORT OFF 
GO
ALTER DATABASE [user1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [user1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [user1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [user1] SET  MULTI_USER 
GO
ALTER DATABASE [user1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [user1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user1] SET QUERY_STORE = OFF
GO
USE [user1]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ParentCategoryId] [int] NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Photo] [nvarchar](50) NULL,
	[DateOfRegistration] [date] NOT NULL,
	[ClientTypeId] [int] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientType]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientType](
	[ClientTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ClientTypeName] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_ClientType] PRIMARY KEY CLUSTERED 
(
	[ClientTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complect]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complect](
	[ComplectId] [int] IDENTITY(1,1) NOT NULL,
	[MainGoodId] [int] NOT NULL,
	[SecondGoodId] [int] NOT NULL,
 CONSTRAINT [PK_Coplect] PRIMARY KEY CLUSTERED 
(
	[ComplectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Developer]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developer](
	[DeveloperId] [int] IDENTITY(1,1) NOT NULL,
	[DeveloperName] [nvarchar](1000) NOT NULL,
	[WorkBeginDate] [date] NOT NULL,
 CONSTRAINT [PK_Developer] PRIMARY KEY CLUSTERED 
(
	[DeveloperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Good]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Good](
	[GoodId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[GoodName] [nvarchar](200) NOT NULL,
	[MainPhoto] [nvarchar](50) NOT NULL,
	[SecondPhotos] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[Weight] [float] NULL,
	[Width] [float] NULL,
	[Heigth] [float] NULL,
	[Length] [float] NULL,
	[DeveloperId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Good] PRIMARY KEY CLUSTERED 
(
	[GoodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Season]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[SeasonId] [int] IDENTITY(1,1) NOT NULL,
	[SeasonName] [nvarchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED 
(
	[SeasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeasonGood]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeasonGood](
	[SeasonGoodId] [int] IDENTITY(1,1) NOT NULL,
	[SeasonId] [int] NOT NULL,
	[GoodId] [int] NOT NULL,
 CONSTRAINT [PK_SeasonGood] PRIMARY KEY CLUSTERED 
(
	[SeasonGoodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sell]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sell](
	[SellId] [int] IDENTITY(1,1) NOT NULL,
	[GoodId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[DateSell] [datetime] NOT NULL,
 CONSTRAINT [PK_Sell] PRIMARY KEY CLUSTERED 
(
	[SellId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellVisit]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellVisit](
	[SellVisitId] [int] IDENTITY(1,1) NOT NULL,
	[SellId] [int] NOT NULL,
	[VisitId] [int] NOT NULL,
 CONSTRAINT [PK_SellVisit] PRIMARY KEY CLUSTERED 
(
	[SellVisitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](200) NOT NULL,
	[ServiceDescription] [nvarchar](1000) NULL,
	[Price] [float] NOT NULL,
	[TimeLength] [int] NOT NULL,
	[MainPhoto] [nvarchar](100) NOT NULL,
	[SecondPhotos] [nvarchar](max) NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[SpecialityId] [int] IDENTITY(1,1) NOT NULL,
	[SpecialityPay] [float] NOT NULL,
	[SpecialityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[SpecialityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[GoodId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[TimeSheetId] [int] IDENTITY(1,1) NOT NULL,
	[WorkerId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[ServiceTime] [time](7) NOT NULL,
	[GenderCheck] [bit] NOT NULL,
 CONSTRAINT [PK_TimeSheet] PRIMARY KEY CLUSTERED 
(
	[TimeSheetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visit]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visit](
	[VisitId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[DateRegs] [datetime] NULL,
	[Paid] [bit] NULL,
	[Rewiew] [nvarchar](1000) NULL,
	[DateActual] [datetime] NOT NULL,
	[Documents] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED 
(
	[VisitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 08.09.2023 0:11:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[WorkerId] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[PassportSeries] [nvarchar](10) NOT NULL,
	[PasssportId] [nvarchar](10) NOT NULL,
	[PassportCode] [nvarchar](10) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Birthday] [date] NOT NULL,
	[SpecialityId] [int] NOT NULL,
	[PayCoeff] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[WorkerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (1, N'Васильев', N'Оскар', N'Богданович', CAST(N'1971-01-30' AS Date), N'0', N' 7(585)801-94-29 ', N' miturria@verizon.net', NULL, CAST(N'2017-05-28' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (2, N'Лазарев', N'Алексей', N'Богданович', CAST(N'1977-03-10' AS Date), N'0', N' 7(0055)737-37-48 ', N' claesjac@me.com', NULL, CAST(N'2017-01-02' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (3, N'Казаков', N'Дмитрий', N'Русланович', CAST(N'1978-12-15' AS Date), N'0', N' 7(51)682-19-40 ', N' ozawa@verizon.net', NULL, CAST(N'2016-05-21' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (4, N'Попова', N'Харита', N'Якуновна', CAST(N'1997-12-16' AS Date), N'1', N' 7(335)386-81-06 ', N' firstpr@verizon.net', NULL, CAST(N'2016-07-05' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (5, N'Турова', N'Георгина', N'Семёновна', CAST(N'1974-05-28' AS Date), N'1', N' 7(555)321-42-99 ', N' yruan@optonline.net', NULL, CAST(N'2018-02-22' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (6, N'Андреев', N'Станислав', N'Максович', CAST(N'1975-10-10' AS Date), N'0', N' 7(02)993-91-28 ', N' budinger@mac.com', NULL, CAST(N'2017-12-26' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (7, N'Орлова', N'Влада', N'Мартыновна', CAST(N'1990-06-26' AS Date), N'1', N' 7(2506)433-38-35 ', N' rnelson@yahoo.ca', NULL, CAST(N'2016-03-21' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (8, N'Костина', N'Любава', N'Авксентьевна', CAST(N'1972-07-13' AS Date), N'1', N' 7(6419)959-21-87 ', N' gordonjcp@hotmail.com', NULL, CAST(N'2016-02-26' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (9, N'Александров', N'Станислав', N'Эдуардович', CAST(N'1981-07-04' AS Date), N'0', N' 7(18)164-05-12 ', N' bigmauler@aol.com', NULL, CAST(N'2018-11-08' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (10, N'Корнилова', N'Анэля', N'Михайловна', CAST(N'1973-04-02' AS Date), N'1', N' 7(20)980-01-60 ', N' jonathan@aol.com', NULL, CAST(N'2016-05-22' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (11, N'Морозов', N'Наум', N'Валерьянович', CAST(N'1985-07-04' AS Date), N'0', N' 7(636)050-96-13 ', N' salesgeek@mac.com', NULL, CAST(N'2016-05-02' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (12, N'Баранова', N'Эльмира', N'Дмитриевна', CAST(N'1977-01-15' AS Date), N'1', N' 7(9240)643-15-50 ', N' jgmyers@comcast.net', NULL, CAST(N'2016-07-08' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (13, N'Степанова', N'Амелия', N'Робертовна', CAST(N'1970-06-06' AS Date), N'1', N' 7(1217)441-28-42 ', N' rasca@hotmail.com', NULL, CAST(N'2017-09-27' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (14, N'Горбачёв', N'Давид', N'Тимурович', CAST(N'1983-05-22' AS Date), N'0', N' 7(53)602-85-41 ', N' hedwig@att.net', NULL, CAST(N'2018-12-17' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (15, N'Волков', N'Людвиг', N'Витальевич', CAST(N'1977-12-27' AS Date), N'0', N' 7(8459)592-05-58 ', N' jrkorson@msn.com', NULL, CAST(N'2016-04-27' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (16, N'Комиссарова', N'Амалия', N'Робертовна', CAST(N'1971-08-18' AS Date), N'1', N' 7(22)647-46-32 ', N' jorgb@msn.com', NULL, CAST(N'2017-08-04' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (17, N'Большаков', N'Вадим', N'Данилович', CAST(N'1970-05-15' AS Date), N'0', N' 7(386)641-13-37 ', N' uncle@gmail.com', NULL, CAST(N'2018-08-04' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (18, N'Абрамов', N'Станислав', N'Филатович', CAST(N'1989-05-18' AS Date), N'0', N' 7(6545)478-87-79 ', N' solomon@att.net', NULL, CAST(N'2016-12-08' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (19, N'Журавлёв', N'Леонтий', N'Яковлевич', CAST(N'2000-03-02' AS Date), N'0', N' 7(4403)308-56-96 ', N' cmdrgravy@me.com', NULL, CAST(N'2018-01-15' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (20, N'Селиверстов', N'Глеб', N'Максимович', CAST(N'1999-06-20' AS Date), N'0', N' 7(20)554-28-68 ', N' jigsaw@sbcglobal.net', NULL, CAST(N'2016-01-07' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (21, N'Киселёв', N'Устин', N'Яковлевич', CAST(N'1985-01-08' AS Date), N'0', N' 7(83)334-52-76 ', N' dalamb@verizon.net', NULL, CAST(N'2018-06-21' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (22, N'Зуев', N'Матвей', N'Иванович', CAST(N'1981-03-28' AS Date), N'0', N' 7(5383)893-04-66 ', N' brickbat@verizon.net', NULL, CAST(N'2018-12-18' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (23, N'Ершов', N'Глеб', N'Федорович', CAST(N'1970-06-14' AS Date), N'0', N' 7(2608)298-40-82 ', N' sjava@aol.com', NULL, CAST(N'2016-09-14' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (24, N'Бобылёв', N'Георгий', N'Витальевич', CAST(N'1983-12-19' AS Date), N'0', N' 7(88)685-13-51 ', N' csilvers@mac.com', NULL, CAST(N'2018-04-06' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (25, N'Ефремов', N'Витольд', N'Авксентьевич', CAST(N'1975-12-02' AS Date), N'0', N' 7(93)922-14-03 ', N' kwilliams@yahoo.ca', NULL, CAST(N'2018-04-09' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (26, N'Андреева', N'Патрисия', N'Валерьевна', CAST(N'1993-11-18' AS Date), N'1', N' 7(9648)953-81-26 ', N' jigsaw@aol.com', NULL, CAST(N'2016-07-17' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (27, N'Ефимова', N'Магда', N'Платоновна', CAST(N'1995-08-16' AS Date), N'1', N' 7(9261)386-15-92 ', N' rbarreira@me.com', NULL, CAST(N'2017-08-01' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (28, N'Голубев', N'Иосиф', N'Тимофеевич', CAST(N'1982-05-06' AS Date), N'0', N' 7(78)972-73-11 ', N' smcnabb@att.net', NULL, CAST(N'2018-08-18' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (29, N'Евсеев', N'Макар', N'Васильевич', CAST(N'1977-09-13' AS Date), N'0', N' 7(2141)077-85-70 ', N' parsimony@sbcglobal.net', NULL, CAST(N'2018-12-05' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (30, N'Бобров', N'Агафон', N'Лаврентьевич', CAST(N'1995-07-29' AS Date), N'0', N' 7(2159)507-39-57 ', N' petersen@comcast.net', NULL, CAST(N'2017-05-09' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (31, N'Игнатов', N'Захар', N'Павлович', CAST(N'1998-10-07' AS Date), N'0', N' 7(578)574-73-36 ', N' dieman@icloud.com', NULL, CAST(N'2017-11-10' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (32, N'Гущина', N'Янита', N'Федоровна', CAST(N'1999-03-02' AS Date), N'1', N' 7(4544)716-68-96 ', N' lishoy@att.net', NULL, CAST(N'2018-02-01' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (33, N'Калашников', N'Артур', N'Юрьевич', CAST(N'1972-12-13' AS Date), N'0', N' 7(147)947-47-21 ', N' oevans@aol.com', NULL, CAST(N'2017-08-20' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (34, N'Дмитриева', N'Элина', N'Даниловна', CAST(N'1988-12-10' AS Date), N'1', N' 7(787)140-48-84 ', N' vmalik@live.com', NULL, CAST(N'2017-02-11' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (35, N'Федотова', N'Сандра', N'Владленовна', CAST(N'1985-03-29' AS Date), N'1', N' 7(126)195-25-86 ', N' penna@verizon.net', NULL, CAST(N'2016-11-08' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (36, N'Кузьмина', N'Дэнна', N'Витальевна', CAST(N'1993-08-24' AS Date), N'1', N' 7(9940)977-45-73 ', N' nichoj@mac.com', NULL, CAST(N'2016-03-27' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (37, N'Колобова', N'Злата', N'Романовна', CAST(N'1994-08-25' AS Date), N'1', N' 7(50)884-07-35 ', N' sinkou@aol.com', NULL, CAST(N'2016-12-03' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (38, N'Некрасов', N'Варлам', N'Михайлович', CAST(N'2000-11-12' AS Date), N'0', N' 7(019)258-06-35 ', N' dogdude@verizon.net', NULL, CAST(N'2017-12-03' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (39, N'Колобов', N'Орест', N'Юлианович', CAST(N'2001-07-14' AS Date), N'0', N' 7(1680)508-58-26 ', N' parkes@verizon.net', NULL, CAST(N'2017-01-01' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (40, N'Блохин', N'Пантелеймон', N'Феликсович', CAST(N'1978-03-06' AS Date), N'0', N' 7(9524)556-48-98 ', N' balchen@comcast.net', NULL, CAST(N'2018-02-14' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (41, N'Калинин', N'Петр', N'Иванович', CAST(N'1993-09-08' AS Date), N'0', N' 7(90)316-07-17 ', N' aschmitz@hotmail.com', NULL, CAST(N'2016-05-26' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (42, N'Беляева', N'Сабрина', N'Федосеевна', CAST(N'1972-07-26' AS Date), N'1', N' 7(6580)534-32-58 ', N' agapow@gmail.com', NULL, CAST(N'2017-06-14' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (43, N'Агафонов', N'Юстиниан', N'Олегович', CAST(N'1997-02-02' AS Date), N'0', N' 7(303)810-28-78 ', N' staffelb@sbcglobal.net', NULL, CAST(N'2016-06-08' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (44, N'Мамонтова', N'Марфа', N'Мироновна', CAST(N'1984-10-19' AS Date), N'1', N' 7(38)095-64-18 ', N' rfoley@verizon.net', NULL, CAST(N'2018-02-27' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (45, N'Блинов', N'Евгений', N'Мэлсович', CAST(N'1994-01-05' AS Date), N'0', N' 7(0852)321-82-64 ', N' moxfulder@outlook.com', NULL, CAST(N'2017-05-07' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (46, N'Воронова', N'Изабелла', N'Вячеславовна', CAST(N'1999-09-24' AS Date), N'1', N' 7(17)433-44-98 ', N' kildjean@sbcglobal.net', NULL, CAST(N'2017-12-21' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (47, N'Медведев', N'Святослав', N'Юлианович', CAST(N'1972-10-04' AS Date), N'0', N' 7(3520)435-21-20 ', N' hllam@comcast.net', NULL, CAST(N'2018-10-13' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (48, N'Куликова', N'Эвелина', N'Вячеславовна', CAST(N'1997-11-14' AS Date), N'1', N' 7(0236)682-42-78 ', N' ilikered@hotmail.com', NULL, CAST(N'2018-02-01' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (49, N'Суворова', N'Божена', N'Анатольевна', CAST(N'1981-03-09' AS Date), N'1', N' 7(347)895-86-57 ', N' attwood@aol.com', NULL, CAST(N'2016-01-28' AS Date), NULL)
INSERT [dbo].[Client] ([ClientId], [LastName], [FirstName], [MiddleName], [DateOfBirth], [Gender], [Phone], [Email], [Photo], [DateOfRegistration], [ClientTypeId]) VALUES (50, N'Егорова', N'Амалия', N'Дамировна', CAST(N'1999-09-28' AS Date), N'1', N' 7(7486)408-12-26 ', N' drezet@yahoo.com', NULL, CAST(N'2016-06-30' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (1, N'Занятие с репетитором-носителем китайского языка', NULL, 1950, 7200, N'Китайский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (2, N'Индивидуальный урок немецкого языка с преподавателем-носителем языка', NULL, 1340, 6600, N'Немецкий язык.png', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (3, N'Киноклуб китайского языка для студентов', NULL, 1990, 6000, N'киноклуб.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (4, N'Индивидуальный онлайн-урок японского языка по Skype', NULL, 1000, 4800, N'online lessons.jpg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (5, N'Киноклуб испанского языка для студентов', NULL, 1050, 2400, N'киноклуб.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (6, N'Занятие с русскоязычным репетитором испанского языка', NULL, 1450, 3000, N'Испанский язык.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (7, N'Урок в группе итальянского языка для взрослых', NULL, 1290, 2400, N'Итальянский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (8, N'Интенсивный онлайн-курс французского языка для компаний по Skype', NULL, 1180, 2400, N'online lessons.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (9, N'Индивидуальный урок французского языка с преподавателем-носителем языка', NULL, 1410, 2400, N'Французский язык.jpg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (10, N'Урок в группе французского языка для школьников', NULL, 1970, 6000, N'Французский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (11, N'Занятие с репетитором-носителем английского языка', NULL, 910, 6600, N'Английский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (12, N'Киноклуб французского языка для взрослых', NULL, 1770, 5400, N'киноклуб.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (13, N'Киноклуб немецкого языка для взрослых', NULL, 1560, 6000, N'киноклуб.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (14, N'Урок в группе японского языка для школьников', NULL, 1300, 4800, N'Японский язык.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (15, N'Индивидуальный урок испанского языка с русскоязычным преподавателем', NULL, 1790, 3600, N'Испанский язык.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (16, N'Интенсивный онлайн-курс итальянского языка для компаний по Skype', NULL, 1230, 4200, N'online lessons.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (17, N'Урок в группе японского языка для студентов', NULL, 1860, 3000, N'Японский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (18, N'Интенсивный курс с преподавателем-носителем английского языка для компаний', NULL, 1670, 6600, N'for company.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (19, N'Киноклуб итальянского языка для студентов', NULL, 1760, 1800, N'киноклуб.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (20, N'Урок в группе испанского языка для взрослых', NULL, 1730, 1800, N'Испанский язык.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (21, N'Урок в группе испанского языка для студентов', NULL, 1310, 6000, N'Испанский язык.jpg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (22, N'Интенсивный онлайн-курс испанского языка для компаний по Skype', NULL, 1510, 7200, N'online lessons.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (23, N'Урок в группе английского языка для школьников', NULL, 900, 6600, N'Английский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (24, N'Занятие с репетитором-носителем испанского языка', NULL, 1090, 3000, N'Испанский язык.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (25, N'Интенсивный курс с преподавателем-носителем итальянского языка для компаний', NULL, 1190, 2400, N'for company.jpg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (26, N'Урок в группе китайского языка для студентов', NULL, 2000, 2400, N'Китайский язык.jpg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (27, N'Индивидуальный урок испанского языка с преподавателем-носителем языка', NULL, 1200, 5400, N'Испанский язык.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (28, N'Интенсивный онлайн-курс португальского языка для компаний по Skype', NULL, 1610, 4200, N'online lessons.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (29, N'Подготовка к экзамену ACT', NULL, 1440, 3000, N'Подготовка к экзамену ACT.png', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (30, N'Урок в группе китайского языка для взрослых', NULL, 1730, 4200, N'Китайский язык.jpg', NULL, 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (31, N'Интенсивный онлайн-курс английского языка для компаний по Skype', NULL, 1160, 3000, N'online lessons.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (32, N'Подготовка к экзамену TOEFL', NULL, 1070, 6000, N'Подготовка к экзамену TOEFL.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (33, N'Занятие с репетитором-носителем итальянского языка', NULL, 1370, 7200, N'Итальянский язык.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (34, N'Урок в группе английского языка для взрослых', NULL, 1010, 3000, N'Английский язык.jpg', NULL, 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (35, N'Киноклуб английского языка для взрослых', NULL, 1250, 4200, N'киноклуб.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (36, N'Интенсивный курс с преподавателем-носителем французского языка для компаний', NULL, 1630, 4200, N'for company.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (37, N'Урок в группе испанского языка для школьников', NULL, 1910, 7200, N'Испанский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (38, N'Подготовка к экзамену GRE', NULL, 1300, 4800, N'Подготовка к экзамену GRE.jpeg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (39, N'Урок в группе английского языка для студентов', NULL, 960, 4800, N'Английский язык.jpg', NULL, 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (40, N'Занятие с русскоязычным репетитором японского языка', NULL, 1260, 2400, N'Японский язык.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (41, N'Индивидуальный онлайн-урок немецкого языка по Skype', NULL, 970, 5400, N'online lessons.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (42, N'Интенсивный курс японского языка с русскоязычным преподавателем для компаний', NULL, 1500, 4800, N'for company.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (43, N'Киноклуб китайского языка для взрослых', NULL, 1800, 4200, N'киноклуб.jpg', NULL, 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (44, N'Индивидуальный урок китайского языка с русскоязычным преподавателем', NULL, 1860, 7200, N'Китайский язык.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (45, N'Подготовка к экзамену GMAT', NULL, 1150, 4200, N'Подготовка к экзамену GMAT.png', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (46, N'Подготовка к экзамену IELTS', NULL, 1730, 7200, N'Подготовка к экзамену IELTS.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (47, N'Подготовка к экзамену SAT', NULL, 1560, 2400, N'Подготовка к экзамену SAT.png', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (48, N'Урок в группе китайского языка для школьников', NULL, 1180, 3000, N'Китайский язык.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (49, N'Киноклуб английского языка для студентов', NULL, 980, 4800, N'киноклуб.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (50, N'Киноклуб португальского языка для студентов', NULL, 1170, 1800, N'киноклуб.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (51, N'Киноклуб китайского языка для детей', NULL, 1120, 6000, N'киноклуб.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (52, N'Урок в группе немецкого языка для школьников', NULL, 1570, 1800, N'Немецкий язык.png', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (53, N'Индивидуальный онлайн-урок испанского языка по Skype', NULL, 1780, 4200, N'online lessons.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (54, N'Урок в группе немецкого языка для взрослых', NULL, 930, 3600, N'Немецкий язык.png', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (55, N'Индивидуальный урок китайского языка с преподавателем-носителем языка', NULL, 1480, 5400, N'Китайский язык.jpg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (56, N'Занятие с русскоязычным репетитором португальского языка', NULL, 1970, 3000, N'Португальский язык.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (57, N'Интенсивный курс китайского языка с русскоязычным преподавателем для компаний', NULL, 1470, 6600, N'for company.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (58, N'Занятие с русскоязычным репетитором немецкого языка', NULL, 1420, 1800, N'Немецкий язык.png', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (59, N'Киноклуб английского языка для детей', NULL, 1280, 2400, N'киноклуб.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (60, N'Занятие с репетитором-носителем немецкого языка', NULL, 1120, 7200, N'Немецкий язык.png', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (61, N'Индивидуальный онлайн-урок китайского языка по Skype', NULL, 1410, 4200, N'online lessons.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (62, N'Индивидуальный урок английского языка с преподавателем-носителем языка', NULL, 1300, 7200, N'Английский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (63, N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', NULL, 1180, 7200, N'for company.jpg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (64, N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', NULL, 1840, 4200, N'online lessons.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (65, N'Урок в группе итальянского языка для школьников', NULL, 1410, 6000, N'Итальянский язык.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (66, N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', NULL, 1330, 1800, N'Итальянский язык.jpg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (67, N'Интенсивный онлайн-курс китайского языка для компаний по Skype', NULL, 1760, 7200, N'online lessons.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (68, N'Занятие с русскоязычным репетитором французского языка', NULL, 1870, 6000, N'Французский язык.jpg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (69, N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', NULL, 990, 1800, N'Немецкий язык.png', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (70, N'Индивидуальный онлайн-урок английского языка по Skype', NULL, 1880, 6000, N'online lessons.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (71, N'Индивидуальный урок французского языка с русскоязычным преподавателем', NULL, 1390, 4200, N'Французский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (72, N'Интенсивный курс португальского языка с русскоязычным преподавателем для компаний', NULL, 2010, 3600, N'for company.jpg', NULL, 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (73, N'Индивидуальный онлайн-урок французского языка по Skype', NULL, 2010, 7200, N'online lessons.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (74, N'Интенсивный курс английского языка с русскоязычным преподавателем для компаний', NULL, 1210, 4800, N'for company.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (75, N'Урок в группе французского языка для взрослых', NULL, 960, 7200, N'Французский язык.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (76, N'Подготовка к экзамену IELTS Speaking Club', NULL, 1430, 5400, N'Подготовка к экзамену IELTS.jpg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (77, N'Киноклуб итальянского языка для детей', NULL, 1480, 4200, N'киноклуб.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (78, N'Урок в группе итальянского языка для студентов', NULL, 1020, 6600, N'Итальянский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (79, N'Индивидуальный урок итальянского языка с преподавателем-носителем языка', NULL, 1690, 4800, N'Итальянский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (80, N'Киноклуб немецкого языка для детей', NULL, 1670, 7200, N'киноклуб.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (81, N'Киноклуб итальянского языка для взрослых', NULL, 1760, 6600, N'киноклуб.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (82, N'Киноклуб португальского языка для взрослых', NULL, 950, 1800, N'киноклуб.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (83, N'Киноклуб португальского языка для детей', NULL, 1710, 5400, N'киноклуб.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (84, N'Киноклуб французского языка для детей', NULL, 1600, 5400, N'киноклуб.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (85, N'Урок в группе японского языка для взрослых', NULL, 1420, 4800, N'Японский язык.jpg', NULL, 5)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (86, N'Интенсивный курс французского языка с русскоязычным преподавателем для компаний', NULL, 1940, 2400, N'for company.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (87, N'Занятие с русскоязычным репетитором итальянского языка', NULL, 1620, 4200, N'Итальянский язык.jpg', NULL, 20)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (88, N'Индивидуальный урок английского языка с русскоязычным преподавателем', NULL, 1910, 1800, N'Английский язык.jpg', NULL, 10)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (89, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', NULL, 1580, 1800, N'for company.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (90, N'Интенсивный курс испанского языка с русскоязычным преподавателем для компаний', NULL, 1000, 5400, N'for company.jpg', NULL, 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (91, N'Киноклуб немецкого языка для студентов', NULL, 1140, 3000, N'киноклуб.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (92, N'Занятие с репетитором-носителем французского языка', NULL, 2040, 3000, N'Французский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (93, N'Урок в группе немецкого языка для студентов', NULL, 1240, 4200, N'Немецкий язык.png', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (94, N'Занятие с русскоязычным репетитором китайского языка', NULL, 940, 6600, N'Китайский язык.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (95, N'Занятие с репетитором-носителем японского языка', NULL, 1100, 3000, N'Японский язык.jpg', NULL, 25)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (96, N'Урок в группе французского языка для студентов', NULL, 1910, 1800, N'Французский язык.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (97, N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', NULL, 900, 6600, N'for company.jpg', NULL, 0)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (98, N'Занятие с русскоязычным репетитором английского языка', NULL, 1950, 5400, N'Английский язык.jpg', NULL, 15)
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (99, N'Интенсивный курс с преподавателем-носителем испанского языка для компаний', NULL, 1660, 5400, N'for company.jpg', NULL, 0)
GO
INSERT [dbo].[Service] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [TimeLength], [MainPhoto], [SecondPhotos], [Discount]) VALUES (100, N'Интенсивный курс с преподавателем-носителем японского языка для компаний', NULL, 1380, 4200, N'for company.jpg', NULL, 20)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Visit] ON 

INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (1, 49, 10, NULL, NULL, NULL, CAST(N'2019-11-16T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (2, 37, 41, NULL, NULL, NULL, CAST(N'2019-01-11T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (3, 37, 19, NULL, NULL, NULL, CAST(N'2019-12-01T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (4, 37, 28, NULL, NULL, NULL, CAST(N'2019-02-11T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (5, 20, 30, NULL, NULL, NULL, CAST(N'2019-09-10T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (6, 48, 26, NULL, NULL, NULL, CAST(N'2019-02-12T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (7, 24, 92, NULL, NULL, NULL, CAST(N'2019-04-04T09:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (8, 21, 20, NULL, NULL, NULL, CAST(N'2019-05-15T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (9, 16, 52, NULL, NULL, NULL, CAST(N'2019-01-16T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (10, 30, 34, NULL, NULL, NULL, CAST(N'2019-01-16T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (11, 3, 52, NULL, NULL, NULL, CAST(N'2019-03-15T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (12, 26, 41, NULL, NULL, NULL, CAST(N'2019-01-31T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (13, 6, 64, NULL, NULL, NULL, CAST(N'2019-11-19T15:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (14, 33, 32, NULL, NULL, NULL, CAST(N'2019-01-10T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (15, 35, 52, NULL, NULL, NULL, CAST(N'2019-04-29T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (16, 43, 80, NULL, NULL, NULL, CAST(N'2019-10-12T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (17, 48, 48, NULL, NULL, NULL, CAST(N'2019-02-13T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (18, 33, 64, NULL, NULL, NULL, CAST(N'2019-02-01T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (19, 30, 63, NULL, NULL, NULL, CAST(N'2019-11-12T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (20, 17, 83, NULL, NULL, NULL, CAST(N'2019-01-11T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (21, 9, 50, NULL, NULL, NULL, CAST(N'2019-03-23T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (22, 43, 12, NULL, NULL, NULL, CAST(N'2019-06-23T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (23, 38, 18, NULL, NULL, NULL, CAST(N'2019-05-25T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (24, 17, 67, NULL, NULL, NULL, CAST(N'2019-02-18T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (25, 35, 13, NULL, NULL, NULL, CAST(N'2019-07-17T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (26, 35, 92, NULL, NULL, NULL, CAST(N'2019-08-06T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (27, 1, 77, NULL, NULL, NULL, CAST(N'2019-12-14T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (28, 22, 76, NULL, NULL, NULL, CAST(N'2019-06-28T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (29, 48, 97, NULL, NULL, NULL, CAST(N'2019-06-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (30, 24, 50, NULL, NULL, NULL, CAST(N'2019-06-07T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (31, 46, 23, NULL, NULL, NULL, CAST(N'2019-04-30T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (32, 6, 83, NULL, NULL, NULL, CAST(N'2019-08-30T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (33, 25, 20, NULL, NULL, NULL, CAST(N'2019-05-08T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (34, 42, 66, NULL, NULL, NULL, CAST(N'2019-10-27T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (35, 30, 13, NULL, NULL, NULL, CAST(N'2019-01-05T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (36, 22, 27, NULL, NULL, NULL, CAST(N'2019-03-04T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (37, 50, 69, NULL, NULL, NULL, CAST(N'2019-09-29T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (38, 27, 3, NULL, NULL, NULL, CAST(N'2019-01-22T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (39, 30, 64, NULL, NULL, NULL, CAST(N'2019-12-19T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (40, 32, 29, NULL, NULL, NULL, CAST(N'2019-11-15T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (41, 12, 9, NULL, NULL, NULL, CAST(N'2019-07-04T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (42, 21, 41, NULL, NULL, NULL, CAST(N'2019-08-06T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (43, 35, 80, NULL, NULL, NULL, CAST(N'2019-11-09T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (44, 24, 62, NULL, NULL, NULL, CAST(N'2019-02-16T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (45, 23, 69, NULL, NULL, NULL, CAST(N'2019-03-03T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (46, 13, 23, NULL, NULL, NULL, CAST(N'2019-05-22T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (47, 36, 10, NULL, NULL, NULL, CAST(N'2019-07-31T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (48, 16, 27, NULL, NULL, NULL, CAST(N'2019-08-29T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (49, 21, 13, NULL, NULL, NULL, CAST(N'2019-10-02T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (50, 8, 41, NULL, NULL, NULL, CAST(N'2019-03-16T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (51, 43, 29, NULL, NULL, NULL, CAST(N'2019-08-27T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (52, 18, 66, NULL, NULL, NULL, CAST(N'2019-06-13T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (53, 4, 80, NULL, NULL, NULL, CAST(N'2019-08-18T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (54, 14, 34, NULL, NULL, NULL, CAST(N'2019-12-26T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (55, 11, 7, NULL, NULL, NULL, CAST(N'2019-11-27T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (56, 47, 13, NULL, NULL, NULL, CAST(N'2019-09-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (57, 46, 98, NULL, NULL, NULL, CAST(N'2019-09-24T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (58, 32, 89, NULL, NULL, NULL, CAST(N'2019-03-01T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (59, 5, 7, NULL, NULL, NULL, CAST(N'2019-09-28T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (60, 15, 92, NULL, NULL, NULL, CAST(N'2019-03-20T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (61, 10, 80, NULL, NULL, NULL, CAST(N'2019-11-27T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (62, 3, 60, NULL, NULL, NULL, CAST(N'2019-01-23T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (63, 27, 27, NULL, NULL, NULL, CAST(N'2019-10-21T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (64, 28, 92, NULL, NULL, NULL, CAST(N'2019-08-11T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (65, 7, 13, NULL, NULL, NULL, CAST(N'2019-01-03T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (66, 33, 64, NULL, NULL, NULL, CAST(N'2019-12-31T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (67, 41, 20, NULL, NULL, NULL, CAST(N'2019-08-29T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (68, 13, 19, NULL, NULL, NULL, CAST(N'2019-01-03T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (69, 14, 30, NULL, NULL, NULL, CAST(N'2019-04-09T11:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (70, 27, 12, NULL, NULL, NULL, CAST(N'2019-12-31T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (71, 2, 19, NULL, NULL, NULL, CAST(N'2019-10-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (72, 46, 69, NULL, NULL, NULL, CAST(N'2019-05-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (73, 11, 14, NULL, NULL, NULL, CAST(N'2019-11-23T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (74, 10, 83, NULL, NULL, NULL, CAST(N'2019-07-10T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (75, 37, 40, NULL, NULL, NULL, CAST(N'2019-06-09T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (76, 23, 69, NULL, NULL, NULL, CAST(N'2019-01-09T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (77, 2, 60, NULL, NULL, NULL, CAST(N'2019-08-15T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (78, 29, 83, NULL, NULL, NULL, CAST(N'2019-07-15T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (79, 21, 14, NULL, NULL, NULL, CAST(N'2019-12-31T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (80, 32, 7, NULL, NULL, NULL, CAST(N'2019-12-22T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (81, 14, 51, NULL, NULL, NULL, CAST(N'2019-12-28T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (82, 33, 69, NULL, NULL, NULL, CAST(N'2019-06-26T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (83, 10, 10, NULL, NULL, NULL, CAST(N'2019-04-29T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (84, 48, 10, NULL, NULL, NULL, CAST(N'2019-04-13T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (85, 23, 48, NULL, NULL, NULL, CAST(N'2019-01-05T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (86, 5, 40, NULL, NULL, NULL, CAST(N'2019-03-25T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (87, 29, 18, NULL, NULL, NULL, CAST(N'2019-11-09T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (88, 31, 41, NULL, NULL, NULL, CAST(N'2019-04-07T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (89, 49, 67, NULL, NULL, NULL, CAST(N'2019-11-11T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (90, 34, 13, NULL, NULL, NULL, CAST(N'2019-01-06T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (91, 4, 48, NULL, NULL, NULL, CAST(N'2019-08-20T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (92, 45, 48, NULL, NULL, NULL, CAST(N'2019-04-16T13:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (93, 27, 52, NULL, NULL, NULL, CAST(N'2019-12-22T15:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (94, 40, 83, NULL, NULL, NULL, CAST(N'2019-01-22T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (95, 8, 18, NULL, NULL, NULL, CAST(N'2019-09-04T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (96, 41, 77, NULL, NULL, NULL, CAST(N'2019-01-01T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (97, 35, 14, NULL, NULL, NULL, CAST(N'2019-01-29T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (98, 40, 49, NULL, NULL, NULL, CAST(N'2019-07-06T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Visit] ([VisitId], [ClientId], [ServiceId], [DateRegs], [Paid], [Rewiew], [DateActual], [Documents]) VALUES (99, 28, 98, NULL, NULL, NULL, CAST(N'2019-12-05T10:20:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Visit] OFF
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientType] FOREIGN KEY([ClientTypeId])
REFERENCES [dbo].[ClientType] ([ClientTypeId])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_ClientType]
GO
ALTER TABLE [dbo].[Complect]  WITH CHECK ADD  CONSTRAINT [FK_Complect_Good] FOREIGN KEY([MainGoodId])
REFERENCES [dbo].[Good] ([GoodId])
GO
ALTER TABLE [dbo].[Complect] CHECK CONSTRAINT [FK_Complect_Good]
GO
ALTER TABLE [dbo].[Complect]  WITH CHECK ADD  CONSTRAINT [FK_Complect_Good1] FOREIGN KEY([SecondGoodId])
REFERENCES [dbo].[Good] ([GoodId])
GO
ALTER TABLE [dbo].[Complect] CHECK CONSTRAINT [FK_Complect_Good1]
GO
ALTER TABLE [dbo].[Good]  WITH CHECK ADD  CONSTRAINT [FK_Good_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Good] CHECK CONSTRAINT [FK_Good_Category]
GO
ALTER TABLE [dbo].[Good]  WITH CHECK ADD  CONSTRAINT [FK_Good_Developer] FOREIGN KEY([DeveloperId])
REFERENCES [dbo].[Developer] ([DeveloperId])
GO
ALTER TABLE [dbo].[Good] CHECK CONSTRAINT [FK_Good_Developer]
GO
ALTER TABLE [dbo].[SeasonGood]  WITH CHECK ADD  CONSTRAINT [FK_SeasonGood_Good] FOREIGN KEY([GoodId])
REFERENCES [dbo].[Good] ([GoodId])
GO
ALTER TABLE [dbo].[SeasonGood] CHECK CONSTRAINT [FK_SeasonGood_Good]
GO
ALTER TABLE [dbo].[SeasonGood]  WITH CHECK ADD  CONSTRAINT [FK_SeasonGood_Season] FOREIGN KEY([SeasonId])
REFERENCES [dbo].[Season] ([SeasonId])
GO
ALTER TABLE [dbo].[SeasonGood] CHECK CONSTRAINT [FK_SeasonGood_Season]
GO
ALTER TABLE [dbo].[Sell]  WITH CHECK ADD  CONSTRAINT [FK_Sell_Good] FOREIGN KEY([GoodId])
REFERENCES [dbo].[Good] ([GoodId])
GO
ALTER TABLE [dbo].[Sell] CHECK CONSTRAINT [FK_Sell_Good]
GO
ALTER TABLE [dbo].[SellVisit]  WITH CHECK ADD  CONSTRAINT [FK_SellVisit_Sell] FOREIGN KEY([SellId])
REFERENCES [dbo].[Sell] ([SellId])
GO
ALTER TABLE [dbo].[SellVisit] CHECK CONSTRAINT [FK_SellVisit_Sell]
GO
ALTER TABLE [dbo].[SellVisit]  WITH CHECK ADD  CONSTRAINT [FK_SellVisit_Visit] FOREIGN KEY([VisitId])
REFERENCES [dbo].[Visit] ([VisitId])
GO
ALTER TABLE [dbo].[SellVisit] CHECK CONSTRAINT [FK_SellVisit_Visit]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_Good] FOREIGN KEY([GoodId])
REFERENCES [dbo].[Good] ([GoodId])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_Good]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([ServiceId])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Service]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Worker] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Worker] ([WorkerId])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Worker]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Client]
GO
ALTER TABLE [dbo].[Visit]  WITH CHECK ADD  CONSTRAINT [FK_Visit_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([ServiceId])
GO
ALTER TABLE [dbo].[Visit] CHECK CONSTRAINT [FK_Visit_Service]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_Speciality] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Speciality] ([SpecialityId])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_Speciality]
GO
USE [master]
GO
ALTER DATABASE [user1] SET  READ_WRITE 
GO
