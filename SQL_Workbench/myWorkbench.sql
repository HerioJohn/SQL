show databases;

create database db_bc2311;

use db_bc2311;

CREATE USER 'vincentlau'@'localhost' IDENTIFIED BY 'yourpassword';

ALTER USER 'vincentlau'@'localhost' IDENTIFIED BY 'yournewpassword';

GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'vincentlau'@'localhost' WITH GRANT OPTION;

create table customer (
	id integer not null,
    cust_name varchar(50),
    cust_email_addr varchar(30),
    cust_phone varchar(50)
);

insert into customer (id, cust_name, email_addr, cust_phone) values (1, 'John Lau', 'johnlau@gmail.com', '12345678');

select * from customer;

-- Insert some more records ...