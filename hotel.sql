create schema Hotel_Management;
use  Hotel_Management;

-- CREATE CUSTOMER TABLE
create table customer(
Customer_id int Primary key,
First_Name varchar(30),
Last_Name varchar(30),
Gender varchar(30),
Phone_Number bigint
);
insert into customer 
values(21221, 'Velu','Srinivasan', 'M', 9842719381),
(21222, 'Sirisha', 'Ramesh', 'F', 8208392084),
(21223, 'Ramya', 'Akash', 'F', 9847582948),
(21224, 'Roshini', 'Naveen', 'F', 7583958385),
(21225, 'Murugesh', 'Srnivasan',  'M', 6738198847),
(21226, 'Vikram', 'Gopal', 'M', 9837583028),
(21227, 'Tharunraj','Natrajan', 'M', 7482038474),
(21228, 'Hemalatha', 'Natrajam', 'F', 987654567),
(21229, 'Dhanush', 'Narayana', 'M', 9384786345),
(21230, 'Tamizh', 'Kumar', 'M', 6732846578),
(21231, 'Sangeetha', 'Mohan', 'F', 6738295621),
(21232, 'Sandhya', 'Jaganadhan', 'F', 7482048564),
(21233, 'Abishek', 'Ashok', 'M', 8749308579),
(21234, 'Aravind', 'Kumar', 'M', 7840928475),
(21235, 'Gowtham', 'Subramaniyam', 'M', 9835738578);
insert into customer
values (21236, 'Priya', 'Rajan', 'F', 7637468478);
insert into customer
values (21237, 'Kavitha', 'Rangaraj' ,'F', 7367498087),
(21238, 'Mohan', 'Krishna', 'M', 9186462747),
(21239, 'Geetha', 'Kamarajan', 'F', 8575672938),
(21240, 'Vasanthi', 'Thangavel','F', 8743752882);
select * from customer;
insert into customer values (21241, 'Saravanan', 'Dilli', 'M', 7636736524);

-- CREATE BOOKING TABLE
create table booking(
Booking_id int primary key,
Book_type varchar(30),
Book_date varchar(30),
Customer_id int,
foreign key (customer_id) references customer(customer_id)
);
alter table booking 
modify column Book_date date;

insert into booking 
values (31311, 'Online or direct', '05-11-2023',21221);

update booking 
set Book_type = 'Online'
where  booking_id = 31311;

insert into booking 
values (31312, 'Direct', '06-11-2023',21222),
(31313, 'Direct', '12-11-2023',21223),
(31314, 'Online', '17-11-2023',21224), 
(31315, 'Direct', '21-11-2023',21225),
(31316, 'Online', '25-11-2023',21226),
(31317, 'Online', '20-11-2023',21227),
(31318, 'Direct', '02-12-2023',21228),
(31319, 'Online', '09-12-2023',21229),
(31320, 'Online', '09-12-2023',21230),
(31321, 'Online', '10-12-2023',21231),
(31322, 'Direct', '11-12-2023',21232),
(31323, 'Online', '15-12-2023',21233),
(31324, 'Direct', '21-12-2023',21234),
(31325, 'Online', '25-12-2023',21235),
(31326, 'Direct', '27-12-2023',21236),
(31327, 'Online', '31-12-2023',21237),
(31328, 'Online', '05-01-2024',21238),
(31329, 'Direct', '07-01-2024',21239),
(31330, 'Online', '13-01-2024',21240);

update booking 
set book_date = '2023-12-10'
where booking_id = 31320;


select * from booking;

-- CREATE RESERVATION TABLE
create table reservation(
Res_id int primary key,
Check_in_date date,
Check_out_date date,
No_of_days int,
Customer_id int, 
Booking_id int,
foreign key(Customer_id) references customer(customer_id),
foreign key(Booking_id) references Booking(Booking_id)
);

