create database hospitaldb;
create table Patient(PID  varchar(10) not null, name varchar(20) not null, sex char(1) not null, address varchar(30), date_admitted date, date_discharged date, primary key (PID));
use hospitaldb;
create table Patient(PID  varchar(10) not null, name varchar(20) not null, sex char(1) not null, address varchar(30), date_admitted date, date_discharged date, primary key (PID));
create table medicine(code varchar(10) not null, price int not null, quantity int not null, primary key (code));
create table bill(m_quantity int not null, PID varchar(10) not null, code varchar(10) not null, primary key(PID,code), foreign key(PID) references Patient(PID), FOREIGN KEY(code) references medicine(code));


  mysql> create table employee(
      -> EID int not null,
      -> E_name varchar(20) not null,
      -> sex char(1),
      -> salary int,
      -> E_address varchar(30),
      -> contact_num varchar(10),
      -> E_type ENUM("Nurse","Receptionist","Doctor") not null,
      -> primary key(EID));
  Query OK, 0 rows affected (0.03 sec)

  mysql> create table record(record_no int not null,
      -> description varchar(50),
      -> EID int not null,
      -> patient_id varchar(10) not null,
      -> appoinment date not null,
      -> primary key(record_no),
      -> foreign key(EID) references employee(EID),
      -> foreign key(patient_id) references Patient(PID));
  Query OK, 0 rows affected (0.02 sec)

  mysql> create table Rooms(room_id int not null,
      -> room_type varchar(10) not null,
      -> period int not null,
      -> PID varchar(10) not null,
      -> primary key(room_id),
      -> foreign key(PID) references Patient(PID));
  Query OK, 0 rows affected (0.01 sec)

  mysql> create table Nurse(EID int not null,
      -> room_id not null,
      -> primary key(EID),
      -> foreign key(EID) references employee(EID));
  ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'not null,
  primary key(EID),
  foreign key(EID) references employee(EID))' at line 2
  mysql> create table Nurse(EID int not null,
      -> room_id int not null,
      -> primary key(EID),
      -> foreign key(EID) references employee(EID));
  Query OK, 0 rows affected (0.05 sec)

  mysql> create table Doctor(EID int not null,
      -> type ENUM("Trainee","Visiting","Permanent") not null,
      -> PID varchar(10) not null,
      -> primary key(EID),
      -> foreign key(EID) references employee(EID),
      -> foreign key(PID) references Patient(PID));
