import json

import psycopg2


def get_product_by_id():
    """Return json-string in 'products_by_id.json' file"""
    tmp = int(input('Enter product id: '))

    connect()

    # create cursor
    with conn.cursor() as cur:
        stmt = f"SELECT product_id, product_name, categories.category_name, unit_price" \
               f" FROM products" \
               f" JOIN categories" \
               f" USING (category_id)" \
               f" WHERE product_id = {tmp}"

        cur.execute(stmt)
        row = cur.fetchone()

        if row:
            data = {'product_id': row[0], 'product_name': row[1],
                    'product_category': row[2], 'product_price': row[3]}

            with open('products_by_id.json', 'w') as w_file:
                json.dump(data, w_file)

            print('Данные по вашему запросу лежат в "products_by_id.json"')

        else:
            print('По вашему запросу нет продуктов с таким id')

    if conn:
        conn.close()


def get_category_by_id():
    tmp = int(input('Enter product category: '))

    connect()

    # create cursor
    with conn.cursor() as cur:
        stmt = f"SELECT category_id, category_name, description, products.product_name" \
               f" FROM categories" \
               f" JOIN products" \
               f" USING (category_id)" \
               f" WHERE category_id = {tmp}"

        cur.execute(stmt)
        rows = cur.fetchall()

        if rows:
            data = {}
            for row in rows:
                if len(data) == 0:
                    data = {'category_id': row[0], 'category_name': row[1],
                            'description': row[2], 'product_name': [row[3]]}
                else:
                    data['product_name'].append(row[3])

            with open('products_by_category.json', 'w') as w_file:
                json.dump(data, w_file)

            print('Данные по вашему запросу лежат в "products_by_category.json"')

        else:
            print('По вашему запросу нет категории продуктов с таким id')

        if conn:
            conn.close()


def customers():
    pass

def orders():
    pass

def employees():
    pass

def products():
    pass

def connect():
    # connect to database
    global conn
    conn = psycopg2.connect(
        host='localhost',
        database='northwind',
        user='postgres',
        password='1'
    )

