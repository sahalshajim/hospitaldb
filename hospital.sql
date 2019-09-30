create database hospitaldb;
create table Patient(PID  varchar(10) not null, name varchar(20) not null, sex char(1) not null, address varchar(30), date_admitted date, date_discharged date, primary key (PID));
use hospitaldb;
create table Patient(PID  varchar(10) not null, name varchar(20) not null, sex char(1) not null, address varchar(30), date_admitted date, date_discharged date, primary key (PID));
create table medicine(code varchar(10) not null, price int not null, quantity int not null, primary key (code));
create table bill(m_quantity int not null, PID varchar(10) not null, code varchar(10) not null, primary key(PID,code), foreign key(PID) references Patient(PID), FOREIGN KEY(code) references medicine(code));
