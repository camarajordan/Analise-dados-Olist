-- Active: 1715401530216@@mysqlolist.mysql.database.azure.com@3306@olistcsv

    /* Captura de dados no servidor MySQL. 

     O dataset é composto por 8 arquivos CSV, que contém informações sobre pedidos, produtos, vendedores, reviews, etc. 
    ---
    Esquema de dados: (**tabela** <-> chave <-> **tabela**)
    **olist_orders_dataset** <-> order_id <-> **olist_order_reviews_dataset**
    **olist_orders_dataset** <-> order_id <-> **olist_order_payments_dataset**
    **olist_orders_dataset** <-> order_id <-> **olist_order_items_dataset**
    **olist_orders_dataset** <-> customer_id <-> **olist_olist_customers_dataset**
    ---
    **olist_order_items_dataset** <-> product_id <-> **olist_products_dataset**
    **olist_order_items_dataset** <-> seller_id <-> **olist_sellers_dataset**
    ---
    **olist_sellers_dataset** <-> zip_code_prefix <-> **olist_geolocation_dataset**
    ---
    **olist_geolocation_dataset** <-> zip_code_prefix <-> **olist_order_custumer_dataset**
    ---
    */

-- Passos:
-- 1. Criação das tabelas no MySQL.
    -- 1.1. olist_orders_dataset
        -- 1.1.1. Primeira e segunda linha do arquivo CSV para referência do tipo de dado.
            /* order_id,customer_id,order_status,order_purchase_timestamp,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date
            e481f51cbdc54678b7cc49136f2d6af7,9ef432eb6251297304e76186b10a928d,delivered,2017-10-02 10:56:33,2017-10-02 11:07:15,2017-10-04 19:55:00,2017-10-10 21:25:13,2017-10-18 00:00:00 */
        -- 1.1.2. Criação da tabela com colunas classificadas.
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
    -- 1.2. olist_order_reviews_dataset
        -- 1.2.1. Primeira e segunda linha do arquivo CSV para referência do tipo de dado. 
            /* review_id,order_id,review_score,review_comment_title,review_comment_message,review_creation_date,review_answer_timestamp
            7bc2406110b926393aa56f80a40eba40,73fc7af87114b39712e6da79b0a377eb,4,Recomendo,Produto chegou conforme descrição,2018-01-18 00:00:00,2018-01-18 21:46:59 */
        -- 1.2.2. Criação da tabela com colunas classificadas.    
            CREATE TABLE olist_order_reviews_dataset (
            review_id CHAR(32) PRIMARY KEY,
            order_id CHAR(32),
            review_score INT,
            review_comment_title VARCHAR(255),
            review_comment_message TEXT,
            review_creation_date TIMESTAMP,
            review_answer_timestamp TIMESTAMP
            );
    -- 1.3. olist_order_payments_dataset
        -- 1.3.1. Primeira e segunda linha do arquivo CSV para referência do tipo de dado.
            /* order_id,payment_sequential,payment_type,payment_installments,payment_value
            b81ef226f3fe1789b1e8b2acac839d17,1,credit_card,8,99.33 */
        -- 1.3.2. Criação da tabela com colunas classificadas.
            CREATE TABLE olist_order_payments_dataset (
            order_id CHAR(32) PRIMARY KEY,
            payment_sequential INT,
            payment_type VARCHAR(255),
            payment_installments INT,
            payment_value DECIMAL(10,2)
            );
    -- 1.4. olist_order_items_dataset
        -- 1.4.1. Primeira e segunda linha do arquivo CSV para referência do tipo de dado.
            /* order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,freight_value
            00010242fe8c5a6d1ba2dd792cb16214,1,4244733e06e7ecb4970a6e2683c13e61,48436dade18ac8b2bce089ec2a041202,2017-09-19 09:45:35,58.90,13.29 */
        -- 1.4.2. Criação da tabela com colunas classificadas.
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
    -- 1.5. olist_products_dataset
        -- 1.5.1. Primeira e segunda linha do arquivo CSV para referência do tipo de dado.
            /* product_id,product_category_name,product_name_lenght,product_description_lenght,product_photos_qty,product_weight_g,product_length_cm,product_height_cm,product_width_cm
            1e9e8ef04dbcff4541ed26657ea517e5,perfumaria,40,287,1,225,16,10,14 */
        -- 1.5.2. Criação da tabela com colunas classificadas.
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
    -- 1.6. olist_sellers_dataset
        -- 1.6.1. Primeira e segunda linha do arquivo CSV para referência do tipo de dado.
            /* seller_id,seller_zip_code_prefix,seller_city,seller_state
            3442f8959a84dea7ee197c632cb2df15,13023,sp,sp */
        -- 1.6.2. Criação da tabela com colunas classificadas.
            CREATE TABLE olist_sellers_dataset (
            seller_id CHAR(32) PRIMARY KEY,
            seller_zip_code_prefix INT,
            seller_city VARCHAR(255),
            seller_state CHAR(2)
            );
    -- 1.7. olist_geolocation_dataset
        -- 1.7.1. Primeira e segunda linha do arquivo CSV para referência do tipo de dado.
            /* zip_code_prefix,geolocation_lat,geolocation_lng,geolocation_city,geolocation_state
            01037,-23.5456219,-46.6392922,sao paulo,sp */
        -- 1.7.2. Criação da tabela com colunas classificadas.
            CREATE TABLE olist_geolocation_dataset (
            zip_code_prefix INT PRIMARY KEY,
            geolocation_lat DECIMAL(10,8),
            geolocation_lng DECIMAL(11,8),
            geolocation_city VARCHAR(255),
            geolocation_state CHAR(2)
            );
    -- 1.8. olist_order_customers_dataset.
        -- 1.8.1. Primeira e segunda linha do arquivo CSV para referência do tipo de dado.
            /* customer_id,customer_unique_id,customer_zip_code_prefix,customer_city,customer_state
            06b8999e2fba1a1fbc88172c00ba8bc7,861eff4711a542e4b93843c6dd7febb0,14409,franca,sp */
        -- 1.8.2. Criação da tabela com colunas classificadas.
            CREATE TABLE olist_customers_dataset (
            customer_id CHAR(32) PRIMARY KEY,
            customer_unique_id CHAR(32),
            customer_zip_code_prefix INT,
            customer_city VARCHAR(255),
            customer_state CHAR(2)
            );

