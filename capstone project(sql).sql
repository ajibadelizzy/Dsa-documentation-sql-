select * from [dbo].[KMS Sql Case Study]

---------------drop table [dbo].[KMS Sql Case Study]----------------

---------case scenario 1----------
---(1)product category with the highest sales----

select top 1
  product_category,
  sum(sales) as highest_sales
  from [dbo].[KMS Sql Case Study]
  group by product_category
  order by highest_sales desc
  
  -----------top & bottom 3 region in terms of sales----------
 -------(2)top 3 region in terms of sales-------
 
select top 3
  Region,
  sum(sales) as sales
  from [dbo].[KMS Sql Case Study]
  group by Region
  order by sales desc
--------bottom 3 region in terms of sales------
  
select top 3
  Region,
  sum(sales) as sales
  from [dbo].[KMS Sql Case Study]
  group by Region
  order by sales asc
  
  --------(3)total sales of appliances in ontairo-------

  select sum (sales) as total_sales
  from [dbo].[KMS Sql Case Study]
  where product_sub_category = 'appliances'
  and Region ='ontairo';

  -----------(4)advice for kms management on how to increase the revenue of bottom 10 customers-----------
  -----------the bottom 10 customer by revenue---------

select top 10 customer_name,
sum (sales) as total_sales
from [dbo].[KMS Sql Case Study]
group by Customer_Name
order by total_sales asc

-------------(5)kms incured the most shipping cost using which method----------

select top 1 Ship_Mode,
sum (Shipping_cost) as total_shipping_cost
from [dbo].[KMS Sql Case Study]
group by Ship_Mode
order by total_shipping_cost desc
------------delivery truck has the highest shipping cost---------

--------------(6) most valuable customer-----------
select top 5 customer_name,
Product_Name,
sum (Profit) as total_profit
from [dbo].[KMS Sql Case Study]
group by Customer_Name,Product_Name
order by total_profit desc
 ---------emily phan is the most valuable customer-------

 --------------- (7)small business customer with the highest sales---------

 select top 1 customer_name,customer_segment,
 sum (sales) as highest_sales
 from [dbo].[KMS Sql Case Study]
 where customer_segment ='small business'
 group by customer_name, customer_segment
  order by highest_sales desc
 ---------dennis kane---------


 ------------(8)coporate customer that placed the most oder in 2009-2012-------

 select top 1 customer_name,customer_segment,
 count (order_id) as total_orders
 from [dbo].[KMS Sql Case Study]
 where customer_segment ='corporate'
 and order_date between '2009'and '2012'
 group by customer_name,customer_segment
 order by total_orders desc
 -------------Adam Hart---------

 -----------(9)most profitatble consumer customer---------
 
 select top 1 customer_name,customer_segment,
 sum (profit) as highest_profit
 from [dbo].[KMS Sql Case Study]
 where customer_segment ='consumer'
 group by customer_name, customer_segment
  order by highest_profit desc