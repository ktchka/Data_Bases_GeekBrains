-- the view with basic film info: title, type, genre, summary, country, language

create or replace view basic_film_info as
select f.filmtitle, f.filmtype, c.country, l.lang, g.genre, (select trivia from (select trivia from trivia t where obj_type = 'f' and original_id = f.id limit 1) temp) summary
from filmitem f 
left join film_genre fg on f.id = fg.film_id 
left join genres g on fg.genre_id = g.id 
left join film_country fc on f.id = fc.film_id 
left join countries c on fc.country_id = c.id
left join film_language fl on f.id = fl.film_id 
left join languages l on fl.lang_id = l.id ;

select * from basic_film_info limit 5;

-- the view with information about actors: name, gender, country, starring, trivia

create or replace view basic_person_info as
select p2.name, p2.gender, c.country, (select trivia from (select trivia from trivia t where obj_type = 'p' and original_id = p2.id limit 1) temp) facts, 
 (select title from 
 (select filmitem.filmtitle title, p.name from filmitem 
left join film_cast fc on fc.film_id = filmitem.id 
left join people p on fc.person_id = p.id
where p.id = p2.id) temp1) starring	
from people p2 
left join countries c on p2.country_id = c.id
where p2.id in (select person_id from film_cast fc);


select * from basic_person_info limit 5;