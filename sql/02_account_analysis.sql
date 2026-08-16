-- Account analysis

select * from accounts;


-- How many accounts exists
select count(*) as no_of_accounts
from accounts;

-- How many accounts exists for each account type

select account_type,count(*) as no_of_accounts
from accounts
group by account_type;


-- What is the total  balance held in each account type 

select account_type,count(*) as no_of_accounts,
round(sum(balance_usd),2) as total_balance
from accounts
group by account_type
order by total_balance desc;


-- What id the average account balance

select account_type,avg(balance_usd) from accounts
group by account_type;


-- show customers whose total account balance exceeds 50000 
select customer_id,count(*) as no_of_accounts,
sum(balance_usd) as total_balance
from accounts
group by customer_id 
having sum(balance_usd) > 50000
order by total_balance desc;


-- Which customers have the highest total balance 
select customer_id,sum(balance_usd) as total_balance from accounts
group by customer_id
order by total_balance desc
limit 10;


-- Find the top 10 account types based on average balance, showing the account type, number of accounts, and average balance.

select account_type,count(*) as no_of_accounts,round(avg(balance_usd),2) as average_balance
from accounts
group by account_type
order by average_balance desc limit 10;


-- Find the top 10 customers who have the highest total account balance. Show customer ID, customer name, number of accounts, and total balance.

select c.customer_id,concat(c.first_name,' ',c.last_name) as customer_name,
count(a.account_id) as no_of_accounts,round(sum(a.balance_usd),2) as total_balance
from customers c inner join accounts a
on c.customer_id = a.customer_id
group by customer_id,
c.first_name,
c.last_name
order by total_balance desc limit 10;