insert into reservation 
values (1001, '2023-11-07','2023-11-11', 4, 21221, 31311),
(1002, '2023-11-06','2023-11-09', 3, 21222, 31312),
(1003, '2023-11-12','2023-11-13', 1, 21223, 31313),
(1004, '2023-11-20','2023-11-22', 2, 21224, 31314),
(1005, '2023-11-21','2023-11-23', 2, 21225, 31315),
(1006, '2023-11-26','2023-11-30', 4, 21226, 31316),
(1007, '2023-11-30','2023-12-02', 2, 21227, 31317),
(1008, '2023-12-02','2023-12-05', 3, 21228, 31318),
(1009, '2023-12-10','2023-12-15', 5, 21229, 31319),
(1010, '2023-12-11','2023-12-13', 2, 21230, 31320),
(1011, '2023-12-14','2023-12-16', 2, 21231, 31321),
(1012, '2023-12-14','2023-12-15', 1, 21232, 31322),
(1013, '2023-12-18','2023-12-20', 2, 21223, 31323),
(1014, '2023-12-21','2023-12-23', 2, 21234, 31324),
(1015, '2023-12-27','2023-12-28', 1, 21235, 31325),
(1016, '2023-12-27','2023-12-29', 2, 21236, 31326),
(1017, '2024-01-01','2024-01-04', 3, 21237, 31327),
(1018, '2024-01-07','2024-01-08', 1, 21238, 31328),
(1019, '2024-01-07','2024-01-10', 3, 21239, 31329),
(1020, '2024-01-15','2024-01-18', 3, 21240, 31330);

select * from reservation;

-- CREATE ROOM TABLE
create table room(
Room_no int primary key,
Room_type varchar(20),
Bed_type varchar(20),
No_of_occupants int,
Room_price int,
Customer_id int,
Res_id int,
foreign key(Customer_id) references customer(customer_id),
foreign key(Res_id) references reservation(Res_id)
);

alter table room 
modify column room_no int primary key;

insert into room
values (501,'Standard Suite', 'Double', 2, 8750, 21221, 1001),
(502,'Luxury Suite', 'Queen', 3, 10467, 21222, 1002), 
(503,'Standard Suite', 'Double', 2, 7266, 21223, 1003),
(504,'Presidential Suite', 'King', 4, 12938, 21224, 1004),
(505,'Standard Suite', 'Single', 2, 5125, 21225, 1005),
(506,'Executive Suite', 'Double', 2, 8753, 21226, 1006),
(507,'Luxury Suite', 'Queen', 3, 10378, 21227, 1007),
(508,'Luxury Suite', 'King', 4, 12753, 21228,  1008),
(509,'Standard Suite', 'Single', 1, 5753, 21229, 1009),
(510,'Presidential Suite', 'Queen', 3, 12323, 21230, 1010),
(511,'Executive Suite', 'Double', 2, 9753, 21231, 1011),
(512,'Presidential Suite', 'King', 4, 12657, 21232, 1012),
(513,'Standard Suite', 'Double', 2, 7753, 21233, 1013),
(514,'Executive Suite', 'Single', 1, 8753, 21234, 1014),
(515,'Luxury Suite', 'Double', 2, 10753, 21235, 1015),
(516,'ExecutiveSuite', 'King', 4, 16283, 21236, 1016),
(517,'Standard Suite', 'Double', 2, 6797, 21237, 1017),
(518,'Luxury Suite', 'Queen', 3, 11675, 21238, 1018),
(519,'Presidential Suite', 'Double', 2, 9725, 21239, 1019),
(520,'Standard Suite', 'King', 4, 7853, 21240, 1020);

update room
set Room_type = 'Executive Suite' 
where Room_type = 'ExecutiveSuite'; 
set sql_safe_updates = 0;

select * from room;

-- CREATE ADDRESS TABLE
create table address(
Street varchar(30),
City varchar(30),
State varchar(30),
Country varchar(30),
Customer_id int,
PinCode int,
foreign key(Customer_id) references customer(customer_id)
);

