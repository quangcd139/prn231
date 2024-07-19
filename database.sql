USE [master]
GO
/****** Object:  Database [Project_Cinema_PRN231]    Script Date: 7/20/2024 6:35:17 AM ******/
CREATE DATABASE [Project_Cinema_PRN231]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_Cinema_PRN231', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Project_Cinema_PRN231.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_Cinema_PRN231_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Project_Cinema_PRN231_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Project_Cinema_PRN231] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_Cinema_PRN231].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_Cinema_PRN231] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET  MULTI_USER 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_Cinema_PRN231] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project_Cinema_PRN231] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project_Cinema_PRN231', N'ON'
GO
ALTER DATABASE [Project_Cinema_PRN231] SET QUERY_STORE = ON
GO
ALTER DATABASE [Project_Cinema_PRN231] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Project_Cinema_PRN231]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 7/20/2024 6:35:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/20/2024 6:35:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Film_Calender]    Script Date: 7/20/2024 6:35:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film_Calender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[room_id] [int] NOT NULL,
	[film_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](50) NULL,
	[price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Library_Film]    Script Date: 7/20/2024 6:35:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Library_Film](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[category_id] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[is_deleted] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
	[trailer_url] [text] NULL,
	[release_year] [datetime] NULL,
	[director] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lot]    Script Date: 7/20/2024 6:35:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[room_id] [int] NOT NULL,
	[building_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](50) NULL,
	[status] [nvarchar](50) NOT NULL,
	[row] [int] NULL,
	[column] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/20/2024 6:35:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lot_id] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[user_id] [int] NOT NULL,
	[film_calender_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](50) NULL,
	[status] [nvarchar](50) NOT NULL,
	[room_id] [int] NOT NULL,
	[building_id] [int] NOT NULL,
	[bar_code] [nvarchar](20) NULL,
	[seatBookingId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/20/2024 6:35:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[building_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NOT NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatBooking]    Script Date: 7/20/2024 6:35:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatBooking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lot_id] [int] NULL,
	[film_calendar_id] [int] NULL,
	[status] [varchar](10) NULL,
	[bookingTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sys_User]    Script Date: 7/20/2024 6:35:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[full_name] [nvarchar](100) NULL,
	[phone_number] [nvarchar](15) NULL,
	[pass_word] [nvarchar](100) NOT NULL,
	[is_admin] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[created_by] [nvarchar](50) NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Building] ON 

INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, N'B001', N'Building A', N'Hoa Lac', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, N'B002', N'Building B', N'Giap Bat', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Building] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [code], [name], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image]) VALUES (1, N'CAT001', N'Science Fiction', 0, CAST(N'2024-06-20T15:34:50.880' AS DateTime), N'admin', CAST(N'2024-07-08T22:45:57.380' AS DateTime), N'admin', N'/assets/images/category/sci-fi.jpg')
INSERT [dbo].[Category] ([id], [code], [name], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image]) VALUES (2, N'CAT002', N'Inception1', 0, CAST(N'2024-06-20T15:34:50.880' AS DateTime), N'admin', CAST(N'2024-07-09T02:22:34.743' AS DateTime), N'admin', N'inception.jpg')
INSERT [dbo].[Category] ([id], [code], [name], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image]) VALUES (3, N'CAT003', N'Drama', 0, CAST(N'2024-06-20T15:34:50.880' AS DateTime), N'admin', NULL, NULL, N'drama.jpg')
INSERT [dbo].[Category] ([id], [code], [name], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image]) VALUES (4, N'CAT004', N'Comedy', 0, CAST(N'2024-06-20T15:34:50.880' AS DateTime), N'admin', NULL, NULL, N'comedy.jpg')
INSERT [dbo].[Category] ([id], [code], [name], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image]) VALUES (5, N'CAT005', N'Horror', 0, CAST(N'2024-06-20T15:34:50.880' AS DateTime), N'admin', NULL, NULL, N'horror.jpg')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Film_Calender] ON 

INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (6, CAST(N'2024-07-20' AS Date), CAST(N'12:30:00' AS Time), CAST(N'14:30:00' AS Time), 1, 2, 0, CAST(N'2024-07-19T20:23:10.490' AS DateTime), N'admin', CAST(N'2024-07-20T03:40:35.637' AS DateTime), N'admin', CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (7, CAST(N'2024-07-21' AS Date), CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 2, 2, 0, CAST(N'2024-06-24T14:39:26.790' AS DateTime), N'admin', NULL, NULL, CAST(12.50 AS Decimal(10, 2)))
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (8, CAST(N'2024-07-20' AS Date), CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), 3, 3, 0, CAST(N'2024-06-24T14:39:26.790' AS DateTime), N'admin', NULL, NULL, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (9, CAST(N'2024-07-20' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1, 3, 0, CAST(N'2024-06-24T14:39:26.790' AS DateTime), N'admin', NULL, NULL, CAST(18.00 AS Decimal(10, 2)))
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (10, CAST(N'2024-07-20' AS Date), CAST(N'21:00:00' AS Time), CAST(N'23:00:00' AS Time), 5, 5, 0, CAST(N'2024-06-24T14:39:26.790' AS DateTime), N'admin', NULL, NULL, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (11, CAST(N'2024-07-21' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:45:00' AS Time), 1, 3, 0, CAST(N'2024-06-27T00:00:00.000' AS DateTime), N'admin', NULL, NULL, CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (12, CAST(N'2024-07-21' AS Date), CAST(N'19:30:00' AS Time), CAST(N'12:00:00' AS Time), 1, 2, 0, CAST(N'2024-07-19T21:15:35.283' AS DateTime), NULL, CAST(N'2024-07-20T04:16:34.860' AS DateTime), N'admin', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (13, CAST(N'2024-07-22' AS Date), CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, 2, 0, CAST(N'2024-07-20T04:17:26.533' AS DateTime), NULL, CAST(N'2024-07-20T04:17:26.607' AS DateTime), N'admin', CAST(10.50 AS Decimal(10, 2)))
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (14, CAST(N'2024-07-22' AS Date), CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 4, 0, CAST(N'2024-07-20T04:17:26.610' AS DateTime), NULL, CAST(N'2024-07-20T04:17:26.613' AS DateTime), N'admin', CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (15, CAST(N'2024-07-20' AS Date), CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, 4, 0, CAST(N'2024-07-20T04:37:09.967' AS DateTime), NULL, CAST(N'2024-07-20T04:37:11.650' AS DateTime), N'admin', CAST(12.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Film_Calender] OFF
GO
SET IDENTITY_INSERT [dbo].[Library_Film] ON 

INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (2, N'string', N's1123asdf', 3, N'asdfasdf', 0, CAST(N'2024-07-08T20:24:46.293' AS DateTime), NULL, CAST(N'2024-07-09T11:55:48.730' AS DateTime), N'admin', N'/assets/images/film/sci-fi.jpg', N'string', CAST(N'2024-07-16T00:00:00.000' AS DateTime), N'quang')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (3, N'FLM002', N'Frozen 2', 2, N'A sci-fi action film', 0, CAST(N'2024-06-20T15:39:09.903' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/m7.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'quang')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (4, N'FLM003', N'gujjubhai', 1, N'A space exploration epic', 0, CAST(N'2024-06-20T15:39:09.903' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/gujjubhai.png', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'quang')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (5, N'FLM004', N'The Godfather', 3, N'A mafia drama', 0, CAST(N'2024-06-20T15:39:09.903' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/ks1.png', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'quang')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (6, N'FLM005', N'Pulp Fiction', 3, N'A crime drama with intersecting storylines', 0, CAST(N'2024-06-20T15:39:09.903' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/ks.png', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'tung')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (9, N'FLM006', N'Alita', 1, N'A crime drama with intersecting storylinesasdasdasd', 0, CAST(N'2024-06-24T16:48:40.007' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/m10.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'tung')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (11, N'FLM007', N'Lego', 2, N'asdfasdfaffghjwtr', 0, CAST(N'2024-06-24T16:50:02.583' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/m11.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'tung')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (13, N'FLM008', N'Hustle', 1, N'akjsdfhalskdjfnzxcvmbuweriwer', 0, CAST(N'2024-06-24T16:50:02.583' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/m12.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'tung')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (14, N'FLM009', N'Doctor sleep', 2, N'askdfaskhdfjzxucv', 0, CAST(N'2024-06-24T16:51:48.690' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/m2.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'hung')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (15, N'FLM010', N'Knives out', 2, N'ashdfhaksjdfiqwuryiwer', 0, CAST(N'2024-06-24T16:52:47.447' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/m3.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'hung')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (16, N'FLM011', N'Jumanji the next level', 3, N'asdfasdfxcvb', 0, CAST(N'2024-06-24T16:53:37.283' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/m5.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'hung')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (17, N'FLM012', N'Long Shot', 3, N'asndfnzxcvqwe', 0, CAST(N'2024-06-24T16:54:28.440' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/m6.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'hung')
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (22, N'FLm067', N'qwerqwer', 3, N'asdfasdf', 0, CAST(N'2024-07-09T13:37:30.133' AS DateTime), N'admin', NULL, NULL, N'/assets/images/film/', N'asd', CAST(N'2024-06-27T13:37:00.000' AS DateTime), N'werqwer')
SET IDENTITY_INSERT [dbo].[Library_Film] OFF
GO
SET IDENTITY_INSERT [dbo].[Lot] ON 

INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (1, N'L001', N'Lot 1', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 1)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (2, N'L002', N'Lot 2', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 2)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (3, N'L003', N'Lot 3', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 3)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (4, N'L004', N'Lot 4', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 4)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (5, N'L005', N'Lot 5', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 5)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (6, N'L006', N'Lot 6', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 6)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (7, N'L007', N'Lot 7', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 7)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (8, N'L008', N'Lot 8', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 8)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (9, N'L009', N'Lot 9', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 1)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (10, N'L010', N'Lot 10', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 2)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (11, N'L011', N'Lot 11', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 3)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (12, N'L012', N'Lot 12', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 4)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (13, N'L013', N'Lot 13', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 5)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (14, N'L014', N'Lot 14', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 6)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (15, N'L015', N'Lot 15', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 3, 1)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (16, N'L016', N'Lot 16', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 3, 2)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (17, N'L017', N'Lot 17', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 3, 3)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (18, N'L018', N'Lot 18', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 3, 4)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (19, N'L019', N'Lot 19', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 3, 5)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (20, N'L020', N'Lot 20', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 3, 6)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (21, N'L001', N'Lot 1', 1, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 3, 7)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (22, N'L002', N'Lot 2', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 1)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (23, N'L003', N'Lot 3', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 2)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (24, N'L004', N'Lot 4', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 3)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (25, N'L005', N'Lot 5', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 4)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (26, N'L006', N'Lot 6', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 5)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (27, N'L007', N'Lot 7', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 6)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (28, N'L008', N'Lot 8', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 7)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (29, N'L009', N'Lot 9', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 8)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (30, N'L010', N'Lot 10', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 1)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (31, N'L011', N'Lot 11', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 2)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (32, N'L012', N'Lot 12', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 3)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (33, N'L013', N'Lot 13', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 4)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (34, N'L014', N'Lot 14', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 5)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (35, N'L015', N'Lot 15', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 6)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (36, N'L016', N'Lot 16', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 7)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (37, N'L017', N'Lot 17', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 8)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (38, N'L018', N'Lot 18', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 3, 1)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (39, N'L019', N'Lot 19', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 3, 2)
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (40, N'L020', N'Lot 20', 3, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 3, 3)
SET IDENTITY_INSERT [dbo].[Lot] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [lot_id], [price], [user_id], [film_calender_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [room_id], [building_id], [bar_code], [seatBookingId]) VALUES (44, 1, CAST(10.00 AS Decimal(10, 2)), 11, 9, 0, CAST(N'2024-07-20T06:17:06.173' AS DateTime), NULL, NULL, NULL, N'Booked', 1, 1, N'79310556', 28)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, N'R001', N'Room 101', 1, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, N'R002', N'Room 102', 1, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (3, N'R003', N'Room 103', 1, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, N'R004', N'Room 201', 1, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (5, N'R005', N'Room 202', 1, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (6, N'R006', N'Room 101', 2, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (7, N'R007', N'Room 102', 2, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (8, N'R008', N'Room 103', 2, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (9, N'R009', N'Room 201', 2, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (10, N'R010', N'Room 202', 2, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (12, N'RO11', N'Room 203', 2, 0, CAST(N'2024-06-20T00:00:00.000' AS DateTime), N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[SeatBooking] ON 

INSERT [dbo].[SeatBooking] ([id], [lot_id], [film_calendar_id], [status], [bookingTime]) VALUES (28, 1, 9, N'Booked', CAST(N'2024-07-20T06:17:06.040' AS DateTime))
SET IDENTITY_INSERT [dbo].[SeatBooking] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_User] ON 

INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, N'quang', N'John Doe', N'123-456-7890', N'123', 1, 0, CAST(N'2024-06-20T15:34:50.863' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, N'hung', N'Jane Smith', N'098-765-4321', N'123', 0, 0, CAST(N'2024-06-20T15:34:50.863' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (3, N'sam_wilson', N'Sam Wilson', N'111-222-3333', N'password123', 0, 0, CAST(N'2024-06-20T15:34:50.863' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, N'linda_jones', N'Linda Jones', N'444-555-6666', N'password123', 0, 0, CAST(N'2024-06-20T15:34:50.863' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (5, N'mike_brown', N'Mike Brown', N'777-888-9999', N'password123', 0, 0, CAST(N'2024-06-20T15:34:50.863' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (6, N'john_doe', N'John Doe', N'123-456-7890', N'password123', 0, 0, CAST(N'2024-06-24T14:39:26.753' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (7, N'jane_smith', N'Jane Smith', N'098-765-4321', N'password123', 1, 0, CAST(N'2024-06-24T14:39:26.753' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (8, N'sam_wilson', N'Sam Wilson', N'111-222-3333', N'password123', 0, 0, CAST(N'2024-06-24T14:39:26.753' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (9, N'linda_jones', N'Linda Jones', N'444-555-6666', N'password123', 0, 0, CAST(N'2024-06-24T14:39:26.753' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (10, N'mike_brown', N'Mike Brown', N'777-888-9999', N'password123', 0, 0, CAST(N'2024-06-24T14:39:26.753' AS DateTime), N'admin', NULL, NULL)
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (11, N'quang1', N'qiwerqiuwer', NULL, N'123', 0, 0, CAST(N'2024-07-19T21:55:30.647' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Sys_User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Category__357D4CF921400D5F]    Script Date: 7/20/2024 6:35:17 AM ******/
ALTER TABLE [dbo].[Category] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Library___357D4CF956ED2BD0]    Script Date: 7/20/2024 6:35:17 AM ******/
ALTER TABLE [dbo].[Library_Film] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Building] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Building] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Film_Calender] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Film_Calender] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Library_Film] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Library_Film] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Lot] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Lot] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Sys_User] ADD  DEFAULT ((0)) FOR [is_admin]
GO
ALTER TABLE [dbo].[Sys_User] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Sys_User] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Film_Calender]  WITH CHECK ADD FOREIGN KEY([film_id])
REFERENCES [dbo].[Library_Film] ([id])
GO
ALTER TABLE [dbo].[Film_Calender]  WITH CHECK ADD FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[Library_Film]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Lot]  WITH CHECK ADD FOREIGN KEY([building_id])
REFERENCES [dbo].[Building] ([id])
GO
ALTER TABLE [dbo].[Lot]  WITH CHECK ADD FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([film_calender_id])
REFERENCES [dbo].[Film_Calender] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([lot_id])
REFERENCES [dbo].[Lot] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([seatBookingId])
REFERENCES [dbo].[SeatBooking] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Sys_User] ([id])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([building_id])
REFERENCES [dbo].[Building] ([id])
GO
ALTER TABLE [dbo].[SeatBooking]  WITH CHECK ADD FOREIGN KEY([film_calendar_id])
REFERENCES [dbo].[Film_Calender] ([id])
GO
ALTER TABLE [dbo].[SeatBooking]  WITH CHECK ADD FOREIGN KEY([lot_id])
REFERENCES [dbo].[Lot] ([id])
GO
USE [master]
GO
ALTER DATABASE [Project_Cinema_PRN231] SET  READ_WRITE 
GO
