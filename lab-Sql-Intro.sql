# Review the tables in the database.
# Explore tables by selecting all columns from each table or using the in built review features for your client.
select * from city;
select * from actor,country;
select * from film, category,city;
# Select one column from a table. Get film titles.
select title from film;
# Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select customer_id client_id from customer;
select language_id language from film;
# 5.1 Find out how many stores does the company have?
select store_id from store;
# 5.2 Find out how many employees staff does the company have?
select * from staff_id;
# 5.3 Return a list of employee first names only?
select first_name from staff;