insert into Address
values  ('14, MG Road', 'Bangalore', 'Karnataka', 'India', 21221, 560001),
 ('34, Vivekanand Street', 'Chennai', 'Tamil Nadu', 'India', 21222, 600004),
 ('56, Gokhle Road', 'Mumbai', 'Maharashtra', 'India', 21223, 400054),
 ('12, Camac Street', 'Kolkata', 'West Bengal', 'India', 21224, 700016),
 ('78, Sardar Patel Marg', 'Delhi', 'Delhi', 'India', 21225, 110021),
 ('9, Race Course Road', 'Hyderabad', 'Telangana', 'India', 21226, 500028),
 ('23, Gandhinagar Main Road', 'Ahmedabad', 'Gujarat', 'India', 21227, 380002),
 ('45, Rajpur Road', 'Dehradun', 'Uttarakhand', 'India', 21228, 248001),
 ('101, Kalinga Road', 'Bhubaneswar', 'Odisha', 'India', 21229, 751002),
 ('76, Ramanathapuram Main Road', 'Coimbatore', 'Tamil Nadu', 'India', 21230, 641045),
 ('34, Lalbagh Road', 'Lucknow', 'Uttar Pradesh', 'India', 21231, 226001),
 ('12, Cunningham Road', 'Pune', 'Maharashtra', 'India', 21232, 411001),
 ('56, Sarojini Naidu Marg', 'Jaipur', 'Rajasthan', 'India', 21233, 302001),
 ('23, Bhim Chandra Joshi Road', 'Kanpur', 'Uttar Pradesh', 'India', 21234, 208001),
 ('9, Subhash Road', 'Nagpur', 'Maharashtra', 'India', 21235, 440002),
 ('45, Gandhi Road', 'Visakhapatnam', 'Andhra Pradesh', 'India', 21236, 530002),
 ('101, S V Road', 'Thane', 'Maharashtra', 'India', 21237, 400602),
 ('76, M G Road', 'Surat', 'Gujarat', 'India', 21238, 395002),
 ('34, J L N Road', 'Ranchi', 'Jharkhand', 'India', 21239, 834001),
 ('12, K K Road', 'Patna', 'Bihar', 'India', 21240, 800001);
 select * from ADDRESS;
 
-- CREATE TABLE SERVICES
create table services(
Service_id int primary Key,
service_type varchar(30),
Service_cost int
);

insert into services
values (55201, 'Spa', 200),
(55202, 'Laundry', 100),
(55203, 'Breakfast', 150),
(55204, 'Lunch', 180),
(55205, 'Dinner', 120);

select * from services;

insert into services
values (55206, "Room Cleaning", 0, 'Free of Cost'),
(55207, "Food Supply", 0, "Free of cost");

create table Service_usage (
service_usage_id int primary key,
customer_id  int,
Service_Id int,
foreign key(service_id) references services(service_id)
);
insert into service_usage values(1,21221,55206),
(2, 21226, 55201),
(3, 21234, 55207),
(4, 21240, 55202),
(5, 21239, 55203),
(6, 21234, 55203),
(7, 21222, 55205),
(8, 21224, 55201),
(9, 21233, 55202),
(10, 21238, 55206),
(11, 21230, 55205),
(12, 21223, 55201),
(13, 21240, 55205),
(14, 21235, 55207),
(15, 21225, 55201),
(16, 21232, 55205),
(17, 21226, 55205),
(18, 21234, 55206),
(19, 21231, 55203),
(20, 21224, 55204);
use hotel_management;
-- CREATE INVOICE TABLE
create table invoice(
Invoice_no int primary key,
Res_id int,
Customer_id int,
foreign key(Customer_id) references customer(customer_id),
foreign key(Res_id) references reservation(customer_id)
);
alter table invoice modify column invoice_no int;
alter table invoice add foreign key (Res_id) references reservation(Res_id);
truncate table invoice;

insert into invoice
values (548921, 1001, 21221),
(463128, 1002, 21222),
(985237, 1003, 21223),
(135792, 1004, 21224),
(627384, 1005, 21225),
(842519, 1006, 21226),
(319874, 1007, 21227),
(475038, 1008, 21228),
(982461, 1009, 21229),
(124579, 1010, 21230),
(935742, 1011, 21231),
(268143, 1012, 21232),
(487592, 1013, 21233),
(639855, 1014, 21234),
(214378, 1015, 21235),
(837463, 1016, 21236),
(351928, 1017, 21237),
(459821, 1018, 21238),
(693147, 1019, 21239),
(917563, 1020, 21240);

select * from invoice
order by res_id asc;

-- CREATE TRANSACTIONS TABLE 
create table transaction(
Trans_no int primary key,
Payment_method varchar(30),
Payment_date date,
Invoice_no int,
customer_id int,
foreign key(Customer_id) references customer(customer_id),
foreign key(Invoice_no) references Invoice(Invoice_no)
);

