GREATEST FUNCTION:
select greatest(20,10,30);
select name, weight, greatest(30,2*weight) from products;
LEAST FUNCTION:
select least(20,30,10);
select name, price, least(price*0.5,400) from products;

select name, price, case 
	when price>600 then 'high' 
	when price>300 then 'medium'
	else 'cheap'
end
from products;
