-- all alternative film titles for film_id 3

select title from alternative_film_title aft where film_id = 3;

-- 5 countries with the majority of films

select count(*), c2.country 
from film_country fc 
left join countries c2 on fc.country_id = c2.id
group by fc.country_id order by 1 desc limit 5;

-- usersnames who rated more films, their ratings and film_title

select u.id, u.username, ur.film_id, f2.filmtitle, ur.rating 
from users u 
left join user_rates ur on u.id = ur.user_id 
left join filmitem f2 on ur.film_id = f2.id
where u.id in (select user_id from (select count(*), user_id from user_rates ur group by 2 order by 1 desc limit 1) temp)
order by 5 desc;

-- the genres of the majority of 10-rated films

select genre, count(*) from genres g2 where id in 
(select genre_id from film_genre fg where film_id in (select film_id from
(select film_id, count(*) from user_rates ur where rating = 10 group by 1 order by 2 desc) temp)) group by 1 order by 2 desc limit 3;

-- production companies, whose cinema films were awarded

select pc.company, f2.filmtitle from company_credits cc 
left join production_companies pc on cc.company_id = pc.id 
left join filmitem f2 on cc.film_id = f2.id 
where cc.film_id in 
(select film_id from awards_film af where status = 'winner') and f2.filmtype = 'c';

-- locations where films with the best boxoffice were shot
select l2.location from filming_location fl 
left join locations l2 on fl.location_id = l2.id 
where fl.film_id in (select id from (select * from filmitem order by boxoffice desc limit 10) temp);

-- actors of the worst-rated movies

select p2.name, fc.film_id from film_cast fc 
left join people p2 on fc.person_id = p2.id
where film_id in (select film_id from (select film_id, count(*) from user_rates ur where rating in (0,3) group by 1 order by 2 desc limit 10) temp);