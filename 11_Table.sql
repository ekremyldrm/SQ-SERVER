/*
	
	DDL (Data Defination Language)

	sql server objeleirni yönetmek için kullanılır...

	create (oluşturmak için)
	alter (düzenlemek için) 
	drop (silmek için)

	create objeTipi ObjeAdi

	alter objeTipi ObjeAdi

	drop objeTipi ObjeAdi


	sql server constraint
	primary key,
	foreign key,
	unique key  => pk dışında tabloda benzersiz alan oluşturmak için kullanılır...,
	check constraint
	default 

*/

insert Products
(ProductName,UnitPrice)
values
('X  Ürünü',50)

insert Products
(ProductName)
values
('Y  Ürünü')

select* from Products
order by ProductID DESC





use Northwind

Create table FirstTable
(
	Id int,
	Adi nvarchar(50)
)

-- tablo düzenleme
alter table FirstTable
 add KayitTarihi datetime

 select * from FirstTable

 -- tablo silme
 drop table FirstTable


 ---
 create table Cinsiyet
 (
	Id int identity(1,1) primary key, -- pk'nin ismi sqlserver tarafından veriliyor..
	Adi nvarchar(50),
	Lang nvarchar(50) default('tr') -- lang alanının default değerinin tr olduğunu söylüuoruz...
 )

 select * from Cinsiyet
 insert Cinsiyet
 (Adi)
 values
 ('Kadın')

 insert Cinsiyet
 (Adi)
 values
 ('Erkek')

 create table Calisanlar
 (
	Id int identity(1,1),
	Adi nvarchar(50) not null,
	SoyAdi nvarchar(50),
	CinsiyetId int not null,

	constraint pk_CalisanId  primary key(Id), --pk'nin ismi bizim tarafamızadn verilir...
	constraint fk_CalisanCinsiyet foreign key(CinsiyetId) references Cinsiyet(Id) -- ilişkilendirme yapmış oluyoruz....
 )


 alter table Calisanlar
	 add TcNo nvarchar(50)

alter table Calisanlar
	add constraint IX_Unique_Cinsiyet unique(TcNo) -- unique constraint


alter table Calisanlar 
	add Yas int


alter table Calisanlar
	add constraint YasKontrol check(Yas>18) -- check constraint


alter table Calisanlar
	add Maas decimal

select * from Calisanlar

-- tablodan değer silme...
alter table Calisanlar
  drop column Maas

