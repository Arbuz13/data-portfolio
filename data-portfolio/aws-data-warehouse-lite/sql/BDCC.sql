CREATE SCHEMA IF NOT EXISTS dw;
CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE staging.staging_sales_data (
    InvoiceNo VARCHAR,
    StockCode VARCHAR,
    Description TEXT,
    Quantity INT,
    InvoiceDate DATE,
    UnitPrice NUMERIC,
    CustomerID INT,
    Country VARCHAR,
    Discount NUMERIC,
    PaymentMethod VARCHAR,
    ShippingCost NUMERIC,
    Category VARCHAR,
    SalesChannel VARCHAR,
    ReturnStatus VARCHAR,
    ShipmentProvider VARCHAR,
    WarehouseLocation VARCHAR,
    OrderPriority VARCHAR
);

CREATE TABLE dw.dim_customer (
    customer_id INT PRIMARY KEY,
    country VARCHAR(100)
);

CREATE TABLE dw.dim_product (
    product_id SERIAL PRIMARY KEY,
    stockcode VARCHAR,
    description TEXT,
    category VARCHAR
);


CREATE TABLE dw.dim_payment (
    payment_id SERIAL PRIMARY KEY,
    payment_method VARCHAR(50)
);

CREATE TABLE dw.dim_shipping (
    shipping_id SERIAL PRIMARY KEY,
    shipment_provider VARCHAR(100),
    shipping_cost NUMERIC,
    warehouselocation VARCHAR
);
CREATE TABLE dw.dim_order (
    order_id SERIAL PRIMARY KEY,
    invoice_no VARCHAR,
    order_priority VARCHAR,
    return_status VARCHAR,
    sales_channel VARCHAR
);

CREATE TABLE dw.fact_sales (
    sales_id SERIAL PRIMARY KEY,
    invoice_no VARCHAR,
    product_id INT REFERENCES dw.dim_product(product_id),
    customer_id INT REFERENCES dw.dim_customer(customer_id),
    payment_id INT REFERENCES dw.dim_payment(payment_id),
    shipping_id INT REFERENCES dw.dim_shipping(shipping_id),
    order_id INT REFERENCES dw.dim_order(order_id),
    quantity INT,
    unit_price NUMERIC,
    discount NUMERIC,
    total_sales NUMERIC
);

SELECT country, SUM(total_sales) FROM dw.dim_customer c
INNER JOIN dw.fact_sales f
ON c.customer_key=f.customer_key
GROUP BY country
ORDER BY SUM(total_sales) DESC

SELECT category, SUM(total_sales) FROM dw.dim_product p
INNER JOIN dw.fact_sales f
ON p.product_id=f.product_id
GROUP BY category
ORDER BY SUM(total_sales) DESc

SELECT shipment_provider, count(*) AS susma from dw.dim_shipping
GROUP BY 1
order by 2 desc

SELECT * from dw.dim_shipping
SELECT * FROM dw.fact_sales
select * from dw.dim_customer
select * from dw.dim_product

SELECT * FROM staging.staging_sales_data
where customerid is null

SELECT count(paymentmethod)
FROM staging.staging_sales_data
WHERE customerid IS NOT NULL;

select * from dw.dim_payment