/*
		DDL 
		FUNCTIONS

		user defined functions = kullanıcı tanımlı fonksiyon veritanımızda kullanılmak üzere oluşturulan fonksiyonlardır.. 
		ikiye ayrılırlar

		a)Table-valued Functions => geriye tablo dönen fonksiyonlardır

		b)Scalar-valued Functions => geriye değer dönen fonksiyonlardır.
		sorgu içerisinde kullanılan karmaşık sorgular, formüller vb. sql ifadelerini sorgularda ayırarak function içerisine yazıp sorgunun okunaklığını (temiz) arttırabiliriz ve bu functiondan farklı sorgulardada faydalanabiliriz (metot gibi)


		DB > Programmability > Functions > Table-valued Function ve Scalar-Valued Function içerisinde bulabilir..

*/

SELECT GETDATE()
SELECT YEAR(GETDATE())
SELECT UPPER('	ekrem')
select LTRIM('	 ekrem')
select LEN('bt akademi sql server')


go

create function ilkFunc()
returns nvarchar(50)
as
begin
		return 'Merhaba Ben Scalar-Valued Function'
end

go
--function çağırma
select dbo.ilkFunc()


go

--parametre alan fonksiyon....
create function Topla
(
	@sayi1 int, -- parametre
	@sayi2 int -- parametre
)
returns int
as
begin
 
	declare @sonuc int = @sayi1 + @sayi2
	return @sonuc
end

go

select dbo.Topla(2,2)
--
select 
	ShipperID,
	CompanyName,
	Phone,
	dbo.Topla(2,5)
from Shippers



-- yöntem 1. formül vb. durumların sorguya yazılması...
select 
	ProductName,
	UnitPrice,
	UnitsInStock,
	case when UnitsInStock between 0 and 10 then 'Stok Alarm'
	 when UnitsInStock between 11 and 20 then 'Stok Az'
	when UnitsInStock between 21 and 30 then 'Stok Normal'
	else 'Stok Yeterli'
	end as StokDurum
from Products

go
-- yöntem 2
-- function ayrı yazılır 
create function StokDurum(@stokMiktari int)
returns nvarchar(50) 
as
begin
	
 return	case  when @stokMiktari between  0 and 10 then 'Stok Alarm'
			  when @stokMiktari between  11 and 20 then 'Stok Az'
			  when @stokMiktari between  21 and 30 then 'Stok Normal'
			  else 'Stok Yeterli' 
		end
end

go

-- sorgu içerisinde function çağrılır....
select 
	ProductName,
	UnitPrice,
	UnitsInStock,
	dbo.StokDurum(UnitsInStock) as StokDurum -- tablonun alanını fonksiyona parametre olarak gönderiyoruz.
from Products


go

-- ürünün satış adetini gösteren fonksiyon...
create function SatisAdet(@urununId int)
returns int
as
begin
	
	return (select sum(o.Quantity) from [Order Details] o
			where o.ProductID=@urununId)
end
go

select dbo.SatisAdet(1),dbo.SatisAdet(2)

-- scalar-valued functionlar select sorgularında her bir satır için çalışır. eğer functiın içerisinde bir select ifadesi varsa büyük verili sorgularda performans sorunu oluşturabilir. dikkatli yazmak gerekir...
select 
	ProductName,
	SupplierID,
	CategoryID,
	dbo.SatisAdet(ProductID)
from Products 


go

-- scalar-valued functionlar sorgu içerisinde kullanılabilen functionlardır. geriye tek değer (tek satır, tek sütundur)

--tabled-valued function (geriye tablo dönen fonksiyonlardır...)

create function Kategoriler()
returns table 
as
	return (select * from Categories)

go

select * from Kategoriler()

-- table-valued functionlari viewlar gibi düşünebiliriz. Viewlar select ifalerinde kullanılır. insert,update,delete işlemi yapılmaz..viewlardan farkı parametre almalarıdır...

-- örnek View
go
-- suppilers tablosundan bütün kayıtları getirir...
create view Tedarikciler
as
	select * from Suppliers

go

-- suppliers tablosundan Id'ye göre kayıt getirir...
create function fnTedarikciler(@Id int)
returns table 
as
	return (select * from Suppliers where SupplierID =@Id)

go

select * from fnTedarikciler(1)
select * from fnTedarikciler(2)

go

select dbo.StokDurum(1) as StokunDUrum
go

create function fnProducts(@CatId int)
returns table
	return (
		select 
				ProductID,
				ProductName,
				UnitPrice,
				UnitsInStock,
				CategoryID,
				SupplierID,
				dbo.StokDurum(UnitsInStock) as StokDurum
		from Products
		where CategoryID = @CatId
	)
go

select * from fnProducts(1)
select * from fnProducts(2)

select p.ProductName,p.StokDurum from fnProducts(3) p
order by p.StokDurum

select 
	p.ProductName,
	p.UnitPrice,
	p.StokDurum,
	s.CompanyName as TedarikciAdi,
	c.CategoryName as Kategorisi
from fnProducts(1) p
inner join Suppliers s on s.SupplierID = p.SupplierID
inner join Categories c on c.CategoryID = p.CategoryID

