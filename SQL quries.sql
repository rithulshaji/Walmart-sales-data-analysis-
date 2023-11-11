Create database if not exists walmartsales;
use walmartsales;
create table if not exists sales ( invoice_id varchar(30) not null primary key, 
branch varchar(5) not null, 
city varchar (30) not null,
customer_type varchar(30) not null,
gender varchar (30) not null, 
product_line varchar (100) not null,
unit_price decimal (10,2) not null,
quantity int not null, 
tax_pct float(6,4) not null,
total decimal (12,4) not null,
date datetime not null,
time time not null,
payment varchar (15) not null,
cogs decimal (10,2) not null,
gross_margin_pct float (11,9),
gross_income decimal (12,4),
rating float (2,1)
);

select 
 time, 
 (case 
    when `time` between "00:00:00" and "12:00:00" then "morning"
    when `time` between "12:01:00" and "16:00:00" then "afternoon" 
    else "evening"
 end) as time_of_day
 from sales;

alter table  sales add column time_of_day varchar(20);
 
update sales set time_of_day = (case 
    when `time` between "00:00:00" and "12:00:00" then "morning"
    when `time` between "12:01:00" and "16:00:00" then "afternoon" 
    else "evening"
 end);
 
select date, 
dayname(date) as day_name
from sales; 
 
 alter table sales add column day_name varchar(10);
 update sales set day_name = dayname(date);
 
 select date, 
 monthname(date) as month_name
 from sales; 

 alter table sales add column month_name varchar(10);
 update sales set month_name = monthname(date);
 
 select distinct city from sales;
  select distinct city, branch from sales;
  
select distinct product_line from sales;  

select payment,
 count(payment) as cmp from sales
group by payment
order by cmp desc;
 
SELECT
	SUM(quantity) as qty,
    product_line
FROM sales
GROUP BY product_line
ORDER BY qty DESC;
 
 select month_name as month,
 sum(total) as total_revenue 
 from sales
 group by month_name 
 order by total_revenue;
 
select month_name as month,
sum(cogs) as cogs
from sales
group by month_name
order by cogs desc;

select product_line,
sum(total) as total_revenue 
from sales
group by product_line
order by  Total_revenue desc;

select city,
sum(total) as total_revenue 
from sales
group by city
order by  Total_revenue desc; 

SELECT
	product_line,
	AVG(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;

select branch, 
sum(quantity) as qty
from sales
group by branch
having sum(quantity)>(select avg(quantity) from sales); 
  
select gender, 
product_line, 
count(gender) as total_count
from sales
group by gender, product_line
order by total_count desc;

select product_line,
round(avg(rating),2) as avg_rating 
from sales
group by product_line 
order by avg_rating desc;

-- ----------------------------------------------------------------------------------
select
time_of_day,
count(*) as timeofday
from sales 
where day_name= "monday"
group by time_of_day
order by timeofday desc;


select 
customer_type,
sum(total) as revenue
from sales
group by customer_type
order by revenue desc;
 
select 
 city,
 round(avg(tax_pct),2) as vat
 from sales
 group by city
 order by vat desc;

select 
 customer_type,
 avg(tax_pct) as vat
 from sales
 group by customer_type
 order by vat desc;
 
 select distinct customer_type from sales;
 
 select distinct payment from sales;
 
 select customer_type,
 count(*) as Ctmr 
 from sales
 group by customer_type
 order by ctmr desc;
 
 
 select customer_type,
 count(*)
 from sales
 group by customer_type;
 
select gender,
 count(*) as gender_cnt
 from sales
 group by gender
 order by gender_cnt desc;
 
select gender,
 count(*) as gender_cnt
 from sales
 where branch= "a"
 group by gender
 order by gender_cnt desc;
 
 select time_of_day,
 avg(rating) as rating
 from sales
 group by time_of_day
 order by rating desc;
 
 
 select time_of_day,
 avg(rating) as rating
 from sales
 where branch = "c"
 group by time_of_day
 order by rating desc;
 
 select day_name,
 avg(rating) as avg_rating
 from sales
 group by day_name
 order by avg_rating desc;
 
select day_name,
 avg(rating) as avg_rating
 from sales
 where branch = "a"
 group by day_name
 order by avg_rating desc;
 
 -- -------------------------------------------------------------------------------
 
 
 SELECT 
	AVG(quantity) AS avg_qnty
FROM sales;

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
GROUP BY product_line;

 -- ----------------------------------------------------------------------------------------------------------------------------------------
 select * from sales;
select distinct time_of_day from sales;
