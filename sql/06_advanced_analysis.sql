use bank_management_system;


-- Find the top 10 customers based on their total account balance.
-- Show:
-- customer_id
-- customer_name
-- total_balance
-- credit_score

select c.customer_id,concat(c.first_name,' ',c.last_name) as customer_name,
sum(a.balance_usd) as total_balance,c.credit_score
from customers c inner join accounts a
on c.customer_id = a.customer_id
group by c.customer_id,
c.first_name,
c.last_name,
c.credit_score
order by total_balance desc
limit 10;





-- Find customers who have both:

-- Total account balance greater than 50,000
-- Total loan amount greater than 100,000

-- Show:

-- customer_id
-- customer_name
-- total_balance
-- total_loan_amount

select c.customer_id,concat(c.first_name,' ',c.last_name) as customer_name,
 a.total_balance,l.total_loan_amount
 from customers c inner join
 (
 select customer_id,sum(balance_usd) as total_balance
 from accounts
 group by customer_id
 )a
 on c.customer_id = a.customer_id
 inner join (
 select customer_id,sum(loan_amount) as total_loan_amount
 from loans
 group by customer_id
 ) l
 on c.customer_id = l.customer_id
 where a.total_balance > 50000
 and l.total_loan_amount > 100000
 order by a.total_balance desc;






-- Find the customers who have the highest account balance within each account_type.

-- Show:

-- account_type
-- customer_id
-- balance_usd


select a.account_type,a.customer_id,a.balance_usd
from accounts a
inner join(
select account_type,max(balance_usd) as highest
from accounts group by account_type
)m
on a.account_type = m.account_type
and a.balance_usd = m.highest
order by a.balance_usd desc;






select * from customers;
-- Window functions 
-- For every customer, calculate their total account balance and rank them from highest to lowest balance.

-- Show:

-- customer_id
-- customer_name
-- total_balance
-- balance_rank

select c.customer_id,concat(c.first_name,' ',c.last_name) as customer_name,
sum(a.balance_usd) as total_balance,
 rank() over (order by sum(a.balance_usd) desc) 
as balance_rank
from customers c inner join accounts a 
on c.customer_id = a.customer_id
group by c.customer_id,
c.first_name,
c.last_name;





-- Rank customers by their total account balance within each city.

-- Show:

-- city
-- customer_id
-- customer_name
-- total_balance
-- city_rank

select c.city,c.customer_id,concat(c.first_name,' ',c.last_name) as customer_name,
sum(a.balance_usd) as total_balance,
rank() over(partition by city order by sum(a.balance_usd) desc)
as city_rank
from customers c inner join accounts a on
c.customer_id = a .customer_id
group by c.city,
c.customer_id,
c.first_name,
c.last_name;





-- For each account_type, assign a unique number to every account based on its balance, from highest to lowest.

-- Show:

-- account_type
-- account_id
-- customer_id
-- balance_usd
-- balance_row_number

select a.account_type,a.account_id,c.customer_id,a.balance_usd,
row_number() over(partition by a.account_type order by a.balance_usd desc) 
as balance_row_number
from customers c inner join accounts a 
on c.customer_id = a.customer_id;





-- For each account_type, rank accounts by balance from highest to lowest. If two accounts have the same balance, they should receive the same rank, with no gaps in the ranking.

-- Show:

-- account_type
-- account_id
-- balance_usd
-- balance_rank

select account_id,account_type,balance_usd,
dense_rank() over (partition by account_type order by balance_usd desc) 
as balance_rank
from accounts;





-- For each loan, show:

-- loan_id
-- customer_id
-- start_date
-- loan_amount
-- the previous loan amount based on start_date

select loan_id,customer_id,loan_amount,
lag(loan_amount) over(order by start_date)
as previous_loan_amount
from loans;





-- For each loan, show:

-- loan_id
-- customer_id
-- loan_amount
-- the next loan amount based on start_date

select loan_id,customer_id,loan_amount,
lead(loan_amount) over(order by start_date)
as next_loan_amount
from loans;





-- For each loan, show:

-- loan_id
-- customer_id
-- loan_amount
-- total_loan_amount → the total amount of all loans

select loan_id,customer_id,loan_amount,
sum(loan_amount) over() as total_loan_amount
from loans;





-- For each loan, show:

-- loan_id
-- customer_id
-- loan_amount
-- customer_total_loans → total loan amount for that customer
select loan_id,customer_id,loan_amount,
sum(loan_amount) over(partition by customer_id) 
as customer_total_loans
from loans;





-- calculate each customer's percentage of the total loan amount.

-- Show:

-- customer_id
-- loan_amount
-- percentage_of_total
select customer_id,loan_amount,
round(
loan_amount / sum(loan_amount )  over () * 100,2
)
as percentage_of_total
from loans;





-- For every loan, show:

-- loan_id
-- customer_id
-- loan_amount
-- average_loan_amount → average of all loans
select loan_id,customer_id,loan_amount,
avg(loan_amount) over ()
from loans;




-- For every loan, show whether the loan amount is:

-- 'Above Average' if it is greater than the overall average loan amount
-- 'Below Average' if it is less than the overall average
-- 'Equal Average' if it is exactly equal

-- Show:

-- loan_id
-- loan_amount
-- loan_category

select loan_id,loan_amount,
case
when loan_amount > avg(loan_amount) over () then 'Above Average'
when loan_amount < avg(loan_amount) over () then 'Below Average'
else 'Equal Average'
end as loan_category
from loans
group by loan_id,loan_amount;
