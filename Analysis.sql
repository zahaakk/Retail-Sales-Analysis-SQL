create database if not exists Retail_Sales ;
use retail_sales ;

create table if not exists retail_sales 
		(transactions_id int PRIMARY KEY,
         sale_date Date ,
         sale_time Time,
         customer_id int,
         gender	Varchar(25),
         age int,
         category varchar(25),	
         quantiy int,
         price_per_unit	int ,
         cogs float,
         total_sale float
) ;

select * from retail_sales ;

-- How Many Sales We have ?
select count(*) total_sales from retail_sales ;

-- How many Unique Customers We have ?
select  count(distinct customer_id) unique_customers from retail_sales ;

-- How Many Unique Categories we have
select  count(distinct category) unique_category from retail_sales ;
select  distinct category unique_category from retail_sales ;

-- Data Analysis & Buissness Key Problems & Answers

# 1. Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales
where sale_date = '2022-11-05' ;

# 2. Write a SQL query to retrieve all transactions where the category is 'Clothing' 
# and the quantity sold is more than 4 in the month of Nov-2022.

select * from retail_sales
where category = 'Clothing' and quantity >= 4 
and (sale_date between '2022-11-01' and '2022-11-30');

#3.Write a SQL query to calculate the total sales (total_sale) for each category.

select 
	category,
    sum(total_sale) as Total_Sales
from retail_sales
group by category 
order by Total_Sales desc ;

# 4.Write a SQL query to find the average age of 
# customers who purchased items from the 'Beauty'category.
select avg(age) as Average_Age 
from retail_sales 
where category = 'Beauty'
;
#5.Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales 
where total_sale >= 1000; 

# 6. Write a SQL query to find the total number of transactions (transaction_id) 
# made by each gender in each category.
select category,gender,count(transactions_id) as Count
from retail_sales 
group by category,gender 
order by category ;

# 7. Write a SQL query to calculate the average sale for each month.
# Find out best selling month in each year.

select * from retail_sales ;

select 
	year(sale_date) as year ,
	Monthname(sale_date) as Month, 
	round(avg(total_sale),2) as Average_Sale
from retail_sales 
group by year(sale_date), Monthname(sale_date) 
order by Average_Sale desc 
limit 2 ;

#8.Write a SQL query to find the top 5 customers based on the highest total sales 
select * from retail_sales 
order by total_sale desc limit 5 ;

# 9. Write a SQL query to find the number of unique customers 
# who purchased items from each category.

select category,count(distinct customer_id) as unique_Customers from retail_sales 
group by category ;

# 10. Write a SQL query to create each shift and number of orders 
# (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

select *,
case 
    when time(sale_time) <= '12:00:00' then 'Morning'
	when time(sale_time) between '12:00:00' and '17:00:00' then 'Afternoon'
	when time(sale_time) > '17:00:00' then 'Evening'
end as Shift
from retail_sales ;

-- END OF PROJECT