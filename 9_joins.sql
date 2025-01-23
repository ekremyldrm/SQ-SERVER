select * from Categories c
join Products p on c.CategoryID = p.CategoryID



-- inner join ve join aynı şeydir
--left join ve left outer join aynı şeydir
--right join ve right outer join...
--full join ve full outer join...

select * from Categories c 
left outer join Products p on c.CategoryID = p.CategoryID


-- ürünü olmayan kategoriler

-- sub query
select * from Categories
where CategoryID not in (select CategoryID from Products where CategoryID is not null)

--outer join
select * from Categories c 
left join Products p on c.CategoryID = p.CategoryID
where p.CategoryID is null




--right join 
select* from Categories c
right join Products p
on c.CategoryID = p.CategoryID

-- yukarıdaki sonucu left yazarakta elde edebiliriz
select * from Products p
left join Categories c on c.CategoryID = p.CategoryID

-- full join
select *from Categories c
--full outer join Products p on c.CategoryID = p.CategoryID
full join Products p on c.CategoryID = p.CategoryID


-- corss join
-- cross join bütün kayıtları eşleştirir
select * from Ogrenciler o
cross join Dersler d

