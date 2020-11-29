/* 1) Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения
(JOIN пока не применять).

*Проагализировала. Думаю, понять, какие корректировки или улучшения можно сделать, применив запросы к таблицам большего размера.
* Но это к скорости выполнения ближе, а мы такое еще не изучали. */

/* 2) Пусть задан некоторый пользователь. ( пользователь 82) 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.*/

select 
	(select concat(firstname, ' ', lastname) from users where id = 82) receiver,
	(select concat(firstname, ' ', lastname) name from users u2 
where id = (select from_user_id from (select from_user_id, count(*) from messages where to_user_id=82 group by 1 order by 2 desc limit 1) top_sender 
where from_user_id in (select initiator_user_id from friend_requests where target_user_id = 82 and status = 'approved'
		union
	select target_user_id from friend_requests where initiator_user_id = 82 and status = 'approved'))) top_sender
from dual;


-- 3) Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

select count(*) total_likes from 
(select * from comment_likes cl where comment_id in (select id from comments where user_id in (select * from (select id from users order by birthday desc limit 10) young_comments))
union
select * from photo_likes where photo_id in (select id from photos where user_id  in (select * from (select id from users order by birthday desc limit 10) young_photos))
union
select * from post_likes pl where post_id in (select id from posts where user_id in (select * from (select id from users order by birthday desc limit 10) young_posts))) all_likes;

-- 4) Определить кто больше поставил лайков (всего) - мужчины или женщины?

select 
	(select count(*) male_likes from 
	(select * from comment_likes cl where from_user_id in (select id from users where gender = 'm')
		union
	select * from photo_likes pl where from_user_id in (select id from users where gender = 'm')
		union
	select * from post_likes pl2 where from_user_id in (select id from users where gender = 'm')) males) male_likes,
	(select count(*) female_likes from 
	(select * from comment_likes cl where from_user_id in (select id from users where gender = 'f')
		union 
	select * from photo_likes pl where from_user_id in (select id from users where gender = 'f')
		union
	select * from post_likes pl2 where from_user_id in (select id from users where gender = 'f')) females) female_likes 
from dual;


-- 5) Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

-- все неактивные

select * from users
where id not in (select user_id from posts)
	and id not in (select user_id from comments) 
	and id not in (select from_user_id from messages m2) 
	and id not in (select from_user_id from comment_likes cl)
	and id not in (select from_user_id from photo_likes pl )
	and id not in (select from_user_id from post_likes pl2)
	and id not in (select user_id from users_communities uc)
	and id not in (select initiator_user_id from friend_requests fr )
	and id not in (select user_id from photos p2) ;

-- все активные
select * from users 
where id not in 
(select id from users
where id not in (select user_id from posts)
	and id not in (select user_id from comments) 
	and id not in (select from_user_id from messages m2) 
	and id not in (select from_user_id from comment_likes cl)
	and id not in (select from_user_id from photo_likes pl )
	and id not in (select from_user_id from post_likes pl2)
	and id not in (select user_id from users_communities uc)
	and id not in (select initiator_user_id from friend_requests fr )
	and id not in (select user_id from photos p2));
	
-- 10 менее активных

select user_id, count(user_id) from (select user_id from comments c 
union all
select user_id from posts p 
union all
select from_user_id from messages
union all
select from_user_id from comment_likes cl 
union all
select from_user_id from photo_likes pl 
union all
select user_id from users_communities uc 
union all
select initiator_user_id from friend_requests fr 
union all 
select user_id from photos) all_active
group by 1 order by 2
limit 10;

