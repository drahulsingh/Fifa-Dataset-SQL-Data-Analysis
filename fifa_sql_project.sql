#	Create the database
create database if not exists fifa_database;

#  Use database 
use fifa_database;

#  Create a table with above details 
create table if not exists match_details(
    ID varchar(50) not null,
    Home varchar(255) not null,
    Away varchar(255) not null,
    Stage varchar(255) not null,
    Scorer varchar(255) not null,
    ScoringTeam varchar(255) not null,
    Type varchar(255) not null
);

#Import the csv file into match_details using table with data table import wirzad

#1.	Show the top 10 rows of match details table
select * from match_details limit 10;

#2.	Remove the duplicate rows using the id column 
select ID, count(ID) from match_details
group by ID 
having count(ID)>1;

select distinct* from match_details;

#3.	Creating the non duplicate data table and adding all the unique rows
create table non_duplicate_data
select distinct * from match_details;

#4.	Deleting the original table(match_details)
drop table match_details;

#5.	Altering the non duplicate data table to original table
alter table  non_duplicate_data rename match_details;

#6.	removed all the duplicates from the original table
select ID, count(ID) from match_details
group by ID 
having count(ID)>1;

#7.	Write a query to show the scorer name and how many goal scored the store the data in to another table called scorer
select scorer, count(id) as goal
from match_details
group by Scorer;

create table if not exists scorer
select scorer, count(id) as goal
from match_details
group by Scorer;

create table if not exists scoring
select scorer, count(id) as goal
from match_details
group by Scorer;

#8.	Write a query  to show the scorer  with the most goals?
select * from scorer order by goal desc;

#9. Write a query to type of goal scored by players and also return the count of type.
select type , count(*) from match_details
group by type;

#10. Write a query to type of goal scored by players and also return the count of type  ascending order
select type , count(*) as number_of_type_goal from match_details
group by type 
order by number_of_type_goal asc;




