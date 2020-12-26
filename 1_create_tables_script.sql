drop database if exists imdb; 
create database imdb;

drop table if exists filmitem;
create table filmitem (
	id serial primary key,
	filmtitle varchar(255) not null,
	release_date date,
	boxoffice int,
	filmtype enum('c','tv','tvs','mini') comment 'c - cinema film, v - tv-film, tvs - series, mini - mini-series',
	cover_photo_id int unsigned not null comment 'Identifying photo in the page',
	summary text
	) comment = 'Film general information';
	
drop table if exists episodes;
create table episodes (
	id serial primary key,
	film_id bigint unsigned not null comment 'Series title',
	season int unsigned not null comment 'Season number',
	release_date date comment 'Episode release date',
	episode_number int unsigned not null,
	episode_title varchar(150),
	episode_summary text,
	foreign key (film_id) references filmitem(id)
	) comment = 'Episode basic information';

drop table if exists production_companies;
create table production_companies (
	id serial primary key,
	company varchar(250) not null)
	comment = 'Film studios and production companies';

drop table if exists company_credits;
create table company_credits (
	id serial primary key,
	film_id bigint unsigned not null,
	company_id bigint unsigned not null,
	foreign key (film_id) references filmitem(id),
	foreign key (company_id) references production_companies(id)
	) comment = 'Films and studios';
	
drop table if exists countries;
create table countries (
	id serial primary key,
	country varchar(50)
	) comment = 'The list of countries';

drop table if exists film_country;
create table film_country (
	id serial primary key,
	film_id bigint unsigned not null,
	country_id bigint unsigned not null,
	foreign key (film_id) references filmitem(id),
	foreign key (country_id) references countries(id)
	) comment = 'Films and countries';

drop table if exists alternative_film_title;
create table alternative_film_title (
	id serial primary key,
	film_id bigint unsigned not null,
	title varchar(250),
	country_id bigint unsigned not null comment 'The country where this title is used',
	foreign key (film_id) references filmitem(id),
	foreign key (country_id) references countries(id)
	) comment = 'Alternative film titles';
	
drop table if exists awards;
create table awards (
	id serial primary key,
	award_title varchar(50),
	nomination_category varchar(250)
	) comment = 'Awards list';

drop table if exists awards_film;
create table awards_film (
	id serial primary key,
	film_id bigint unsigned not null,
	award_id bigint unsigned not null,
	status enum('winner', 'nominee'),
	foreign key (film_id) references filmitem(id),
	foreign key (award_id) references awards(id)
	) comment = 'Awarded and nominated films';
	
drop table if exists languages;
create table languages (
	id serial primary key,
	lang varchar(50)
	) comment = 'Languages list';
	
drop table if exists film_language;
create table film_language (
	id serial primary key,
	film_id bigint unsigned not null,
	lang_id bigint unsigned not null,
	foreign key (film_id) references filmitem(id),
	foreign key (lang_id) references languages(id)
	) comment = 'Film language';
	
drop table if exists genres;
create table genres (
	id serial primary key,
	genre varchar(30)
	) comment = 'Genre list';

drop table if exists film_genre;
create table film_genre (
	id serial primary key,
	film_id bigint unsigned not null,
	genre_id bigint unsigned not null,
	foreign key (film_id) references filmitem(id),
	foreign key (genre_id) references genres(id)
	) comment = 'Film genre';

drop table if exists locations;
create table locations (
	id serial primary key,
	location varchar(250)
	) comment = 'Locations list';

drop table if exists filming_location;
create table filming_location (
	id serial primary key,
	film_id bigint unsigned not null,
	location_id bigint unsigned not null,
	foreign key (film_id) references filmitem(id),
	foreign key (location_id) references locations(id)
	) comment = 'Filming locations';

drop table if exists part_type;
create table part_type (
	id serial primary key,
	value varchar(50)
	) comment = 'Production roles';

drop table if exists photos;
create table photos (
	id serial primary key,
	obj_type enum('p', 'f') comment "p - person's photo, f - film images",
	original_id bigint unsigned not null,
	caption varchar(255)
	) comment = 'Photos and images';

drop table if exists people;
create table people (
	id serial primary key,
	name varchar(100),
	date_bitrh date,
	gender enum('f','m','nb') comment 'Female, male, non-binary',
	country_id bigint unsigned not null,
	cover_photo_id bigint unsigned not null comment 'The identifying photo in the page',
	foreign key (country_id) references countries(id),
	foreign key (cover_photo_id) references photos(id)
	) comment = 'People involved with the production';

