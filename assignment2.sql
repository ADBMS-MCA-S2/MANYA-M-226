create database moviee;
use moviee;
create table actor(act_id int,act_name varchar(20),act_gender varchar(10));
create table director(dir_id int,dir_name varchar(20),dir_phone int);
create table movies(Mov_id int, Mov_Title varchar(20), Mov_Year date, Mov_Lang varchar(20), Dir_id int);

create table movie_cast (act_id int, mov_id int,role varchar(20));
create table rating(mov_id int,  rev_stars int) 
