-- procedure which shows recomended films based on the genres of the watched ones

drop procedure if exists recommendation;

delimiter //

create procedure recommendation(in check_user int)
begin
	select filmtitle from filmitem f2 where id in
	(select film_id from film_genre fg2 where genre_id in 
	(select genre_id from film_genre fg where film_id in (select  film_id from user_rates ur 
	where user_id = check_user)));
end//

delimiter ;
	
call recommendation(80);

-- trigger which doesn't allow to add reviews for the same movie

drop trigger if exists check_user_existence_for_review;
delimiter //

create trigger check_user_existence_for_review before insert on reviews
for each row
begin 
	 if new.user_id in (select user_id from reviews) and new.film_id in (select film_id from reviews ) then
		signal sqlstate '45000' set message_text = "The review for this film from this user already exists!";
	 end if;
end//

delimiter ;

insert into reviews (user_id, film_id) values (1,1);