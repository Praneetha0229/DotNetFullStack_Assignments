-- 1) Implementing Views

CREATE DATABASE SampleSPDb;
USE SampleSPDb;

CREATE TABLE Products
(
	ProductId INT PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL,
	QuantityInStock INT NOT NULL CHECK (QuantityInStock > 0),
	UnitPrice INT NOT NULL CHECK (UnitPrice > 0),
	Category NVARCHAR(50) NOT NULL
);

INSERT INTO Products VALUES(1,'Laptop',23,50000,'Electronics')
INSERT INTO Products VALUES(2,'Mobile',12,30000,'Electronics')
INSERT INTO Products VALUES(3,'Chips',54,20,'Food')
INSERT INTO Products VALUES(4,'Twix',20,40,'Food')
INSERT INTO Products VALUES(5,'Head Phone',30,1000,'Electronics')
INSERT INTO Products VALUES(6,'Chair',10,750,'Furniture')
INSERT INTO Products VALUES(7,'Table',17,300,'Furniture')
INSERT INTO Products VALUES(8,'Dolo',100,30,'Medicine')
INSERT INTO Products VALUES(9,'Paracetemol',50,10,'Medicine')

SELECT * FROM Products;

-- Create the view
CREATE VIEW Products_Less_Than_Average_Price AS
SELECT ProductId, Name, UnitPrice As UnitPrice_Less_Than_Average_Price FROM Products
WHERE UnitPrice < (SELECT AVG(UnitPrice) FROM Products);

-- Display the view
SELECT * FROM Products_Less_Than_Average_Price;

-- Rename the view
EXEC sp_rename 'Products_Less_Than_Average_Price', 'Low_Cost_Products';
SELECT * FROM Low_Cost_Products;

-- Drop the view
DROP VIEW Low_Cost_Products;

-- 2) Implementing Stored Procedures and Cursors

USE master;

SELECT * FROM Products;

CREATE PROCEDURE  uspGetProducts
AS
BEGIN
	SELECT * FROM Products;
END
GO;

EXEC uspGetProducts;

----------------

CREATE PROCEDURE uspGetProdctWithTotalAmount 
AS
Begin

DECLARE cursor_product CURSOR
FOR SELECT ProductName, UnitPrice, UnitsOnOrder FROM  Products;

OPEN cursor_product;

DECLARE @ProductName NVARCHAR(40),  @UnitPrice money, @UnitsOnOrder smallint, @TotalAmount DECIMAL;
SET @TotalAmount=0;
FETCH NEXT FROM cursor_product INTO  @ProductName, @UnitPrice, @UnitsOnOrder;

WHILE @@FETCH_STATUS=0
	BEGIN
		PRINT @ProductName + ' - ' +  CAST(@UnitPrice * @UnitsOnOrder AS varchar);
		SET @TotalAmount += @UnitPrice * @UnitsOnOrder;
		FETCH NEXT FROM cursor_product INTO  @ProductName,  @UnitPrice, @UnitsOnOrder;
	END;
	PRINT 'Grand Total - ' + CAST(@TotalAmount AS varchar);

CLOSE cursor_product;

DEALLOCATE cursor_product;

End;

DROP PROCEDURE uspGetProdctWithTotalAmount;

EXEC uspGetProdctWithTotalAmount;
	




