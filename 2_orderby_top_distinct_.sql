
USE Northwind -- QUERY PENCERESİNDE HANGİ VERİTABANININ KULLANILACAĞINI BELİRTİR


-- DEFAULT - ASC 
SELECT * FROM Products
ORDER BY UnitsInStock

SELECT * FROM Products
ORDER BY UnitsInStock ASC

select * from Products
order by  UnitsInStock desc

SELECT * FROM Products
ORDER BY UnitsInStock asc, UnitPrice desc

SELECT * FROM Products
ORDER BY UnitPrice desc,UnitsInStock asc

SELECT * FROM Products
ORDER BY UnitPrice,UnitsInStock

-- TOP N => SATIR SEÇMEK İÇİN KULLANILIR. N ADET SATIRI SEÇMEK İÇİN
SELECT TOP 10 * FROM Products

USE Northwind

SELECT TOP 1 * FROM Categories

SELECT TOP 5  P.ProductName,P.CategoryID,P.UnitsInStock FROM Products AS P

-- TOP ORDER BY İLE KULLANIMI
SELECT TOP 10 * FROM Products AS P
ORDER BY P.UnitPrice

SELECT TOP 10 * FROM Products AS P
ORDER BY P.UnitPrice DESC

SELECT TOP 1 * FROM Orders
ORDER BY OrderDate DESC

SELECT CustomerID  FROM Customers


SELECT CustomerID FROM Orders


-- DISTINCT => SELECT İFADELERİNDE  ALANA GÖRE BENZER SATIRLARI elimine (ayıklamak) eder
SELECT DISTINCT CustomerID FROM Orders

SELECT DISTINCT CategoryID FROM Products


select * from [Order Details] 

