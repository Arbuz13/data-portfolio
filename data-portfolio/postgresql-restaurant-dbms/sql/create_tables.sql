/* Category table*/
create table category(
category_id SERIAL PRIMARY KEY,
category_name VARCHAR(50) NOT NULL,
category_description VARCHAR(250)
);

/* Menu table*/
create table menu (
menu_item_id SERIAL PRIMARY KEY,
category_id INT references category(category_id),
item_name VARCHAR(50) NOT NULL,
item_description VARCHAR(250)	
);

/* Price table*/
create table price (
price_id SERIAL PRIMARY KEY,
menu_item_id INT references menu(menu_item_id),
price FLOAT NOT NULL);

/*Customer table*/
create table customer (
customer_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50),
email VARCHAR(100) NOT NULL UNIQUE
);

/*Contact*/
create table contact (
   contact_id SERIAL PRIMARY KEY,
   customer_id INT references customer(customer_id),
   phone_number VARCHAR(30) NOT NULL);

/* Restaurant Location Table*/
create table restaurant_location (
   restaurant_location_id SERIAL PRIMARY KEY,
   location_name VARCHAR(100) NOT NULL,
   location_state VARCHAR (50)	NOT NULL,
   location_city VARCHAR (50) NOT NULL,
   location_zipcode VARCHAR (50));

/* Reservation*/
create table reservation (
   reservation_id SERIAL PRIMARY KEY,
   customer_id INT references customer(customer_id),
   restaurant_location_id INT references restaurant_location(restaurant_location_id),
   number_of_guest SMALLINT NOT NULL,
   reservation_date TIMESTAMP NOT NULL);

/*Ingredient*/
create table ingredient(
   ingredient_id SERIAL PRIMARY KEY,
   ingredient_name VARCHAR(100) NOT NULL,
   ingredient_category VARCHAR(100) NOT NULL);

/*Inventory Table*/
create table inventory (
    inventory_id SERIAL PRIMARY KEY,
     restaurant_location_id INT references       restaurant_location(restaurant_location_id),
     ingredient_id INT references ingredient(ingredient_id),
     quantity_in_stock SMALLINT NOT NULL,
     unit_of_measure VARCHAR(10));

/*Payment Method Table*/
create table payment_method(
     payment_method_id SERIAL PRIMARY KEY,
     method_name VARCHAR(20) NOT NULL);

/*Transactions table*/
create table transactions (
     transaction_id SERIAL PRIMARY KEY,
     restaurant_location_id INT references      restaurant_location(restaurant_location_id),
     customer_id INT references customer(customer_id),
     payment_method_id INT references payment_method(payment_method_id),
     total_amount DECIMAL(10,2) NOT NULL,
     transaction_date TIMESTAMP NOT NULL);

/*Sales Table*/
create table sales(
    sales_id SERIAL PRIMARY KEY,
    menu_item_id INT references menu(menu_item_id),
    transaction_id INT references transactions(transaction_id),
    quantity_sold SMALLINT NOT NULL	);-- SQL script to create normalized tables (menu, reservations, customers, transactions, inventory)
