IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ShoppingServiceMVC')
BEGIN
    CREATE DATABASE ShoppingServiceMVC;
END;
GO

USE ShoppingServiceMVC;
GO

DROP TABLE IF EXISTS dbo.products;
DROP TABLE IF EXISTS dbo.Category;
DROP TABLE IF EXISTS dbo.users;
GO

CREATE TABLE dbo.users (
                           user_id INT IDENTITY(1,1) NOT NULL,
                           username VARCHAR(50) NOT NULL,
                           password VARCHAR(255) NOT NULL,
                           email VARCHAR(100) NOT NULL,
                           fullname NVARCHAR(100) NOT NULL,
                           phone VARCHAR(20) NULL,
                           avatar VARCHAR(255) NULL,
                           roleid INT NOT NULL,
                           created_date DATETIME NULL,
                           is_enable BIT NULL,
                           otp VARCHAR(10) NULL,
                           CONSTRAINT PK_Users PRIMARY KEY (user_id),
                           CONSTRAINT UQ_Username UNIQUE (username),
                           CONSTRAINT UQ_Email UNIQUE (email)
);
GO

CREATE TABLE dbo.Category (
                              cate_id INT IDENTITY(1,1) NOT NULL,
                              cate_name NVARCHAR(255) NOT NULL,
                              icons NVARCHAR(255) NULL,
                              status INT NULL,
                              CONSTRAINT PK_Category PRIMARY KEY (cate_id)
);
GO

CREATE TABLE dbo.products (
                              product_id INT IDENTITY(1,1) NOT NULL,
                              product_name NVARCHAR(255) NOT NULL,
                              price FLOAT NOT NULL,
                              quantity INT NOT NULL,
                              description NVARCHAR(MAX) NULL,
                              image_url VARCHAR(500) NULL,
                              created_at DATETIME DEFAULT GETDATE(),
                              category_id INT NOT NULL,
                              CONSTRAINT PK_Products PRIMARY KEY (product_id),
                              CONSTRAINT FK_Product_Category FOREIGN KEY (category_id) REFERENCES dbo.Category(cate_id)
);
GO

INSERT INTO dbo.users (username, password, email, fullname, phone, avatar, roleid, created_date, is_enable, otp) VALUES
('admin', '123456', 'admin@uteshop.com', N'Quản Trị Viên UTE', '0909123456', 'default-avatar.png', 1, GETDATE(), 1, NULL);
GO

INSERT INTO dbo.Category (cate_name, icons, status) VALUES
(N'Quần Áo Nam', N'shirt-icon.png', 1),
(N'Đồ Điện Tử', N'phone-icon.png', 1),
(N'Phụ Kiện Thời Trang', N'accessory-icon.png', 1);
GO

INSERT INTO dbo.products (product_name, price, quantity, description, image_url, category_id) VALUES
(N'Tai nghe Bluetooth TWS', 450000, 40, N'Tai nghe không dây âm thanh HIFI.', 'https://placehold.co/400x400/e9c46a/black?text=Tai+Nghe', 2),
(N'Sạc dự phòng 10000mAh', 299000, 100, N'Sạc dự phòng nhỏ gọn, sạc nhanh.', 'https://placehold.co/400x400/e9c46a/black?text=Sac+Du+Phong', 2),
(N'Bàn phím cơ Gaming', 850000, 25, N'Bàn phím cơ Red Switch, LED RGB.', 'https://placehold.co/400x400/e9c46a/black?text=Ban+Phim', 2),
(N'Chuột không dây Silent', 150000, 60, N'Chuột click chống ồn, độ nhạy cao.', 'https://placehold.co/400x400/e9c46a/black?text=Chuot+Khong+Day', 2),

(N'Đồng hồ nam dây da', 550000, 20, N'Đồng hồ cơ nam tính, mặt kính sapphire.', 'https://placehold.co/400x400/e76f51/white?text=Dong+Ho', 3),
(N'Mắt kính râm phân cực', 250000, 45, N'Kính mát chống tia UV400.', 'https://placehold.co/400x400/e76f51/white?text=Mat+Kinh', 3),
(N'Thắt lưng nam da bò', 320000, 50, N'Thắt lưng da thật 100%.', 'https://placehold.co/400x400/e76f51/white?text=That+Lung', 3),
(N'Ví da nam dáng đứng', 199000, 70, N'Ví da nam nhiều ngăn đựng thẻ.', 'https://placehold.co/400x400/e76f51/white?text=Vi+Da', 3);
GO
(N'Áo Polo Nam Basic', 249000, 50, N'Áo polo nam chất liệu cotton thoáng mát, thiết kế lịch lãm.', 'https://res.cloudinary.com/yc31bvxm/image/upload/v1788427240/nkvuiq3aehgj5tmd1wzj.jpg', 1),
(N'Áo Sơ Mi Nam Công Sở', 329000, 30, N'Áo sơ mi nam dài tay, chống nhăn, form dáng chuẩn.', 'https://res.cloudinary.com/yc31bvxm/image/upload/v1788427242/xb6pmch0euk6jxtn0msd.jpg', 1),
(N'Áo Thun Nam Cotton', 179000, 100, N'Áo thun ngắn tay năng động, thấm hút mồ hôi tốt.', 'https://res.cloudinary.com/yc31bvxm/image/upload/v1788427243/c5cttslqienutgglpaul.jpg', 1),
(N'Quần Kaki Nam Thời Trang', 399000, 40, N'Quần kaki nam ống đứng, chất liệu dày dặn, co giãn nhẹ.', 'https://res.cloudinary.com/yc31bvxm/image/upload/v1788427244/g8uee1juq6l16if7s4kj.jpg', 1),
(N'Áo Khoác Hoodie Nam', 450000, 25, N'Hoodie nỉ ngoại ấm áp, phong cách trẻ trung cá tính.', 'https://res.cloudinary.com/yc31bvxm/image/upload/v1788427246/mn8b2p4kv7pibdebz5im.jpg', 1),
(N'Quần Jean Nam Slimfit', 420000, 35, N'Quần jean phong cách trẻ trung, bền đẹp theo thời gian.', 'https://res.cloudinary.com/yc31bvxm/image/upload/v1788427247/n1dlxsswlro6mbzzhbdr.jpg', 1),
(N'Áo Len Nam Mùa Đông', 350000, 20, N'Áo len lông cừu giữ nhiệt tốt, thiết kế đơn giản dễ phối đồ.', 'https://res.cloudinary.com/yc31bvxm/image/upload/v1788427249/xz7ei81skoduw3fwahw0.jpg', 1),
(N'Quần Short Kaki Nam', 199000, 60, N'Quần short ngắn năng động cho mùa hè, thoải mái vận động.', 'https://res.cloudinary.com/yc31bvxm/image/upload/v1788427250/t4n401ljclmpgbuhzu4w.jpg', 1),
(N'Áo Blazer Nam Hàn Quốc', 690000, 15, N'Áo khoác blazer lịch sự, thích hợp đi tiệc hoặc đi làm.', 'https://res.cloudinary.com/yc31bvxm/image/upload/v1788427251/sm2pxj6k8g9zylxnea54.jpg', 1),
(N'Áo Khoác Dù Chống Nắng', 299000, 45, N'Áo dù mỏng nhẹ, chống tia UV, tiện lợi khi di chuyển ngoài đường.', 'https://res.cloudinary.com/yc31bvxm/image/upload/v1788427253/upn7y3nsug31d14ruioy.jpg', 1);

GO
