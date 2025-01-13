--
/*
	where (kriter) operatörüleri 
	=  eşit
	!= eşit değil
	<> eşit değil
	> büyüktür
	>= büyük eşittir
	< küçüktür
	<= küçük eşittir
	in			=> (içeren)
	not in		=> (içermeyen)
	like		=> (benzer) 
	not like	=> (benzer olmayan)
	is null		=> null olanlar
	is not null => null olmayanlar
	between		=> aralık belirmek için
*/

-- ShipCountry'si fransa olanlar
select * from Orders
where ShipCountry = 'France'

-- ShipCountry'si fransa olmayanlar
select * from Orders
where ShipCountry != 'France'

-- ShipCountry'si fransa olmayanlar
select * from Orders
where ShipCountry <> 'France'


select * from Products
where UnitsInStock> 10

-- styok miktarı 10'dan büyük olanları asc sıralayalım
select * from Products
where UnitsInStock > 10
order by UnitsInStock 

select * from Products
where CategoryID = 1


-- mantısal ve (and) c#'ta &&

select * from Products
where CategoryID = 1 and UnitsInStock < 20

-- Sipariş ülkesi fransa olanlar ve Nakliyecisi 1 olanlar
select * from Orders
where ShipCountry  = 'France' and ShipVia  = 1


--  mantısak veya (or) c# ||
select * from Orders
where ShipCountry = 'France' or ShipCountry = 'Brazil'

-- Fransa'ya ve Brazilyaya 1 nolu taşıyıcı ile giden siparişer
select * from Orders
where (ShipCountry = 'France' or ShipCountry = 'Brazil') and ShipVia = 1


select * from Orders 
where ShipCountry  ='France' or ShipCountry = 'Brazil' or ShipCountry = 'Spain'

--eşitlik durumlarında birden fazla değeri tek seferde vermek için kullanılır

select * from Orders
where ShipCountry in ('France','Brazil','Spain')