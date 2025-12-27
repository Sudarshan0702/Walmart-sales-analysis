use walmart;
create table sales_wal( Store int , Date varchar(20) , Weekly_sales decimal (12,2) , Holiday_flag int , Temperature decimal (5,2), Fuel_price decimal(5,3) , CPI decimal(6,3) , Unemployment decimal(5,3));
select * from sales_wal;
show databases;
select * from sales_wal;
use walmart;
select count(*) from sales_wal;
select min(Date) , max(Date) from sales_wal; 
select holiday_flag , count(*) from sales_wal group by(holiday_flag);
select store , round(avg(weekly_sales) ,2) total_sales  from sales_wal 
group by (store)
order by (avg(weekly_sales)) desc ;
 select holiday_flag , round(avg(weekly_sales)) as weekly_sal from sales_wal  
 group by (holiday_flag)
 order by (avg (weekly_sales)) desc;
 select round((avg(case when holiday_flag = 1 then weekly_sales end) - 
 avg(case when holiday_flag = 0 then weekly_sales end))/ 
 avg(case when holiday_flag = 0 then weekly_sales end) *100  ,2) 
 as holiday_sales_increase_percent from sales_wal;
 SELECT date from sales_wal;
 Alter table sales_wal
 add column sales_date Date ;
 Update sales_wal 
 Set sales_date = str_to_date(Date , '%d-%m-%Y');
 SET SQL_SAFE_UPDATES = 0;
 Select * from sales_wal;
 Select year(Sales_date) as Year, month(sales_date) as month , round(sum(weekly_sales), 2) as total_sales
 from sales_wal
 group by year, month
 order by total_sales desc;
 select min(sales_date) , max(sales_date) from sales_wal;
 Select Weekly_sales,Temperature,Fuel_price,Unemployment,CPI 
 from sales_wal;
 Select Year(sales_date) AS Year, Month(sales_date) AS Month , max(holiday_flag) as holiday_weeks,
 sum(weekly_sales) as Monthly_sales , avg(Temperature) as avg_temp , avg(Fuel_price) as avg_fuel_price,
 avg(CPI) as avg_cpi , avg(Unemployment) as avg_unemployment from sales_wal
 group by Year ,Month
 Order by  Year,Month
 