drop table if exists film_cast;
create table film_cast (
	id serial primary key,
	film_id bigint unsigned not null,
	person_id bigint unsigned not null,
	film_characted varchar(150),
	foreign key (film_id) references filmitem(id),
	foreign key (person_id) references people(id)
	) comment = 'Films and their cast';

drop table if exists film_crew;
create table film_crew (
	id serial primary key,
	film_id bigint unsigned not null,
	person_id bigint unsigned not null,
	part_type_id bigint unsigned not null,
	details varchar(250),
	foreign key (film_id) references filmitem(id),
	foreign key (person_id) references people(id),
	foreign key (part_type_id) references part_type(id)
	) comment = 'Films and their crew';

drop table if exists trivia;
create table trivia (
	id serial primary key,
	obj_type enum('p', 'f') comment "p - facts about people, f - facts about films",
	original_id int unsigned not null,
	trivia text
	) comment = 'Facts about films and people';

drop table if exists videos;
create table videos (
	id serial primary key,
	film_id bigint unsigned not null,
	filemane varchar(255),
	title varchar(255) comment 'The title of a video',
	caption text,
	foreign key (film_id) references filmitem(id)
	) comment = 'Videos';

drop table if exists official_sites;
create table official_sites (
	id serial primary key,
	site varchar(255) comment 'Official websites'
	) comment = 'The list of all official websites';
	
drop table if exists film_websites;
create table film_websites (
	id serial primary key,
	film_id bigint unsigned not null,
	site_id bigint unsigned not null,
	foreign key (film_id) references filmitem(id),
	foreign key (site_id) references official_sites(id)
	) comment = 'Films and their official websites';
	
drop table if exists keywords;
create table keywords (
	id serial primary key,
	keyword varchar(100)
	) comment = 'All possible keywords';
	
drop table if exists film_keywords;
create table film_keywords (
	id serial primary key,
	film_id bigint unsigned not null,
	keyword_id bigint unsigned not null,
	foreign key (film_id) references filmitem(id),
	foreign key (keyword_id) references keywords(id)
	) comment = 'Films and their keywords';
	
drop table if exists technical_specs;
create table technical_specs (
	id serial primary key,
	film_id bigint unsigned not null,
	runntime_min int unsigned not null comment 'Film duaration in minutes',
	soundmix varchar(100),
	color enum('c','bw') comment 'c - color, bw - black&white' ,
	aspect_ratio varchar(10),
	foreign key (film_id) references filmitem(id)
	) comment = 'Technical specifications';
	
drop table if exists soundtrack;
create table soundrack (
	id serial primary key,
	film_id bigint unsigned not null,
	track_title varchar(255),
	music_by_id bigint unsigned not null,
	lyrics_by_id bigint unsigned not null,
	performed_by_id bigint unsigned not null,
	courtesy_of varchar(255),
	foreign key (film_id) references filmitem(id),
	foreign key (music_by_id) references people(id),
	foreign key (lyrics_by_id) references people(id),
	foreign key (performed_by_id) references people(id)
	) comment = "Film soundtrack";

drop table if exists users;
create table users (
	id serial primary key,
	username varchar(20),
	date_birth date not null,
	country_id bigint unsigned not null,
	email varchar(50),
	foreign key (country_id) references countries(id)
	) comment = 'Users';

drop table if exists reviews;
create table reviews (
	id serial primary key,
	user_id bigint unsigned not null,
	film_id bigint unsigned not null,
	review text,
	foreign key (user_id) references users(id),
	foreign key (film_id) references filmitem(id)
	) comment = 'Film reviews';
	
drop table if exists user_rates;
create table user_rates (
	id serial primary key,
	user_id bigint unsigned not null,
	film_id bigint unsigned not null,
	rating tinyint,
	foreign key (user_id) references users(id),
	foreign key (film_id) references filmitem(id)
	) comment = "User's film rating";
	
drop table if exists film_rating;
create table film_rating (
	id serial primary key,
	film_id bigint unsigned not null,
	total_votes int not null default '0',
	total_rating float(1,1) unsigned not null default '0.0',
	foreign key (film_id) references filmitem(id)
	) comment = "Final film rating";