-- Loan Analysis 
select * from loans;

-- What is the total number of loans in the loans table?
select count(loan_id) as total_loans from loans;


-- What is the total amount of money given as loans?
select sum(loan_amount) as total_amount
from loans;

-- What is the average loan amount?
select avg(loan_amount) as average_amount
from loans;

-- What is the highest loan amount given to a customer?
select max(loan_amount) as highest_amount
from loans;


-- What is the average interest rate of all loans?
select avg(interest_rate) as interest_rate from loans;


-- Find the number of loans for each interest rate.
select interest_rate,count(*) as no_of_loans
from loans
group by interest_rate
order by interest_rate ;


-- Find the top 10 customers who have the highest total loan amount

select customer_id ,sum(loan_amount) as total_loan_amount
from loans
group by customer_id
order by total_loan_amount desc
limit 10;


-- Find the number of loans started in each year.
select year(start_date) as started_year,count(*) as no_of_loans
from loans
group by started_year
order by started_year;



-- Find the average loan amount for each interest rate.
select interest_rate,round(avg(loan_amount),2) as average_loan_amount
from loans
group by interest_rate
order by average_loan_amount desc;

-- Find the top 10 customers by total loan amount, and also show their average interest rate
select customer_id,avg(interest_rate)  as average_interest,round(sum(loan_amount),2) as total_loan_amount
from loans
group by customer_id
order by total_loan_amount desc
limit 10;



-- Find the top 10 customers by total loan amount, but this time display their first name, last name, total loan amount, and average interest rate
select concat(c.first_name,' ',c.last_name) as customer_name,l.customer_id,avg(l.interest_rate)  as average_interest,round(sum(l.loan_amount),2) as total_loan_amount
from customers c inner join loans l
on c.customer_id = l.customer_id
group by c.first_name,
c.last_name,
l.customer_id
order by total_loan_amount desc
limit 10;



-- Find the number of loans for each customer who has more than one loan.
select customer_id,count(loan_amount) as no_of_loans
from loans
group by customer_id
having count(loan_amount) > 1;


select * from loans;
select * from customers;
-- Find the average loan amount for each year the loans were started.
select year(start_date),avg(loan_amount) as average_loan
from loans 
group by year(start_date)
order by average_loan desc;



-- Find the customers whose total loan amount is greater than 100,000.

select customer_id,sum(loan_amount) as total_loan_amount
from loans
group by customer_id
having sum(loan_amount) > 100000
order by total_loan_amount desc;



-- Find the customer who has the highest total loan amount, and display their customer ID, name, and total loan amount
select c.customer_id,concat(c.first_name,' ',c.last_name) as customer_name,
sum(l.loan_amount) as total_loan_amount
from customers c inner join loans l
on c.customer_id = l.customer_id
group by c.first_name,
c.last_name,
c.customer_id
order by total_loan_amount desc
limit 1;
