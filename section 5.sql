AGGREGRATE FUNCTION:
select contents from comments group by user_id;
select max(id) from comments;
select avg(id) from comments;
select sum(id) from comments;
select sum(id), id from comments;
select user_id,max(id) from comments group by user_id;
select user_id,count(id) as num_comments_created from comments group by user_id;
select count(user_id) from photos;
select count(*) from photos; 
select user_id, count(*) from comments group by user_id;
select photo_id, count(*) from comments group by photo_id;
select photo_id, count(*) from comments where photo_id<3 group by photo_id having  count(*)>2;
select user_id, count(*) from comments where photo_id<50 group by user_id having count(*)>20;
