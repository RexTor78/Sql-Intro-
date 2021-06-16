# 0. Inspect the database structure and find the best-fitting table to analyse for the next task

# 1. Using the tables address and staff and the JOIN command, display the first names, last names, and address of each staff member.
select s.first_name, s.last_name, address
from staff as s
join address as ad
on s.address_id= ad.address_id
group by first_name ;

# 2. Using the tables staff and payment and the JOIN command, display the total payment amount by staff member in August of 2005.
select sum(p.amount) Total_payment_amount, s.first_name
from staff as s
join payment as p
on p.staff_id=s.staff_id
where payment_date like '%2005-08%' 
group by first_name ;

# 3. Using the tables film and film_actor and the JOIN command, list each film and the number of actors who are listed for that film.
select f.title, count(fa.actor_id) total_actors
from film f 
join film_actor fa
on f.film_id = fa.film_id
group by actor_id
order by f.title desc;

# 4. Using the tables payment and customer and the JOIN command, list the total paid by each customer. Order the customers by last name and alphabetically.
select sum(p.amount) Total_paid_per_customers, c.last_name
from customer c 
join payment p 
on c.customer_id = p.customer_id
group by last_name
order by c.last_name asc;

Optional 

  
# 1.  In the actor table, which are the actors whose last names are not repeated? For example 
# if you would sort the data in the table actor by last_name, you would see that there is 
# Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name.
# So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor 
# "Angelina Astaire", hence we would want this in our output list.
select last_name from actor group by last_name having count(*)=1 order by last_name asc;

# 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we 
# want to include the last names of the actors where the last name was present more than once.
select last_name from actor group by last_name having count(*)>1 order by last_name asc;

# 3. Using the rental table, find out how many rentals were processed by each employee.
select staff_id, count(staff_id) employee_rent from rental group by staff_id;

# 4. Using the film table, find out how many films were released each year
select release_year, count(title) from film;
select release_year from film;

# 5. Using the film table, find out for each rating how many films were there.
select rating , count(rating) from film group by rating;

# 6. What is the average length of films for each rating? Round off the average lengths to two decimal places.
select rating, round(avg(length), 2) AvgLength from film group by rating;

# 7. Which kind of movies (based on rating) have an average duration of two hours or more?
select rating more2H from film group by rating having (avg(length))>=120;
