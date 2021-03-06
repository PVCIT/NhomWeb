USE [master]
GO
/****** Object:  Database [BTN_EShop]    Script Date: 25/11/2016 7:38:11 AM ******/
CREATE DATABASE [BTN_EShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BTN_EShop', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BTN_EShop.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BTN_EShop_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BTN_EShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Bill]    Script Date: 25/11/2016 7:38:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[address] [nvarchar](100) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 25/11/2016 7:38:11 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 25/11/2016 7:38:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[theorder] [int] NULL,
	[isdelete] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 25/11/2016 7:38:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[mail] [varchar](50) NULL,
	[comment] [nvarchar](500) NULL,
	[start_point] [float] NULL,
	[product_id] [int] NULL,
	[isdelete] [int] NULL,
	[date] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 25/11/2016 7:38:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mail] [varchar](50) NULL,
	[title] [nvarchar](50) NULL,
	[thecontent] [nvarchar](500) NULL,
	[isdelete] [int] NULL,
	[isread] [int] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 25/11/2016 7:38:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[theorder] [int] NULL,
	[isdelete] [int] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photo]    Script Date: 25/11/2016 7:38:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[name] [nchar](50) NULL,
	[theorder] [int] NULL,
	[isdelete] [int] NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 25/11/2016 7:38:11 AM ******/
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
	[date] [int] NULL,
	[status] [int] NULL,
	[introduct] [ntext] NULL,
	[details] [ntext] NULL,
	[count] [int] NULL,
	[isdelete] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 25/11/2016 7:38:11 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 25/11/2016 7:38:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[isdelete] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [theorder], [isdelete]) VALUES (1, N'Máy tính', 1, NULL)
INSERT [dbo].[Category] ([id], [name], [theorder], [isdelete]) VALUES (2, N'LapTop', 2, NULL)
INSERT [dbo].[Category] ([id], [name], [theorder], [isdelete]) VALUES (3, N'Điện thoại', 3, NULL)
INSERT [dbo].[Category] ([id], [name], [theorder], [isdelete]) VALUES (4, N'Phụ kiện', 5, NULL)
INSERT [dbo].[Category] ([id], [name], [theorder], [isdelete]) VALUES (5, N'Máy ảnh & Máy quay phim', 7, NULL)
INSERT [dbo].[Category] ([id], [name], [theorder], [isdelete]) VALUES (6, N'Máy nghe nhạc', 6, NULL)
INSERT [dbo].[Category] ([id], [name], [theorder], [isdelete]) VALUES (7, N'Máy tính bảng', 4, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (1, N'Apple', 1, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (2, N'Asus', 4, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (3, N'Canon', 7, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (4, N'Dell', 5, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (5, N'Lenovo', 6, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (6, N'LG', 7, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (7, N'Samsung', 2, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (8, N'Sony', 3, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (9, N'Xiaomi', 4, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (10, N'Huawei', 7, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (11, N'Intel', 8, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (12, N'HTC', 9, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (13, N'BlackBerry', 10, NULL)
INSERT [dbo].[Manufacturer] ([id], [name], [theorder], [isdelete]) VALUES (14, N'Kingston', 11, NULL)
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([id], [product_id], [name], [theorder], [isdelete]) VALUES (1, 1, N'test.jpg                                          ', 1, NULL)
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [oldprice], [newprice], [category_id], [manufacturer_id], [rate], [date], [status], [introduct], [details], [count], [isdelete]) VALUES (1, N'Test', 1500, 200000000, 1, 1, 5, 161110, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [oldprice], [newprice], [category_id], [manufacturer_id], [rate], [date], [status], [introduct], [details], [count], [isdelete]) VALUES (2, N'Laptop1', 50, 10, 2, 2, 4,8, 161109, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [oldprice], [newprice], [category_id], [manufacturer_id], [rate], [date], [status], [introduct], [details], [count], [isdelete]) VALUES (3, N'Notebook1', 500, 10, 2, 1, 3,5, 161101, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [oldprice], [newprice], [category_id], [manufacturer_id], [rate], [date], [status], [introduct], [details], [count], [isdelete]) VALUES (4, N'Iphone1', 50, 20, 3, 1, 4,5, 161102, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [oldprice], [newprice], [category_id], [manufacturer_id], [rate], [date], [status], [introduct], [details], [count], [isdelete]) VALUES (5, N'Samsung1', 50, 20, 3, 7, 1, 161101, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [oldprice], [newprice], [category_id], [manufacturer_id], [rate], [date], [status], [introduct], [details], [count], [isdelete]) VALUES (6, N'Camon1', 30, 10, 4, 3, 3, 161105, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [oldprice], [newprice], [category_id], [manufacturer_id], [rate], [date], [status], [introduct], [details], [count], [isdelete]) VALUES (7, N'Camon2', 30, 10, 4, 3, 4, 161105, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [oldprice], [newprice], [category_id], [manufacturer_id], [rate], [date], [status], [introduct], [details], [count], [isdelete]) VALUES (8, N'Laptop2', 50, 10, 2, 2, 4,1, 161109, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [oldprice], [newprice], [category_id], [manufacturer_id], [rate], [date], [status], [introduct], [details], [count], [isdelete]) VALUES (9, N'Laptop3', 50, 10, 2, 2, 2,3, 161109, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [oldprice], [newprice], [category_id], [manufacturer_id], [rate], [date], [status], [introduct], [details], [count], [isdelete]) VALUES (10, N'Samsung2', 60, 10, 3, 7, 3,4, 160830, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([id], [name], [oldprice], [newprice], [category_id], [manufacturer_id], [rate], [date], [status], [introduct], [details], [count], [isdelete]) VALUES (11, N'Notebook2', 500, 10, 2, 1, 4, 161101, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_isdelete]  DEFAULT ((0)) FOR [isdelete]
GO
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comment_isdelete]  DEFAULT ((0)) FOR [isdelete]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_isdelete]  DEFAULT ((0)) FOR [isdelete]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_isread]  DEFAULT ((0)) FOR [isread]
GO
ALTER TABLE [dbo].[Manufacturer] ADD  CONSTRAINT [DF_Manufacturer_isdelete]  DEFAULT ((0)) FOR [isdelete]
GO
ALTER TABLE [dbo].[Photo] ADD  CONSTRAINT [DF_Photo_isdelete]  DEFAULT ((0)) FOR [isdelete]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_isdelete]  DEFAULT ((0)) FOR [isdelete]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isdelete]  DEFAULT ((0)) FOR [isdelete]
GO
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
