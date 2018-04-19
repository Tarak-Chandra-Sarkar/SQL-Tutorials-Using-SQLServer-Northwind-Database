Use W3SchoolsDemoDatabaseNorthwindLT;

--SELECT * Example
select * from Customers;


--SELECT Column Example
select CustomerName, City from Customers;


--SELECT DISTINCT Examples
select Country from Customers;
select distinct Country from Customers;
select count(distinct Country) from Customers;


--START: WHERE Clause Example
select * from Customers
where Country='Mexico';
--Text Fields vs. Numeric Fields
select * from Customers
where CustomerID=1;
--AND Example
select * from Customers
where Country='Germany' and City='Berlin';
--OR Example
select * from Customers
where City='Berlin' or City='Aachen';
--NOT Example
select * from Customers
where Country<>'Germany';
--Combining AND, OR and NOT
select * from Customers
where Country='Germany' and (City='Berlin' or City='Aachen');
--using <> operator "Germany" and <> "USA"
select * from Customers
where Country<>'Germany' and Country<>'USA';
--NOT "Germany" and NOT "USA":
select * from Customers
where Not Country='Germany' and not Country='USA';
--END: WHERE Clause Example


--START: ORDER BY Example
select * from Customers
order by Country;
--ORDER BY DESC Example
select * from CUstomers
order by Country desc;
--ORDER BY Several Columns Example
select * from Customers
order by Country , CustomerName;
--ORDER BY Several Columns Example 2
select * from Customers
order by country asc, CustomerName desc;
--END: ORDER BY Example


--INSERT INTO Example
insert into Customers(CustomerName, ContactName, Address, City, PostalCode, Country)
values('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');
--Check inserted row in Customers table
select * from Customers
where CustomerName='Cardinal';
--Insert Data Only in Specified Columns
insert into Customers(CustomerName, City, Country)
values ('tarak', 'kolkata', 'India');
--Check inserted row in Customers table
select * from Customers
where CustomerName='tarak';


--The IS NULL Operator
select * from Customers
where ContactName is Null;
--The IS NOT NULL Operator
select * from Customers
where ContactName is not null;


--START: UPDATE Table 
-- Test Customer record Before Update
select * from Customers
where CustomerID=1;
--Update for CustomerID = 1
update Customers
set ContactName='Alfred Schmidt', City='Frankfurt'
where CustomerID=1;
-- Test Customer record After Update
select * from Customers
where CustomerID=1;
--UPDATE Multiple Records
-- Test Customer record Before Update
select * from Customers
where Country='Mexico';
--Update for Country='Mexico'
update Customers
set ContactName='Juan'
where Country='Mexico';
-- Test Customer record After Update
select * from Customers
where Country='Mexico';
--Update back to original state of Customers table
update Customers
set ContactName='Ana Trujillo'
where CustomerID=2;

update Customers
set ContactName='Antonio Moreno'
where CustomerID=3;

update Customers
set ContactName='Francisco Chang'
where CustomerID=13;

update Customers
set ContactName='Guillermo Fernández'
where CustomerID=58;

update Customers
set ContactName='Miguel Angel Paolino'
where CustomerID=80;
--END: UPDATE Table


--SQL DELETE Example
delete from Customers
where CustomerName='tarak';
--Test the deletion from Customers table
select * from Customers
where CustomerName='tarak';
--Delete the CustomerName='Cardinal'
delete from Customers
where CustomerName='Cardinal';
--Test the deletion from Customers table
select * from Customers
where CustomerName='Cardinal';


--SQL TOP
select top 3 * from Customers;

--SQL TOP PERCENT Example
select top 50 percent * from Customers;

--Top with ADD a WHERE CLAUSE
select top 3 * from Customers
where Country='Germany';


--MIN() Example
select MIN(Price) As SmallestPrice
from Products;

--MAX() Example
select MAX(Price) As LargestPrice
from Products;


--COUNT() Example
select COUNT(ProductID) As TotalNumOfProducts
from Products;

--AVG() Example
select AVG(Price) As AvgPrice
from Products;

--SUM() Example
select SUM(Quantity) As TotalQuantityOfOrderDetails
from OrderDetails;


--START: SQL LIKE Examples
--CustomerName starting with "a":
select * from Customers
where CustomerName like 'a%';

--CustomerName ending with "a":
select * from Customers
where CustomerName like '%a';

--CustomerName that have "or" in any position:
select * from Customers
where CustomerName like '%or%';

--CustomerName that have "r" in the second position:
select * from Customers
where CustomerName like '_r%';

--CustomerName that starts with "a" and are at least 3 characters in length:
select * from Customers
where CustomerName like 'a_%_%';

--ContactName that starts with "a" and ends with "o":
select * from Customers
where ContactName like 'a%o';

--CustomerName that does NOT start with "a":
select * from Customers
where CustomerName not like 'a%';

--Using the [charlist] Wildcard
select * from Customers
where City like '[bsp]%';
--END: SQL LIKE Examples


--START: IN Operator Examples
select * from Customers
where Country in ('Germany', 'France', 'UK');

--NOT located in "Germany", "France" or "UK":
select * from Customers
where Country not in ('Germany', 'France', 'UK');

--selects all customers that are from the same countries as the suppliers:
select * from Customers
where Country in (select Country from Suppliers);
--END: IN Operator Examples


--BETWEEN Example
select * from Products
where Price between 10 and 20;

--NOT BETWEEN Example
select * from Products
where Price not between 10 and 20;

--selects all products with a price BETWEEN 10 and 20. In addition; do not show products with a CategoryID of 1,2, or 3:
select * from Products
where (Price between 10 and 20) and CategoryID not in (1, 2, 3);

--selects all products with a ProductName BETWEEN 'Carnarvon Tigers' and 'Mozzarella di Giovanni':
select * from Products
where ProductName between 'Carnarvon Tigers' and 'Mozzarella di Giovanni'
order by ProductName;

--selects all products with a ProductName NOT BETWEEN 'Carnarvon Tigers' and 'Mozzarella di Giovanni':
select * from Products
where ProductName not between 'Carnarvon Tigers' and 'Mozzarella di Giovanni'
order by ProductName;

--selects all orders with an OrderDate BETWEEN '04-July-1996' and '09-July-1996':
select * from Orders
where OrderDate between '07/04/1996' and '07/09/1996';


--Alias for Columns Examples
select CustomerID as ID, CustomerName as Customer
from Customers;

--It requires double quotation marks or square brackets if the alias name contains spaces:
select CustomerName as Customer, ContactName as [Contact Person]
from Customers;

--creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country):
select CustomerName, Address+', '+PostalCode+', '+City+', '+Country as Address
from Customers;


--Alias for Tables Example
select o.OrderID, o.OrderDate, c.CustomerName
from Customers as c, Orders as o
where c.CustomerName='Around the Horn' and c.CustomerID=o.CustomerID;



--START: SQL JOIN
select Orders.OrderID, Customers.CustomerName, Orders.OrderDate
from Orders inner join Customers
on Orders.CustomerID=Customers.CustomerID;
--END: SQL JOIN

--JOIN Three Tables
select Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
from (Orders inner join Customers on Orders.CustomerID=Customers.CustomerID) inner join Shippers
on Orders.ShipperID=Shippers.ShipperID;