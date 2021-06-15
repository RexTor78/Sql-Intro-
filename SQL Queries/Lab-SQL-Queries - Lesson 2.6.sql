# 1. Get release years.
select distinct(release_year) from film;

# 2. Get all films with ARMAGEDDON in the title.
select * from film where title like '%ARMAGEDDON%';

# 3. Get all films which title ends with APOLLO.
select * from film where title like '%APOLLO';

# 4. Get 10 the longest films.
select * from film order by length desc limit 10;

# 5.How many films include Behind the Scenes content?
select special_features  from film;
select * from film where special_features like "%Behind the Scenes%";

# 6.Drop column picture from staff.
alter table staff drop column picture;

# 7.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select staff_id from staff;
select address_id from staff where first_name = 'Jon';
select active from staff where first_name = 'Jon';
select store_id from staff where first_name = 'Jon';
insert into staff (staff_id, first_name, last_name, address_id, email, store_id, active, username) values (3,'TAMMY','SANDERS','4','tammy@sakila.org',2,1,'TAMMY');
select first_name, last_name from staff;

# 8.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 
# Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., 
# you would notice that you need customer_id information as well. To get that you can use the following query:
# select customer_id from sakila.customer
# where first_name = 'CHARLOTTE' and last_name =  'HUNTER';
# Use similar method to get inventory_id, film_id, and staff_id.
select film_id from film where title = 'Academy Dinosaur';
SELECT inventory_id from inventory where film_id = 1;
SELECT * from staff;
select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
insert into rental(customer_id,staff_id,inventory_id) values(130,1,9);

# 9. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
# Check if there are any non-active users
select * from customer where active=0;
select count(active) from customer where active=0;
# Create a table backup table as suggested
# Insert the non active users in the table backup table
create table deleted_users as select * from customer where active =0;
select customer_id from deleted_users;
# Delete the non active users from the table customer
select count(*) from customer;
delete from customer where active=0;
select count(*) from customer;