SELECT * FROM invoice i
JOIN invoice_line il ON il.invoice_id = i.invoice_id
WHERE il.unit_price > .99

SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id

SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e ON c.support_rep_id = e.employee_id

SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id;

SELECT pt.track_id
FROM playlist_track pt
JOIN playlist pl ON pl.playlist_id = pt.playlist_id
WHERE p.name = 'Music';

SELECT t.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
WHERE pt.playlist_id = 5;

SELECT t.name, pl.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
JOIN playlist pl ON pt.playlist_id = pl.playlist_id

SELECT t.name, al.title
FROM track t
JOIN album al ON t.album_id = a.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk'

SELECT pl.name, g.name, al.title, ar.name
FROM playlist pl
JOIN playlist_track pt ON pl.playlist_id = pt.playlist_id
JOIN track t ON pt.track_id = t.track_id
JOIN genre g ON t.genre_id = g.genre_id
JOIN album al ON t.album_id = al.album_id
JOIN artist ar ON al.artist_id = ar.artist_id
WHERE pl.name = 'Music';

SELECT * FROM invoice
WHERE invoice_id IN ( SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99);

SELECT * FROM playlist_track
WHERE playlist_id IN ( SELECT playlist_id FROM playlist
WHERE name = 'Music');

SELECT name FROM track
WHERE track_id IN (
SELECT track_id 
FROM playlist_track
WHERE playlist_id = 5);

SELECT * FROM track 
WHERE genre_id IN (
SELECT genre_id 
FROM genre
WHERE name = 'Comedy');

SELECT * FROM track
WHERE album_id IN (
SELECT album_id
FROM album
WHERE title = 'Fireball');

SELECT * FROM track
WHERE album_id IN (
SELECT album_id
FROM album
WHERE artist_id IN (
SELECT artist_id
FROM artist
WHERE name = 'Queen'));

UPDATE customer
SET fax=NULL
WHERE fax IS NOT NULL;

UPDATE customer
SET company='Self'
WHERE company IS NULL;

UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = 'Barnett';

UPDATE customer
SET support_rep_id=4
WHERE email='luisrojas@yahoo.cl'

UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = ( 
SELECT genre_id
FROM genre
WHERE name = 'Metal' )
AND composer IS NULL;

SELECT COUNT(*), g.name
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY g.name;

SELECT COUNT(*), g.name
FROM track t
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Pop' OR g.name = 'Rock'
GROUP BY g.name;

SELECT COUNT(*), ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id
GROUP BY ar.name;

SELECT DISTINCT composer FROM track;

SELECT DISTINCT billing_postal_code
FROM invoice;

SELECT DISTINCT company 
FROM customer;

DELETE
FROM practice_delete
WHERE type = 'bronze';

DELETE
FROM practice_delete
WHERE type = 'silver';

DELETE
FROM practice_delete
WHERE value = 150;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_first VARCHAR(50),
    user_last VARCHAR(50),
    
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    product_price NUMERIC
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_quantity NUMERIC
);

INSERT INTO users (user_first, user_last)
VALUES ('Bob', 'Jones'),
('Bridget', 'Jones'),
('Bill', 'Burr');


INSERT INTO products (product_name, product_price)
VALUES ('Apple', 1.25),
('Orange', 1.50),
('Bananas', 1.75);

INSERT INTO orders (order_quantity)
VALUES (7), (5), (8)

SELECT * FROM users
SELECT * FROM products
SELECT * FROM orders

SELECT COUNT(*) FROM orders

ALTER TABLE orders
ADD user_id REFERENCES users(user_id)

ALTER TABLE orders
ADD product_id REFERENCES products(product_id)

UPDATE orders
SET user_id=1
WHERE order_quantity=7

UPDATE orders
SET user_id=2
WHERE order_quantity=5

UPDATE orders
SET user_id=3
WHERE order_quantity=8