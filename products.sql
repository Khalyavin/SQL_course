SELECT product_name, units_in_stock, categories.category_name, suppliers.contact_person, suppliers.phone
FROM products
JOIN categories USING (category_id)
JOIN suppliers USING (supplier_id)
WHERE categories.category_name IN ('Beverages',  'Seafood') AND discontinued <> 1
