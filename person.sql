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

select * from person