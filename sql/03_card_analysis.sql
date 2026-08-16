-- Cards Analysis
select * from cards;


-- How many cards are there in total in the cards table
select count(card_id) as total_cards from cards;


-- How many cards are there for each card_type
select card_type,count(*) as total_cards
from cards 
group by card_type;


-- Which card_type has the highest number of cards
select card_type,count(*) as highest_cards
from cards 
group by card_type
order by highest_cards desc
limit 1;


-- Find how many cards are associated with each account.
select account_id,count(*) as no_of_cards from cards
group by account_id
order by no_of_cards desc;


-- Find the top 10 accounts that have the most cards
select account_id,count(*) as no_of_cards from cards
group by account_id
order by no_of_cards desc
limit 10;



-- Find how many cards are expiring in each year
select year(expiration_date) as expiration_year,count(*) as no_of_cards
from cards
group by year(expiration_date)
order by expiration_year;


-- Find how many cards are expiring in each card_type for each year.
select card_type,year(expiration_date) as expiration_year,count(*) as no_of_cards
from cards
group by year(expiration_date),
card_type
order by expiration_year;


-- Find the top 10 accounts that have the highest number of cards, and show the account_id and no_of_cards.
select account_id,count(*) as no_of_cards
from cards
group by account_id
order by no_of_cards desc
limit 10;
