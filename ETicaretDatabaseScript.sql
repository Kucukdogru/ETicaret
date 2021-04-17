CREATE DATABASE ETicaret
USE ETicaret


CREATE TABLE Customer(
Id bigint primary key identity,
Username nvarchar(50) not null,
Password nvarchar(16) not null,
CreateDate Datetime default getdate(),
Active bit not null default 1
)

CREATE TABLE Address(
Id bigint primary key identity,
CustomerId bigint not null,
Country nvarchar(150) not null,
City nvarchar(100) not null,
State nvarchar(100) not null,
Address nvarchar(500),
PostalCode nvarchar(16),
CreateDate datetime not null default getdate(),
Active bit not null default 1,

Constraint Fk_Address_Customer Foreign Key(CustomerId) References Customer(Id)
)


CREATE TABLE Brand(
Id bigint primary key identity,
BrandName nvarchar(100) not null,
CreateDate datetime not null default getdate(),
Active bit not null default 1
)


CREATE TABLE Category(
Id bigint primary key identity,
CategoryName nvarchar(100),
CreateDate datetime not null default getdate(),
Active bit default 1
)


CREATE TABLE Profile(
CustomerId int primary key,
Name nvarchar(50) not null,
Surname nvarchar(50) not null,
Email varchar(50) not null,
Phone char(15),
CreateDate datetime not null default getdate(),
Active bit not null default 1
)


CREATE TABLE Product(
Id bigint primary key identity,
CategoryId bigint not null,
BrandId bigint not null,
ProductName nvarchar(50) not null,
ProductCode varchar(15),
Price decimal,
CreateDate datetime not null default getdate(),
Active bit not null default 1,

Constraint fk_product_category Foreign Key(CategoryId) References Category(Id),
Constraint fk_product_brand Foreign Key(BrandId) References Brand(Id)
)



CREATE TABLE Basket(
Id bigint primary key identity,
ProductId bigint not null,
CustomerId bigint not null,
Count int not null,
CreateDate datetime not null default getdate(),
Active bit not null default 1,

Constraint fk_basket_product Foreign Key(ProductId) References Product(Id),
Constraint fk_basket_customer Foreign Key(CustomerId) References Customer(Id),
)


CREATE TABLE Order_(
Id bigint primary key identity,
ProductId bigint not null,
CustomerId bigint not null,
AddressId bigint not null,
Count int not null,
Status bit not null default 1,
CreateDate datetime not null default getdate(),
Active bit not null default 1,

Constraint fk_order_product Foreign Key(ProductId) References Product(Id),
Constraint fk_order_customer Foreign Key(CustomerId) References Customer(Id),
Constraint fk_order_address Foreign Key(AddressId) References Address(Id)
)
