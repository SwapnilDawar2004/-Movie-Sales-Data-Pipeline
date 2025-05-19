--(DML)data_manipulation_language

--inserting in dimdate
INSERT INTO dimDate(date_key,date,year,quarter,month,day,week,is_weekend)
SELECT
      DISTINCT (TO_CHAR(payment_date :: DATE,'yyymmDD'):: integer) as date_key,
      date(payment_date) as date,
      EXTRACT (year from payment_date) as year,
      EXTRACT (quarter from payment_date) as quarter,
      EXTRACT (month from payment_date) as month,
      EXTRACT (day from payment_date) as day,
      EXTRACT (week from payment_date) as week,
      CASE WHEN EXTRACT( ISODOW FROM payment_date) IN (6,7) THEN true ELSE false END AS is_weekend
FROM payment;

-- select * from payment;
select * from dimdate;

--inserting in dimcustomer
INSERT INTO dimCustomer(customer_key,customer_id,first_name,last_name,email,address,address2,district,city,country,postal_code,phone,active,create_date,start_date,end_date)
SELECT c.customer_id as customer_key,
       c.customer_id,
	   c.first_name,
	   c.last_name,
	   c.email,
	   a.address,
	   a.address2,
	   a.district,
	   ci.city,
	   co.country,
	   a.postal_code,
	   a.phone,
	   c.active,
	   c.create_date,
	   now()  AS start_date,
	   now()  AS end_date
FROM customer c
JOIN address a ON (c.address_id = a.address_id)
JOIN city ci   ON (a.city_id = ci.city_id)
JOIN country co ON (ci.country_id = co.country_id);

select * from dimcustomer;

--inserting in dimmovie
INSERT INTO dimMovie(movie_key,film_id,title,description,release_year,language,length,rating,special_features)
SELECT 
      f.film_id as movie_key,
	  f.film_id,
	  f.title,
	  f.description,
	  f.release_year,
	  f.language_id,
	  f.length,
	  f.rating,
	  f.special_features
FROM film f

-- creating fact table
CREATE TABLE factsales
(
  sales_key SERIAL PRIMARY KEY,
  date_key integer REFERENCES dimDate(date_key),
  customer_key integer REFERENCES dimCustomer(customer_key),
  movie_key integer REFERENCES dimMovie (movie_key),
  store_key integer REFERENCES dimStore (store_key),
  sales_amount numeric
);

INSERT INTO dimStore (store_id, address, address2, district, city, country, postal_code, manager_first_name, manager_last_name, start_date, end_date)
SELECT 
    s.store_id,
    a.address,
    a.address2,
    a.district,
    c.city,
    co.country,
    a.postal_code,
    st.first_name AS manager_first_name,
    st.last_name AS manager_last_name,
    NOW() AS start_date,
    NOW() AS end_date
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
JOIN staff st ON s.manager_staff_id = st.staff_id;

-- inserting data in fact table
INSERT INTO factsales (date_key,customer_key,movie_key,store_key,sales_amount)
SELECT
     TO_CHAR(payment_date :: DATE, 'yyymmdd'):: integer AS date_key,
	 p.customer_id as customer_key,
	 f.film_id as movie_key,
	 s.store_id as store_key,
	 p.amount as sales_amount
FROM payment p
JOIN rental r ON (p.rental_id = r.rental_id )
JOIN inventory i ON (r.inventory_id = i.inventory_id)
JOIN film f ON (i.film_id = f.film_id)
JOIN store s ON (i.store_id = s.store_id);

select * from factsales;
