
select * from Categories

select * from Products

select * from Suppliers

--sütun seçme
select ProductName,UnitPrice,UnitsInStock  from Products

select * from Employees

select FirstName,LastName,Title,ReportsTo from Employees

--sütunları birleştirme
select FirstName + ' ' +  LastName from Employees

-- alises (as)
-- takma isim
select CategoryName as KategoriAdi from Categories

select p.ProductName,p.CategoryID,p.SupplierID from Products as p



-- order by 
-- tabloyı select ifadelerinde belirlenen alan göre sırala. asc (artan a-z) ve desc (azalan z-a)
select * from  Products
order by UnitPrice -- (default asc) ascending sıralama

select * from Products
order by UnitPrice asc -- ascending sıralama

select * from Products
order by UnitPrice desc
