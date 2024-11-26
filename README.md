## Sales Insights Data Analysis Project
### Data Analysis Using SQL

1. Display all customer records

    `select * from customers;`

2. Display all customer records

    `select  * from date_;`

3. Display all markets records

    `select * from markets;`

4. Display all products records

    `select * from products;`

5. Display all transactions records

    `select * from transactions;`

6. Show total number of customers

    `select count(*) from customers;`

7. Show total number of transactions

    `select count(*) from transactions;`

8. Show the first 5 records in transactions

   `select * from transactions limit 5;`

9. Show transactions for Chennai market (market code for chennai is Mark001)

    `select * from transactions where market_code = 'Mark001';`

10. Show the count of transactions for chennai market (market code for chennai is Mark001)

    `count(*) from transactions where market_code = 'Mark001'`

11. Show transactions where currency is US dollars

    `select * from transactions where currency = 'USD';`

12. Show distinct product codes that were sold in chennai

    `select distinct product_code from transactions where market_code = 'Mark001';`

13. show the all columns from transactions and date_ 

    `select transactions.*, date_.* from transactions inner join date_ on transactions.order_date = date_.dates;`

14. display how many transactions occurred on each dates

    `select date_.dates, count(*) as transaction_count from transactions inner join date_ on transactions.order_date = date_.dates group by date_.dates;`
	
15. total sales for each dates

    `select date_.dates, sum(transactions.sales_amount) as total_revenue from transactions inner join date_ on transactions.order_date = date_.dates group by date_.dates;`

16. transactions in 2020 join by date_ table

    `select transactions.*, date_.* from transactions inner join date_ on transactions.order_date = date_.dates where date_.year = 2020;`

17. total revenue in year 2020

    `select sum(transactions.sales_amount) from transactions inner join date_ on transactions.order_date = date_.dates where date_.year = 2020;`

18. total revenue in year 2019

    `select sum(transactions.sales_amount) from transactions inner join date_ on transactions order_date = date_.dates where date_.year = 2019;`

19. total revenue in year 2018

    ` select sum(transactions.sales_amount) from transactions inner join date_ on transactions order_date = date_.dates where date_.year = 2018;`

20. total revenue in year 2017

    ` select sum(transactions.sales_amount) from transactions inner join date_ on transactions order_date = date_.dates where date_.year = 2017;`

21. average revenue in year 2019 & 2018

    `select cast(avg(transactions.sales_amount) as decimal(10, 2))  as avg_revenue from transactions inner join date_ on transactions.order_date = date_.dates where date_.year = 2020 or date_.year = 2019;`

22. total revenue of 2020, based on transaction currency USA & IND

    `select SUM(transactions.sales_amount) FROM transactions INNER JOIN date_ ON transactions.order_date = date_.dates where date_.year=2018 and transactions currency='INR' or transactions.currency='USD';`

23. Show total revenue in year 2020, January Month

    `select date_.month_name,sum(transactions.sales_amount) from transactions inner join date_ on transactions.order_date = date_.dates where date_.year = 2020 and date_.month_name = 'January' and (transactions.currency = 'INR' or transactions currency = 'USD') group by date_.month_name;`

24. total revenue in year 2020 in Chennai

    `select sum(transactions.sales_amount) from transactions inner join date_ on transactions.order_date = date_.dates where date_.year = 2020 and transactions.market_code = 'Mark001';`

25. Show total revenue in year 2020, Feburary Month

    `select sum(transactions.sales_amount) from transactions inner join date_ on transactions.order_date = date_.dates where date_.year = 2020 and date_.month_name = 'February' and transactions.currency = 'INR' or transactions.currency = 'USD';`

26. total revenue in year 2020 in Mumbai

    `  select sum(transactions.sales_amount) from transactions inner join date_ on transactions order_date = date_.dates where date_.year = 2018 and transactions.market_code = 'Mark002';` 

-- pull the data and do data cleaning called etl

-- select * from transactions where sales_amount <= 0;
    
-- select distinct currency from transactions; 

-- select* from transactions where currency = 'USD' or currency = 'USD\r';



Data Analysis Using Power BI
============================

1. Formula to create norm_amount column

`= Table.AddColumn(#"Filtered Rows", "norm_amount", each if [currency] = "USD" or [currency] ="USD#(cr)" then [sales_amount]*75 else [sales_amount], type any)`



