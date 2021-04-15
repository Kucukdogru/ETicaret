CREATE DATABASE ETicaret
use ETicaret

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