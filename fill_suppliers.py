import json
import psycopg2


suppliers_file = 'suppliers.json'

def main():
    """Connect to database and fill it with data from 'suppliers_file'"""

    # connect to database
    conn = psycopg2.connect(
        host='localhost',
        database='northwind',
        user='postgres',
        password='1'
    )

    # create cursor
    with conn.cursor() as cur:

        # {'product': supplier_id}
        product_dict = {}

        # create table
        cur.execute("CREATE TABLE suppliers ("
                    "supplier_id serial PRIMARY KEY,"
                    "supplier_name varchar(200),"
                    "contact_person varchar(100),"
                    "contact_post varchar(100),"
                    "country varchar(100),"
                    "address varchar(100),"
                    "phone varchar(15),"
                    "fax varchar(15),"
                    "homepage varchar(200))")

        with open(suppliers_file, 'r', encoding='UTF-8') as fp:
            row_data = json.load(fp)

            # parsing file data
            for i in range(len(row_data)):
                tmp_supplier_name = row_data[i].get('company_name')
                tmp_contact_person = row_data[i].get('contact').split(',')[0]
                tmp_contact_post = row_data[i].get('contact').split(',')[1]
                tmp_country = row_data[i].get('address').split(';')[0]
                tmp_address = row_data[i].get('address').replace(tmp_country + ';', '').strip(';')
                tmp_phone = row_data[i].get('phone')
                tmp_fax = row_data[i].get('fax')
                tmp_homepage = row_data[i].get('homepage')
                tmp_products = row_data[i].get('products')

                # fill db
                rec_to_insert = (tmp_supplier_name, tmp_contact_person, tmp_contact_post,
                                 tmp_country, tmp_address, tmp_phone, tmp_fax, tmp_homepage)
                query = 'INSERT INTO suppliers(supplier_name, contact_person, contact_post, country, address, phone, fax, homepage)' \
                        ' VALUES (%s, %s, %s, %s, %s, %s, %s, %s) RETURNING supplier_id'

                cur.execute(query, rec_to_insert)
                tmp_id = cur.fetchone()[0]
                conn.commit()

                # fill product dictionary
                for ii in range(len(tmp_products)):
                    product_dict.update({tmp_products[ii]: tmp_id})

        print(product_dict)


if __name__ == '__main__':
    main()