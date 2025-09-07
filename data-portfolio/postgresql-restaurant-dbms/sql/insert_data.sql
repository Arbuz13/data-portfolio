/* Populating each table with data*/

insert into category (category_name,category_description)
values
('Appetizers','Small dishes served before the main course to stimulate the appetite.'),
('Salads','Fresh and often healthy dishes featuring mixed greens and various toppings'),
('Soups','Liquid dishes, often served warmed, made with broth, vegetables, or other ingredients'),
('Burgers','Ground meat patties served on buns, often with various toppings'),
('Sandwiches','Prepared food typically consisting of fillings between slices of bread'),
('Pizza','Baked flatbread topped with tomato sauce, cheese, and other ingredients'),
('Pasta','Dishes made with various types of pasta, often with sauce and other ingredients'),
('Seafood','Dishes featuring fish and other seafood'),
('Steaks','Cuts of beef, typically grilled or pan-fried'),
('Desserts','Sweet dishes served at the end of the meal'),
('Beverages','Drinks of various types, including soft drinks, juices, and alcoholic beverages'),
('Sides','Dishes served alongside the main course'),
('Breakfast','Meals typically eaten in the morning'),
('Lunch Specials','Specially priced meals offered during lunchtime'),
('Daily Specials','Rotating dishes offered for a limited time'),
('Vegetarian','Dishes made without meat, poultry, or fish'),
('Vegan','Dishes made without any animal product'),
('Gluten-Free','Dishes made without gluten'),
('Kids Menu','Dishes designed for children'),
('Platters','Large dishes typically shared by multiple people');

insert into menu (category_id,item_name,item_description)
values
(1,'Bruschetta','Toasted bread with tomatos and basil'),
(5,'Caesar Salad','Romaine lettuce, croutons, dressing'),
(12,'Chicken Alfredo','Fettucine pasta with creamy sauce'),
(14,'Margherita Pizza','Tomato, mozzarella, basil'),
(15,'Cheeseburger','Beef patty, cheese, bun'),
(11,'Grilled Salmon','Fresh salmon grilled to prefection'),
(6,'Tomato Soup','Creamy tomato soup'),
(7,'French Fries','Crispy fried potatoes'),
(3,'Chocolate Cake','Rich chocolate cake with frosting'),
(4,'Iced Tea','Refreshing iced tea'),
(8,'Omelette','Fluffy omelette with various fillings'),
(13,'Club Sandwich','Turkey, bacon, lettuce, tomato'),
(17,'Pad Thai','Rice noodles with vegetables and peanuts'),
(18,'Tacos al Pastor','Marinated pork tacos'),
(19,'Spaghetti Carbonara','Pasta with eggs, cheese, bacon'),
(20,'Crreme Brulee','Custard dessert with caramelized sugar'),
(1,'Onion Rings','Crispy fried onion rings'),
(5,'Greek Salad','Tomatoes, cucumbers, feta, olives'),
(16,'Steak Frites','Steak with French Fries'),
(4,'Coffee','Freshly brewed coffee');

insert into price(menu_item_id,price)
values
(1,8.99),
(2,10.99),
(3,16.99),
(4,12.99),
(5,9.99),
(6,19.99),
(7,5.99),
(8,4.99),
(9,7.99),
(10,3.99),
(11,9.99),
(12,17.99),
(13,10.99),
(14,11.99),
(15,6.99),
(16,11.99),
(17,14.99),
(18,15.99),
(19,13.99),
(20,16.99);

insert into customer(first_name,last_name,email)
values
('John','Doe','johndoe12@gmail.com'),
('Jane','Smith','janesmith2@gmail.com'),
('David','Lee','davidlee5@gmail.com'),
('Sarah','Johnson','sarahjohnson@gmail.com'),
('Micheal','Brown','michealbrown2@gmail.com'),
('Emily','Davis','emilydavis1@gmail.com'),
('Kevin','Wilson','kevinwilson@gmail.com'),
('Ashley','Garcia','ashleygracia3@gmail.com'),
('Christopher','Rodriguez','christopherrodri@gmail.com'),
('Jessica','Martinez','jessicamartines@gmail.com'),
('William','Anderson','williamanderson64@gmail.com'),
('Elizabeth','Taylor','elizibathtaylor3@gmail.com'),
('James','Thomas','jamesthomas32@gmail.com'),
('Jennifer','Hermandez','jenniferhermandez36@gmail.com'),
('Robert','Moore','robertmoore70@gmail.com'),
('Linda','Jackson','lindajackson22@gmail.com'),
('Joseph','Martin','josephmartin44@gmail.com'),
('Mary','Thompson','marythompson21@gmail.com'),
('Charles','Perez','perezcharles23@gmail.com'),
('Susan','Sanchez','susansanchez45@gmail.com');

insert into contact(customer_id,phone_number)
values
(1,'07700900001'),
(1,'07700900011'),
(2,'07700900002'),
(2,'07700900023'),
(3,'07700900003'),
(4,'07700900004'),
(5,'07700900005'),
(6,'07700900006'),
(7,'07700900007'),
(8,'07700900008'),
(9,'07700900009'),
(10,'07700900010'),
(11,'07700900021'),
(12,'07700900012'),
(13,'07700900013'),
(14,'07700900014'),
(15,'07700900015'),
(16,'07700900016'),
(17,'07700900017'),
(18,'07700900018'),
(19,'07700900019'),
(20,'07700900020'),
(20,'07700900026');

