SELECT * FROM Employee
/*SSSHDCVYT
CDNSDB
SJCJSDB
DJCJHBDS
TEST COMMENT */ 
INSERT INTO Employee(SSN, FirstN)
VALUES (238, 'ZEIN')

SELECT * FROM Employee


--DDL
CREATE TABLE emp
(
	eid int Primary Key, --assign as a primary key
	ename varchar(20) not null,
	eage int,
	eadd varchar(50) default 'cairo', --anystring must be added between quotations
	hiredate date default getdate(), --current system date function
	Dnum int


)

--ALTER

alter  table emp add sal int --adding table on run can be added by design from wizard

-- in datatype changing allowed to change within same catogry, doesnt allow to less datatype if there's data inside
the table
alter table emp alter column sal bigint -- to change data type of a column
alter table emp drop column sal --to delete table salary

--DROP
drop table emp --deleted table from database
-------------------------------------------------------------------------------------------------------------------


--DML
--Insert, update , delete
insert into emp
values(1, 'ali',NULL,'alex','1/1/2001',NULL) --what if i dont want to add data withing same arrangement
--in this case i shall writhe column name before inserting value to columns

insert into emp( ename, eid)
values ('eman',2) --allowed me to add to these 2 columns because the other columns allow null and there's default value

--to insert many rows within the same query we use INSERT INSTRUCTOR
insert into emp (emp.ename, emp.eid)
values ('eman',3),('ahmed',4),('zozo',23)

--UPDATE
update emp
	set ename ='omar',eage=25  
	where eid=3

--to update many rows at the same time
update emp
	set eage +=1

	select * from Project
	select * from Employee


delete from Employee --removes data inside the table but keeps the structure (metadata ) of the table
--always know that delete remove rows not structure
--so how we delete column?
--by using alter in column? no
--we can use set to numm by using update set
update Project
	set Pname = 'Column Test'

update Project	
	set Pname = NULL

	-------------------------------------------------------------------------------------------------------------
---- 
-- DQL
select * from Employee --usually brings back the whole table but if i selected certin data brings back "columns"
select SSN, LastN from Employee

--to bring certin rows use where
select * from Employee	
	where Gender ='M'

select * from Employee 
	order by FirstN asc

select firstN+' '+lastn as [FullN]
	from Employee


select * from Employee
where FirstN is not NULL --and LastN is not NULL

select FirstN
from Employee


select distinct FirstN-- ye3ml order w b remove el mktrar
from Employee


select *
from Emp
where eadd in ( 'cairo' , 'alex')  ---in is the used in case of wanting to use OR
---   and eage > 25
select *
from Emp
where eage<=27 and eage>=23

select *
from emp
where eage between 23 and 27

---Mapping
--Create DB
--SQL (DDL, DML, DQL)
