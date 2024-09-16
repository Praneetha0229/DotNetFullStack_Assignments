CREATE DATABASE ShoppingCartDb;

USE ShoppingCartDb;

CREATE TABLE Users
(
	UserId INT PRIMARY KEY,
	UserName VARCHAR(50),
	Password NVARCHAR(50),
	ContactNumber NVARCHAR(50),
	City NVARCHAR(50)
);

INSERT INTO Users VALUES(1,'Jack','password@jack','8932247328','New York')
INSERT INTO Users VALUES(2,'Rosie','password@rosie','8934693792','London')
INSERT INTO Users VALUES(3,'Arjun','password@arjun','9273627831','Hyderabad')
INSERT INTO Users VALUES(4,'John','password@john','7346237332','Sydney')
INSERT INTO Users VALUES(5,'Mike','password@mike','9237672233','Omaha')

SELECT * FROM Users;

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
INSERT INTO Products VALUES(6,'Charger',55,500,'Electronics')
INSERT INTO Products VALUES(7,'AirPods',15,30000,'Electronics')
INSERT INTO Products VALUES(8,'Idly',30,20,'Food')

DELETE Products;
SELECT * FROM Products;

CREATE TABLE Cart
(
	Id INT PRIMARY KEY,
	CartId NVARCHAR(50) NOT NULL,
	ProductId INT NOT NULL,
	Quantity INT NOT NULL CHECK (Quantity > 0),
	FOREIGN KEY(ProductId) REFERENCES Products(ProductId)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

INSERT INTO Cart VALUES(1,'CART01',1,2)
INSERT INTO Cart VALUES(2,'CART02',2,3)
INSERT INTO Cart VALUES(3,'CART03',3,5)
INSERT INTO Cart VALUES(4,'CART04',4,6)

DELETE Cart;

SELECT * FROM Cart;

-- Checking the constraints

INSERT INTO Products VALUES(6,NULL,1,10,'Food') -- Checking Name NOT NULL constraint
INSERT INTO Products VALUES(6,'Chips',-1,10,'Food') -- Checking QuantityInStock CHECK constraint
INSERT INTO Products VALUES(6,'Chips',1,-3,'Food') -- Checking UnitPrice CHECK constraint
INSERT INTO Products VALUES(6,'Chips',1,20,NULL) -- Checking Category NOT NULL constraint
INSERT INTO Cart VALUES(1,NULL,NULL,NULL) -- Checking NULL constraint

-- SELECT queries

SELECT * FROM Products;
SELECT * FROM Products WHERE Category = 'Food';
SELECT * FROM Products WHERE QuantityInStock = 0;
SELECT * FROM Products WHERE UnitPrice>=1000 AND UnitPrice <=10000;
SELECT * FROM Products WHERE ProductId=2;

SELECT * FROM Cart WHERE CartId='CART03';
SELECT Name FROM Products
INNER JOIN Cart
ON Products.ProductId=Cart.ProductId;

SELECT * FROM Users;
SELECT * FROM Users WHERE ContactNumber='7346237332';
SELECT * FROM Users WHERE UserId=5;

-- Joins

SELECT CartId, Name, Quantity, UnitPrice
FROM Products
INNER JOIN Cart
ON Products.ProductId=Cart.ProductId;

SELECT CartId, Name, Quantity, UnitPrice
FROM Products
RIGHT OUTER JOIN Cart
ON Products.ProductId=Cart.ProductId;

SELECT CartId, Name, Quantity, UnitPrice
FROM Products
LEFT OUTER JOIN Cart
ON Products.ProductId=Cart.ProductId;

SELECT CartId, Name, Quantity, UnitPrice
FROM Products
FULL OUTER JOIN Cart
ON Products.ProductId=Cart.ProductId;

CREATE TABLE Student
(
	StudentId INT PRIMARY KEY,
	StudentName NVARCHAR(50),
	CourseName NVARCHAR(50),
	CityName NVARCHAR(50),
	ContactNumber NVARCHAR(50)
);

INSERT INTO Student VALUES (1,'John Doe','Angular','New York','123-456-7890')
INSERT INTO Student VALUES (2,'Jane Smith','Mathematics','Los Angeles','234-567-8901')
INSERT INTO Student VALUES (3,'Michael Brown','Physics','Chicago','345-678-9012')
INSERT INTO Student VALUES (4,'Emily Davis','Chemistry','Hyderabad','456-789-0123')
INSERT INTO Student VALUES (5,'William Johnson','Biology','Phoenix','567-890-1234')
INSERT INTO Student VALUES (6,'Olivia Wilson','English','Philadelphia','678-901-2345')
INSERT INTO Student VALUES (7,'James Jones','Angular','Hyderabad','789-012-3456')
INSERT INTO Student VALUES (8,'Sophia Garcia','Economics','Hyderabad','890-123-4567')
INSERT INTO Student VALUES (9,'Benjamin Martinez','Angular','Dallas','901-234-5678')
INSERT INTO Student VALUES (10,'Isabella Hernandez','Psychology','Hyderabad','012-345-6789')

SELECT * FROM Student;

SELECT COUNT(*) FROM Student WHERE CourseName = 'Angular';
SELECT COUNT(*) FROM Student WHERE CityName = 'Hyderabad';

SELECT CityName,COUNT(StudentId) AS Count
FROM Student 
GROUP BY CityName;

SELECT CourseName,COUNT(StudentId) AS Count
FROM Student 
GROUP BY CourseName;

SELECT CityName,CourseName,COUNT(StudentId) AS CountOfCityName,COUNT(StudentId) AS CountOfCourseName
FROM Student 
WHERE CourseName = 'Angular' AND CityName = 'Hyderabad'
GROUP BY CityName, CourseName;

SELECT * FROM Products
WHERE EXISTS ( 
SELECT CartId FROM Cart WHERE Products.ProductId=Cart.ProductId AND Quantity = 6);

SELECT Name,UnitPrice FROM Products
WHERE EXISTS ( 
SELECT * FROM Cart WHERE Products.ProductId=Cart.ProductId AND UnitPrice >= 5000);