select * from Products
where UnitsInStock > 20 and UnitsInStock < 40

select * from Products
where UnitsInStock >= 20 and UnitsInStock <= 40

--between operatörü.. belirli aralığa göre veri getirmek için kullanılır
select * from Products
where UnitsInStock between 20 and 40

select GETDATE() -- tarih verisini döndürür,
select YEAR(getdate()) -- yıl bilgisini döner
select MONTH(getdate()) -- ay bilgisini döndürür
select DAY(getdate())

select GETDATE() AS TARIH,YEAR(GETDATE()) AS YIL,MONTH(GETDATE()) AS AY
,DAY(GETDATE()) AS GUN

select YEAR(OrderDate),MONTH(OrderDate),DAY(OrderDate), * from Orders

SELECT * FROM Orders
WHERE YEAR(OrderDate)  = 1998

SELECT * FROM Orders
WHERE YEAR(OrderDate)  = 1998 AND MONTH(OrderDate) BETWEEN 1 AND 3



-- like => benzer . veritabanında koloında arama yapmak için kullanılır
select * from Products
where ProductName like '%ku%' -- içerisinde geçen

select * from Products
where ProductName like 'ch%' -- ile başlayan

select * from Products
where ProductName like '%ku' -- ile biten

-- not like 
select * from Products
where ProductName not like '%ku%' -- içerisinde geçmeyen

select * from Products
where ProductName not like 'ch%' -- ile başlamayan

select * from Products
where ProductName not like '%ku' -- ile bitmeyen

-- is null
select * from Suppliers
where Region is null

-- is not null
select * from Suppliers
where Region is not null





Select * from Orders where 1=2

SELECT UPPER('EkReM'),LOWER('GökBerK')

select 'ekrem' where 1<2
select 'ekrem' where 'a'='A'

-- Description alanı sql kodu olduğu için yazılışta sql ifadesine benzer.. buyüzden isimlendirme yaparken sql kodlarını obje isimlrimize vermemeliyiz... eğer bu alanisimi normal isim gibi görmek isterseniz [] kullanabilirsiniz
select CategoryName, [Description] from Categories

-- obje isimlerinde boşluk kullanılmaz...
select * from [Order Details]

select  CategoryName as [Kategori Adı], Description as Aciklama  from Categories
