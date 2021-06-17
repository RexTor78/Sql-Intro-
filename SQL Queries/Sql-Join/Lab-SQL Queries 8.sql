# 1. Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column). 
# In your output, only select the columns title, length, and the rank.
select title, length, rank() over (order  by length desc) Ranking
from film where length  is not null and length <> 0 ;

# 2. Build on top of the previous query and rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
# In your output, only select the columns title, length, rating and the rank.
select title, length, rating, rank() over (partition by rating order  by length desc) Ranking
from film where length  is not null and length <> 0 ;

# 3. How many films are there for each of the categories? Inspect the database structure and use appropriate join to write this query.
select count(distinct(category_id)) from film_category;
select count(distinct(fc.film_id)) Films, c.name Categories 
from category c
join film_category fc
using (category_id)
group by category_id;

# 4. Which actor has appeared in the most films?
select concat(a.first_name,' ', a.last_name) "Actors", count(fa.actor_id) "Films appear"
from actor a 
join film_actor fa
using(actor_id)
join film f 
using (film_id)
group by fa.actor_id
order by count(fa.actor_id) desc;

# 5. Most active customer (the customer that has rented the most number of films)
select count(r.customer_id) "Total Rentals", concat(c.first_name,' ', c.last_name) "Customer name"
from rental r 
join customer c 
using (customer_id)
group by c.customer_id
order by count(r.customer_id) desc;


# Lab | SQL Joins on multiple tables

# 1. Using multiple JOIN() clauses display the store ID, city, and country of each store.
select ci.city "City", c.country "Country", s.store_id "Store ID"
from store s
join address  
using (address_id)
join city ci 
using (city_id)
join country c 
using (country_id)
group by s.store_id;
    
# 2. Display the total payment amount for each store.
select s.store_id "Store ID",sum(p.amount) "Total payment-amount"
from payment p
join rental r 
using (rental_id)
join inventory i 
using (inventory_id)
join store s 
using (store_id)
group by s.store_id;
# 3. What is the average film length per each category? Which category of films are the longest?
select category.name "Category Name", avg(length) "Avg-Length"
from film f
join film_category
using (film_id)
join category
using (category_id)
group by category.name
order by avg(length) desc;

select category.name "Category Name", avg(length) "Avg-Length"
from film f
join film_category
using (film_id)
join category
using (category_id)
group by category.name
having avg(length)> (select avg(length) from film)
order by avg(length) desc; 

# 4. Display the 2 most frequently rented movies in descending order.
select distinct(f.title) "Movies most rented"
from film f
join inventory i 
using (film_id)
join rental r 
using (inventory_id)
order by r.inventory_id desc limit 2;

# 5. Display the top 5 categories with highest revenue (payment amount) in descending order.
select c.name Category, sum(p.amount) Revenue
from category c 
join film_category fc 
using(category_id)
join film f 
using (film_id)
join inventory i 
using (film_id)
join rental r 
using (inventory_id)
join payment p 
using (rental_id)
group by c.name order by revenue desc limit 5;

# 6. Is the Academy Dinosaur movie available for rent from Store 1? If yes, display the title, store_id and inventory_id of the available copies of that movie.
 select f.title Title, s.store_id "Store_ID", i.inventory_id "Inventory_ID"
 from inventory i 
 join store s 
 using (store_id)
 join film f 
 using (film_id)
 where f.title= "Academy Dinosaur" and s.store_id = 1;