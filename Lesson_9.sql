-- “Транзакции, переменные, представления”

/* 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
 Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.*/

START TRANSACTION; 
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1 LIMIT 1;
COMMIT;

/* 2. Создайте представление, которое выводит название name товарной позиции из таблицы products 
 * и соответствующее название каталога name из таблицы catalogs.*/

create view names as select p.name product_name, c.name catalog_name from products p left join catalogs c on p.catalog_id = c.id;
select * from names;

/* 3. Пусть имеется таблица с календарным полем created_at. 
 * В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', 
 * '2016-08-04', '2018-08-16' и 2018-08-17. 
 * Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1,
 *  если дата присутствует в исходном таблице и 0, если она отсутствует.*/

select selected_date, 
case 
	when selected_date in ('2018-08-01', '2016-08-04', '2018-08-16','2018-08-17') then 1
 	else 0
end as is_absent
from 
(select selected_date from 
(select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selected_date from
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3,
 (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v
where selected_date between '2018-08-01' and '2018-08-31') august_dates;

/* 4.Пусть имеется любая таблица с календарным полем created_at. 
 * Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.*/

use  snet0611;
start transaction;
create view fresh5 as select id from posts order by created_at desc limit 5;
delete from posts 
where id not in (select id from fresh5);
commit;

-- “Администрирование MySQL” 

/* 1. Создайте двух пользователей которые имеют доступ к базе данных shop. 
 * Первому пользователю shop_read должны быть доступны только запросы на чтение данных,
 *  второму пользователю shop — любые операции в пределах базы данных shop.*/

create user shop_read, shop;
grant all on shop.* to shop;
grant select on shop.* to shop_read;

/* 2. (по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password, содержащие первичный ключ, имя пользователя и его пароль. 
 * Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. 
 * Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако, мог бы извлекать записи из представления username.
 */

create view username as
select id, name from customers;

create user user_read;
grant select on username to user_read;
revoke all on shop.accounts from user_read;

-- “Хранимые процедуры и функции, триггеры"

/* 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
 * С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
 *  с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер",
 *  с 00:00 до 6:00 — "Доброй ночи".
 */

drop function if exists hello;

delimiter //

create function hello()
returns varchar(50)
deterministic
begin
	select 
		case 
			when curtime() between '06:00:00' and '12:00:00' then 'Доброе утро'
			when curtime() between '12:01:00' and '18:00:00' then 'Добрый день'
			when curtime() between '18:01:00' and '00:00:00' then 'Добрый вечер'
			else 'Доброй ночи'
		end as gr
	into @greeting;
	return @greeting;
end 
//
delimiter ;

select hello() as hello; 


/* 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
 * Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
 Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
 */
use example;

drop trigger if exists check_null;
delimiter //

create trigger check_null before insert on products
for each row 
begin
	if new.name is null then 
		signal sqlstate '45000'
		set message_text = 'You cannot insert null values';
	end if;
end 
//

delimiter ;
insert into products(name) values('fjffj');
insert into products(name) values(null);

/* 3.(по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
 * Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. Вызов функции 
 * FIBONACCI(10) должен возвращать число 55.
 */

drop function if exists fibonacci;

delimiter //

create function fibonacci(n int)
returns decimal deterministic
begin
	set @outcome = (power(1.6180339,n) - power(-0.6180339,n))/2.236067977;
	return @outcome;
end //

delimiter ;

select fibonacci(10);