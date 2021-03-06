USE [master]
GO

CREATE DATABASE [VegetableShop]
GO
USE [VegetableShop]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [NVARCHAR](50) IDENTITY(1,1) NOT NULL,
	[fullName] [NVARCHAR](255) NULL,
	[password] [NVARCHAR](255) NULL,
	[roleID] [INT]NULL,
	[address] [NVARCHAR](255) NULL,
	[email] [NVARCHAR](255) NULL,
	[birthday][DATE] NULl,
	[phone][NVARCHAR](255) NULL,
	[status][INT] NULL
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblRoles](
	[roleID][INT]IDENTITY(1,1) NOT NULL,
	[roleName][NVARCHAR](255) NULL,
	CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED
	(
	[roleID] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [INT] IDENTITY(1,1) NOT NULL,
	[categoryName] [NVARCHAR](255) NULL,
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
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [INT] IDENTITY(1,1) NOT NULL,
	[orderID] [INT] NULL,
	[productID] [INT] NULL,
	[price] [FLOAT] NULL,
	[quantity] [INT] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [INT] IDENTITY(1,1) NOT NULL,
	[userID] [NVARCHAR](50) NULL,
	[totalPrice] [FLOAT] NULL,
	[note] [TEXT] NULL,
	[orderDate] [DATE] NULL,
	[shippingID] [INT] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [NVARCHAR](255) NULL,
	[quantity] [INT] NULL,
	[price] [FLOAT] NULL,
	[description] [NVARCHAR](255) NULL,
	[imageUrl] [nvarchar](255) NULL,
	[categoryID] [INT] NULL,
	[importDate] [DATE] NULL,
	[usingDate] [DATE] NULL
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 2/24/2022 7:50:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShipping](
	[shippingID] [INT] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[shippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (1, N'Rau củ quả')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (2, N'Trái cây tươi')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (3, N'Các loại hạt')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (4, N'Thực phẩm phơi sấy')

SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (1, N'Bắp cải tím hữu cơ Đà Lạt', 20, 30.000, N'Bắp cải tím Đà Lạt là thực phẩm rất tốt cho sức khỏe con người. Bên cạnh thành phần chứa nhiều vitamin C và K, Bắp cải tím Đà Lạt rất giàu anthocyanin polyphenols – chất chống oxy hóa, các tính năng kháng viêm khác nhau.', N'https://anhoafood.com/wp-content/uploads/2018/08/bapcaitimdalat-300x300.jpg', 1,CAST(N'2022-03-01' AS Date), CAST(N'2022-03-02' AS Date))
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (2, N'Bắp Mỹ ngọt hữu cơ Đà Lạt', 20, 12.500, N'Ngô ngọt hay ngô đường, bắp ngọt, bắp đường; là giống ngô có hàm lượng đường cao. Ngô ngọt là kết quả xuất hiện tự nhiên của đặc tính lặn của gen điều khiển việc chuyển đường thành tinh bột bên trong nội nhũ của hạt ngô.', N'https://anhoafood.com/wp-content/uploads/2020/11/bap-my-huuco-dalat-8-300x300.jpg',1,CAST(N'2022-03-01' AS Date), CAST(N'2022-03-02' AS Date));
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (3, N'Bí nhật già Đà Lạt', 18, 22.500, N'Bí đỏ là nhà vô địch về hàm lượng sắt, giàu vitamin, muối khoáng cũng như các axít hữu cơ.', N'https://anhoafood.com/wp-content/uploads/2018/08/binhat-pumpkinjapan-anhoafood-23-300x300.jpg', 1,CAST(N'2022-03-01' AS Date), CAST(N'2022-03-02' AS Date));
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (4, N'Bông cải xanh hữu cơ Đà Lạt', 17, 25.000, N'Bông cải xanh được biết đến là một loại rau ngon và bổ, chứa nhiều chất dinh dưỡng. Ngăn ngừa ung thư,giảm cholesterol,giảm phản ứng dị ứng và viêm nhiễm,chất chống oxy hóa mạnh mẽ, sức khỏe của xương,sức khỏe của tóc,tuyệt vời để giải độc,…', N'https://anhoafood.com/wp-content/uploads/2020/11/bong-cai-xanh-suplo-xanh-huucodalat-anhoafood-5-300x300.jpg', 1, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-02' AS Date));
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (5, N'Cà chua Picota Đà Lạt', 25, 39.000, N'Cà chua Picota  là giống cà chua chịu nhiệt, trái nhỏ, tròn, có màu xanh và khi chín chuyển thành màu đỏ đều rất đẹp, vị ngọt hơn các loại cà chua khác.', N'https://anhoafood.com/wp-content/uploads/2018/08/c%C3%A0-chua-Picota-%C4%90%C3%A0-L%E1%BA%A1t-300x300.jpg', 1, CAST(N'2022-03-01' AS Date), CAST(N'2022-5-01' AS Date));
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (6, N'Carot baby hữu cơ Đà Lạt', 20, 40.000, N'Thanh nhiệt, giải độc cơ thể. Tăng khả năng miễn dịch Phòng ngừa bệnh tim. Hỗ trợ tiêu hóa. Ngăn ngừa ung thư.', N'https://anhoafood.com/wp-content/uploads/2020/11/Organic-Baby-Carrot-carot-baby-huuco-anhoafood-1-300x300.png', 1, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-02' AS Date));
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (7, N'Chanh không hạt Đà lạt', 10, 25.000, N'Thanh nhiệt, chế biến món ăn hoặc dùng trực tiếp', N'https://anhoafood.com/wp-content/uploads/2020/11/chanh-khonghat-da-lat-anhoafood-3-300x300.jpg', 1, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-02' AS Date));
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (8, N'Bơ hữu cơ 034 Đà Lạt', 20, 44.900, N'Bơ 034 có độ dẻo và béo nhất trong các loại bơ nên phù hợp để chế biến rất nhiều món như: Salad bơ, bơ dầm, sinh tố bơ, kem bơ, nhân bánh.', N'https://anhoafood.com/wp-content/uploads/2020/11/BO-0340HUUCO-ANHOAFOOD-6-300x300.jpg', 2, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-02' AS Date));
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (9, N'Dâu tây Pháp tươi cỡ lớn', 20, 150.00, N'Dâu tây Pháp tươi cỡ lớn (hộp 500g) được tuyển chọn từ vùng trồng Đà Lạt, được trồng theo phương pháp organic, đảm bảo an toàn, không hóa chất, không chất bảo quản.', N'https://anhoafood.com/wp-content/uploads/2018/08/dautayphap-anhoafood-1-300x300.jpg', 2, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-02' AS Date));
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (10, N'Bông cải xanh hữu cơ Đà Lạt', 17, 25.000, N'Bông cải xanh được biết đến là một loại rau ngon và bổ, chứa nhiều chất dinh dưỡng. Ngăn ngừa ung thư,giảm cholesterol,giảm phản ứng dị ứng và viêm nhiễm,chất chống oxy hóa mạnh mẽ, sức khỏe của xương,sức khỏe của tóc,tuyệt vời để giải độc,…', N'https://anhoafood.com/wp-content/uploads/2020/11/bong-cai-xanh-suplo-xanh-huucodalat-anhoafood-5-300x300.jpg', 1, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-02' AS Date));
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (11, N'Cà chua Picota Đà Lạt', 25, 39.000, N'Cà chua Picota  là giống cà chua chịu nhiệt, trái nhỏ, tròn, có màu xanh và khi chín chuyển thành màu đỏ đều rất đẹp, vị ngọt hơn các loại cà chua khác.', N'https://anhoafood.com/wp-content/uploads/2018/08/c%C3%A0-chua-Picota-%C4%90%C3%A0-L%E1%BA%A1t-300x300.jpg', 1, CAST(N'2022-03-01' AS Date), CAST(N'2022-5-01' AS Date));
INSERT [dbo].[tblProduct] ([productID], [productName], [quantity], [price], [description], [imageUrl], [categoryID], [importDate], [usingDate]) 
VALUES (12, N'Carot baby hữu cơ Đà Lạt', 20, 40.000, N'Thanh nhiệt, giải độc cơ thể. Tăng khả năng miễn dịch Phòng ngừa bệnh tim. Hỗ trợ tiêu hóa. Ngăn ngừa ung thư.', N'https://anhoafood.com/wp-content/uploads/2020/11/Organic-Baby-Carrot-carot-baby-huuco-anhoafood-1-300x300.png', 1, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-02' AS Date));
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoles] ON
INSERT INTO [dbo].[tblRoles] ([roleID], [roleName])
VALUES (1, N'ADMIN');
INSERT INTO [dbo].[tblRoles] ([roleID], [roleName])
VALUES (2, N'USER');
SET IDENTITY_INSERT [dbo].[tblRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON

GO
INSERT INTO [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [email], [birthday], [phone], [status])
VALUES (N'admin',N'Ngô Xuân Thiệp', N'1', 1, N'Đồng Nai',N'ngothiep@gmail.com', CAST(N'2001-12-24' AS Date), N'0905952717', 1)
INSERT INTO [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [email], [birthday], [phone], [status])
VALUES (N'tungnt',N'Nguyễn Thanh Tùng', N'1', 2, N'Bình Dương',N'thanhtung@gmail.com', CAST(N'2001-09-16' AS Date), N'0868649875', 1)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__user] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK__Orders__user]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__shipping] FOREIGN KEY([shippingID])
REFERENCES [dbo].[tblShipping] ([shippingID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK__Orders__shipping]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK__Product__categor]
GO
ALTER TABLE [dbo].[tblusers]  WITH CHECK ADD  CONSTRAINT [FK__User__role] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblroles] ([roleID])
GO
ALTER TABLE [dbo].[tblusers] CHECK CONSTRAINT [FK__User__role]	
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__product] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK__OrderDeta__product]


SELECT productID,productName, price, quantity,categoryID,importDate,usingDate,DATEDIFF(day, GETDATE(), usingDate) AS outofdate ,image
FROM tblProduct 
WHERE productName like '%%' AND status = 1 AND quantity > 0 
AND DATEDIFF(day, GETDATE(), usingDate) <= 15 AND DATEDIFF(day, GETDATE(), usingDate) >=0
AND DATEDIFF(YEAR, GETDATE(), usingDate) = 0 AND DATEDIFF(MONTH, GETDATE(), usingDate) = 0