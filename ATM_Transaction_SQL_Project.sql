create database ATMTransactiondb;
use ATMTransactiondb;
CREATE TABLE customers
(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
phone VARCHAR(15),
email VARCHAR(100),
address VARCHAR(200)
);
INSERT INTO customers VALUES
(101,'Arun Kumar','9876543210','arun@gmail.com','Chennai'),
(102,'Priya Sharma','9876543211','priya@gmail.com','Coimbatore'),
(103,'Rahul Singh','9876543212','rahul@gmail.com','Madurai'),
(104,'Sneha Reddy','9876543213','sneha@gmail.com','Salem'),
(105,'Karthik Raj','9876543214','karthik@gmail.com','Trichy'),
(106,'Anitha Devi','9876543215','anitha@gmail.com','Erode'),
(107,'Vijay Kumar','9876543216','vijay@gmail.com','Chennai'),
(108,'Meena Lakshmi','9876543217','meena@gmail.com','Namakkal'),
(109,'Suresh Babu','9876543218','suresh@gmail.com','Karur'),
(110,'Divya Priya','9876543219','divya@gmail.com','Tirunelveli');

select * from customers;

CREATE TABLE accounts
(
account_id INT PRIMARY KEY,
customer_id INT,
account_number BIGINT,
account_type VARCHAR(20),
balance DECIMAL(10,2),
account_status VARCHAR(20),
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id)
);

INSERT INTO accounts VALUES
(201,101,50010001,'Savings',85000,'Active'),
(202,102,50010002,'Current',120000,'Active'),
(203,103,50010003,'Savings',35000,'Active'),
(204,104,50010004,'Savings',15000,'Blocked'),
(205,105,50010005,'Current',92000,'Active'),
(206,106,50010006,'Savings',45000,'Active'),
(207,107,50010007,'Savings',30000,'Inactive'),
(208,108,50010008,'Current',78000,'Active'),
(209,109,50010009,'Savings',64000,'Active'),
(210,110,50010010,'Savings',50000,'Active');

select * from accounts;

CREATE TABLE atm_cards
(
card_id INT PRIMARY KEY,
customer_id INT,
account_id INT,
card_number BIGINT,
card_type VARCHAR(20),
issue_date DATE,
expiry_date DATE,
card_status VARCHAR(20),
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id),
FOREIGN KEY(account_id)
REFERENCES accounts(account_id)
);

INSERT INTO atm_cards VALUES
(301,101,201,400100001,'Visa','2024-01-01','2029-01-01','Active'),
(302,102,202,400100002,'Master','2024-02-01','2029-02-01','Active'),
(303,103,203,400100003,'Visa','2024-03-01','2029-03-01','Active'),
(304,104,204,400100004,'RuPay','2024-04-01','2029-04-01','Blocked'),
(305,105,205,400100005,'Visa','2024-05-01','2029-05-01','Active'),
(306,106,206,400100006,'Master','2024-06-01','2029-06-01','Active'),
(307,107,207,400100007,'Visa','2024-07-01','2029-07-01','Inactive'),
(308,108,208,400100008,'RuPay','2024-08-01','2029-08-01','Active'),
(309,109,209,400100009,'Visa','2024-09-01','2029-09-01','Active'),
(310,110,210,400100010,'Master','2024-10-01','2029-10-01','Active');

select * from atm_cards;

CREATE TABLE atm_machines
(
atm_id INT PRIMARY KEY,
atm_location VARCHAR(100),
branch_id INT,
city VARCHAR(50),
atm_status VARCHAR(20)
);

INSERT INTO atm_machines VALUES
(401,'Anna Nagar',1,'Chennai','Working'),
(402,'RS Puram',2,'Coimbatore','Working'),
(403,'Mattuthavani',3,'Madurai','Working'),
(404,'Hasthampatti',4,'Salem','Maintenance'),
(405,'Central Bus Stand',5,'Trichy','Working'),
(406,'Bus Stand',6,'Erode','Working'),
(407,'T Nagar',7,'Chennai','Working'),
(408,'Town',8,'Namakkal','Working'),
(409,'Main Road',9,'Karur','Working'),
(410,'Junction',10,'Tirunelveli','Working');

select * from atm_machines;

CREATE TABLE atm_transactions
(
transaction_id INT PRIMARY KEY,
card_id INT,
account_id INT,
atm_id INT,
transaction_type VARCHAR(20),
amount DECIMAL(10,2),
transaction_date DATE,
transaction_status VARCHAR(20),
FOREIGN KEY(card_id)
REFERENCES atm_cards(card_id),
FOREIGN KEY(account_id)
REFERENCES accounts(account_id),
FOREIGN KEY(atm_id)
REFERENCES atm_machines(atm_id)
);

