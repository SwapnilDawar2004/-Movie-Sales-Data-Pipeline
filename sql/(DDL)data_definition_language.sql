CREATE TABLE dimDate
(
    date_key integer NOT NULL PRIMARY KEY,
	date date NOT NULL,
	year smallint NOT NULL,
	quarter smallint NOT NULL,
	month smallint NOT NULL,
    day smallint NOT NULL,
    week smallint NOT NULL,
	is_weekend boolean
	
);

select * from information_schema.columns where table_name = 'dimdate'

select column_name,data_type from information_schema.columns where table_name = 'dimdate'

CREATE TABLE dimCustomer
(
  customer_key SERIAL PRIMARY KEY, --SERIAL will create the autoincrement number that will start from 1 , will assign the automatic ID to the table 
  customer_id  smallint NOT NULL,
  first_name   varchar(50) NOT NULL,
  last_name    varchar(50) NOT NULL,
  email        varchar(50),
  address      varchar(50) NOT NULL,
  address2     varchar(50) ,
  district     varchar(50) NOT NULL,
  city         varchar(50) NOT NULL,
  country      varchar(50) NOT NULL,
  postal_code  varchar(50),
  phone        varchar(20) NOT NULL,
  active       smallint NOT NULL,
  create_date  timestamp NOT NULL,
  start_date   date NOT NULL,
  end_date     date NOT NULL
);

CREATE TABLE dimMovie
(
  movie_key  SERIAL PRIMARY KEY,
  film_id    smallint NOT NULL,
  title      varchar(255) NOT NULL,
  description text,
  release_year year,
  language   varchar(20) NOT NULL,
  original_language smallint NOT NULL,
  length     smallint NOT NULL,
  rating     varchar(5) NOT NULL,
  special_features varchar(69) NOT NULL
);

--original_language does not exist
SELECT column_name 
FROM information_schema.columns 
WHERE table_name = 'film' AND column_name = 'original_language';
--deleting original_language
ALTER TABLE dimMovie 
DROP COLUMN original_language;


CREATE TABLE dimStore
(
store_key SERIAL PRIMARY KEY,
store_id smallint NOT NULL ,
address varchar(50) NOT NULL,
address2 varchar(50),
district varchar(20) NOT NULL,
city varchar(50) NOT NULL,
country varchar(50) NOT NULL,
postal_code varchar(10),
manager_first_name varchar(45)NOT NULL,
manager_last_name varchar(45)NOT NULL,
start_date date NOT NULL,
end_date date NOT NULL
);

