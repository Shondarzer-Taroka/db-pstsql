select * from person
alter table person
add column age varchar(23)


alter table person
drop column age


alter table person
add column upazila varchar(23) default 'Dhaka'



alter table person
rename column upazila to district


alter table person
ALTER COLUMN district
SET  NOT NULL


alter table person 
add column mob varchar(15) unique check(length (mob)>=15)


 alter table person
 rename to manush

 alter table manush 
 rename to person

select * from person
select * from manush

alter table person 
drop column mob