INSERT INTO atm_transactions VALUES
(501,301,201,401,'Withdrawal',5000,'2026-08-01','Success'),
(502,302,202,402,'Deposit',10000,'2026-08-01','Success'),
(503,303,203,403,'Balance Enquiry',0,'2026-08-02','Success'),
(504,304,204,404,'Withdrawal',2000,'2026-08-02','Failed'),
(505,305,205,405,'Withdrawal',7000,'2026-08-03','Success'),
(506,306,206,406,'Deposit',5000,'2026-08-03','Success'),
(507,307,207,407,'Withdrawal',1000,'2026-08-04','Failed'),
(508,308,208,408,'Withdrawal',3000,'2026-08-04','Success'),
(509,309,209,409,'Balance Enquiry',0,'2026-08-05','Success'),
(510,310,210,410,'Deposit',12000,'2026-08-05','Success');

select * from atm_transactions;
select * from customers;
select * from accounts;
select * from atm_cards;
select * from atm_machines;

---- select quary ------

select customer_name,email,address from customers;

select customer_name,email from customers;

select customer_id,account_type,account_status from accounts;

select account_id,account_number from accounts;

select account_id,card_number,expiry_date from atm_cards;

select account_id,issue_date from atm_cards;

select atm_location,city,atm_status from  atm_machines;

select city,atm_status from atm_machines;

select card_id,account_id,amount,transaction_status from  atm_transactions;

select transaction_status from atm_transactions;

--- where condition ----

select * from customers
where customer_id = 101;

select * from accounts
where account_type ="savings";

select * from atm_cards
where card_status ="active";

select * from atm_machines
where city ="chennai";

select * from atm_transactions
where transaction_type ="withdrawal";

select * from accounts
where balance >50000;

select * from atm_transactions
where amount >5000;

select * from accounts 
where account_id >205;

select * from atm_cards
where card_id >305;

select * from atm_machines
where branch_id > 7;

select * from atm_transactions
where atm_id >404 and 
transaction_status="success";

select * from customers
where address ="chennai" or
customer_id >105;

select * from accounts
where balance <50000;

select * from atm_transactions
where card_id >305 and 
transaction_status="failed";

select * from atm_transactions
where atm_id > 405 or 
transaction_type ="deposit";

select * from atm_transactions 
where amount<5000;

select * from customers
where customer_id<105 or
address ="chennai";

select * from atm_transactions;
select * from customers;
select * from accounts;
select * from atm_cards;
select * from atm_machines;

select * from customers 
where customer_id >=104 or
address ="coimbatore ";

select * from accounts 
where balance >= 85000 or
account_type ="saving";

select * from atm_cards
where card_status ="active" and
account_id >=205;

select * from atm_machines 
where atm_id <405 and 
city ="madurai";

select * from atm_transactions
where amount >=7000 and 
transaction_date >2026-08-01;

select * from customers 
where address <> "chennai";

select * from customers 
where address <> "madurai" and 
customer_id >105;

select * from accounts 
where balance > 85000 and 
account_status ="active";

select * from atm_cards 
where card_type <>"visa" and 
account_id >205 ;


select * from atm_machines 
where atm_status <> "working" or
atm_id >405 ;

select * from atm_transactions 
where transaction_type <> "withdrawal" and 
account_id >205;

select * from atm_transactions;
select * from customers;
select * from accounts;
select * from atm_cards;
select * from atm_machines;

select * from customers 
where customer_id > 105 and 
address ="chennai";

select * from accounts 
where account_type ="savings" and 
account_id >205;

select * from atm_cards 
where account_id > 205 and 
issue_date >2024-02-01;

select * from atm_machines 
where atm_status ="working" and 
branch_id > 5;

select * from atm_transactions 
where transaction_id >505 and 
transaction_status ="success";

select * from accounts 
where account_status ="active" and 
balance >50000;

select * from atm_cards 
where card_type ="master" and 
card_status ="active";

select * from atm_machines 
where city ="chennai" and 
atm_id >405;

select * from atm_transactions 
where card_id <305 and 
transaction_type ="withdrawal";

select * from customers
where customer_id>105 or address ="chennai";

select * from accounts 
where account_number >50010005 or 
account_status ="active";

select * from atm_cards 
where card_type ="visa" or
issue_date > 2024-05-01;

select * from atm_machines 
where city ="chennai" or 
atm_id >405;


select * from atm_transactions 
where amount >5000 or 
transaction_status ="active";

select *from customers
where customer_id=101;

select * from accounts 
where account_type="savings";

select * from atm_cards 
where card_status <>"active";

select * from atm_machines 
where city in("chennai","salem");

