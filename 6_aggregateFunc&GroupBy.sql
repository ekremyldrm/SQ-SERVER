use Northwind

--aggregate functions
select max(UnitPrice) from Products

select min(UnitPrice) from Products

select min(UnitPrice) from Products
where CategoryID = 1

select avg(UnitPrice) from Products


select sum(UnitPrice) from Products

-- tablodaki satır sayısını döndürür...
select count(*) from Products

-- count içerisinde * kullanılırsa satırların tamamını sayar
-- count içerisinde * yerine kolon ismi yazılırsa satırın tamamı yerine null olmayan satırları sayar
select COUNT(*),count(s.SupplierID),Count(s.Fax) from Suppliers s

-- YUKARIDAKİ AGGREGATE FUNCTİONLAR GERİYE TEK SATIR TEK SÜTUN DÖNERLER...

--GROUP BY => TABLODAKİ ALANLARI BELİRLİ BİR ALANA GÖRE GRUPLAMAYA YARAR... 
-- group by kullanımında group by uygulanan satır select ifadesinde seçilmek zorundadır. 

SELECT  CategoryID FROM Products
GROUP BY CategoryID

select CategoryID from Products
group by SupplierID

select ProductID from [Order Details]
group by ProductID

-- CategoryId'ye göre ürün sayısı
SELECT CategoryID,cOUNT(*) FROM Products
GROUP BY CategoryID


select ProductID,Count(*) from [Order Details]
group by ProductID


select ProductID,Sum(od.Quantity) as Adet from [Order Details] as od
group by ProductID


select ProductID,Count(*) as SiparisSayi,Sum(od.Quantity) as SiparisMiktari from [Order Details] as od
group by ProductID

-- group by 'da where kullanılmaz...
-- having ifadesi group by querylerinde kriter belirlemek için kullanılır...

--ProductId'ye göre ProductId'si 1 olanları grubla 
-- kaynaktan id'si 1 olanları al ve grupla
select ProductID,Count(*) as SiparisSayi,Sum(od.Quantity) as SiparisMiktari from [Order Details] as od
where ProductId = 1
group by ProductID

-- ProductID'ye göre grupla, 1 olanları getir
-- kaynaktan tamanını al ve grupla
select ProductID,Count(*) as SiparisSayi,Sum(od.Quantity) as SiparisMiktari from [Order Details] as od
group by ProductID
having ProductId = 1 -- gruplu verilerde kriter belirler...


select ShipCountry from Orders
WHERE ShipCountry = 'Spain'
group by ShipCountry
Having ShipCountry  = 'UK'

select ShipCountry from Orders
group by ShipCountry
Having ShipCountry  = 'UK'

select ShipCountry,COunt(*) from Orders
group by ShipCountry
Having ShipCountry  = 'UK'

--nakliyecilerin taşıma yaptıkları ülkeler
select o.ShipVia,o.ShipCountry,Count(*)  from Orders o
group by o.ShipVia,o.ShipCountry 

select o.ShipVia,o.ShipCountry,o.ShipCity ,Count(*)  from Orders o
group by o.ShipVia,o.ShipCountry,o.ShipCity

select o.ShipVia,o.ShipCountry,o.ShipCity ,Count(*)  from Orders o
group by o.ShipVia,o.ShipCountry,o.ShipCity
having o.ShipCountry ='UK' AND O.ShipCity= 'London'

-- subquery,joins,insert,update,delete






