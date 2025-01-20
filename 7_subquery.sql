
use Northwind


--  tablodan  degiskene veri atama 1. yol..
declare @ortFiyat money = (select avg(UnitPrice) from Products)
select @ortFiyat

declare @avgPrice money;
select @avgPrice= avg(UnitPrice) from Products;
--select @avgPrice
--fiyati ortalamanin üzerinde olanlar..
select * from Products
where UnitPrice  > @avgPrice

declare @katId int =1
select * from Products 
where CategoryID=@katId



-- subquery
--alt sorgu

-- önce alt sorgu çalisir, daha sonra üst sorgu çalisir
select * from Products
where UnitPrice > (select  avg(UnitPrice) from Products)

--hiç alis veris yapmamis müsteriler
select *from Customers as c
where CustomerID not in (select CustomerID from Orders)


--hiç alis veris yapmis müsteriler
select *from Customers as c
where CustomerID  in (select CustomerID from Orders)



select * from Customers as c -- enaz gönderi yapılan müşteri
where c.Country in (
select top 1 ShipCountry from Orders -- enaz gönderi yapılan ülke
group by ShipCountry
order by Count(*)
)


-- yukarıdaki bölümde önce iç sorgu sonra dış sorgu çalıştırılır...

-- subquery 2

-- select ile yazılan subquerylerde önce dış sorgu sonra iç sorgu çalışırılır
select 
		ProductID,
		ProductName,
		UnitPrice,
		UnitsInStock,
		CategoryID,
		(select CategoryName from Categories where CategoryID = p.CategoryID) as KategoriAdi
from Products as p 


select 
		c.*,
		(select count(*) from Products where CategoryID = c.CategoryID) as UrunSayisi
from Categories as c


