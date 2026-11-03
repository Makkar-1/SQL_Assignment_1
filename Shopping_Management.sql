drop database if exists Shopping_Management;
create database Shopping_Management;
use Shopping_Management;

create table Customers(
	Customer_Id int primary key auto_increment,
    Customer_Name Varchar(100) not null,
    Email Varchar(100)	unique not null,
    Phone_Number varchar(10) unique not null,
    Age tinyint unsigned check(Age>0),
    Gender enum('Male', 'Female', 'Other'),
    Country varchar(50) default 'India',
    City varchar(50) not null,
    Pincode varchar(6) default '201301',
    Registration_Date Date default (current_date),
    Registration_Time Time default (current_time),
    Created_At Timestamp default (current_timestamp),
    Address Varchar(250),
    Customer_Status enum('Active', 'Inactive', 'Blocked') default('Active'),
    Customer_Notes varchar(1000));
    
select * from Customers;
describe Customers;

create table Orders(
	Order_Id int Primary key auto_increment,
    Customer_Id int,
    Order_Date date default (current_date),
    Order_Amount decimal(10,2) not null,
    Order_Status enum('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') default('Pending'),
    Payment_Method enum('Cash', 'Card', 'UPI', 'Net Banking'),
    Payment_Status enum('Pending', 'Paid', 'Failed') default('Pending'),
    Shipping_Address varchar(250) not null,
    Delivery_Pincode varchar(6),
    Quantity int check(Quantity>=0),
    Discount_Amount decimal(10,2) default 0,
    Delivery_Date date,
    Created_At timestamp default(current_timestamp),
    Tracking_Number varchar(30) not null unique,
    Delivery_Status enum('Not Dispatched', 'In Transit', 'Delivered', 'Returned') default('Not Dispatched'),
    Order_Notes Varchar(1000),
    foreign key (Customer_Id) References Customers (Customer_Id) on delete cascade on update cascade);

select * from Orders;
describe Orders;
    
    