-- 2. Ingestão dos dados nas tabelas.
    -- 2.1. olist_orders_dataset
        -- 2.1.1. Carregamento dos dados do arquivo CSV.
            LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_orders_dataset.csv'
        -- 2.1.2. Inserção dos dados 
            INTO TABLE olist_orders_dataset
            FIELDS TERMINATED BY ','
            ENCLOSED BY '"'
            LINES TERMINATED BY '\n'
            IGNORE 1 ROWS;
    -- 2.2. olist_order_reviews_dataset
        -- 2.2.1. Carregamento dos dados do arquivo CSV.
            LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_order_reviews_dataset.csv'
        -- 2.2.2. Inserção dos dados
            INTO TABLE olist_order_reviews_dataset
            FIELDS TERMINATED BY ','
            ENCLOSED BY '"'
            LINES TERMINATED BY '\n'
            IGNORE 1 ROWS;
    -- 2.3. olist_order_payments_dataset
        -- 2.3.1. Carregamento dos dados do arquivo CSV.
            LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_order_payments_dataset.csv'
        -- 2.3.2. Inserção dos dados
            INTO TABLE olist_order_payments_dataset
            FIELDS TERMINATED BY ','
            ENCLOSED BY '"'
            LINES TERMINATED BY '\n'
            IGNORE 1 ROWS;
    -- 2.4. olist_order_items_dataset
        -- 2.4.1. Carregamento dos dados do arquivo CSV.
            LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_order_items_dataset.csv'
        -- 2.4.2. Inserção dos dados
            INTO TABLE olist_order_items_dataset
            FIELDS TERMINATED BY ','
            ENCLOSED BY '"'
            LINES TERMINATED BY '\n'
            IGNORE 1 ROWS;
    -- 2.5. olist_products_dataset
        -- 2.5.1. Carregamento dos dados do arquivo CSV.
            LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_products_dataset.csv'
        -- 2.5.2. Inserção dos dados
            INTO TABLE olist_products_dataset
            FIELDS TERMINATED BY ','
            ENCLOSED BY '"'
            LINES TERMINATED BY '\n'
            IGNORE 1 ROWS;
    -- 2.6. olist_sellers_dataset
        -- 2.6.1. Carregamento dos dados do arquivo CSV.
            LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_sellers_dataset.csv'
        -- 2.6.2. Inserção dos dados
            INTO TABLE olist_sellers_dataset
            FIELDS TERMINATED BY ','
            ENCLOSED BY '"'
            LINES TERMINATED BY '\n'
            IGNORE 1 ROWS;
    -- 2.7. olist_geolocation_dataset
        -- 2.7.1. Carregamento dos dados do arquivo CSV.
            LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_geolocation_dataset.csv'
        -- 2.7.2. Inserção dos dados
            INTO TABLE olist_geolocation_dataset
            FIELDS TERMINATED BY ','
            ENCLOSED BY '"'
            LINES TERMINATED BY '\n'
            IGNORE 1 ROWS;
    -- 2.8. olist_order_customers_dataset
        -- 2.8.1. Carregamento dos dados do arquivo CSV.
            LOAD DATA LOCAL INFILE '/Users/jordanmac/Downloads/archive/olist_customers_dataset.csv'
        -- 2.8.2. Inserção dos dados
            INTO TABLE olist_customers_dataset
            FIELDS TERMINATED BY ','
            ENCLOSED BY '"'
            LINES TERMINATED BY '\n'
            IGNORE 1 ROWS;