-- Merchant Analysis
select * from merchants;

-- How many merchants are there in total?
select count(merchant_id) as total_merchants from merchants;


-- How many merchants are there in each city
select city,count(merchant_id) as count_merchants from merchants
group by city
order by  count_merchants desc;



-- Which city has the highest number of merchants
select city,count(merchant_id) as highest_merchants from merchants
group by city
order by  highest_merchants desc
limit 1;


-- Find the top 10 cities with the highest number of merchants
select city,count(merchant_id) as highest_merchants from merchants
group by city
order by  highest_merchants desc
limit 10;


-- Find the number of merchants whose name starts with the letter A
select merchant_name from merchants 
where merchant_name like 'A%';


-- How many merchants have a name that starts with the letter A?
select count(merchant_name) from merchants 
where merchant_name like 'A%';


-- Find the number of merchants whose names contain the word Store
select count(merchant_name) from merchants 
where merchant_name like '%Store%';


-- Find the number of merchants in each city whose merchant name starts with A.
select city,count(merchant_name) as no_of_merchants from merchants 
where merchant_name like 'A%'
group by city
order by no_of_merchants desc;


-- Find the cities that have more than 100 merchants
select city,count(merchant_id) as no_of_merchants from merchants 
group by city
having count(merchant_id)> 100;


-- Find the top 10 merchant names alphabetically (A → Z)
select merchant_name from merchants
order by merchant_name
limit 10;


-- Find the number of merchants in each city, but show only cities that have more than 500 merchants.
select city,count(merchant_id) as no_of_merchants from merchants 
group by city
having count(merchant_id)> 500;


-- Find the total number of merchants whose names contain the letter a (case-insensitive).
select count(*) as merchant_count 
from merchants 
where merchant_name like '%a%';


-- Find the top 5 cities with the highest number of merchants whose names contain a.
select city,count(*) as merchant_count 
from merchants 
where merchant_name like '%a%'
group by city
order by merchant_count desc
limit 5;


-- Find the city with the fewest number of merchants
select city,count(*) as merchant_count 
from merchants 
group by city
order by merchant_count
limit 1 ;

-- Find the average length of merchant names
select avg(length(merchant_name)) as average_name_length
from merchants;
