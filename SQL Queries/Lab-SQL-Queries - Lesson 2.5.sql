# 1. Select all the actors with the first name ‘Scarlett’.
select * from actor where first_name= 'Scarlett' ;

# 2. How many films (movies) are available for rent and how many films have been rented?
# Total number of films for rental
select count(distinct(inventory_id)) from rental;

# Total number of rental events 
select count(rental_id) from rental;

# 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select max(length),min(length) from film;
select title from film where length =(select max(length) from film);

# 4. What's the average movie duration expressed in format (hours, minutes)?
select AVG(length) div 60 as 'Hours', floor(mod(AVG(length), 60)) as 'minutes'from film;

# 5. How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from actor;

# 6. Since how many days has the company been operating (check DATEDIFF() function)?
select DATEDIFF(max(rental_date),min(rental_date)) as Total_days from rental;

# 7. Show rental info with additional columns month and weekday. Get 20 results.
select *, month(rental_date) as Month, weekday(rental_date) as Weekday from rental limit 20; 

# 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, monthname(rental_date) as 'Month', weekday(rental_date) as 'Weekday',
date_format(convert(substring_index(rental_date, ' ', 1), date), '%W')  'Day of week',
case when (weekday(rental_date) in (5,6)) then 'weekend' else 'workday' end as day_type from rental;

# 9. How many rentals were in the last month of activity?
SELECT COUNT(rental_date) 'Last Month' from rental where month(rental_date) = (select month(max(rental_date)) from rental);
