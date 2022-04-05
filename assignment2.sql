create database moviee;
use moviee;
select * from movies;
show tables;


create table actor(act_id int,act_name varchar(20),act_gender varchar(10),primary key(act_id));
create table director(dir_id int,dir_name varchar(20),dir_phone varchar(10),primary key(dir_id));
create table movies(mov_id int, mov_title varchar(20), mov_year int, mov_lang varchar(20), dir_id int,primary key(mov_id));
create table movie_cast (act_id int, mov_id int,role varchar(20),foreign key(act_id)references actor(act_id) on delete cascade,foreign key(mov_id)references movies(mov_id) on delete cascade);
create table rating(mov_id int,rev_stars int,foreign key(mov_id)references movies(mov_id) on delete cascade); 

insert into actor(act_id,act_name,act_gender)values(101,'antony perkins','male');
insert into actor(act_id,act_name,act_gender)values(102,'janet leign','female');
insert into actor(act_id,act_name,act_gender)values(103,'margrate lockwod','female');
insert into actor(act_id,act_name,act_gender)values(104,'michael redgrave','male');
insert into actor(act_id,act_name,act_gender)values(105,'dennis weaver','male');
insert into actor(act_id,act_name,act_gender)values(106,'luccille benson','male');

insert into director(dir_id,dir_name,dir_phone)values(202,'hitcock','9824315609');
insert into director(dir_id,dir_name,dir_phone)values(203,'victor saville',9045231789);
insert into director(dir_id,dir_name,dir_phone)values(204,'steven spielberg','8902453199');


insert into movies(mov_id,mov_title,mov_year,mov_lang,dir_id)values(301,'the lady vanishes',1938,'english',202);
insert into movies(mov_id,mov_title,mov_year,mov_lang,dir_id)values(302,'psycho',1960,'english',202);
insert into movies(mov_id,mov_title,mov_year,mov_lang,dir_id)values(303,'if winter comes',1947,'english',203);
insert into movies(mov_id,mov_title,mov_year,mov_lang,dir_id)values(304,'duel',1971,'english',204);

insert into movie_cast(act_id,mov_id,role)values(101,302,'normal bates');
insert into movie_cast(act_id,mov_id,role)values(102,302,'marion crane');
insert into movie_cast(act_id,mov_id,role)values(102,303,'effie bright');
insert into movie_cast(act_id,mov_id,role)values(103,301,'iris henderson');
insert into movie_cast(act_id,mov_id,role)values(104,301,'gillbert');
insert into movie_cast(act_id,mov_id,role)values(105,304,'david mann');
insert into movie_cast(act_id,mov_id,role)values(106,304,'luccille benson');

insert into rating(mov_id,rev_stars)values(301,5);
insert into rating(mov_id,rev_stars)values(302,4);
insert into rating(mov_id,rev_stars)values(303,4);
insert into rating(mov_id,rev_stars)values(304,3);

select movies.mov_title,director.dir_name from movies inner join director on movies.dir_id=director.dir_id where director.dir_name='hitcock';
SELECT mov_title FROM movies WHERE mov_id IN (
SELECT mov_id FROM  movie_cast WHERE act_id IN (
SELECT act_id FROM actor WHERE act_id IN (
SELECT act_id FROM  movie_cast GROUP BY act_id HAVING COUNT(act_id)>1)));
select actor.act_name from actor inner join movie_cast on actor.act_id=movie_cast.act_id where mov_id in (select mov_id from movies where where mov_year<2005 or mov_year>2015);
