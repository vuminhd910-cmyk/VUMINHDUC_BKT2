create database BookStore; 
use BookStore; 
create table category (
category_id int AUTO_increment  primary key not null, 
category_name varchar(100) not null, 
description varchar(255)
); 

create table Book (
book_id int primary Key auto_increment not null, 
titlte varchar(150) not null, 
status int default 1, 
publish_date date , 
price decimal(18,2) ,
category_id int, 
foreign key (category_id) references  category(category_id) , 
author_name varchar(30) not null 

);

create table BookOrder ( 
order_id int primary key auto_increment not null , 
customer_name varchar(100) not null, 
book_id int , 
order_date date default(current_date), 
delivery_date date , 
foreign key (book_id) references Book(book_id) 
on delete cascade 
); 

alter table Book 
add author_name varchar(100) not null ; 
alter table BookOrder 
modify customer_name varchar(200); 
alter table BookOrder 
add constraint check_delivery_date check(delivery_date >= order_date) ; 

insert into category(category_name, description) 
values 
('IT & Tech', 'Sách lập trình'), 
('Business', 'Sách kinh doanh'), 
('Novel', 'Tiểu thuyết') ; 

insert into Book(titlte, status, publish_date, price, category_id,author_name) 
values 
('Clean Code', 1, '2020-05-10', 500000,1, 'Robert C. Martin' ) ,
('Đắc Nhân Tâm', 0,'2018-08-20', 150000, 2, 'Dale Carnegie'), 
('JavaScript Nâng cao',1, '2023-01-15', 350000, 1, 'Kyle Simpson'), 
('Nhà Giả Kim', 0, '2015-11-25', 120000, 3, 'Paulo Coelho'); 

insert into BookOrder(order_id, customer_name, book_id, order_date, delivery_date)
values 
(101, 'Nguyen Hai Nam', 1, '2025-01-10', '2025-01-15'), 
(102, 'Tran Bao Ngoc', 3, '2025-02-05', '2025-02-10'), 
(103, 'Le Hoang Yen', 4, '2025-03-12', NULL); 

update Book 
set price = price + 50000 
where category_id = 1 ; 

 update BookOrder 
 set delivery_date = '2025-12-31' 
 where delivery_date is  null ; 

delete from bookOrder 
where order_date < '2025-02-01' ; 

select * from Book 
order by price desc 
limit 2 ; 

SELECT titlte, author_name , 
case 
when status = 1 then 'Còn hàng' 
   when status = 1 then 'hết hàng' 
   else 'không xác định' 
   end as status_name 
   from Books; 























 



 










