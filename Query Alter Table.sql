USE olistcsv;

-- Ajustando nome Tabela Olist_Customers_dataset e os respectivos nomes das colunas
RENAME TABLE olist_customers_dataset TO Clientes;

ALTER TABLE clientes RENAME COLUMN customer_id TO ID_Cliente;
ALTER TABLE clientes RENAME COLUMN customer_unique_id TO ID_Exclusivo_Cliente;
ALTER TABLE clientes RENAME COLUMN customer_zip_code_prefix TO Prefixo_CEP_Cliente;
ALTER TABLE clientes RENAME COLUMN customer_city TO Cidade_Cliente;
ALTER TABLE clientes RENAME COLUMN customer_state TO Estado_Cliente;

-- Ajustando nome Tabela Olist_Geolocation_Dataset e os respectivos nomes das colunas
RENAME TABLE olist_geolocation_dataset TO Geolocalizacao;

ALTER TABLE geolocalizacao RENAME COLUMN zip_code_prefix TO Prefixo_do_CodigoPostal_Geolocalizacao;
ALTER TABLE geolocalizacao RENAME COLUMN geolocation_lat TO Latitude_Geografica;
ALTER TABLE geolocalizacao RENAME COLUMN geolocation_lng TO Geolocalizacao_lng;
ALTER TABLE geolocalizacao RENAME COLUMN geolocation_city TO Cidade_de_Geolocalizacao;
ALTER TABLE geolocalizacao RENAME COLUMN geolocation_state TO Estado_de_Geolocalizacao;

-- Ajustando nome Tabela olist_order_items_dataset e os respectivos nomes das colunas
RENAME TABLE olist_order_items_dataset TO Itens_Pedidos;

ALTER TABLE Itens_Pedidos RENAME COLUMN order_id TO ID_Pedido;
ALTER TABLE Itens_Pedidos RENAME COLUMN order_item_id TO ID_do_Item_Pedido;
ALTER TABLE Itens_Pedidos RENAME COLUMN product_id TO ID_Produto;
ALTER TABLE Itens_Pedidos RENAME COLUMN seller_id TO ID_Vendedor;
ALTER TABLE Itens_Pedidos RENAME COLUMN shipping_limit_date TO Data_Limite_de_Envio;
ALTER TABLE Itens_Pedidos RENAME COLUMN price TO Preço;
ALTER TABLE Itens_Pedidos RENAME COLUMN freight_value TO Valor_Frete;

-- Ajustando nome Tabela olist_order_payments_dataset e os respectivos nomes das colunas
RENAME TABLE olist_order_payments_dataset TO Pagamentos_Pedidos;

ALTER TABLE Pagamentos_Pedidos RENAME COLUMN order_id TO ID_Pedido;
ALTER TABLE Pagamentos_Pedidos RENAME COLUMN payment_sequential TO Pagamento_Sequencial;
ALTER TABLE Pagamentos_Pedidos RENAME COLUMN payment_type TO Tipo_de_Pagamento;
ALTER TABLE Pagamentos_Pedidos RENAME COLUMN payment_installments TO Parcelamento_de_Pagamento;
ALTER TABLE Pagamentos_Pedidos RENAME COLUMN payment_value TO Valor_Pagamento;

-- Ajustando nome Tabela olist_order_reviews_dataset e os respectivos nomes das colunas
RENAME TABLE olist_order_reviews_dataset TO Analises_Pedidos;

ALTER TABLE analises_pedidos RENAME COLUMN review_id TO Codigo_Revisao;
ALTER TABLE analises_pedidos RENAME COLUMN order_id TO ID_Pedido;
ALTER TABLE analises_pedidos RENAME COLUMN review_score TO Pontuacao_da_Revisao;
ALTER TABLE analises_pedidos RENAME COLUMN review_comment_title TO Titulo_Comentario_da_Revisao;
ALTER TABLE analises_pedidos RENAME COLUMN review_comment_message TO Mensagem_Comentario_da_Revisao;
ALTER TABLE analises_pedidos RENAME COLUMN review_creation_date TO Data_de_Criacao_Revisao;
ALTER TABLE analises_pedidos RENAME COLUMN review_answer_timestamp TO Data_Hora_da_Resposta_Revisao;

-- Ajustando nome Tabela olist_orders_dataset e os respectivos nomes das colunas
RENAME TABLE olist_orders_dataset TO Pedidos;

ALTER TABLE Pedidos RENAME COLUMN order_id TO ID_Pedido;
ALTER TABLE Pedidos RENAME COLUMN customer_id TO ID_Cliente;
ALTER TABLE Pedidos RENAME COLUMN order_status TO Status_Pedido;
ALTER TABLE Pedidos RENAME COLUMN order_purchase_timestamp TO Data_Hora_de_Compra_Pedido;
ALTER TABLE Pedidos RENAME COLUMN order_approved_at TO Data_Aprovacao_Pedido;
ALTER TABLE Pedidos RENAME COLUMN order_delivered_carrier_date TO Data_Entrega_Transportadora;
ALTER TABLE Pedidos RENAME COLUMN order_delivered_customer_date TO Data_Entrega_Cliente;
ALTER TABLE Pedidos RENAME COLUMN order_estimated_delivery_date TO Data_Estimada_de_Entrega_Pedido;

-- Ajustando nome Tabela olist_products_dataset e os respectivos nomes das colunas
RENAME TABLE olist_products_dataset TO Produtos;

ALTER TABLE produtos RENAME COLUMN product_id TO ID_Produto;
ALTER TABLE produtos RENAME COLUMN product_category_name TO Nome_Categoria;
ALTER TABLE produtos RENAME COLUMN product_name_lenght TO Produto_Nome_Comprimento;
ALTER TABLE produtos RENAME COLUMN product_description_lenght TO Produto_Decricao_Comprimento;
ALTER TABLE produtos RENAME COLUMN product_photos_qty TO Quantidade_Fotos_Produto;
ALTER TABLE produtos RENAME COLUMN product_weight_g TO Peso_gramas_Produto;
ALTER TABLE produtos RENAME COLUMN product_length_cm TO Comprimento_cm_Produto;
ALTER TABLE produtos RENAME COLUMN product_height_cm TO Altura_cm_Produto;
ALTER TABLE produtos RENAME COLUMN product_width_cm TO Largura_cm_Produto;

-- Ajustando nome Tabela olist_sellers_dataset e os respectivos nomes das colunas
RENAME TABLE olist_sellers_dataset TO Vendedores;

ALTER TABLE vendedores RENAME COLUMN seller_id TO ID_Vendedor;
ALTER TABLE vendedores RENAME COLUMN seller_zip_code_prefix TO Prefixo_do_CodigoPostal_Vendedor;
ALTER TABLE vendedores RENAME COLUMN seller_city TO Cidade_Vendedor;
ALTER TABLE vendedores RENAME COLUMN seller_state TO Estado_Vendedor;






