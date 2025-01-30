
/*

	Stored Procedure (SP) =>  (Sakli Yordamlar) sql server en önemli objerilidir..
*/


-- parse
create procedure ilksp
as
begin
		select 'selam ben sp'
end

go
-- sp'yi çalistirma
execute ilksp
exec ilksp

go

create procedure mesaj
(
	@msj nvarchar(50)
)
as
begin
	
	 select @msj as mesaj
	
end

go

exec mesaj 'merhaba'
exec mesaj 'selam'



go

create proc KatList
(
	@KatId int
)
as
begin	
		select * from Products
		where CategoryID = @KatId
		order by UnitPrice
end
--
exec KatList 1
exec KatList 2
exec KatList 3

-- procedureler geriye daima int deger dönerler...sp içerisinde return ifadesi ile deger dönülür. eger return ifadesi yoksa default 0 degeri döner....
--sp'den dönen degeri alalim...
declare @retVal int
exec @retVal= KatList 1
select @retVal


go
alter proc ToplaGel
(
	@sayi1 int,
	@sayi2 int
)
as
begin	
		return @sayi1 + @sayi2		
		select 'test' -- return ifadesinden sonraki komutlar çalistirilmaz tipki c# dilindeki gibi.....
end
go
declare @result int
exec @result =  ToplaGel 2,2 -- topla gelden dönen deger result'a atanir. eger return ifadesi var ise return'in degeri, yoksa oolarak döner
select @result

-- store procedureler metotlar gibi geriye tek deger dönerler. metotlardan farki int dönmeleridir. (metotlar her türlü tipi dönebilirler)

declare @num1 int=50,@num2 int=25
declare @result int;
exec @result = ToplaGel @num1,@num2
select @result


go
create proc  Islem
(	@sayi1 int,
	@sayi2 int,
	@csonuc int output,
	@casonuc int output,
	@bsonuc int output	
)as
begin
	
	--select @csonuc = @sayi1-@sayi2 -- işlemin sonucunu csonuc'a aktarır...
	set @csonuc = @sayi1- @sayi2
	set @casonuc = @sayi1 * @sayi2
	set @bsonuc = @sayi1 / @sayi2

	return @sayi1+@sayi2

end

declare @x int,@y int,@z int,@m int
declare @k int=10,@l int= 2

exec @m =  Islem @k,@l,@x output,@y output,@z output
select @m,@x,@y,@z

------
declare @x int,@y int,@z int,@m int
declare @k int=10,@l int= 2

exec @m =  Islem @k,@l, @bsonuc= @x output, @casonuc = @y output, @csonuc = @z output
select @m,@x,@y,@z

--

exec AddShipers 'BT Taşımacılık','341134'

DECLARE @R INT
exec @R =  AddShipers 'BT nAK','341134'
SELECT @R

select * from Shippers
