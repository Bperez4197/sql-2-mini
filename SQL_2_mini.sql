CREATE TABLE movie (
  movie_id SERIAL,
  title TEXT,
  media_type_id INTEGER, 
  FOREIGN KEY(media_type_id) REFERENCES media_type(media_type_id)
);
-- create table

INSERT INTO movie ( title, media_type_id ) 
VALUES ( 'Aladdin', 3 );
--add a movie

ALTER TABLE movie 
ADD COLUMN genre_id INTEGER REFERENCES genre(genre_id);
-- add a foreign key that references a different tables primary key

UPDATE movie 
SET genre_id=22 
WHERE movie_id=1;
--change the genre_id in movie table where the movie_id is 1


SELECT a.title, ar.name 
FROM album a 
JOIN artist ar ON a.artist_id = ar.artist_id;
--Join the artist and album tables to list out the artist name and album name.

SELECT * FROM Track 
WHERE genre_id IN ( SELECT genre_id FROM genre WHERE name = 'Jazz' OR name = 'Blues' );
--Use a sub-select statement to get all tracks from the Track table where the genre_id is either Jazz or Blues.

UPDATE Employee 
SET Phone = null 
WHERE EmployeeId = 1;
--Update Phone on the Employee table to null where the EmployeeId is 1.

SELECT * from customer
 WHERE Company IS null;
 --Get all customers from the customer table who do not have a company.

 SELECT ar.artist_id, ar.name, COUNT(*) 
FROM artist ar
JOIN album a ON ar.artist_id = a.artist_id 
GROUP BY ar.artist_id;
--Select all artist ids, artist names, and count how many albums they have.

SELECT DISTINCT country FROM customer;
--Get all countries from the customer table with no duplicates.

SELECT * FROM customer WHERE fax IS null;
DELETE FROM customer WHERE fax IS null;
--Select all records from the customer table where fax is null;
--Delete all records from the customer table where fax is null;

--always select what you want to delete first to make sure youre find with losing it