insert into transaction 
values  (10001, 'Cash', '2023-11-11', 548921, 21221),	
 (10002, 'Credit Card', '2023-01-09', 463128, 21222),
 (10003, 'PhonePe', '2023-11-13', 985237, 21223),
 (10004, 'Debit Card', '2023-11-22', 135792, 21224),
 (10005, 'Cash', '2023-11-23', 627384, 21225),
 (10006, 'Credit Card', '2023-11-30',842519, 21226),
 (10007, 'PhonePe', '2023-12-02', 319874, 21227),
 (10008, 'Debit Card', '2023-12-05', 475038, 21228),
 (10009, 'Cash', '2023-12-15',982461, 21229),
 (10010, 'Credit Card', '2023-12-13', 124579, 21230),
 (10011, 'PhonePe', '2023-12-16', 935742, 21231),
 (10012, 'Debit Card', '2023-12-15', 268143, 21232),
 (10013, 'Cash', '2023-12-20', 487592, 21233),
 (10014, 'Credit Card', '2023-12-23', 639855, 21234),
 (10015, 'PhonePe', '2023-12-28', 214378, 21235),
 (10016, 'Debit Card', '2023-12-29', 837463, 21236),
 (10017, 'Cash', '2024-01-04', 351928, 21237),
 (10018, 'Credit Card', '2024-01-08', 459821, 21238),
 (10019, 'PhonePe', '2024-01-10', 693147, 21239),
 (10020, 'Debit Card', '2024-01-18', 917563, 21240);

select * from transaction;

-- CREATE SATISFACTION TABLE
create table satisfaction(
Satisfaction_id int,
Satisfaction_level int,
Trans_no int,
foreign key(Trans_no) references transaction(Trans_no)
);
rename table satisfactionI to satisfaction;
drop table satisfaction;

insert into satisfaction
values (001 , 4, 10001),
(002 , 3, 10002),
(003 , 4, 10003),
(004 , 5, 10004),
(005 , 3, 10005),
(006 , 2, 10006),
(007 , 5, 10007),
(008 , 4, 10008),
(009 , 2, 10009),
(010 , 1, 10010),
(011 , 5, 10011),
(012 , 3, 10012),
(013 , 2, 10013),
(014 , 4, 10014),
(015 , 5, 10015),
(016 , 2, 10016),
(017 , 5, 10017),
(018 , 4, 10018),
(019 , 4, 10019),
(020 , 3, 10020);

update reservation
set customer_id = 21233
where res_id = 1013;

select * from  customer;
select * from booking;
select * from reservation;
select * from room;
select * from address;
select * from services;
select * from invoice;
select * from transaction;
select * from satisfaction;

alter table services add column Type varchar(30);
update services 
set type = "Payable"
where service_id = 55205;


-- Customer Information

-- 1. Who is the customer with ID 21221?
select first_name from customer
where customer_id = 21221;

-- 2. List all male customers.
select * from customer
where gender = 'M';

-- 3. Find the phone number of a customer named Velu Srinivasan.
select phone_number from customer
where first_name = 'velu' and last_name = 'srinivasan';

-- 4. List all customers from Tamil Nadu.
select * from customer as c
inner join address as a
on c.customer_id = a.customer_id
where state = 'Tamil Nadu';

-- 5. Find the address of a customer named Ramya Akash.
select * from address as a
inner join customer as c
on a.customer_id = c.customer_id
where first_name = 'Ramya' and last_name = 'Akash';


-- Booking and Reservation

-- 1. What is the booking type for booking ID 31311?
select book_type from booking
where booking_id = 31311;

-- 2. List the name all reservations made directly.
select c.first_name, c.last_name from customer as c
inner join booking as b
on c.customer_id = b.customer_id
inner join reservation as r
on b.booking_id = r.booking_id
where book_type = 'Direct';


-- 3. Find the check-in and check-out dates for customer ID 21223.
select c.first_name, c.last_name, r.check_in_date, r.Check_out_date from customer as c
inner join  reservation as r
on c.customer_id = r.customer_id
where customer_id = 21223;

-- Select check_in_date, check_out_date from reservation 
-- where customer_id = 21223;

-- 4. List all bookings made online.
select * from booking
where book_type = 'online';

-- 5. Find the booking ID for customer ID 21225.
select booking_id from booking
where customer_id = 21225;

-- Room and Occupancy

-- 1. Which rooms are currently occupied?

