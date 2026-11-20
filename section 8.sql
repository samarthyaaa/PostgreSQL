UNION AND INTERSECTION
(select * from products order by price desc limit 4)union all
(select * from products order by price/weight desc limit 4);
(select * from products order by price desc limit 4)intersect all
(select * from products order by price/weight desc limit 4);
(select * from products order by price desc limit 4)except
(select * from products order by price/weight desc limit 4);
