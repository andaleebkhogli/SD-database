--Day 4 part 2

Select St_Fname, St_Age, Dept_Id
from Student
order by St_Address

--order by 1st column in select

Select St_Fname, St_Age, Dept_Id
from Student
order by 1

--sub order
Select St_Fname, St_Age, Dept_Id
from Student
order by Dept_Id asc, St_Age desc

--to order with something useful we must use column have duplicate
delete
from Department
where Dept_Id = 100
--no rows affected because it have relationship parent have child
--the child is student and instructor

Update Department set Dept_Id = 4000 where Dept_Id = 20

--to do so use all tables haverelationsips first fix it then fix what I want
--Update / Delete in Student then in Instructor then in Department
--Manually by query

----------------------- 
-- BUILT IN FUNCTIONS

--All aggregate functions , max() , min() , avg()
getdate() , isnull() , coalesce
concat , convert

select year(getdate())

select month(getdate())

select substring(st_fname,1,3)
from Student
-- ygeeby awl 3 hroof 
--btgeeb goz2 mn el kelma (Start Index, Length)

--database working on it
select db_name()

--my user loggedin on server
select suser_name()

--View > Template Explorer
--to get syntax 
