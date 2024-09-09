# DotNetFullStack_Assignments

## Course1 : JavaScript_jQuery
### Module1 : JavaScript Introduction

1. Practical :  Write a JavaScript code to display Employee details as follows in console window: 
				Empno : 12645,  Ename  :  Scott,  Job : Manager, Salary :  45000
	
2.   Create a web page to process product details using JavaScript.  Calculate total amount based on the given values.  (Refer the Image)

		a.  Take the confirmation from the user before proceeding the total calculation. 

	Hint :   If qty is more than 10  	---   give 10% discount 
				 If qty is more than 20  	---   give 15% discount 
				 If qty is more than 30  	---   give 20% discount 
				 
				 
				 
3.   Create a web page to perform all math operations (Add, Sub, Multiply, Div) using JavaScript.

## Course2 : DotNetFramework_OOPs

1.   Read Employee details from the user and display on console. 
		Employee Id :  6546545
		Employee Name   :  Scott
		Employee Job :   Manager
		Employee Salary :   85000	

2.  Write a C# program to read product details from end user and display the following details:	
		Product Id :  102566
		Product Name :  LG Printer
		Unit Price :   2500
		Quantity :  20
		Total Amount:    50000
		Discount Amount:   5000
		Final Amount :     45000
		
	Hint :   Total Amount need to be calculate based on the Unit Price and Quantity. 
	
		a.  If qty is greater than 10   ---    10% discount on total amount
		b.  If qty is greater than 30   ---    20% discount on total amount 
		c.  If qty is greater than 50   ---    30% discount  on total amount

## Course3 : WebApplication_ASP.NET
### Module1 : ADO.NET

1.  Create a product table in database with following columns:
		-->  productId, name, price, quantity, category 
		-->  Insert  some rows (min. 6 rows - 2 for each category) 

2.  Write a C# program to insert new product details using connected architecture

3.   Write a C# program to display all product details using disconnected model.

### Module3 : EntityFramework

1. Create ASP.NET MVC Application to implement List(Display all items) and Create operation on Products data using Entity Framework Core.

Entity Class : Product
Properties : ProductId, ProductName, UnitPrice, Quantity, Category
DbContext : SalesDbContext