select * from atm_transactions 
where atm_id>405 or
transaction_status ="success";

select * from atm_transactions 
where transaction_type not in ("withdrawal","deposit");

select * from customers 
where address like "%a%";

select * from customers 
where address like "c%";

select * from accounts 
where account_type like "%a%";

select * from customers
where address is null;

select address,count(*) from customers
group by address;

select address,count(customer_id) from customers 
where address ="chennai" 
group by customer_id;

select account_type,sum(balance) from accounts 
group by account_type;

select balance,count(*) from accounts 
where account_status="active" 
group by balance;

select card_status,count(card_type) from atm_cards 
group by card_status;

select card_status,count(card_type) from atm_cards 
where card_status ="blocked"
group by card_type;

select city,count(*) from atm_machines 
where branch_id>5 
group by city;

select transaction_type,count(*) from atm_transactions 
group by transaction_type;

select distinct address from customers;

select * from customers
order by address desc;

select * from accounts
order by account_type asc;

select * from atm_cards 
order by card_type desc;

select * from atm_machines
where branch_id >5
order by city asc;

select * from atm_transactions 
where  amount >5000
order by transaction_status="success";

select * from customers 
where customer_id >105
order by address asc;

select * from accounts 
order by account_type asc,account_status asc;

select count(*) from customers 
group by address;

select sum(balance) from accounts 
group by account_status;

select count(*) from atm_cards 
group by card_type;

select count(*) from atm_machines 
group by city;

select count(*) from accounts 
group by account_type ;

select sum(balance) from accounts 
order by account_type;

select transaction_status,transaction_type,count(*) from atm_transactions 
group by transaction_status,transaction_type;

select card_type,card_status, count(*) from atm_cards 
group by  card_type,card_status;

select account_type,count(*) from accounts 
group by account_type 
having count(*)>1;

select card_type ,count(*) from atm_cards 
group by card_type 
having count(*)>2;

select card_status,count(*) from atm_cards 
group by card_status 
having count(*) >3;

select transaction_type,transaction_status,count(*) from atm_transactions
group by transaction_type,transaction_status;

select transaction_type,transaction_status,count(*) from atm_transactions
group by transaction_type,transaction_status;

select transaction_status,sum(amount) from atm_transactions 
group by transaction_status 
having sum(amount)>1000;

select transaction_status,count(*) from atm_transactions 
group by transaction_status 
having count(*) >3;

select transaction_type,sum(amount) from atm_transactions 
group by transaction_type 
having sum(amount)<3000;

select transaction_type,sum(amount) from atm_transactions 
group by transaction_type 
having sum(amount) >5000
order by transaction_type asc;

select transaction_type,count(*) from atm_transactions 
group by transaction_type 
having count(*) >2;

select customer_name ,account_number from customers 
inner join accounts
on customers.customer_id=accounts.customer_id;

select customer_name, account_type ,balance from customers 
inner join accounts 
on customers.customer_id=accounts.customer_id;

select customer_name ,card_number from customers 
inner join atm_cards 
on customers.customer_id=atm_cards.customer_id;

select customer_name ,account_number from customers 
left join accounts 
on customers.customer_id=accounts.customer_id;

select *, account_type,balance from customers 
left join accounts 
on customers.customer_id=accounts.customer_id;

select *,card_number from customers 
left join atm_cards
on customers.customer_id=atm_cards.customer_id;

select customers.customer_name,customers.email,accounts.account_number,accounts.balance from customers
left join accounts 
on customers.customer_id=accounts.customer_id;

select customers.customer_name,customers.email,accounts.account_number,accounts.balance from customers
right join accounts 
on customers.customer_id=accounts.customer_id;

select customer_id,account_type,atm_id,transaction_status from accounts 
inner join atm_transactions 
on accounts.account_id=atm_transactions.account_id;


select atm_location,city ,card_id,transaction_date from atm_machines
right join atm_transactions
on atm_machines.atm_id=atm_transactions.atm_id;


select customer_id,customer_name,address from customers 
union
select customer_id,account_number,account_type from accounts;

select card_id,account_id,amount from atm_transactions 
union
select atm_id,atm_location,city from atm_machines;


select customer_id,phone,
case 
    when address ="chennai" then "city"
    when address ="madurai" then "kovil"
else "customer_city"
end as customer_atm
from customers ;

select account_id,customer_id,expiry_date,card_type,card_status,
case 
when card_type="visa" then "visa_type"
when card_status="active" then "active_type"
else "type"
end as cards 
from atm_cards;

