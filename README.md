# Analise-dados-Olist

## Esquema de dados: (tabela <-> chave <-> tabela)

O dataset é composto por 8 arquivos CSV, que contém informações sobre pedidos, produtos, vendedores, reviews, etc.

![EsquemaOlist](https://i.imgur.com/HRhd2Y0.png)

- **olist_orders_dataset** <-> order_id <-> **olist_order_reviews_dataset**
- **olist_orders_dataset** <-> order_id <-> **olist_order_payments_dataset**
- **olist_orders_dataset** <-> order_id <-> **olist_order_items_dataset**
- **olist_orders_dataset** <-> customer_id <-> **olist_olist_customers_dataset**

- **olist_order_items_dataset** <-> product_id <-> **olist_products_dataset**
- **olist_order_items_dataset** <-> seller_id <-> **olist_sellers_dataset**

- **olist_sellers_dataset** <-> zip_code_prefix <-> **olist_geolocation_dataset**

- **olist_geolocation_dataset** <-> zip_code_prefix <-> **olist_order_custumer_dataset**

## Captura de dados no servidor MySQL

O dataset é composto por 8 arquivos CSV, que contém informações sobre pedidos, produtos, vendedores, reviews, etc.

### Passos:

1. Criação das tabelas no MySQL.

    1.1. olist_orders_dataset

    ```sql
    CREATE TABLE olist_orders_dataset (
      order_id CHAR(32) PRIMARY KEY,
      customer_id CHAR(32),
      order_status VARCHAR(255),
      order_purchase_timestamp TIMESTAMP,
      order_approved_at TIMESTAMP,
      order_delivered_carrier_date TIMESTAMP,
      order_delivered_customer_date TIMESTAMP,
      order_estimated_delivery_date TIMESTAMP
    );
    ```

    1.2. olist_order_reviews_dataset

    ```sql
    CREATE TABLE olist_order_reviews_dataset (
      review_id CHAR(32) PRIMARY KEY,
      order_id CHAR(32),
      review_score INT,
      review_comment_title VARCHAR(255),
      review_comment_message TEXT,
      review_creation_date TIMESTAMP,
      review_answer_timestamp TIMESTAMP
    );
    ```

    1.3. olist_order_payments_dataset

    ```sql
    CREATE TABLE olist_order_payments_dataset (
      order_id CHAR(32) PRIMARY KEY,
      payment_sequential INT,
      payment_type VARCHAR(255),
      payment_installments INT,
      payment_value DECIMAL(10,2)
    );
    ```

    1.4. olist_order_items_dataset

    ```sql
    CREATE TABLE olist_order_items_dataset (
      order_id CHAR(32),
      order_item_id INT,
      product_id CHAR(32),
      seller_id CHAR(32),
      shipping_limit_date TIMESTAMP,
      price DECIMAL(10,2),
      freight_value DECIMAL(10,2),
      PRIMARY KEY (order_id, order_item_id)
    );
    ```

    1.5. olist_products_dataset

    ```sql
    CREATE TABLE olist_products_dataset (
      product_id CHAR(32) PRIMARY KEY,
      product_category_name VARCHAR(255),
      product_name_lenght INT,
      product_description_lenght INT,
      product_photos_qty INT,
      product_weight_g INT,
      product_length_cm INT,
      product_height_cm INT,
      product_width_cm INT
    );
    ```

    1.6. olist_sellers_dataset

    ```sql
    CREATE TABLE olist_sellers_dataset (
      seller_id CHAR(32) PRIMARY KEY,
      seller_zip_code_prefix INT,
      seller_city VARCHAR(255),
      seller_state CHAR(2)
    );
    ```

    1.7. olist_geolocation_dataset

    ```sql
    CREATE TABLE olist_geolocation_dataset (
      zip_code_prefix INT PRIMARY KEY,
      geolocation_lat DECIMAL(10,8),
      geolocation_lng DECIMAL(11,8),
      geolocation_city VARCHAR(255),
      geolocation_state CHAR(2)
    );
    ```

    1.8. olist_order_customers_dataset

    ```sql
    CREATE TABLE olist_customers_dataset (
      customer_id CHAR(32) PRIMARY KEY,
      customer_unique_id CHAR(32),
      customer_zip_code_prefix INT,
      customer_city VARCHAR(255),
      customer_state CHAR(2)
    );
    ```

2. Ingestão dos dados nas tabelas.

    2.1. olist_orders_dataset

    ```sql
    LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_orders_dataset.csv'
    INTO TABLE olist_orders_dataset
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    ```

    2.2. olist_order_reviews_dataset

    ```sql
    LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_order_reviews_dataset.csv'
    INTO TABLE olist_order_reviews_dataset
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    ```

    2.3. olist_order_payments_dataset

    ```sql
    LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_order_payments_dataset.csv'
    INTO TABLE olist_order_payments_dataset
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    ```

    2.4. olist_order_items_dataset

    ```sql
    LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_order_items_dataset.csv'
    INTO TABLE olist_order_items_dataset
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    ```

    2.5. olist_products_dataset

    ```sql
    LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_products_dataset.csv'
    INTO TABLE olist_products_dataset
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    ```

    2.6. olist_sellers_dataset

    ```sql
    LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_sellers_dataset.csv'
    INTO TABLE olist_sellers_dataset
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    ```

    2.7. olist_geolocation_dataset

    ```sql
    LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_geolocation_dataset.csv'
    INTO TABLE olist_geolocation_dataset
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    ```

    2.8. olist_order_customers_dataset

    ```sql
    LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_customers_dataset.csv'
    INTO TABLE olist_customers_dataset
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    ```
