-- Customer Analysis

select * from customers limit 10;

-- How many customers are there in the customers table
select count(customer_id) as no_of_customers  from customers;


-- How many customers are there in each city 
select city,count(*) as customer_count from customers
group by city 
order by customer_count desc;


-- What is the average credit score of customers?

select avg(credit_score) as average_credit_score
from customers;


-- Find the highest credit score among all customers.
select max(credit_score) as highest_credit_score 
from customers;


-- Find the lowest credit score among all customers.
select min(credit_score) as lowest_credit_score 
from customers;


-- Find how many customers have a credit score greater than 700
select count(*) as highest from customers
where credit_score > 700;


-- Find the number of customers in each credit-score range
-- Below 600 → Poor
-- 600–699 → Average
-- 700–749 → Good
-- 750 and above → Excellent

select 
customer_id, credit_score,
case
when credit_score < 600 then 'poor'
when credit_score >= 600 and credit_score<= 699 then 'Average'
when credit_score >= 700 and credit_score<= 749 then 'Good'
else 'Excellent'
end as credit_category
from customers;



-- How many customers are in each category?

select 
case
when credit_score < 600 then 'poor'
when credit_score >= 600 and credit_score<= 699 then 'Average'
when credit_score >= 700 and credit_score<= 749 then 'Good'
else 'Excellent'
end as credit_category,
count(*) as customer_count
from customers
group by
case
when credit_score < 600 then 'poor'
when credit_score >= 600 and credit_score<= 699 then 'Average'
when credit_score >= 700 and credit_score<= 749 then 'Good'
else 'Excellent'
end;


-- Find the number of customers created in each year.
select year(created_at) as created_year,count(*) as no_of_customers
from customers
group by year(created_at)
order by created_year;



-- Find the average credit score for each city.
select city,round(avg(credit_score),2) as credit_score
from customers
group by city
order by credit_score desc;


-- Find the top 10 customers with the highest credit scores.
select customer_id,concat(first_name,' ',last_name) as customer_name,credit_score
from customers
order by credit_score desc
limit 10;


-- Find the number of customers in each city whose credit score is greater than 700

SELECT
    city,
    COUNT(*) AS no_of_customers
FROM customers
WHERE credit_score > 700
GROUP BY city
ORDER BY no_of_customers DESC;
