Here is a SQL query with a common table expression:

Find the average dollar amount paid by the top 5 customers at a movie rental company 

WITH Top5Customers AS (
  SELECT A.customer_id,
         A.first_name,
         A.last_name,
         D.country,
         C.city,
         SUM(E.amount) AS total_amount_paid
  FROM customer A
  INNER JOIN address B ON A.address_id = B.address_id
  INNER JOIN city C ON B.city_id = C.city_id
  INNER JOIN country D ON C.country_ID = D.country_ID
  INNER JOIN payment E ON E.customer_id = A.customer_id
WHERE C.city IN ('Aurora', 'Acua', 'Citrus Heights', 'Iwaki', 'Ambattur', 'Shanwei', 'So Leopoldo', 'Teboksary', 'Tianjin', 'Cianjur')
  GROUP BY A.customer_id, A.first_name, A.last_name, D.country, C.city
  ORDER BY total_amount_paid DESC
  LIMIT 5
)

SELECT AVG(total_amount_paid)
FROM Top5Customers;
