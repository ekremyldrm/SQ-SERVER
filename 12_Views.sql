/*
	Views

	Sorgu sonucu oluşan tablolardır. bu tablolar select ifadesinden gelen verileri gösterir.... aynı zamanda yazılan query view içerisinde saklanır. yani sorgu view objesine kapsüllenerek sonraki çalışmalarda sorguyu tektar yazmak yerine view adını yazarak sonuıcu hızlıca erişiriz..

	-- sql serverda oluşturulan viewlar ;
	db içerisinde Views sekmesi içerisinde bulunur...

*/

select Count(Adi),Count(SoyAdi) from Calisanlar

--Count => * ile kullanılırsa satırın tamamını sayar...* yerine eğer kolon adını yazarsanız null olmayan satırları sayar..

select 
* from Shippers s
left join Orders o on s.ShipperID= o.ShipVia

go

create view vwNakliyeDurum as
select 
	s.CompanyName,
	Count(ShipVia) as TasimaSayi
	from Shippers s
left join Orders o on s.ShipperID= o.ShipVia
group by s.CompanyName
go

-- Viewlar tablolar gibidir, fark olarak tablo verilerden viewlar sorgulardan oluşur. view çağrıldığında view içerisindeki sorgu çalışır...

-- VİEW İÇERİSİDEKİ SELECT SORGUSUNA VİEW ÜZZERİNDEN WHERE,GROIPBY, ORDER BY VB. İŞLEMLER UYGULANABİLİR
select * from vwNakliyeDurum
where TasimaSayi > 0

SELECT * FROM vwNakliyeDurum
ORDER BY TasimaSayi 


-- VİEWLAR DİKKATLİ KULLANILMASI GEREKEN SQL SERVER OBJELERİDİR. EĞER VİEW İÇERİSİNDEKİ SELECT İFADESİNDE FİLTRE YOKSA VERİNİN TAMAMI GETİRELECEĞİ İÇİN PERFORMANS SORUNUNA NEDEN OLABİLİR...



GO


CREATE VIEW VWURUNLER
AS
	SELECT *FROM Products

GO

SELECT * FROM VWURUNLER
WHERE CategoryID=2

GO

-- VİEW'İ DÜZENLİYORUZ
ALTER VIEW VWURUNLER
AS
	SELECT * FROM Products
	WHERE CategoryID=1
GO


-- VİEWLARI DESİGN PENCERESİNDE OLUŞTURABİLİRSİNİZ... DB > VİEWS SEKMESİ SAĞ TIK NEW VİEW
-- vwProducts view'ini design'adn oluşturduk..
select * from vwProducts



-- bir view'i sql sevrdan silmek için 
-- drop view VWURUNLER




select s.CompanyName from Orders o
left join Shippers s on s.ShipperID= o.ShipVia
group by s.CompanyName


select * from Shippers
select * from Orders where ShipVia =4

select * from Products
select * from vwProducts

-- insert işlemi => viewlarda insert işlemi yapılabilir.
insert VWURUNLER
(ProductName,UnitPrice,CategoryID)
values
('Bizim Ürün',50,2)

select * from Products
where ProductName like '%Bizim%'

select * from VWURUNLER
where ProductName like '%Bizim%'

select * from vwProducts

insert vwProducts
(Expr1)
values
('Test Test Test')

select * from vwProducts
where Expr1 like '%Test%'

select * from Products
where ProductName like '%Test%'


-- view çalıştırıldığıdan view'in gövdesindeki sorgu çalışıtırılır ve view'a aktarılır. View üzerine uygulanan filtre (where) kaynağa değil view'a yapılır...

-- user defined fuınctions
-- procedureler


-- entity framework