SELECT * FROM trips;

SELECT * FROM riders;

SELECT * FROM cars;

-- create a Trip Log with the trips and its user
SELECT *
FROM trips
LEFT JOIN riders
  ON trips.rider_id = riders.id;

-- create a link between the trips and the cars used during those trips
SELECT *
FROM trips
JOIN cars
  ON trips.car_id = cars.id;

-- There are three new users this month. Stack the riders table on top of the new table named riders2.

SELECT *
FROM riders
UNION 
SELECT * 
FROM riders2;

-- What is the average cost for a trip?
SELECT ROUND(AVG(cost),2)
FROM trips;

-- Find all the riders who have used Lyft less than 500 times
SELECT *
FROM riders
WHERE total_trips < 500
UNION 
SELECT *
FROM riders2
WHERE total_trips < 500;

-- Calculate the number of cars that are active
SELECT COUNT(*)
FROM cars
WHERE status = 'active';

-- Write a query that finds the two cars that have the highest trips_completed
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;

