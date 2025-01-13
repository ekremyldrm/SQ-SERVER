-- case when => select ifadelerinde koşul ifadeleri yazmak için kullanılır
-- > büyüktür operatörü
-- < küçük operatörü
-- = eşit operatörü
-- != eşit değil

select 
	ProductName,
	UnitPrice,
	case 
		when UnitPrice < 50 then 'Ucuz'
		when UnitPrice > 50 then 'Pahali'
	end as FiyatAciklama
from Products

-- Not : alises (as) columnlara order by uygulanabilir..
select 
  'ekrem' as Adi,
  case 
		when p.UnitsInStock < 10 then 'Stok Az' 
		when p.UnitsInStock < 50 then 'Stok Normal'
		else 'Stok Yeterli'
  end as StokDurum,
	p.*  -- p'nin tüm alanları
from Products as p
order by StokDurum



