SELECT SUM(unit_price *units_in_stock)
FROM products
WHERE discontinued <> 1