-- 2. Find the room number and type for customer ID 21225.
select room_no, room_type from room
where customer_id = 21225;

-- 3. List available standard suites.
select * from room
where room_type = 'standard suite';

-- 4. Find the room price for room number 501.
select room_price from room
where room_no = 501;

-- 5. List rooms booked by customer ID 21221.
select * from room
where customer_id = 21221;

-- Billing and Payments

-- 1. What is the total cost for invoice number 548921?
select r.room_price from room as r
inner join invoice as i
on r.customer_id = i.customer_id
where invoice_no = 548921;

-- 2. List all transactions made by credit card.
select * from transaction
where payment_method = 'credit Card';

-- 3. Find the payment date for transaction ID 10005.
select payment_date from transaction
where trans_no = 10005;

-- 4. Calculate the total revenue generated.
select sum(room_price) from room;

-- 5. List invoices for customer ID 21223.
select * from invoice 
where customer_id = 21223;

-- Satisfaction and Feedback

-- 1. What is the satisfaction rating for transaction ID 10010?
select satisfaction_level from satisfaction
where trans_no = 10010;

-- 2. Calculate the average satisfaction rating.
select avg(satisfaction_level) from satisfaction;

-- 3. List transactions with a satisfaction rating of 5.
select * from transaction as t
inner join satisfaction as s
on t.trans_no = s.trans_no
where satisfaction_level = 5;

-- 4. Find the satisfaction rating for customer ID 21225.
select * from satisfaction as s
inner join transaction as t
on s.trans_no = t.trans_no
where customer_id = 21225;

-- 5. List customers with low satisfaction ratings.
select * from customer as c
inner join transaction as t
on c.customer_id = t.customer_id
inner join satisfaction as s
on t.trans_no = s.trans_no
where satisfaction_level = 
(select min(satisfaction_level) from satisfaction);

-- Other Queries

-- 1. Find the number of rooms booked by each customer.
select customer_id, count(room_no) from room group by customer_id;

-- 2. Calculate the total revenue generated by each room type.
select room_type, sum(room_price) as Total_Revenue from room 
group by room_type;

-- 3. List services used by customer ID 21221.
select * from service_usage 
where customer_id = 21221;

-- 4. Find the most popular room type.
select max(distinct room_type) from room; 
select distinct room_type, count(customer_id) from room group by room_type;

-- 5. List customers who have used the spa service.
select c.*, s.service_type  from customer as c
join service_usage as su
on su.customer_id = c.customer_id
join services as s
on s.service_id = su.service_id
where s.service_type = 'spa';

-- UNION Queries

-- 1. Retrieve all transaction IDs and payment dates, including both credit card and cash payments.
select payment_method,trans_no, payment_date from transaction 
where payment_method = 'credit card'
union
select  payment_method,trans_no, payment_date from transaction 
where  payment_method = 'cash';

-- 2. Find all customer IDs and room numbers for customers who have booked rooms directly or online.
select c.customer_id, r.room_no,b.book_type from customer as c
inner join room as r
on c.customer_id = r.customer_id
inner join booking as b
on b.customer_id = r.customer_id
where book_type = 'online' 
union
select c.customer_id, r.room_no,b.book_type from customer as c
inner join room as r
on c.customer_id = r.customer_id
inner join booking as b
on b.customer_id = r.customer_id
where  book_type = 'Direct';

-- 3. Retrieve all customer IDs and satisfaction ratings, including both high and low satisfaction ratings.
select c.first_name,t.customer_id, s.satisfaction_level from satisfaction as s
inner join transaction as t
on t.trans_no = s.trans_no
inner join customer as c
on c.customer_id = t.customer_id
where satisfaction_level = (select min(satisfaction_level) from satisfaction)
union
select c.first_name,t.customer_id, s.satisfaction_level from satisfaction as s
inner join transaction as t
on t.trans_no = s.trans_no
inner join customer as c
on c.customer_id = t.customer_id
where satisfaction_level = (select max(satisfaction_level) from satisfaction);

-- VIEW Queries

-- 1. Create a view to display transaction details with payment information.
create view transactions as
select t.trans_no, t.payment_method, t.payment_date, i.res_id from transaction as t
inner join invoice as i
on t.customer_id  = i.customer_id;

select * from transactions;

