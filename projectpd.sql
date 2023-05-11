show databases;
create database project;
use project;
show tables;
select * from fortune;
drop table fortune;
desc fortune;

-- creating new column 
alter table fortune add column id int primary key auto_increment;
alter table fortune drop column id;
select * from fortune;
desc fortune;


-- adding constraints
-- primary key
alter table fortune add primary key (ranking);
alter table fortune drop primary key;
-- not null 
alter table fortune modify revenues text not null;
-- unique
alter table fortune modify company varchar(40);
alter table fortune add unique (company);
-- default
alter table fortune add column country varchar(20) default 'global';
select * from fortune;
desc fortune;

-- select 
select ranking as position, company from fortune where ranking = 3;

-- update 
update fortune set company = 'Walmart Corp' where ranking = 1;
select * from fortune;

-- delete
delete from fortune where ranking = 1;
select * from fortune;

-- distinct 
select distinct company from fortune;

-- count
select count(distinct(ranking)), count(distinct(company)) from fortune;
select * from fortune;
desc fortune;
alter table fortune modify employees int;









select * from salaries;
desc salaries;
alter table salaries rename column myunknowncolumn to id;

-- filtering 
select id, work_year, salary from salaries where salary > 50000;
select id, work_year as joining, salary, company_size from salaries where salary = 70000 and company_size = 'L';
select id, salary, company_size from salaries where salary < 70000 or company_size = 'M';
select id, salary, job_title from salaries where salary between 90000 and 100000;
select * from fortune;

-- concat
select concat (ranking, '  =  ', company) as rankid from fortune;

-- length
select company, char_length(company) as length from fortune;

-- lower and upper
select lower(company) as company from fortune;
select upper(company) as company from fortune;
select * from fortune;
select * from salaries;
-- like operator
select ranking, company, employees from fortune where company like 'general%';

-- order by
select id, job_title as job, salary from salaries order by salary desc limit 5;

-- group by
select job_title, salary, salary_currency, work_year from salaries group by job_title;

-- sub query
select job_title, salary from salaries where salary > (select avg(salary) from salaries);

-- self join
select t1.work_year, t1.company_size from salaries as t1 inner join salaries as t2
on (t1.work_year = t2.work_year and t1.company_size = t2.company_size);