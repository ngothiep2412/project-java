USE [master]
GO
/****** Object:  Database [ShoppingOnlineDB]    Script Date: 2/24/2022 7:50:06 PM ******/
CREATE DATABASE [ShoppingOnline]
GO
USE [ShoppingOnline]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[displayName] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [text] NULL,
	[created_date] [date] NULL,
	[shipping_id] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](255) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](255) NULL,
	[image_url] [nvarchar](255) NULL,
	[created_date] [date] NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (1, N'Mazda')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (2, N'Mercedes-Benz')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (3, N'Chevrolet')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (4, N'Ford')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (5, N'Lincoln')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (6, N'Mercury')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (7, N'Mazda-2')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (8, N'Nissan')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (9, N'Aston Martin')
INSERT [dbo].[Category] ([categoryID], [categoryName]) VALUES (10, N'Chevrolet-2')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (1, N'G-Series 2500', 9, 6.3, N'Family disruption due to other extended absence of family member', N'http://dummyimage.com/100x100.png/ff4444/ffffff', CAST(N'2021-08-23' AS Date), 8)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (2, N'DeVille', 8, 12.5, N'Other specified disorders of urethra', N'http://dummyimage.com/224x100.png/ff4444/ffffff', CAST(N'2021-04-03' AS Date), 1)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (3, N'Gallardo', 18, 10.3, N'Accidental poisoning by other paints and varnishes', N'http://dummyimage.com/242x100.png/ff4444/ffffff', CAST(N'2021-01-21' AS Date), 6)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (4, N'SC', 17, 13.2, N'Sprain of wrist, unspecified site', N'http://dummyimage.com/108x100.png/5fa2dd/ffffff', CAST(N'2021-02-09' AS Date), 6)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (5, N'Prius', 6, 17, N'Wegener''s granulomatosis', N'http://dummyimage.com/120x100.png/cc0000/ffffff', CAST(N'2021-08-23' AS Date), 4)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (6, N'Pilot', 16, 5.2, N'Tuberculous encephalitis or myelitis, tubercle bacilli not found by bacteriological examination, but tuberculosis confirmed histologically', N'http://dummyimage.com/171x100.png/cc0000/ffffff', CAST(N'2021-09-25' AS Date), 2)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (7, N'Ram 3500', 19, 16.4, N'Arthropathy associated with mycoses, lower leg', N'http://dummyimage.com/191x100.png/5fa2dd/ffffff', CAST(N'2021-07-07' AS Date), 8)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (8, N'Caravan', 10, 12.9, N'Generally contracted pelvis, delivered, with or without mention of antepartum condition', N'http://dummyimage.com/177x100.png/ff4444/ffffff', CAST(N'2022-02-03' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (9, N'Montero Sport', 15, 14.2, N'Mixed acid-base balance disorder', N'http://dummyimage.com/197x100.png/cc0000/ffffff', CAST(N'2022-01-28' AS Date), 2)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (10, N'Integra', 13, 7.2, N'Personal history of other disorders of nervous system and sense organs', N'http://dummyimage.com/116x100.png/dddddd/000000', CAST(N'2021-06-06' AS Date), 2)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (11, N'Corvette', 17, 10.4, N'Mixed malaria', N'http://dummyimage.com/243x100.png/cc0000/ffffff', CAST(N'2021-04-05' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (12, N'Grand Cherokee', 13, 15.9, N'Other and unspecified alcohol dependence, episodic', N'http://dummyimage.com/192x100.png/cc0000/ffffff', CAST(N'2021-03-16' AS Date), 6)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (13, N'Phantom', 15, 16.6, N'Orthopnea', N'http://dummyimage.com/162x100.png/ff4444/ffffff', CAST(N'2021-02-26' AS Date), 5)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (14, N'Park Avenue', 13, 14.9, N'Poisoning by dental drugs topically applied', N'http://dummyimage.com/102x100.png/dddddd/000000', CAST(N'2021-11-02' AS Date), 2)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (15, N'Insight', 11, 13.3, N'Reticulosarcoma, lymph nodes of axilla and upper limb', N'http://dummyimage.com/217x100.png/5fa2dd/ffffff', CAST(N'2021-10-29' AS Date), 5)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (16, N'MKT', 12, 9.6, N'Schizophreniform disorder, in remission', N'http://dummyimage.com/115x100.png/ff4444/ffffff', CAST(N'2021-07-27' AS Date), 3)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (17, N'E-Series', 16, 10.2, N'Open fractures involving skull or face with other bones, with other and unspecified intracranial hemorrhage, unspecified state of consciousness', N'http://dummyimage.com/100x100.png/5fa2dd/ffffff', CAST(N'2021-08-05' AS Date), 1)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (18, N'Escort', 17, 19.9, N'Accident caused by ignition of clothing by unspecified source', N'http://dummyimage.com/155x100.png/dddddd/000000', CAST(N'2021-06-25' AS Date), 2)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (19, N'Mazda6', 12, 19.6, N'Scoliosis due to radiation', N'http://dummyimage.com/187x100.png/5fa2dd/ffffff', CAST(N'2021-09-20' AS Date), 10)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (20, N'850', 8, 7.4, N'Syndactyly of toes with fusion of bone', N'http://dummyimage.com/210x100.png/cc0000/ffffff', CAST(N'2021-12-12' AS Date), 10)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (21, N'Tacoma Xtra', 15, 8.7, N'Malignant neoplasm of pelvis', N'http://dummyimage.com/237x100.png/ff4444/ffffff', CAST(N'2021-07-02' AS Date), 3)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (22, N'RL', 18, 9.5, N'Hepatitis E without mention of hepatic coma', N'http://dummyimage.com/191x100.png/cc0000/ffffff', CAST(N'2021-07-18' AS Date), 6)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (23, N'Focus', 11, 20, N'Amphetamine or related acting sympathomimetic abuse, in remission', N'http://dummyimage.com/108x100.png/ff4444/ffffff', CAST(N'2021-08-20' AS Date), 4)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (24, N'Diablo', 18, 9.6, N'Other specified sites of sprains and strains', N'http://dummyimage.com/215x100.png/ff4444/ffffff', CAST(N'2021-01-06' AS Date), 10)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (25, N'E350', 6, 13.3, N'Other joint derangement, not elsewhere classified, hand', N'http://dummyimage.com/207x100.png/5fa2dd/ffffff', CAST(N'2021-05-05' AS Date), 5)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (26, N'Pathfinder', 11, 12, N'Retroverted and incarcerated gravid uterus, delivered, with mention of antepartum condition', N'http://dummyimage.com/190x100.png/ff4444/ffffff', CAST(N'2021-05-06' AS Date), 8)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (27, N'Park Avenue', 17, 19.3, N'Specified congenital anomalies of sclera', N'http://dummyimage.com/174x100.png/5fa2dd/ffffff', CAST(N'2021-05-09' AS Date), 5)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (28, N'Lucerne', 6, 13, N'Hydrocephalic fetus causing disproportion, delivered, with or without mention of antepartum condition', N'http://dummyimage.com/116x100.png/ff4444/ffffff', CAST(N'2021-08-08' AS Date), 4)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (29, N'Quattro', 6, 6.7, N'Open fracture of seven ribs', N'http://dummyimage.com/240x100.png/dddddd/000000', CAST(N'2021-05-29' AS Date), 4)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (30, N'M-Class', 15, 13.7, N'Failed medical or unspecified induction of labor, unspecified as to episode of care or not applicable', N'http://dummyimage.com/126x100.png/5fa2dd/ffffff', CAST(N'2022-02-06' AS Date), 9)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (31, N'F350', 20, 15.9, N'Other specified endocrine disorders', N'http://dummyimage.com/147x100.png/cc0000/ffffff', CAST(N'2021-02-04' AS Date), 1)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (32, N'Spirit', 12, 10.5, N'Stenosis of lacrimal sac', N'http://dummyimage.com/129x100.png/ff4444/ffffff', CAST(N'2021-08-09' AS Date), 4)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (33, N'Range Rover', 13, 10, N'Cortex (cerebral) laceration without mention of open intracranial wound, unspecified state of consciousness', N'http://dummyimage.com/188x100.png/5fa2dd/ffffff', CAST(N'2021-04-05' AS Date), 2)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (34, N'Sentra', 6, 10, N'Tonic pupillary reaction', N'http://dummyimage.com/132x100.png/ff4444/ffffff', CAST(N'2021-08-11' AS Date), 6)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (35, N'MKZ', 12, 11, N'Unspecified tuberculosis of central nervous system, tubercle bacilli not found by bacteriological examination, but tuberculosis confirmed histologically', N'http://dummyimage.com/178x100.png/cc0000/ffffff', CAST(N'2021-12-14' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (36, N'RX', 10, 16.6, N'Sprain of interphalangeal (joint) of hand', N'http://dummyimage.com/101x100.png/5fa2dd/ffffff', CAST(N'2022-01-14' AS Date), 8)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (37, N'8 Series', 18, 19.7, N'Other malignant lymphomas, intrapelvic lymph nodes', N'http://dummyimage.com/152x100.png/5fa2dd/ffffff', CAST(N'2021-10-24' AS Date), 3)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (38, N'Sonata', 18, 5.9, N'Accidental fall into well', N'http://dummyimage.com/165x100.png/ff4444/ffffff', CAST(N'2021-04-07' AS Date), 4)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (39, N'Outback', 16, 11.8, N'Tuberculosis of eye, tubercle bacilli not found by bacteriological examination, but tuberculosis confirmed histologically', N'http://dummyimage.com/219x100.png/dddddd/000000', CAST(N'2021-12-29' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (40, N'S-Class', 17, 15.8, N'Unspecified complication of pregnancy, antepartum condition or complication', N'http://dummyimage.com/176x100.png/5fa2dd/ffffff', CAST(N'2021-12-06' AS Date), 2)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (41, N'Scirocco', 5, 13.6, N'Chronic or unspecified gastric ulcer with hemorrhage and perforation, with obstruction', N'http://dummyimage.com/152x100.png/dddddd/000000', CAST(N'2021-06-08' AS Date), 3)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (42, N'300D', 10, 6.7, N'Peripheral T cell lymphoma, lymph nodes of head, face, and neck', N'http://dummyimage.com/170x100.png/ff4444/ffffff', CAST(N'2021-07-10' AS Date), 10)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (43, N'CTS-V', 12, 6.2, N'Poisoning by BCG vaccine', N'http://dummyimage.com/179x100.png/ff4444/ffffff', CAST(N'2021-11-25' AS Date), 3)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (44, N'Q7', 8, 19.7, N'Injury to kidney without mention of open wound into cavity, laceration', N'http://dummyimage.com/226x100.png/cc0000/ffffff', CAST(N'2021-10-27' AS Date), 6)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (45, N'S10 Blazer', 5, 8.9, N'Abnormal retinal correspondence', N'http://dummyimage.com/155x100.png/5fa2dd/ffffff', CAST(N'2021-10-09' AS Date), 3)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (46, N'Xterra', 7, 15.8, N'Cumulative trauma from repetitive motion', N'http://dummyimage.com/135x100.png/cc0000/ffffff', CAST(N'2021-05-02' AS Date), 10)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (47, N'3 Series', 14, 5.3, N'Traumatic amputation of arm and hand (complete) (partial), unilateral, level not specified, complicated', N'http://dummyimage.com/113x100.png/5fa2dd/ffffff', CAST(N'2022-02-07' AS Date), 1)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (48, N'XK Series', 8, 10.1, N'Tuberculosis of epididymis, tubercle bacilli found (in sputum) by microscopy', N'http://dummyimage.com/222x100.png/cc0000/ffffff', CAST(N'2021-09-23' AS Date), 5)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (49, N'Caravan', 17, 15.7, N'Other signs and symptoms involving emotional state', N'http://dummyimage.com/216x100.png/ff4444/ffffff', CAST(N'2021-03-30' AS Date), 3)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (50, N'Century', 13, 6.7, N'Subdural hemorrhage following injury without mention of open intracranial wound, with brief [less than one hour] loss of consciousness', N'http://dummyimage.com/128x100.png/ff4444/ffffff', CAST(N'2021-06-30' AS Date), 4)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (51, N'Savana 2500', 9, 12, N'Accidental poisoning by psychostimulants', N'http://dummyimage.com/218x100.png/dddddd/000000', CAST(N'2021-01-09' AS Date), 3)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (52, N'4Runner', 14, 9, N'Fall in, on, or from aircraft injuring occupant of unpowered aircraft, except parachutist', N'http://dummyimage.com/168x100.png/cc0000/ffffff', CAST(N'2021-02-26' AS Date), 1)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (53, N'XL-7', 13, 18.5, N'Abnormal cardiovascular function study, unspecified', N'http://dummyimage.com/226x100.png/5fa2dd/ffffff', CAST(N'2021-02-15' AS Date), 1)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (54, N'Cirrus', 6, 13.1, N'Burkitt''s tumor or lymphoma, lymph nodes of inguinal region and lower limb', N'http://dummyimage.com/145x100.png/dddddd/000000', CAST(N'2021-01-10' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (55, N'LeSabre', 17, 15.5, N'Other fetal abnormality causing disproportion, unspecified as to episode of care or not applicable', N'http://dummyimage.com/163x100.png/cc0000/ffffff', CAST(N'2021-02-20' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (56, N'Camry', 15, 13.6, N'Unspecified effect of reduced temperature', N'http://dummyimage.com/172x100.png/ff4444/ffffff', CAST(N'2021-11-09' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (57, N'Camry', 6, 18, N'Late effect of fracture of multiple and unspecified bones', N'http://dummyimage.com/189x100.png/ff4444/ffffff', CAST(N'2021-03-24' AS Date), 1)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (58, N'Laser', 18, 17.8, N'Rheumatic aortic stenosis', N'http://dummyimage.com/148x100.png/ff4444/ffffff', CAST(N'2021-08-10' AS Date), 5)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (59, N'E350', 11, 5.4, N'Other multiple birth (three or more), unspecified whether mates liveborn or stillborn, born in hospital, delivered without mention of cesarean section', N'http://dummyimage.com/144x100.png/ff4444/ffffff', CAST(N'2021-09-23' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (60, N'Impala', 14, 14.6, N'Closed fracture of mandible, symphysis of body', N'http://dummyimage.com/194x100.png/ff4444/ffffff', CAST(N'2021-10-07' AS Date), 1)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (61, N'Capri', 6, 5.9, N'33-34 completed weeks of gestation', N'http://dummyimage.com/186x100.png/5fa2dd/ffffff', CAST(N'2021-11-13' AS Date), 6)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (62, N'Suburban 2500', 18, 19.4, N'Hereditary progressive muscular dystrophy', N'http://dummyimage.com/225x100.png/cc0000/ffffff', CAST(N'2021-08-08' AS Date), 9)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (63, N'Range Rover Sport', 15, 19.8, N'Unspecified curvature of spine', N'http://dummyimage.com/197x100.png/cc0000/ffffff', CAST(N'2021-12-31' AS Date), 10)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (64, N'TSX', 17, 13.7, N'Torsion of ovary, ovarian pedicle, or fallopian tube', N'http://dummyimage.com/157x100.png/dddddd/000000', CAST(N'2021-08-09' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (65, N'Routan', 9, 7, N'Unspecified abortion, complicated by renal failure, unspecified', N'http://dummyimage.com/237x100.png/dddddd/000000', CAST(N'2021-03-23' AS Date), 5)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (66, N'Jimmy', 19, 9.5, N'Late effects of genitourinary tuberculosis', N'http://dummyimage.com/191x100.png/ff4444/ffffff', CAST(N'2021-01-01' AS Date), 2)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (67, N'Patriot', 18, 13.9, N'Obstruction by abnormal pelvic soft tissues during labor, antepartum condition or complication', N'http://dummyimage.com/105x100.png/5fa2dd/ffffff', CAST(N'2021-06-13' AS Date), 1)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (68, N'Passat', 14, 16.5, N'Simple type schizophrenia, in remission', N'http://dummyimage.com/222x100.png/ff4444/ffffff', CAST(N'2021-08-16' AS Date), 8)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (69, N'Envoy XUV', 7, 12.2, N'Neuroma of amputation stump', N'http://dummyimage.com/157x100.png/ff4444/ffffff', CAST(N'2021-02-22' AS Date), 9)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (70, N'3500', 5, 11.3, N'Other, mixed, or unspecified drug abuse, in remission', N'http://dummyimage.com/179x100.png/ff4444/ffffff', CAST(N'2021-06-24' AS Date), 2)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (71, N'Cruze', 12, 5.4, N'Late anemia of fetus or newborn due to isoimmunization', N'http://dummyimage.com/122x100.png/ff4444/ffffff', CAST(N'2021-07-19' AS Date), 4)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (72, N'Malibu', 20, 11.2, N'Placental polyp, postpartum condition or complication', N'http://dummyimage.com/203x100.png/5fa2dd/ffffff', CAST(N'2021-01-01' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (73, N'LTD Crown Victoria', 15, 19.7, N'Premature rupture of membranes, antepartum condition or complication', N'http://dummyimage.com/175x100.png/dddddd/000000', CAST(N'2022-01-24' AS Date), 10)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (74, N'Ram 3500', 12, 5.5, N'Arthropathy associated with helminthiasis, lower leg', N'http://dummyimage.com/206x100.png/5fa2dd/ffffff', CAST(N'2021-01-01' AS Date), 4)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (75, N'Sedona', 5, 6.5, N'Full-thickness skin loss [third degree, not otherwise specified]of two or more digits of hand, not including thumb', N'http://dummyimage.com/100x100.png/dddddd/000000', CAST(N'2022-01-03' AS Date), 1)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (76, N'ES', 19, 17.9, N'Explosion, fire, or burning in watercraft, occupant of military watercraft, any type', N'http://dummyimage.com/107x100.png/dddddd/000000', CAST(N'2021-03-02' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (77, N'Boxster', 10, 9.3, N'Accident to watercraft causing submersion, occupant of military watercraft, any type', N'http://dummyimage.com/239x100.png/dddddd/000000', CAST(N'2021-12-27' AS Date), 6)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (78, N'Tacoma', 9, 10.5, N'Disorders of pneumogastric [10th] nerve', N'http://dummyimage.com/122x100.png/ff4444/ffffff', CAST(N'2021-12-13' AS Date), 5)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (79, N'Aura', 18, 8.9, N'Accidental poisoning by salicylates', N'http://dummyimage.com/102x100.png/5fa2dd/ffffff', CAST(N'2022-01-05' AS Date), 10)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (80, N'Passat', 11, 5.5, N'Other specified cardiovascular syphilis', N'http://dummyimage.com/174x100.png/ff4444/ffffff', CAST(N'2022-01-04' AS Date), 5)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (81, N'Sephia', 20, 15, N'Unspecified sleep apnea', N'http://dummyimage.com/220x100.png/5fa2dd/ffffff', CAST(N'2021-01-26' AS Date), 2)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (82, N'Electra', 7, 10.3, N'Open fracture of coronoid process of ulna', N'http://dummyimage.com/204x100.png/5fa2dd/ffffff', CAST(N'2021-08-18' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (83, N'Eurovan', 14, 19.7, N'Other orbital disorders', N'http://dummyimage.com/149x100.png/dddddd/000000', CAST(N'2021-01-24' AS Date), 4)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (84, N'Intrepid', 16, 12.1, N'Other disorders of calcium metabolism', N'http://dummyimage.com/215x100.png/cc0000/ffffff', CAST(N'2021-09-14' AS Date), 6)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (85, N'Tahoe', 8, 18.4, N'Papyraceous fetus, unspecified as to episode of care or not applicable', N'http://dummyimage.com/109x100.png/5fa2dd/ffffff', CAST(N'2021-08-22' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (86, N'Park Avenue', 19, 9.3, N'Bereavement, uncomplicated', N'http://dummyimage.com/207x100.png/ff4444/ffffff', CAST(N'2021-08-06' AS Date), 9)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (87, N'Century', 16, 7.4, N'Ankylosis of joint, ankle and foot', N'http://dummyimage.com/246x100.png/cc0000/ffffff', CAST(N'2021-04-26' AS Date), 9)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (88, N'RL', 9, 11.8, N'Cortex (cerebral) contusion with open intracranial wound, with prolonged [more than 24 hours] loss of consciousness without return to pre-existing conscious level', N'http://dummyimage.com/238x100.png/5fa2dd/ffffff', CAST(N'2022-01-06' AS Date), 8)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (89, N'Galant', 15, 6.6, N'Human herpesvirus 7 infection', N'http://dummyimage.com/248x100.png/ff4444/ffffff', CAST(N'2021-10-22' AS Date), 3)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (90, N'Crown Victoria', 14, 13.5, N'Malignant mast cell tumors, lymph nodes of multiple sites', N'http://dummyimage.com/233x100.png/5fa2dd/ffffff', CAST(N'2021-12-24' AS Date), 4)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (91, N'Altima', 11, 5.1, N'Sunburn', N'http://dummyimage.com/198x100.png/cc0000/ffffff', CAST(N'2021-10-15' AS Date), 5)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (92, N'Avenger', 14, 10.3, N'Other closed skull fracture with subarachnoid, subdural, and extradural hemorrhage, with no loss of consciousness', N'http://dummyimage.com/188x100.png/ff4444/ffffff', CAST(N'2021-08-13' AS Date), 8)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (93, N'Pajero', 14, 19.2, N'Failed attempted abortion without mention of complication', N'http://dummyimage.com/125x100.png/dddddd/000000', CAST(N'2021-04-27' AS Date), 8)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (94, N'Lancer Evolution', 7, 12.9, N'Central choroidal atrophy, total', N'http://dummyimage.com/135x100.png/5fa2dd/ffffff', CAST(N'2021-06-16' AS Date), 6)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (95, N'S-Class', 11, 8.6, N'Tetracycline group causing adverse effects in therapeutic use', N'http://dummyimage.com/215x100.png/dddddd/000000', CAST(N'2021-10-15' AS Date), 2)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (96, N'Camry Hybrid', 20, 9, N'Chronic glomerulonephritis with lesion of rapidly progressive glomerulonephritis', N'http://dummyimage.com/226x100.png/ff4444/ffffff', CAST(N'2021-08-24' AS Date), 5)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (97, N'Mini Cooper', 16, 13.4, N'Toxic effect of carbon monoxide', N'http://dummyimage.com/229x100.png/dddddd/000000', CAST(N'2021-07-31' AS Date), 1)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (98, N'Escalade EXT', 7, 14.6, N'Ankylosis of joint, multiple sites', N'http://dummyimage.com/107x100.png/5fa2dd/ffffff', CAST(N'2021-01-18' AS Date), 7)
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (99, N'Sunbird', 6, 7.2, N'Tuberculosis of ureter, bacteriological or histological examination unknown (at present)', N'http://dummyimage.com/210x100.png/5fa2dd/ffffff', CAST(N'2021-05-14' AS Date), 4)
GO
INSERT [dbo].[Product] ([productID], [productName], [quantity], [price], [description], [image_url], [created_date], [category_id]) VALUES (100, N'Mustang', 12, 17.7, N'Toxic effect of freon', N'http://dummyimage.com/120x100.png/dddddd/000000', CAST(N'2021-04-09' AS Date), 7)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__30F848ED] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__30F848ED]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__account___2F10007B] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__account___2F10007B]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__shipping__300424B4] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__shipping__300424B4]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor__267ABA7A] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__categor__267ABA7A]
GO