-- 2. Create a view to display customer satisfaction ratings.
create view customer_saisfaction as
select c.first_name, c.last_name, c.customer_id, s.satisfaction_level from customer as c
join transaction as t
on t.customer_id = c.customer_id
join satisfaction as s
on s.trans_no = t.trans_no;

select * from customer_satisfaction;
rename table customer_saisfaction to customer_satisfaction;


-- Here are the questions using subqueries:

-- 1. Find all customers who have made a booking with a room price greater than the average room price.
select * from customer
where customer_id  in (
select c.customer_id from customer c
join room r on c.customer_id = r.customer_id
where r.room_price > (select avg(room_price) from room)
);

-- 2. Retrieve the invoice numbers for customers who have paid using credit card.
select invoice_no from invoice 
where customer_id in (
select customer_id from transaction
where payment_method = 'Credit Card'
);

-- 3. Find all rooms that have been booked by customers from Tamil Nadu.
select * from room
where customer_id in
(select a.customer_id from address as a 
join customer as c on 
a.customer_id = c.customer_id
where a.state = "Tamil Nadu");

-- 4. Retrieve the satisfaction levels of customers who have booked a room with a price greater than 10000.
select * from satisfaction as s
join transaction as t 
on s.trans_no = t.trans_no
where t.customer_id in (
select t.customer_id from transaction as t
where t.customer_id in
(select customer_id from room as r
where r.room_price > 10000));

-- 5. Find all invoices with an amount greater than the total revenue of customer 21223.
select i.* from invoice as i
join room as r
on i.customer_id = r.customer_id 
where r.room_price > (select room_price from room 
where customer_id = 21223);


-- 6. Retrieve the customer IDs of those who have booked a room with a satisfaction level less than 3.
select customer_id from reservation
where res_id in
(select i.res_id from invoice as i
join transaction as t
on i.invoice_no = t.invoice_no
join satisfaction as s
on t.trans_no = s.trans_no
where  satisfaction_level < 3);


-- 7. Retrieve the total revenue generated by customers from Delhi.
select sum(room_price) as Total_Revenue from room 
where customer_id in
(select customer_id from address
where state = 'Tamil nadu');

-- The Questions about Exists

-- 1. Find all customers who have made at least one reservation.
select c.first_name, c.customer_id from customer as c
where exists (
select * from reservation as r
where c.customer_id = r.customer_id);

-- 2. Retrieve customer IDs of those who have booked a room with a satisfaction level less than 3.
select t.customer_id from transaction as t
where exists(
select s.satisfaction_level from satisfaction as s
where s.satisfaction_level < 3 and s.trans_no = t.trans_no);

-- 3. Find customers who have used the "Spa" service.
select * from customer as c
where exists (
Select customer_id from service_usage as su
join services as s
on s.service_id = su.service_id
where service_type = 'spa' and c.customer_id = su.customer_id);

-- 4. Retrieve customers who made payments in January 2024.
select * from customer as c
where exists(
select customer_id from transaction as t
where year(payment_date) = 2024 and month(payment_date) = 1 and t.customer_id = c.customer_id);



-- Questions Using ANY

-- 1. Retrieve customer IDs of customers who have made at least one transaction with an amount greater than 5000.
select * from customer
where customer_id = ANY 
(select customer_id from room
where room_price >8000);


-- Questions Using ALL

-- 1. Retrieve the names of customers who have booked rooms that cost more than all standard suite prices.
select c.* from customer as c 
join room as r
on c.customer_id = r.customer_id
where r.room_price > all
(select room_price from room 
where room_type = 'STANDARD SUITE');

-- USING WINDOW FUNCTION

-- 1. What is the average room price for each room type?
select  room_type,  
avg(room_price) over(PARTITION BY  room_type order by room_type) as avg_room_price
from room;

-- 2. How many bookings does each customer have?
select customer_id, 
count(booking_id) over (partition by customer_id) as booking_count 
from booking;

-- 3. What is the ranking of customers based on their average satisfaction level?
select c.customer_id,
avg(s.satisfaction_level) as average_satisfaction,
rank() over(order by avg(s.satisfaction_level) desc) as rank_satisfaction
from customer as c
join transaction as t
on t.customer_id = c.customer_id
join satisfaction as s
on s.trans_no = t.trans_no 
group by c.customer_id;