select atm_location,atm_status,city,
case 
 when atm_status="working" then "work"
 else "normal"
 end as machines
 from atm_machines;
 
 select card_id,amount,transaction_status,
 case 
 when transaction_status="success" then "status"
 when transaction_status="failed" then "failed_status"
 else "transaction"
 end as transaction_sta
 from atm_transactions;
 
 

 select customer_id,customer_name, 
 row_number() over(order by customer_name asc) as row_no
 from customers ; 
 
select customer_id,account_number,account_status,balance,
rank() over(order by balance asc) as rank_balance
from accounts;

select card_id,issue_date,expiry_date,card_status,card_type,
dense_rank() over(partition by card_type) as danse_type
from atm_cards;

select card_id,issue_date,expiry_date,card_status,card_type,
dense_rank() over(partition by card_type) as danse_type
from atm_cards;

CREATE VIEW customer AS
SELECT customer_name, phone, account_number, balance
FROM customers
INNER JOIN accounts
ON customers.customer_id = accounts.customer_id;

select * from customer;
  
select * from atm_modal;
 
 select * from card;
 
select upper(customer_name) from customers;
select lower(customer_name) from customers;
select length(customer_name) from customers;
select concat(account_number) from accounts;
select trim(customer_name) from customers;

select now();

create index index_customer
on customers(customer_name);

show index from customers;

create index index_account 
on accounts (account_status);


show index from accounts;

create index atm_index
on atm_machines(city);

show index from atm_machines;

DELIMITER //
create procedure custom()
BEGIN
  select * from  customer;
END//
DELIMITER ;

call custom();

DELIMITER // 
create procedure name_custom()
BEGIN 
  select customer_name,email from customers;
END //
DELIMITER ;

call name_custom();

DELIMITER //
create procedure atm_accountss()
BEGIN 
 select customer_id,account_type from accounts
 where account_type="savings";
END //
DELIMITER ;

call atm_accountss();

select distinct account_type from accounts;


select * from atm_transactions;
select * from customers;
select * from accounts;
select * from atm_cards;
select * from atm_machines;

DELIMITER //
create procedure custom_tab () 
BEGIN 
   select customer_name,address from customers;
END //
DELIMITER ;

call custom_tab();

DELIMITER //

CREATE TRIGGER prevent_empty_customer_name
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    IF NEW.customer_name IS NULL OR TRIM(NEW.customer_name) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer name cannot be empty';
    END IF;
END //

DELIMITER ;

SHOW TRIGGERS;

DELIMITER //

CREATE TRIGGER customer_name_upper
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    SET NEW.customer_name = UPPER(NEW.customer_name);
END //

DELIMITER ;

show TRIGGERS;

INSERT INTO customers (customer_id, customer_name)
VALUES (111, 'arun kumar');

SELECT * FROM customers
WHERE customer_id = 111;

SELECT customer_name
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM accounts
    WHERE balance > 50000
);

UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 201;

select * from accounts;

commit;

START TRANSACTION;

UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 201;

ROLLBACK;

SELECT * FROM accounts
WHERE account_id = 201;

SELECT SUM(amount) AS total_success_amount
FROM atm_transactions
WHERE transaction_status = 'Success';

SELECT *FROM atm_transactions
ORDER BY amount DESC
LIMIT 1;

select * FROM customers
INNER JOIN accounts
ON customers.customer_id = accounts.customer_id;

SELECT c.customer_name,a.account_number,t.transaction_type,t.amount,t.transaction_status
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id
INNER JOIN atm_transactions t
ON a.account_id = t.account_id;

SELECT address, COUNT(*) AS customer_count
FROM customers
WHERE address = 'Chennai'
GROUP BY address;

SELECT SUM(amount) AS total_success_amount
FROM atm_transactions
WHERE transaction_status = 'Success';

SELECT * FROM atm_transactions
ORDER BY amount DESC
LIMIT 1;

SELECT SUM(amount) AS total_withdrawal
FROM atm_transactions
WHERE transaction_type = 'Withdrawal'
AND transaction_status = 'Success';

SELECT SUM(amount) AS total_deposit
FROM atm_transactions
WHERE transaction_type = 'Deposit'
AND transaction_status = 'Success';

SELECT COUNT(*) AS failed_transactions
FROM atm_transactions
WHERE transaction_status = 'Failed';

SELECT c.customer_name,a.account_number,a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id
ORDER BY a.balance DESC
LIMIT 1;

SELECT atm_id,COUNT(*) AS transaction_count
FROM atm_transactions
GROUP BY atm_id
ORDER BY transaction_count DESC;

SELECT m.city,COUNT(t.transaction_id) AS transaction_count
FROM atm_machines m
INNER JOIN atm_transactions t
ON m.atm_id = t.atm_id
GROUP BY m.city
ORDER BY transaction_count DESC;

