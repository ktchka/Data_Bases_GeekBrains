-- Оптимизация запросов
/* Создайте таблицу logs типа Archive. 
 * Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи,
 *  название таблицы, идентификатор первичного ключа и содержимое поля name.*/

drop table if exists logs;
create table logs(
	name varchar(101),
	created_at datetime,
	table_name enum('users','catalogs','products'),
	original_id bigint unsigned not null) engine = archive;

drop trigger if exists insert_from_users_to_logs;
drop trigger if exists insert_from_catalogs_to_logs;
drop trigger if exists insert_from_products_to_logs;

delimiter //

create trigger insert_from_users_to_logs before insert on users
for each row
begin 
insert into logs(name,created_at,table_name,original_id) 
values (new.name, new.created_at, 'users', new.id);
end//

create trigger insert_from_catalogs_to_logs before insert on catalogs
for each row
begin 
insert into logs(name,created_at,table_name,original_id) 
values (new.name, current_timestamp(), 'catalogs', new.id);
end//

create trigger insert_from_products_to_logs before insert on products
for each row
begin 
insert into logs(name,created_at,table_name,original_id) 
values (new.name, new.created_at, 'products', new.id);
end//

delimiter ;


insert into users(name) values('Dwight');
insert into catalogs(name) values('Cameras');
insert into products(name) values('Sony X5');

/*(по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.*/

drop procedure if exists mil_lines;
delimiter //

create procedure mil_lines()
begin
	declare i int default 0;
	while i < 1000000 do
		insert users(firstname) values ('firstname');
		set i = i + 1;
	end while;
end//
delimiter ;


