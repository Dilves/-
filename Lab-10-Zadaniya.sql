use MobileShop
--1
CREATE TRIGGER Sales_ValidateQuantity
ON Sales
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS(SELECT * FROM inserted WHERE Quantity <= 0)
    BEGIN
        RAISERROR('Количество должно быть положительным числом.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO Sales (SaleDate, PhoneID, Quantity, Price)
        SELECT SaleDate, PhoneID, Quantity, Price
        FROM inserted;
    END
END

--2
CREATE TRIGGER Sales_UpdateTotalPrice
ON Sales
AFTER INSERT
AS
BEGIN
    UPDATE Phones
    SET TotalSales = TotalSales + (SELECT SUM(Price * Quantity) FROM inserted WHERE PhoneID = Phones.ID)
    FROM Phones
    JOIN inserted ON Phones.ID = inserted.PhoneID
END

--3
CREATE TRIGGER Sales_PreventPriceUpdate
ON Sales
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS(SELECT * FROM deleted JOIN Sales ON deleted.ID = Sales.ID WHERE Sales.SaleDate IS NOT NULL)
    BEGIN
        RAISERROR('Цена не может быть обновлена ​​для уже проданных товаров.', 16, 1);
    END
    ELSE
    BEGIN
        UPDATE Sales SET Price = inserted.Price
        FROM Sales
        JOIN inserted ON Sales.ID = inserted.ID
    END
END


--Triggers

--1--
/*Before insert триггер, который проверяет, чтобы количество товара было положительным числом перед тем, как записать новую продажу:
При попытке вставить запись со значением Quantity меньше или равным нулю, 
триггер возвратит ошибку и откатит транзакцию.
*/


--2--
/*After insert триггер, который обновляет общую стоимость продажи для телефона, которые только что был продан:
При вставке новых записей в таблицу "Sales", 
триггер обновляет общую стоимость продаж для соответствующего телефона в таблице 
"Phones" путем добавления стоимости новых продаж к уже существующей общей стоимости.
*/

--3--
/*Instead of update триггер, который не позволяет обновлять цену продажи для уже проданных товаров:
При попытке обновить цену продажи для уже проданных товаров, триггер возвратит ошибку. 
В противном случае, он позволит обновить цену для соответствующих записей.
*/
