import json

import psycopg2


def get_product_by_id():
    """Return json-string in 'products_by_id.json' file by sql query"""
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
    """Return json-string in 'products_by_category.json' file by sql query"""
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
    """SQL queries for portal, customer page"""
    print()
    print('Страничка "Заказчики"')
    print('(1) Подсчитать количество заказчиков')
    print('(2) Выбор уникальных сочетаний городов и стран, в которых "зарегестрированы" заказчики')
    print('(3) Найти заказчиков и обслуживающих их заказы сотрудников (по условию)')
    print('(4) Найти заказчиков, не сделавших ни одного заказа')
    print('[0] Выход')
    tmp = int(input('Ваш выбор: '))

    if tmp == 1:
        process('customer_1.sql', 1)
    elif tmp == 2:
        process('customer_2.sql', 0)
    elif tmp == 3:
        process('customer_2.sql', 0)
    elif tmp == 4:
        process('customer_4.sql', 0)

def orders():
    """SQL queries for portal, order page"""
    print()
    print('Страничка "Заказы"')
    print('(1) Выбрать все заказы, отсортировать по required_date (по убыванию) и отсортировать по дате отгрузке (по возрастанию)')
    print('(2) Найти среднее значение дней уходящих на доставку с даты формирования заказа в USA')
    print('(3) Найти сумму, на которую имеется товаров (количество * цену) причём таких, которые не сняты с продажи (см. на поле discontinued)')
    print('[0] Выход')
    tmp = int(input('Ваш выбор: '))

    if tmp == 1:
        process('orders_1.sql', 0)
    elif tmp == 2:
        process('orders_2.sql', 1)
    elif tmp == 3:
        process('orders_2.sql', 1)

def employees():
    """SQL queries for portal, employees page"""
    print()
    print('Страничка "Работники"')
    print('(1) Выбрать записи работников (включить колонки имени, фамилии, телефона, региона) в которых регион неизвестен')
    print('(2) Выбрать такие страны в которых "зарегистированы" одновременно заказчики и поставщики, но при этом в них не "зарегистрированы" работники')
    print('[0] Выход')
    tmp = int(input('Ваш выбор: '))

    if tmp == 1:
        process('employees_1.sql', 0)
    elif tmp == 2:
        process('employees_2.sql', 0)

def products():
    """SQL queries for portal, product page"""
    print()
    print('Страничка "Товары"')
    print('(1) Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood, которых в продаже менее 20 единиц')
    print('[0] Выход')
    tmp = int(input('Ваш выбор: '))

    if tmp == 1:
        process('products.sql', 0)


def connect():
    # connect to database
    global conn
    conn = psycopg2.connect(
        host='localhost',
        database='northwind',
        user='postgres',
        password='1'
    )

def process(f_name: str, fetch_sign: int):
    """Processor for sql query from f_name. Fetch_sign switch fetchall/fetchone"""
    with open(f_name, 'r', encoding='UTF-8') as fp:
        stmt = fp.readlines()

    connect()

    # create cursor
    with conn.cursor() as cur:

        cur.execute(stmt)

        if fetch_sign == 0:
            rows = cur.fetchall()

            for row in rows:
                print(row)

        else:
            row = cur.fetchone()
            print(row)

    if conn:
        conn.close()
