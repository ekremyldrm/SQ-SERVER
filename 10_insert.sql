
insert Ogrenciler
(Adi)
values
('Emine')


insert Ogrenciler
(Adi)
values
('Gökberk')

insert Ogrenciler
(Adi)
values
('Veli')


-- çoklu insert
insert Ogrenciler
(Adi)
values
('Ern'),
('Mahmut')

-- Identity alanlara insert işlemi yapılamaz
--insert Ogrenciler
--(Id,Adi)
--values
--(10,'Şimal')



insert Shippers
(CompanyName,Phone)
values
('Yıldırım Jet Kargo','191919')


select * from Ogrenciler
select * from Shippers


-- tablpdaki verileri günellemek için UPDATE komutu kullanılır...

-- UPDATE VE DELETE KOMUTLARI BÜTÜN TABLOYU ETKİLER. WHERE KRİTERİ OLMADAN KULLANMAYINIZ...
update Ogrenciler
	set Adi = 'Eren'
where Adi = 'Ern'

update Ogrenciler
	set Adi = 'EMİNE'
WHERE Adi = 'Emine'

-- update ve delete ifadelerini pklar üzerinden yazınız
update Shippers
	set CompanyName = 'YJK (Yıldırım Jet Kargo)',Phone= '5413510019'
where ShipperID = 4

select * from Shippers

select * from Ogrenciler

-- delete tablodaki verileri silmek için kullanılır...
delete Ogrenciler
where Id = 2

delete Ogrenciler
where Id = 3

delete Ogrenciler
where Id = 1443

