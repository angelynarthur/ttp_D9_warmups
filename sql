--find the total sales ($$) and number of orders per month in the database (northwind).
-- don't worry about months with no sales.


-- Which month has the highest average sales ($$) over every year of the database?
--(hint you can either start from scratch or make use of the previous answer)

--
select sum(order_details.unit_price * order_details.quantity) as total_sales, count(*), extract (month from orders.order_date) as month, 
extract (year from orders.order_date) as year
from order_details
inner join orders on orders.order_id = order_details.order_id group by month, year;

--
with sums as (select sum(order_details.unit_price * order_details.quantity) as total_sales, count(*) as total_count, extract (month from orders.order_date) as month, 
extract (year from orders.order_date) as year
from order_details
inner join orders on orders.order_id = order_details.order_id group by month, year)

select *, (total_sales/total_count) as total_avg from sums group by month, year, total_sales, total_count;

