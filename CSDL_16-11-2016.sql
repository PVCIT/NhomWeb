USE [master]
GO
/****** Object:  Database [BTN_EShop]    Script Date: 11/16/2016 3:58:47 PM ******/
CREATE DATABASE [BTN_EShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BTN_EShop', FILENAME = N'E:\GitHub\BTN_EShop.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BTN_EShop_log', FILENAME = N'E:\GitHub\BTN_EShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BTN_EShop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BTN_EShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BTN_EShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BTN_EShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BTN_EShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BTN_EShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BTN_EShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [BTN_EShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BTN_EShop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BTN_EShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BTN_EShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BTN_EShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BTN_EShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BTN_EShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BTN_EShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BTN_EShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BTN_EShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BTN_EShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BTN_EShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BTN_EShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BTN_EShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BTN_EShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BTN_EShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BTN_EShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BTN_EShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BTN_EShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BTN_EShop] SET  MULTI_USER 
GO
ALTER DATABASE [BTN_EShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BTN_EShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BTN_EShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BTN_EShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BTN_EShop]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 11/16/2016 3:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NULL,
	[name] [nvarchar](50) NULL,
	[mail] [varchar](50) NULL,
	[phone] [int] NULL,
	[datepay] [date] NULL,
	[dateship] [date] NULL,
	[status] [int] NULL,
	[created] [date] NULL,
	[message] [nvarchar](500) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 11/16/2016 3:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bill_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[amount] [int] NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_BillDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/16/2016 3:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[theorder] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/16/2016 3:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[mail] [varchar](50) NULL,
	[comment] [nvarchar](500) NULL,
	[start_point] [float] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 11/16/2016 3:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mail] [varchar](50) NULL,
	[title] [nvarchar](50) NULL,
	[thecontent] [nvarchar](500) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 11/16/2016 3:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[theorder] [int] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photo]    Script Date: 11/16/2016 3:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[name] [nchar](50) NULL,
	[theorder] [int] NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/16/2016 3:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[oldprice] [int] NULL,
	[newprice] [int] NULL,
	[category_id] [int] NULL,
	[manufacturer_id] [int] NULL,
	[rate] [float] NULL,
	[details] [ntext] NULL,
	[date] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/16/2016 3:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/16/2016 3:58:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NULL,
	[fullname] [nvarchar](50) NULL,
	[date] [int] NULL,
	[sex] [nvarchar](3) NULL,
	[mail] [varchar](50) NULL,
	[identify] [int] NULL,
	[tel] [int] NULL,
	[address] [nvarchar](50) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'Khách hàng')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'Nhân viên bán hàng')
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'Quản trị viên')
INSERT [dbo].[Role] ([id], [name]) VALUES (4, N'Administrator')
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[User] ([username], [password], [fullname], [date], [sex], [mail], [identify], [tel], [address], [status], [role]) VALUES (N'admin', N'admin', N'Admin', 951010, N'Nam', N'admin@gmail.com', 3489342, 923478283, N'Hà Nội', 1, 4)
INSERT [dbo].[User] ([username], [password], [fullname], [date], [sex], [mail], [identify], [tel], [address], [status], [role]) VALUES (N'customer', N'123', N'Customer', 950203, N'Nam', N'customer@gmail.com', 92384272, 293402931, N'Hà Nội', 1, 1)
INSERT [dbo].[User] ([username], [password], [fullname], [date], [sex], [mail], [identify], [tel], [address], [status], [role]) VALUES (N'manager', N'123', N'Manager', 941212, N'Nam', N'manager@gmail.com', 92387434, 92342423, N'Bắc Ninh', 1, 3)
INSERT [dbo].[User] ([username], [password], [fullname], [date], [sex], [mail], [identify], [tel], [address], [status], [role]) VALUES (N'seller', N'123', N'Seller', 950101, N'Nữ', N'seller@gmail.com', 3984034, 983948564, N'Hà Nội', 1, 2)
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_User] FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_User]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillDetails_Bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_BillDetails_Bill]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillDetails_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_BillDetails_Product]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_Photo_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_Photo_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[Manufacturer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [BTN_EShop] SET  READ_WRITE 
GO
