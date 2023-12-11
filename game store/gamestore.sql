use [Games store ];
go
CREATE TABLE Games
(
games_id Integer PRIMARY KEY,
games_name varchar(255),
genre varchar(255),
max_no_players Integer,
platform_name VARCHAR(20) NOT NULL,

);

create table Customer
(
customer_id int not null primary key,
frist_name varchar(15) not null,
last_name varchar(15) not null,
email varchar(50) not null,
phone varchar(30) unique,
city varchar(30) not null,
street varchar(30) not null,

);


create table Orders
(
order_id  int not null primary key,
order_date date,
customer_id int,
game_id Integer,
order_status varchar(255),
constraint Customer_Order_fk foreign key(customer_id)
references Customer(customer_id),
constraint Game_Orders_fk foreign key(game_id) references Games(games_id),
);


CREATE TABLE Product
(
Product_id integer PRIMARY KEY,
    dess varchar(150),
    product_name varchar(255),
    price decimal(5 ,2 ),check(price between 20 and 400),

	constraint games_Product_fk foreign key(Product_id)references Games(games_id),

);

CREATE TABLE Payment (
customer_id int not null ,
order_id  int not null,
    total_amount DECIMAL(10, 2),
    payment_date date,
    payment_method VARCHAR(50),
	Status VARCHAR(50),
	constraint Customer_Pay_fk foreign key(customer_id)
references Customer(customer_id),
	constraint Orders_Payment_fk foreign key(order_id )
references Orders(order_id ),

);
CREATE TABLE offer (
    Offer_ID INT ,
    Promo_Code VARCHAR(50),
    Percentage_Discount VARCHAR(50),
);
CREATE TABLE Developer (
    developer_name VARCHAR(100),
    website VARCHAR(255),
    contactemail VARCHAR(255)
);


CREATE TABLE Tracking_detail (
    tracking_no INT PRIMARY KEY,
    courier_name VARCHAR(50),

);

CREATE TABLE product_feedback (
    Review_Date date,
    Review_ID int,
	Rating decimal(2,1),
	constraint Customer_product_feedback_fk foreign key(Review_ID)
references Customer(customer_id),
);
insert into Games(games_id,games_name,genre,max_no_players,platform_name)
values(1,'dead by daylight','Survival horror',5,'Windows')
,(2,'valorant ','shooter',10,'Windows')
,(3,'The Last of Us','Action-adventure',2,'PlayStation');
select * from Games;

insert into Customer(customer_id,frist_name,last_name,email,phone,city,street)
values(4201495,'abdulrahman','alrehile','abd@gmail.com',0566276214,'madinahh','omar'),
(5466,'omran','alharbi','omran@gmail.com',0589276761,'jeddah','abo baker');
select *from Customer;

insert into Orders(order_id,order_date,customer_id,game_id,order_status)
values(12,2002-11-04,4201495,1,'Order Placed'),
(24,2005-7-11,5466,3,'Order Dispatched');
select *from Orders;

INSERT INTO Product(Product_id, dess, product_name, price)
VALUES
    (3, 'The Last of Us is a 2013 action-adventure game developed by Naughty Dog and published by Sony Computer Entertainment.', 'The Last of Us', 20.99);

select *from Product;

insert into Payment(customer_id,order_id,total_amount,payment_date,payment_method,Status)
values(4201495,12,$9.99,'2023-11-05','paybal','Completed');
select *from Payment;

INSERT INTO offer(Offer_ID, Promo_Code, Percentage_Discount)
VALUES
    (95, 'ksa', 15);
select *from offer;

insert into Developer(developer_name,website,contactemail)
values(null,null,null);
select *from Developer;

insert into Tracking_detail(tracking_no,courier_name)
values(2214,null);
select *from Tracking_detail;

INSERT INTO product_feedback(Review_Date, Review_ID, Rating)
VALUES
    ('2022-09-01', 4201495, 4.4);
select *from product_feedback;



