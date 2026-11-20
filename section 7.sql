SORTING RECORDS
select * from products order by price;
select * from products order by price desc;
select * from products order by name;
select * from products order by price,weight;

select * from users1 offset 40;
select * from users1 limit 5;
select * from products order by price desc limit 5 offset 1; 
