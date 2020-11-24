use example;

-- Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

update users set created_at = now(), updated_at = now();

/* Таблица users была неудачно спроектирована. 
 * Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017 8:10. 
 * Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.*/

alter table users add column new_created_at DATETIME;
alter table users add column new_updated_at DATETIME;
update users 
set new_created_at = str_to_date(created_at, '%d.%m.%Y %h:%i'),
	new_updated_at = str_to_date(updated_at, '%d.%m.%Y %h:%i');
alter table users 
	drop created_at, updated_at,
	rename column new_created_at to created_at,
				  new_updated_at to updated_at;
	
/* В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
 * 0, если товар закончился и выше нуля, если на складе имеются запасы. 
 * Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
 * Однако нулевые запасы должны выводиться в конце, после всех записей.*/
				 
select * from storehouses_products sp 
order by case when value = 0 then 123456789 else value end;

/*(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
 * Месяцы заданы в виде списка английских названий (may, august)*/

select name from users 
where birthday_at in ('may', 'august');

/*(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
 * SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
 * Отсортируйте записи в порядке, заданном в списке IN.*/

select * from catalogs where id in (5,1,2)
order by field(id,5,1,2);

-- Подсчитайте средний возраст пользователей в таблице users.

select avg(floor(datediff('2020-11-24', birthday_at)/365)) as average_age from users;

/* Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 * Следует учесть, что необходимы дни недели текущего года, а не года рождения.
 */

alter table users add column this_year_birthday datetime;
update users set this_year_birthday = date_format(birthday_at, '2020-%m-%d');
select count(weekday(this_year_birthday)) days_count, weekday(this_year_birthday) day_id,
	case
		when weekday(this_year_birthday)=0 then 'Monday'
		when weekday(this_year_birthday)=1 then 'Tuesday'
		when weekday(this_year_birthday)=2 then 'Wednesday'
		when weekday(this_year_birthday)=3 then 'Thursday'
		when weekday(this_year_birthday)=4 then 'Friday'
		when weekday(this_year_birthday)=5 then 'Saturday'
		else 'Sunday'
		end as birthday_day
from users	
group by 2
order by 2;

-- (по желанию) Подсчитайте произведение чисел в столбце таблицы.
select floor(exp(sum(log(value)))) product from tbl;