-- owners
id | first_name | last_name
----+------------+-----------
  1 | Bob        | Hope
  2 | Jane       | Smith
  3 | Melody     | Jones
  4 | Sarah      | Palmer
  5 | Alex       | Miller
  6 | Shana      | Smith
  7 | Maya       | Malarkin

-- vehicles
 id |  make  |  model  | year |  price   | owner_id
----+--------+---------+------+----------+----------
  1 | Toyota | Corolla | 2002 |  2999.99 |        1
  2 | Honda  | Civic   | 2012 | 12999.99 |        1
  3 | Nissan | Altima  | 2016 | 23999.99 |        2
  4 | Subaru | Legacy  | 2006 |  5999.99 |        2
  5 | Ford   | F150    | 2012 |  2599.99 |        3
  6 | GMC    | Yukon   | 2016 | 12999.99 |        3
  7 | GMC    | Yukon   | 2014 | 22999.99 |        4
  8 | Toyota | Avalon  | 2009 | 12999.99 |        4
  9 | Toyota | Camry   | 2013 | 12999.99 |        4
 10 | Honda  | Civic   | 2001 |  7999.99 |        5
 11 | Nissan | Altima  | 1999 |  1899.99 |        6
 12 | Lexus  | ES350   | 1998 |  1599.99 |        6
 13 | BMW    | 300     | 2012 | 22999.99 |        6
 14 | BMW    | 700     | 2015 | 52999.99 |        6


-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id.
 SELECT *
 FROM owners
 FULL JOIN vehicles
 ON vehicles.owner_id = owners.id; 


-- Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. 
-- The first_name should be ordered in ascending order.
 SELECT o.first_name, o.last_name, COUNT(v.owner_id)
 FROM vehicles v
 JOIN owners o
 ON v.owner_id = o.id
 GROUP BY o.first_name, o.last_name
 ORDER BY o.first_name ASC; 


-- Count the number of cars for each owner and display the average price for each of the cars as integers. 
-- Display the owners first_name, last_name, average price and count of vehicles. 
-- The first_name should be ordered in descending order. 
-- Only display results with more than one vehicle and an average price greater than 10000.
SELECT o.first_name, o.last_name, ROUND(AVG(v.price)), COUNT(v.owner_id)
FROM vehicles v
JOIN owners o 
ON v.owner_id = o.id
GROUP BY o.first_name, o.last_name 
HAVING COUNT(v.owner_id) > 1 AND AVG(v.price) > 10000
ORDER BY first_name DESC;