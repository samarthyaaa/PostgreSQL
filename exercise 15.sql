Group By 
Write a query to print the number of paid and unpaid orders.
result :
+-------+-------+
| paid  | count |
+-------+-------+
| true  | 4     |
+-------+-------+
| false | 2     |
+-------+-------+
For reference, here is an example of the orders table:
+----+---------+------------+-------+
| id | user_id | product_id | paid  |
+----+---------+------------+-------+
| 1  | 1       | 3          | true  |
+----+---------+------------+-------+
| 2  | 3       | 3          | false |
+----+---------+------------+-------+
| 3  | 5       | 5          | true  |
+----+---------+------------+-------+
| 4  | 1       | 4          | true  |
+----+---------+------------+-------+
| 5  | 4       | 2          | false |
+----+---------+------------+-------+
| 6  | 2       | 1          | true  |
+----+---------+------------+-------+
select paid ,count(*) from orders group by paid;
