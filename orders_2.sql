SELECT DISTINCT AVG(required_date - order_date)
FROM orders
WHERE ship_country='USA'
