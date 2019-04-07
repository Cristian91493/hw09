USE  sakila;

SELECT first_name, last_name from actor;

SELECT CONCAT(first_name, ' ', last_name) AS Actor_Name FROM actor;

SELECT actor_id, first_name, last_name FROM actor WHERE first_name = 'Joe' ;

SELECT first_name, last_name FROM actor WHERE last_name LIKE '%GEN%';

SELECT last_name, first_name FROM actor WHERE last_name LIKE '%li%';

SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

ALTER TABLE actor ADD description BLOB;

ALTER TABLE actor DROP description;

SELECT last_name, count(last_name) FROM actor GROUP BY last_name;

SELECT last_name, COUNT(last_name) FROM actor GROUP BY last_name HAVING COUNT(last_name) > 1;

UPDATE actor SET first_name = 'HARPO' WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

UPDATE actor SET first_name = 'GROUCHO' WHERE first_name = 'HARPO' AND last_name = 'WILLIAMS';

SHOW CREATE TABLE address;

SELECT actor.first_name, actor.last_name, address.address FROM actor JOIN address ON actor_id = address_id;

SELECT SUM(payment.amount), staff.first_name, staff.last_name FROM payment JOIN staff on payment.staff_id = staff.staff_id WHERE payment_date like '2005-08-%' GROUP BY staff.first_name, staff.last_name ;

SELECT film.title, count(film_actor.actor_id) FROM film JOIN film_actor ON film.film_id = film_actor.film_id GROUP BY film.title;

SELECT COUNT(inventory.inventory_id), film.title FROM inventory JOIN film ON film.film_id = inventory.film_id WHERE film.title = 'Hunchback Impossible';

SELECT  customer.first_name, customer.last_name , SUM(payment.amount) AS 'Total Amount Paid' FROM customer JOIN payment ON customer.customer_id = payment.customer_id  GROUP BY first_name, last_name ORDER BY last_name;

SELECT film.title from film where title like 'k%' or title like'q%'; 

SELECT language.name, film.title from language join film on film.language_id = language.language_id where name = 'English';

SELECT (SELECT name FROM language WHERE name='English'), film.title FROM language JOIN film ON film.language_id = language.language_id WHERE title LIKE 'k%' OR title LIKE'q%';

SELECT first_name, last_name FROM actor WHERE actor_id IN (SELECT actor_id FROM film_actor WHERE film_id =(SELECT film_id FROM film WHERE title = 'Alone Trip'));

SELECT customer.first_name, customer.last_name,customer.email FROM  customer JOIN address ON customer.address_id= address.address_id JOIN city ON address.city_id = city.city_id JOIN country ON city.country_id = country.country_id WHERE country.country = "Canada";

SELECT film.title FROM film JOIN film_category ON film.film_id = film_category.film_id JOIN category on film_category.category_id = category.category_id WHERE category.name = "family";

SELECT title,COUNT(title) AS count FROM film JOIN inventory ON film.film_id = inventory.film_id JOIN rental ON inventory.inventory_id = rental.inventory_id GROUP BY title ORDER BY count desc;

SELECT store.store_id, SUM(amount) AS "Total Amount" FROM store JOIN  staff  ON store.store_id = staff.store_id JOIN payment ON staff.staff_id = payment.staff_id GROUP BY store.store_id;

SELECT store_id, city, country FROM store JOIN address ON store.address_id = address.address_id JOIN city ON address.city_id = city.city_id join country on city.country_id = country.country_id;

SELECT name FROM  category JOIN film_category ON category.category_id = film_category.category_id JOIN inventory ON film_category.film_id = inventory.film_id JOIN rental on inventory.inventory_id = rental.inventory_id JOIN payment ON rental.customer_id = payment.customer_id GROUP BY category.name ORDER BY SUM(payment.amount) DESC LIMIT 5;

CREATE VIEW top_five_genres AS SELECT name FROM  category JOIN film_category ON category.category_id = film_category.category_id JOIN inventory ON film_category.film_id = inventory.film_id JOIN rental on inventory.inventory_id = rental.inventory_id JOIN payment ON rental.customer_id = payment.customer_id GROUP BY category.name ORDER BY SUM(payment.amount) DESC LIMIT 5;

DROP VIEW top_five_genres;











