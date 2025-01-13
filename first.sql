-- veri tipleri...
--https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16

print('Merhaba SQL ')

print('End')

-- değişken oluşturma...
declare @sayi1 int=5,@sayi2 int=20
declare @sonuc int = @sayi1+@sayi2
print @sonuc

declare @isim nvarchar(50) = 'ekrem'
declare @yas int = 36
declare @cinsiyet nvarchar(50) = 'e'


declare @byte tinyint=300
declare @smallint smallint = 32700
declare @int int
declare @long bigint 

declare @x real
declare @y float
declare @z decimal(5,3)=50
select @z

-- metinsel veritiplerinde tip belirtilirken karakter sayısı belirtilmelidir...
declare @a char(10) = 'şimal'
declare @b varchar(8000)

declare @c nchar(10) ='yiğit'
declare @d nvarchar(max) -- max...

-- metinsel tiplerde karakter sayısını verir
select @a
select @c

-- değişkenbe değer atama
set @a ='ŞİMAL'
SELECT @a -- SELECT İFADESİ İLE DEĞİŞKENİN DEĞERİ SEÇİLİR...

-- KARAR YAPISI
IF 3=3
BEGIN 
		SELECT 'EŞİT'
END
ELSE
BEGIN
		SELECT 'EŞİT DEĞİL'
END

----

DECLARE @i int=0
while @i < 10
begin
	select 'Merhaba Dünya'
	set @i =@i+1
end



