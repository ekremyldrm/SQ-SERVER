use Northwind


/*
		-- join 
		birden fazla tablodan veri elde etmek için kullanılır. sorguya birden fazla tablo dahil edilir

		iç join
				-- inner join
				-- sorguya dahil edilen tabloların eşleşen kayıtlarını getirir
		dış join
				-- outer join 
*/

--1. yol
select * from Products as p
inner join Categories as c on p.CategoryID  = c.CategoryID

--2. yol
select * from Products as p
join Categories as c on p.CategoryID  = c.CategoryID

select p.ProductName, p.UnitPrice,p.UnitsInStock,c.CategoryName from Products as p
join Categories as c on p.CategoryID  = c.CategoryID


select p.ProductName, p.UnitPrice,p.UnitsInStock,c.CategoryName,s.CompanyName from Products as p
join Categories as c on p.CategoryID  = c.CategoryID
join Suppliers as s on s.SupplierID = p.SupplierID


select c.CategoryName,COUNT(*) from Products as p
inner join Categories as c on c.CategoryID = p.CategoryID
group by c.CategoryName


select * from [Order Details]

select * from Products as p
join [Order Details] as od on p.ProductID = od.ProductID 
where p.ProductID=11

select * from [Order Details] where ProductID=11

select *,UnitPrice * Quantity - (UnitPrice * Quantity * Discount) as SiparisBazliSatisFiyat
from [Order Details] 
where ProductID=11

select Sum(UnitPrice * Quantity - (UnitPrice * Quantity * Discount)) as UrunBazliSatisFiyat 
from [Order Details] 
where ProductID=11


select  * from Products
where ProductID =11

select 
 p.ProductName
	,Sum(od.UnitPrice * od.Quantity - (od.UnitPrice * od.Quantity * od.Discount))
from Products p
join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductName



select 
	--Sum(od.UnitPrice * od.Quantity - (od.UnitPrice * od.Quantity * od.Discount))
	*
from [Order Details] od 
join Products p on od.ProductID = p.ProductID
join Categories c on p.CategoryID = c.CategoryID

select 
	CategoryName,
	Sum(od.UnitPrice * od.Quantity - (od.UnitPrice * od.Quantity * od.Discount))
from [Order Details] od 
join Products p on od.ProductID = p.ProductID
join Categories c on p.CategoryID = c.CategoryID
group by c.CategoryName




-- derived table... sorgu'dan türetilen tablo...
-- aslında her bir result sorgudan türetilir. ama bunu sorgudan sorgu türeterektte elde edebiliriz..

select * from (
		select * from Products
) as p



select  ProductName as UrunAdi,Discontinued as Satistami  from Products
--where Satistami =0 -- takma isimler where'de kullanılmaz..
order by Satistami 

-- takma isimlerew (as) where uygulanamaz.. bu gibi durumlarda sorgu başka bir sorguya aktarılarak filtre uygulanabilir,


select * from (
select  ProductName as UrunAdi,Discontinued as Satistami  from Products
) as derivedTable
where derivedTable.Satistami=1

-- satış yaptığım kategoriler
select 
		derivedTable.UrunAdi,
		c.CategoryName
from (
select  ProductName as UrunAdi, CategoryID as KatId,Discontinued as Satistami  from Products
) as derivedTable
inner join Categories as c on c.CategoryID = derivedTable.KatId
where derivedTable.Satistami=1


-- outer join 

--left join
-- left join iki tabloyu birleştirirken sol tarafın tamamanı getirir, sağ tarafın sadece eşleşen kayıtlraını getirir...
select * from Categories as c
left join Products  as p on c.CategoryID = p.CategoryID


-- where  kaynak veri alınırken uygulanır.. where fiziki tabloya uygulanır...

select 
		EmployeeID,
		FirstName,
		LastName,
		Title,
		YEAR(BirthDate) as DogumYili,
		YEAR(GETDATE()) - YEAR(BirthDate) as Yas -- sorgu sonucu oluşturdum
from Employees
--where Yas >70



-- sonucu başka tabloya aktarıyorum...

-- sonucu t tablosuna aktardık... t tablosu içteki sorgudan türetildi...
select * from (
select 
		EmployeeID,
		FirstName,
		LastName,
		Title,
		YEAR(BirthDate) as DogumYili,
		YEAR(GETDATE()) - YEAR(BirthDate) as Yas -- sorgu sonucu oluşturdum
from Employees
) as t
where Yas >70













