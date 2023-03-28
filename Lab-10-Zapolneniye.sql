use MobileShop
INSERT INTO Phones (ID, Model, Manufacturer, Color, Specs, Price, TotalSales)
VALUES
(1, 'iPhone 13', 'Apple', 'Blue', 'A15 Bionic, 5G, OLED, 128GB', 799.99, 0.00),
(2, 'Galaxy S21', 'Samsung', 'Phantom Black', 'Snapdragon 888, 5G, Dynamic AMOLED, 128GB', 899.99, 0.00),
(3, 'Pixel 6', 'Google', 'Stormy Black', 'Tensor, 5G, AMOLED, 128GB', 699.99, 0.00),
(4, 'OnePlus 10', 'OnePlus', 'Starry Black', 'Snapdragon 8 Gen 1, 5G, AMOLED, 256GB', 899.99, 0.00),
(5, 'Xperia 1 III', 'Sony', 'Frosted Black', 'Snapdragon 888, 5G, OLED, 256GB', 1299.99, 0.00);


INSERT INTO Customers (ID, FirstName, LastName, Address, Phone)
VALUES
(1, '����', '������', '��. ������, 1', '79991234567'),
(2, '����', '������', '��. �������, 2', '79999876543'),
(3, '����', '��������', '��. ������, 3', '79991234568'),
(4, '�����', '���������', '��. ��������, 4', '79991234569'),
(5, '������', '��������', '��. ������������, 5', '79991234570');


INSERT INTO Orders (ID, OrderDate, CustomerID, Quantity, TotalPrice, Status)
VALUES
(1, '2022-01-15 10:30:00', 1, 2, 1599.98, '��������'),
(2, '2022-02-01 12:45:00', 2, 1, 899.99, '��������'),
(3, '2022-02-10 14:20:00', 3, 3, 2099.97, '��������'),
(4, '2022-03-01 11:10:00', 4, 1, 1299.99, '� ���������'),
(5, '2022-03-20 15:30:00', 5, 2, 2599.98, '� ���������');

INSERT INTO Sales (ID, SaleDate, PhoneID, Quantity, Price) VALUES
(1, '2022-01-02 15:30:00', 1, 2, 2198.00),
(2, '2022-01-03 11:45:00', 3, 1, 799.00),
(3, '2022-01-05 13:15:00', 5, 3, 1785.00),
(4, '2022-01-06 10:00:00', 2, 1, 899.00),
(5, '2022-01-08 16:20:00', 4, 2, 1100.00);

INSERT INTO Suppliers (ID, Name, Address, Phone) VALUES
(1, 'Samsung Electronics Co., Ltd', 'Seocho District, Seoul, South Korea', '+82-2-2255-0114'),
(2, 'Apple Inc.', 'Cupertino, California, USA', '+1-408-996-1010'),
(3, 'Xiaomi Corporation', 'Haidian District, Beijing, China', '+86-10-6060-1188'),
(4, 'Huawei Technologies Co., Ltd', 'Shenzhen, Guangdong, China', '+86-755-28780808'),
(5, 'LG Electronics Inc.', 'Yeouido-dong, Seoul, South Korea', '+82-2-3777-1114');