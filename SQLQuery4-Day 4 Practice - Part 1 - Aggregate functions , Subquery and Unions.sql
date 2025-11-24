--Agregate functions

select salary
from Instructor

select sum(salary)
from Instructor

--using more than agg function in the same query
select min(salary) as MinVal ,max(salary) as MaxVal
from Instructor

--Agg function does not count Null values
Select Count(*),count(st_id),count(st_fname),count(st_age)
from student

--both are equally same but give different values
select avg(st_age) --divided people who have age only as it doesnt count null
from student
--we can use isnull here to make the avg count null values
select avg(isnull(st_age,0)) 
from student

select sum(st_age)/count(*) --divided on all people either has age or no
from student

----------------------------
--any normal columns next to select must be added inside group by also
select sum (salary),i.dept_id,d.Dept_Name
from Instructor i inner join Department d
on i.Dept_Id =d.Dept_Id
group by i.Dept_Id,d.Dept_Name

--2 group by clauses in query will make db group by with both address and deptid
--ex alex-->10 , alex --> 30 , cairo -->10 , cairo --> 30
select avg(st_age),St_Address,Dept_Id
from Student
group by St_Address,Dept_Id

--query malosh m3na as no group by for primary keys as it's unique already
select avg(st_age),St_Id
from Student
group by St_Id

---
select sum(salary), Dept_Id
from Instructor
where salary >1000
group by Dept_Id

---
select sum(salary), Dept_Id
from Instructor
group by Dept_Id
having sum(salary)>10000

--having btayar group kamel but where change values in rows
Select sum(salary), dept_id
from Instructor
group by dept_id
having Count(ins_id)<6

--having must yekon m3aha aggregate function
-- we can use having and where together
--orderd by where > group > having
Select sum(salary), dept_id
from Instructor
where salary > 1000
group by dept_id
having Count(ins_id)<6
----------------------------------------------------

--SUBQUERY
--to use query inside a query
--output of a query to be inside another query
select *
from student
where st_age<avg(St_Age)

--query msh hat run then we need to use a subquery
select *
from student
where st_age< (Select avg(st_age) from student)
--where st_age < 23
--Inner query runs before outer query

select * , (select count(st_id) from student)
from Student

select count(st_id) from student
--subequery can be written anywhere, select having

--to get departments that have students only
--we can add not in to get dept that have no students only!
Select dept_name
from Department
where dept_id in (select distinct (dept_id) from student where dept_id is not null)

--But we can use join instead and get same result
Select distinct dept_name
from student s inner join Department d
on s.Dept_Id = d.Dept_Id

-- we can use more effective queries by using join instead

--Subquery + DML

Delete from Stud_Course
where st_id = 1
---

Delete from Stud_Course
where st_id in (Select st_id from student where st_address ='cairo')

select * from Stud_Course

-----------------------

--  UNION FAMILY --
-- Union All
-- Union
--Intersect
--Except

--without union called patch
select st_fname as Names
from student
union all
select ins_name
from Instructor
--29 row

--Same # in 1st select = # in 2nd select with same data type
--the query takes first select row name and use it

--Union gets distinct / unique names only removes duplicates
select st_fname as Names
from student
union 
select ins_name
from Instructor
--24 row
--if there's duplicates it removes it


--Intersect gets common name distinct
select st_fname as Names
from student
intersect
select ins_name
from Instructor
--4 rows
--hat students name that have same name as instructors


--Except gets in 1st result set and not in 2nd result set, removes one from one
select st_fname as Names
from student
except
select ins_name
from Instructor
--9 rows
-- hat 3dd el talba eli asamehom msh zay asamy el instructors