insert into restaurant_location(location_name,location_state,location_city,location_zipcode)
values
('The Harborside','Anytown','CA','90210'),
('The Market Square','Anytown','CA','90211'),
('The Willow Bend','Springfield','IL','62704'),
('The City Centre','Riverdale','NY','10463'),
('The Hilltop','Oakville','OH','45202');


insert into reservation(customer_id,restaurant_location_id,number_of_guest,reservation_date)
values
(1,1,2,'2024-11-10 19:00:00'),
(3,2,4,'2024-11-12 12:00:00'),
(5,1,6,'2024-11-15 20:00:00'),
(2,3,2,'2024-11-18 18:00:00'),
(7,1,3,'2024-11-20 13:00:00'),
(9,2,4,'2024-11-22 19:30:00'),
(4,3,2,'2024-11-25 12:30:00'),
(6,1,5,'2024-11-28 21:00:00'),
(8,2,3,'2024-12-01 17:00:00'),
(10,3,2,'2024-12-03 14:00:00'),
(11,4,4,'2024-12-05 19:00:00'),
(13,2,2,'2024-12-08 11:30:00'),
(15,3,6,'2024-12-10 20:00:00'),
(12,1,3,'2024-12-13 18:30:00'),
(14,5,2,'2024-12-16 13:30:00'),
(16,3,5,'2024-12-19 19:00:00'),
(18,1,3,'2024-12-21 12:00:00'),
(20,5,2,'2024-12-24 21:30:00'),
(17,3,4,'2024-12-27 17:30:00'),
(19,1,2,'2024-12-29 14:30:00');

insert into ingredient (ingredient_name,ingredient_category)
values
('Beef Patty','Meat'),
('Tomato','Produce'),
('Lettuce','Produce'),
('Bun','Dairy'),
('Cheese','Bakery'),
('Chicken Breast','Meat'),
('Fettuccine Pasta','Dry Goods'),
('Alfredo Sauce','Pantry'),
('Mozzarella Cheese','Dairy'),
('Basil','Seafood'),
('Salmon Fillet','Produce'),
('Potatoes','Produce'),
('Chocolate','Produce'),
('Sugar','Dry Goods'),
('Tea Leaves','Dry Goods'),
('Eggs','Dairy'),
('Bacon','Dairy'),
('Rice Noodles','Dry Foods'),
('Pork','Meat'),
('Cream','Produce');

insert into inventory (restaurant_location_id,ingredient_id,quantity_in_stock,unit_of_measure)
values
(1,1,50,'kg'),
(1,2,10,'kg'),
(1,3,5,'kg'),
(3,4,60,'units'),
(2,1,40,'kg'),
(1,6,30,'kg'),
(4,7,25,'kg'),
(5,8,20,'liters'),
(4,9,15,'kg'),
(3,10,1,'kg'),
(1,12,10,'kg'),
(2,13,5,'kg'),
(5,14,10,'kg'),
(2,15,2,'kg'),
(3,16,30,'units'),
(3,17,15,'kg'),
(1,18,10,'kg'),
(2,19,20,'kg'),
(4,20,5,'liters'),
(5,5,35,'kg'),
(1,11,45,'kg');

insert into payment_method (method_name)
values
('Cash'),
('Credit Card'),
('Debit Card'),
('Gift Card');

insert into transactions (customer_id,restaurant_location_id,payment_method_id,total_amount,transaction_date)
values
(1,1,2,25.97,'2024-11-01 12:30:00'),
(2,2,3,18.98,'2024-11-02 19:00:00'),
(3,1,1,32.97,'2024-11-03 14:45:00'),
(4,3,2,21.98,'2024-11-04 20:15:00'),
(5,2,4,15.98,'2024-11-05 11:00:00'),
(6,1,2,29.97,'2024-11-06 18:30:00'),
(7,3,3,24.98,'2024-11-07 13:15:00'),
(8,2,1,19.98,'2024-11-08 21:45:00'),
(9,1,4,12.99,'2024-11-09 10:30:00'),
(10,3,2,35.97,'2024-11-10 17:00:00'),
(11,1,3,27.98,'2024-11-11 15:30:00'),
(12,4,1,22.98,'2024-11-12 19:45:00'),
(13,5,4,16.99,'2024-11-13 11:15:00'),
(14,4,2,31.97,'2024-11-14 18:00:00'),
(15,2,3,26.98,'2024-11-15 12:45:00'),
(16,3,1,20.98,'2024-11-16 20:30:00'),
(17,1,4,14.99,'2024-11-17 14:00:00'),
(18,5,2,33.97,'2024-11-18 17:15:00'),
(19,3,3,28.98,'2024-11-19 19:30:00'),
(20,1,1,23.98,'2024-11-20 10:45:00');

insert into sales (menu_item_id,transaction_id,quantity_sold)
values
(5,1,1),
(8,1,2),
(3,2,1),
(10,2,1),
(4,3,1),
(9,3,1),
(6,4,1),
(8,4,1),
(1,5,2),
(7,5,1),
(5,6,1),
(10,6,2),
(3,7,1),
(9,7,1),
(8,8,1),
(4,9,2),
(7,9,1),
(6,10,1),
(9,10,1);-- SQL script to insert sample data into tables
