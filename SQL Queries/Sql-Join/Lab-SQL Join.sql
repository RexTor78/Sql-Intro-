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
