subquery:
select name, price from products where price>(select max (price) from products where department ='Toys');
select * from orders; 
select id from orders;
select count(*) from orders; 
select name, price,(select max(price) from products)  from products where price  > 867;
select name, price,(select price from products where id=3)as id_3_price from products where price > 867;
select name, price_weight_ratio from(select name, price/weight as price_weight_ratio from products)as p where price_weight_ratio >5;

select avg(order_count) from (select user1_id, count(*) as order_count from orders group by user1_id )as p;

select user1_id from orders where product_id=3;
select first_name from users1 join (select user1_id from orders where product_id=3) as o on o.user1_id=users1.id;
select id from orders where product_id in (select id from products where price/weight>50);
select name ,price from products where price >(select avg(price) from products);
select name, department from products where department not in( select department from products where price<100);

select name, department, price from products where price >all (select price from products where department='Indusrtial');
select name, department, price from products where price >=any (select price from products where department='Indusrtial');

select name, department, price from products as p1  where p1.price = (select max(price) from products as p2 where p2.department = p1.department);

select p1.name, (select count(*) from orders as o1 where o1.product_id=p1.id)as num_orders from products as p1;

select(select max(price) from products)/(select avg(price) from products);
