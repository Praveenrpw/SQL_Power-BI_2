-- use sales;

-- 1. all customer records
	select * from customers;
    
-- 2. all date records
	select  * from date_;

-- 3. all markets records
	select * from markets;

-- 4. all products records
	select * from products;
    
-- 5. all transactions records
	select * from transactions;

-- 6. total number of transactions
	select count(*) 
    from transactions;

-- 7. total number of customers
	select count(*) 
    from customers;

-- 8. the first 5 records in transactions
	select * from transactions 
    limit 5;
    
-- 9. transactions for Chennai market (market code for chennai is Mark001)    
	select * from transactions 
    where market_code = 'Mark001';

-- 10. the count of transactions for chennai market (market code for chennai is Mark001)
	select 
    count(*) from transactions 
    where market_code = 'Mark001';

-- 11. transactions where currency is US dollars
	select * from transactions 
    where currency = 'USD';

-- 12. distinct product codes that were sold in chennai
	select 
    distinct product_code 
    from transactions 
    where market_code = 'Mark001';

-- 13. the all columns from transactions and date_    
	select transactions.*, date_.* 
    from transactions 
    inner join date_ 
    on transactions.order_date = date_.dates;

-- 14. how many transactions occurred on each dates
	select date_.dates, 
    count(*) as transaction_count 
    from transactions
	inner join date_
	on transactions.order_date = date_.dates
	group by date_.dates;

-- 15. sales for each dates
	select date_.dates, 
    sum(transactions.sales_amount) as total_revenue
	from transactions
	inner join date_
	on transactions.order_date = date_.dates
	group by date_.dates;

-- 16. transactions in 2020 join by date_ table
	select transactions.*, date_.* 
    from transactions 
    inner join date_ 
    on transactions.order_date = date_.dates 
    where date_.year = 2020;

-- 17. total revenue in year 2020
	select 
    sum(transactions.sales_amount) 
    from transactions 
    inner join date_ 
    on transactions.order_date = date_.dates 
    where date_.year = 2020;

-- 18. total revenue in year 2019
	select 
    sum(transactions.sales_amount) 
    from transactions 
    inner join date_ 
    on transactions.order_date = date_.dates 
    where date_.year = 2019;
    
 -- 19. total revenue in year 2018
	select 
    sum(transactions.sales_amount) 
    from transactions 
    inner join date_ 
    on transactions.order_date = date_.dates 
    where date_.year = 2018;

-- 20. average revenue in year 2020 & 2019
	select
    cast(avg(transactions.sales_amount) as decimal(10, 2))
    from transactions 
    inner join date_ 
    on transactions.order_date = date_.dates 
    where date_.year = 2020 
    or date_.year = 2019;
    
-- 21. revenue in year 2017
	select 
    sum(transactions.sales_amount) 
    from transactions 
    inner join date_ 
    on transactions.order_date = date_.dates 
    where date_.year = 2017;
    
-- 22. total revenue of 2020, based on transaction currency USA & IND
	select 
    SUM(transactions.sales_amount) 
    FROM transactions 
    INNER JOIN date_ 
    ON transactions.order_date = date_.dates 
    where date_.year=2018 
    and transactions.currency='INR' 
    or transactions.currency='USD';

-- 23. total revenue in year 2020, January Month
	select date_.month_name,
	sum(transactions.sales_amount)
	from transactions
	inner join date_
	on transactions.order_date = date_.dates
	where date_.year = 2020
	and date_.month_name = 'January'
	and (transactions.currency = 'INR'
	or transactions.currency = 'USD')
    group by date_.month_name;


-- 24. total revenue in year 2020 in Chennai
	select 
    sum(transactions.sales_amount) 
    from transactions 
    inner join date_ 
    on transactions.order_date = date_.dates 
    where date_.year = 2020 
    and transactions.market_code = 'Mark001';

-- 25. total revenue in year 2020, Feburary Month
	select sum(transactions.sales_amount)
	from transactions inner join 
	date_ on transactions.order_date = date_.dates
	where date_.year = 2020 
    and date_.month_name = 'February' 
    and transactions.currency = 'INR' 
    or transactions.currency = 'USD';
	
 -- 26. revenue in year 2020 in Mumbai
	select sum(transactions.sales_amount)
    from transactions 
    inner join date_ 
    on transactions.order_date = date_.dates
	where date_.year = 2020 
	and transactions.market_code = 'Mark001';
     

