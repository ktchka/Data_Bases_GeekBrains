-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
select 
	id, name
from users u2 
where id in (select id from orders);

-- Выведите список товаров products и разделов catalogs, который соответствует товару.
select id, name, (select name from catalogs c2 where c2.id = p.catalog_id) catalog_name from products p; 


/*(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 * Поля from, to и label содержат английские названия городов, поле name — русское. 
 * Выведите список рейсов flights с русскими названиями городов.*/
select id, (select name from cities c where c.label = f.`from` ) from_city, (select name from cities where c.label = f.`to` ) to_city from flights f;