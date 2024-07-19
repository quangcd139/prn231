USE [master]
GO
/****** Object:  Database [Project_Cinema_PRN231]    Script Date: 6/30/2024 3:05:39 AM ******/
CREATE DATABASE [Project_Cinema_PRN231]

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
/****** Object:  Table [dbo].[Building]    Script Date: 6/30/2024 3:05:39 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 6/30/2024 3:05:39 AM ******/
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
/****** Object:  Table [dbo].[Film_Calender]    Script Date: 6/30/2024 3:05:39 AM ******/
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
/****** Object:  Table [dbo].[Library_Film]    Script Date: 6/30/2024 3:05:39 AM ******/
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
/****** Object:  Table [dbo].[Lot]    Script Date: 6/30/2024 3:05:39 AM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/30/2024 3:05:39 AM ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/30/2024 3:05:39 AM ******/
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
/****** Object:  Table [dbo].[SeatBooking]    Script Date: 6/30/2024 3:05:39 AM ******/
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
/****** Object:  Table [dbo].[Sys_User]    Script Date: 6/30/2024 3:05:39 AM ******/
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
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, N'B001', N'Building A', N'123 Main St', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, N'B002', N'Building B', N'456 Elm St', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (3, N'B003', N'Building C', N'789 Oak St', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, N'B004', N'Building D', N'101 Pine St', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (5, N'B005', N'Building E', N'202 Maple St', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (6, N'B006', N'Building F', N'303 Cedar St', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (7, N'B007', N'Building G', N'404 Birch St', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (8, N'B008', N'Building H', N'505 Walnut St', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (9, N'B009', N'Building I', N'606 Chestnut St', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (10, N'B010', N'Building J', N'707 Spruce St', 0, CAST(N'2024-06-20T15:34:50.840' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (11, N'B001', N'Building A', N'123 Main St', 0, CAST(N'2024-06-24T14:39:26.727' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (12, N'B002', N'Building B', N'456 Elm St', 0, CAST(N'2024-06-24T14:39:26.727' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (13, N'B003', N'Building C', N'789 Oak St', 0, CAST(N'2024-06-24T14:39:26.727' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (14, N'B004', N'Building D', N'101 Pine St', 0, CAST(N'2024-06-24T14:39:26.727' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (15, N'B005', N'Building E', N'202 Maple St', 0, CAST(N'2024-06-24T14:39:26.727' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (16, N'B006', N'Building F', N'303 Cedar St', 0, CAST(N'2024-06-24T14:39:26.727' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (17, N'B007', N'Building G', N'404 Birch St', 0, CAST(N'2024-06-24T14:39:26.727' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (18, N'B008', N'Building H', N'505 Walnut St', 0, CAST(N'2024-06-24T14:39:26.727' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (19, N'B009', N'Building I', N'606 Chestnut St', 0, CAST(N'2024-06-24T14:39:26.727' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Building] ([id], [code], [name], [address], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (20, N'B010', N'Building J', N'707 Spruce St', 0, CAST(N'2024-06-24T14:39:26.727' AS DateTime), N'admin', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Building] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([id], [code], [name], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image]) VALUES (1, N'CAT001', N'Science Fiction', 0, CAST(N'2024-06-20T15:34:50.880' AS DateTime), N'admin', NULL, NULL, N'sci-fi.jpg')
GO
INSERT [dbo].[Category] ([id], [code], [name], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image]) VALUES (2, N'CAT002', N'Action', 0, CAST(N'2024-06-20T15:34:50.880' AS DateTime), N'admin', NULL, NULL, N'action.jpg')
GO
INSERT [dbo].[Category] ([id], [code], [name], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image]) VALUES (3, N'CAT003', N'Drama', 0, CAST(N'2024-06-20T15:34:50.880' AS DateTime), N'admin', NULL, NULL, N'drama.jpg')
GO
INSERT [dbo].[Category] ([id], [code], [name], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image]) VALUES (4, N'CAT004', N'Comedy', 0, CAST(N'2024-06-20T15:34:50.880' AS DateTime), N'admin', NULL, NULL, N'comedy.jpg')
GO
INSERT [dbo].[Category] ([id], [code], [name], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image]) VALUES (5, N'CAT005', N'Horror', 0, CAST(N'2024-06-20T15:34:50.880' AS DateTime), N'admin', NULL, NULL, N'horror.jpg')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Film_Calender] ON 
GO
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (6, CAST(N'2024-06-29' AS Date), CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, 2, 0, CAST(N'2024-06-24T14:39:26.790' AS DateTime), N'admin', NULL, NULL, CAST(10.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (7, CAST(N'2024-06-12' AS Date), CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 2, 2, 0, CAST(N'2024-06-24T14:39:26.790' AS DateTime), N'admin', NULL, NULL, CAST(12.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (8, CAST(N'2024-06-13' AS Date), CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), 3, 3, 0, CAST(N'2024-06-24T14:39:26.790' AS DateTime), N'admin', NULL, NULL, CAST(15.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (9, CAST(N'2024-06-13' AS Date), CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 4, 4, 0, CAST(N'2024-06-24T14:39:26.790' AS DateTime), N'admin', NULL, NULL, CAST(18.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (10, CAST(N'2024-06-29' AS Date), CAST(N'21:00:00' AS Time), CAST(N'23:00:00' AS Time), 5, 5, 0, CAST(N'2024-06-24T14:39:26.790' AS DateTime), N'admin', NULL, NULL, CAST(20.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Film_Calender] ([id], [date], [start_time], [end_time], [room_id], [film_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [price]) VALUES (11, CAST(N'2024-06-29' AS Date), CAST(N'18:00:00' AS Time), CAST(N'19:45:00' AS Time), 2, 2, 0, CAST(N'2024-06-27T00:00:00.000' AS DateTime), N'admin', NULL, NULL, CAST(25.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Film_Calender] OFF
GO
SET IDENTITY_INSERT [dbo].[Library_Film] ON 
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (2, N'FLM001', N'Inception', 1, N'A mind-bending thriller', 0, CAST(N'2024-06-20T15:39:09.903' AS DateTime), N'admin', NULL, NULL, N'inception.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'quang')
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (3, N'FLM002', N'Frozen 2', 2, N'A sci-fi action film', 0, CAST(N'2024-06-20T15:39:09.903' AS DateTime), N'admin', NULL, NULL, N'm7.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'quang')
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (4, N'FLM003', N'gujjubhai', 1, N'A space exploration epic', 0, CAST(N'2024-06-20T15:39:09.903' AS DateTime), N'admin', NULL, NULL, N'gujjubhai.png', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'quang')
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (5, N'FLM004', N'The Godfather', 3, N'A mafia drama', 0, CAST(N'2024-06-20T15:39:09.903' AS DateTime), N'admin', NULL, NULL, N'ks1.png', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'quang')
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (6, N'FLM005', N'Pulp Fiction', 3, N'A crime drama with intersecting storylines', 0, CAST(N'2024-06-20T15:39:09.903' AS DateTime), N'admin', NULL, NULL, N'ks.png', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'tung')
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (9, N'FLM006', N'Alita', 1, N'A crime drama with intersecting storylinesasdasdasd', 0, CAST(N'2024-06-24T16:48:40.007' AS DateTime), N'admin', NULL, NULL, N'm10.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'tung')
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (11, N'FLM007', N'Lego', 2, N'asdfasdfaffghjwtr', 0, CAST(N'2024-06-24T16:50:02.583' AS DateTime), N'admin', NULL, NULL, N'm11.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'tung')
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (13, N'FLM008', N'Hustle', 1, N'akjsdfhalskdjfnzxcvmbuweriwer', 0, CAST(N'2024-06-24T16:50:02.583' AS DateTime), N'admin', NULL, NULL, N'm12.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'tung')
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (14, N'FLM009', N'Doctor sleep', 2, N'askdfaskhdfjzxucv', 0, CAST(N'2024-06-24T16:51:48.690' AS DateTime), N'admin', NULL, NULL, N'm2.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'hung')
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (15, N'FLM010', N'Knives out', 2, N'ashdfhaksjdfiqwuryiwer', 0, CAST(N'2024-06-24T16:52:47.447' AS DateTime), N'admin', NULL, NULL, N'm3.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'hung')
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (16, N'FLM011', N'Jumanji the next level', 3, N'asdfasdfxcvb', 0, CAST(N'2024-06-24T16:53:37.283' AS DateTime), N'admin', NULL, NULL, N'm5.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'hung')
GO
INSERT [dbo].[Library_Film] ([id], [code], [name], [category_id], [description], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [image], [trailer_url], [release_year], [director]) VALUES (17, N'FLM012', N'Long Shot', 3, N'asndfnzxcvqwe', 0, CAST(N'2024-06-24T16:54:28.440' AS DateTime), N'admin', NULL, NULL, N'm6.jpg', NULL, CAST(N'2022-12-15T00:00:00.000' AS DateTime), N'hung')
GO
SET IDENTITY_INSERT [dbo].[Library_Film] OFF
GO
SET IDENTITY_INSERT [dbo].[Lot] ON 
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (1, N'L001', N'Lot 1', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 1)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (2, N'L002', N'Lot 2', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 2)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (3, N'L003', N'Lot 3', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 3)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (4, N'L004', N'Lot 4', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 4)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (5, N'L005', N'Lot 5', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 5)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (6, N'L006', N'Lot 6', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 6)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (7, N'L007', N'Lot 7', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 7)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (8, N'L008', N'Lot 8', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 8)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (9, N'L009', N'Lot 9', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 1, 9)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (10, N'L010', N'Lot 10', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 6)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (11, N'L011', N'Lot 11', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 1)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (12, N'L012', N'Lot 12', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 2)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (13, N'L013', N'Lot 13', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 4)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (14, N'L014', N'Lot 14', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 4, 4)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (15, N'L015', N'Lot 15', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 5)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (16, N'L016', N'Lot 16', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 4, 1)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (17, N'L017', N'Lot 17', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 4, 6)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (18, N'L018', N'Lot 18', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 8)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (19, N'L019', N'Lot 19', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 2, 9)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (20, N'L020', N'Lot 20', 1, 1, 0, CAST(N'2024-06-20T15:34:50.860' AS DateTime), N'admin', NULL, NULL, N'Available', 4, 3)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (21, N'L001', N'Lot 1', 1, 1, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', 4, 2)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (22, N'L002', N'Lot 2', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (23, N'L003', N'Lot 3', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (24, N'L004', N'Lot 4', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (25, N'L005', N'Lot 5', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (26, N'L006', N'Lot 6', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (27, N'L007', N'Lot 7', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (28, N'L008', N'Lot 8', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (29, N'L009', N'Lot 9', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (30, N'L010', N'Lot 10', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (31, N'L011', N'Lot 11', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (32, N'L012', N'Lot 12', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (33, N'L013', N'Lot 13', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (34, N'L014', N'Lot 14', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (35, N'L015', N'Lot 15', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (36, N'L016', N'Lot 16', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (37, N'L017', N'Lot 17', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (38, N'L018', N'Lot 18', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (39, N'L019', N'Lot 19', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
INSERT [dbo].[Lot] ([id], [code], [name], [room_id], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [row], [column]) VALUES (40, N'L020', N'Lot 20', 2, 2, 0, CAST(N'2024-06-24T14:39:26.743' AS DateTime), N'admin', NULL, NULL, N'Available', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Lot] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 
GO
INSERT [dbo].[OrderDetail] ([id], [lot_id], [price], [user_id], [film_calender_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by], [status], [room_id], [building_id], [bar_code]) VALUES (6, 1, CAST(12.00 AS Decimal(10, 2)), 1, 6, 0, CAST(N'2024-06-24T17:06:17.047' AS DateTime), NULL, NULL, NULL, N'pendding', 1, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 
GO
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, N'R001', N'Room 101', 1, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, N'R002', N'Room 102', 1, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (3, N'R003', N'Room 103', 1, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, N'R004', N'Room 201', 2, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (5, N'R005', N'Room 202', 2, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (6, N'R006', N'Room 203', 2, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (7, N'R007', N'Room 301', 3, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (8, N'R008', N'Room 302', 3, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (9, N'R009', N'Room 303', 3, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Room] ([id], [code], [name], [building_id], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (10, N'R010', N'Room 304', 3, 0, CAST(N'2024-06-20T15:34:50.843' AS DateTime), N'admin', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[SeatBooking] ON 
GO
INSERT [dbo].[SeatBooking] ([id], [lot_id], [film_calendar_id], [status], [bookingTime]) VALUES (1, 10, 6, N'Booked', CAST(N'2024-06-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[SeatBooking] ([id], [lot_id], [film_calendar_id], [status], [bookingTime]) VALUES (2, 15, 6, N'Booked', NULL)
GO
SET IDENTITY_INSERT [dbo].[SeatBooking] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_User] ON 
GO
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, N'john_doe', N'John Doe', N'123-456-7890', N'password123', 0, 0, CAST(N'2024-06-20T15:34:50.863' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, N'jane_smith', N'Jane Smith', N'098-765-4321', N'password123', 1, 0, CAST(N'2024-06-20T15:34:50.863' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (3, N'sam_wilson', N'Sam Wilson', N'111-222-3333', N'password123', 0, 0, CAST(N'2024-06-20T15:34:50.863' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, N'linda_jones', N'Linda Jones', N'444-555-6666', N'password123', 0, 0, CAST(N'2024-06-20T15:34:50.863' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (5, N'mike_brown', N'Mike Brown', N'777-888-9999', N'password123', 0, 0, CAST(N'2024-06-20T15:34:50.863' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (6, N'john_doe', N'John Doe', N'123-456-7890', N'password123', 0, 0, CAST(N'2024-06-24T14:39:26.753' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (7, N'jane_smith', N'Jane Smith', N'098-765-4321', N'password123', 1, 0, CAST(N'2024-06-24T14:39:26.753' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (8, N'sam_wilson', N'Sam Wilson', N'111-222-3333', N'password123', 0, 0, CAST(N'2024-06-24T14:39:26.753' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (9, N'linda_jones', N'Linda Jones', N'444-555-6666', N'password123', 0, 0, CAST(N'2024-06-24T14:39:26.753' AS DateTime), N'admin', NULL, NULL)
GO
INSERT [dbo].[Sys_User] ([id], [user_name], [full_name], [phone_number], [pass_word], [is_admin], [is_deleted], [created_at], [created_by], [updated_at], [updated_by]) VALUES (10, N'mike_brown', N'Mike Brown', N'777-888-9999', N'password123', 0, 0, CAST(N'2024-06-24T14:39:26.753' AS DateTime), N'admin', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Sys_User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Category__357D4CF921400D5F]    Script Date: 6/30/2024 3:05:39 AM ******/
ALTER TABLE [dbo].[Category] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Library___357D4CF956ED2BD0]    Script Date: 6/30/2024 3:05:39 AM ******/
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
