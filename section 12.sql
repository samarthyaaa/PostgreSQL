create table prod(id serial primary key, name varchar(40), department varchar(40), prices integer, weights integer);
insert into prod (name, department, prices, weights)values ('Shirts','Clothes',20,1);
alter table prod alter column prices set not null;
alter table prod alter column prices set default 99;
alter table prod add unique (name);
alter table prod add check (prices>0);
