
select * from df_orders;
--find top 10 highest reveue generating products 
select top(10) product_id, sum(sale_price) from df_orders group by product_id order by sum(sale_price) desc 

--find top 5 highest selling products in each region

with cte as (select region, product_id,sum(sale_price*quantity) as sales,
rank() over (partition by region order by sum(sale_price*quantity) desc) as rank
from df_orders
group by product_id, region)

Select product_id, sales,region from
cte where rank<6 
order by region, rank


--for each category which month had highest sales 

with cte as (select category, format(order_date,'yyyyMM') as order_year_month,
sum(sale_price) as sales
from df_orders
group by category, format(order_date,'yyyyMM')
--order by category, format(order_date,'yyyyMM')
)

select * from (
select *,
row_number() over ( partition by category order by sales desc) as rn
from cte ) a 
where rn=1

--find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
with cte as (Select year(order_date) as order_year, Month(order_date) as order_month,
sum(sale_price) as sales
from df_orders
group by Month(order_date), year(order_date)
--order by Month(order_date)
)

select order_month, 
sum (case when order_year=2022 then sales else 0 end ) as sales_2022,
sum (case when order_year=2023 then sales else 0 end ) as sales_2023
from cte
group by order_month;



--which sub category had highest growth by profit in 2023 compare to 2022
with cte as (
Select sub_category, year(order_date) as order_year, 
sum(sale_price) as sales
from df_orders
group by year(order_date), sub_category
) 
, cte2 as (
select sub_category, 
sum (case when order_year=2022 then sales else 0 end ) as sales_2022,
sum (case when order_year=2023 then sales else 0 end ) as sales_2023
from cte
group by sub_category
)
select Top(1) *, (sales_2023-sales_2022)*100/sales_2022 as profit_growth
from cte2 
order by profit_growth desc