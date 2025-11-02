--JOINS
Select St_Fname ,Dept_name
--from Student, Department
from student cross join department
--this is wrong as we need to cancel the cartsian product by using crossjoin [student 14 row ] * [dept 7 rows] = 98 total row we got
--remove , and add crossjoin will give the same answer == 98 rows

--where Dept_Id = Dept_Id --> thats why we must use alias 

select st_fname, dept_name
from student s , Department d
where d.Dept_Id = s.Dept_Id
--voila 13 row the correct answer

select st_fname, dept_name , s.dept_id -- if dept_id only will give ambigous error as db can't decide which column to bring from two tables
from student s , Department d
where d.Dept_Id = s.Dept_Id

select st_fname, d.* -- if i selected * without specifying which * i want from which table will bring * from all tables
from student s , Department d
where d.Dept_Id = s.Dept_Id
--InnerJoin 13 row for students who have dept id
select st_fname, dept_name
from student s inner join Department d
on d.dept_id = s.dept_id --and St_Address ='alex'
order by Dept_Name
-------------
--Left OuterJoin --> 14 row hytla3 kol el + students rows
select st_fname, dept_name
from student s left outer join Department d
on d.dept_id = s.dept_id 

--Right OuterJoin --> 16 row hytla3 kol el + dept rows
select st_fname, dept_name
from student s right outer join Department d
on d.dept_id = s.dept_id 

--FULL OuterJoin --> 17 row hytla3 kol el students rows
select st_fname, dept_name
from student s full outer join Department d
on s.dept_id = d.dept_id 


---self join
--when there's only self relationship
select x.st_fname , y.*
from student x, student y --student x inner join student y
where y.St_Id=x.St_super
--x is the child and y is the parent
--we start the query with from then the where the back to select what you want <33333
---------------------------------------------------------------------------------------------------------------------

--Join with MULTIPLE tables ? yes we can

--we want the student name and course name and grade so we need bridge as there's no connection between tables
--it's always said the number of joins is > 1 number of table
select St_fname, Crs_name,grade
from Student s , Stud_Course sc, Course c
where s.St_Id = sc.St_Id and  c.Crs_Id = sc.Crs_Id
order by St_Fname -- 36 rows same number of relation between two tables

--how to write it with inner join
select s.St_fname, c.Crs_name, sc.grade,s.Dept_Id
from Student s inner join Stud_Course sc 
on s.St_Id = sc.St_Id
inner join Course c
on sc.Crs_Id = c.Crs_Id
inner join Department d
on d.Dept_Id = s.Dept_Id
--- waaaaaaaaaayy better syntax for many joins love it ^^ <3
--it's okay to use a table as a bridge without displaying it's data



--JOIN DML
--want to add 10 score extra to each student grade that lives only in cairo

update Stud_Course
set grade += 10

--write normal select query for what you want then remove select query replace it with update set
--select grade 
update Stud_Course
set grade += 10
from Student s,Stud_Course sc
where s.St_Id=sc.St_Id and s.St_Address ='cairo'

--join with delete?
--join with insert ?
--------------------------------------------------------------------------------------------------------------

--Function to replace null value with something
select st_fname
from Student
where St_Fname is not null

select isnull(st_fname,'has no name yakhoya')
from Student

--replace null firstname with last name of the student
select isnull(st_fname,St_Lname)
from Student

--what if both values are null?
select coalesce(st_fname,St_Lname,st_Address,'No Data')
from Student 
--coalesce takes array

--to display different data types together
select st_fname, St_Age
from student
--- error of Conversion failed when converting the nvarchar value 'Ahmed ' to data type int.
select st_fname+' '+ St_Age
from student

select 'Student name is: ' + st_fname +' and his age is: '+ convert(varchar(2) , St_Age)
from student

--but if we concacneted with something null will give eventually null all
--so we can add isnull function to replace whichever we like 
select 'Student name is: ' + isnull(st_fname, St_Lname) +' and his age is: '+ convert(varchar(2) , isnull(St_Age,0))
from student
--but this will take long runtime
--microsoft made us new function called concat
--it turns all data type to strin and removes any null and add empty string inside it <3

select concat(st_fname, ' ',st_age)
from Student

--AMAZING SOLUTION

select *
from Student
where St_Fname = 'ahmed'

--exactly like equal but better for string if we know part of the thing we want to search for 
--specific search pattern
select *
from Student
where St_Fname like 'ahmed'
 
 -- _ --> one char
 -- % --> zero/more char

 select *
from Student
where St_Fname like '_a%'
-- %a akherha 7arf el a
-- a% awelha harf el a
-- %a% contains a f ay hetta w khalas
-- _a% tany harf is a then hrof b3deh
-- a%h awel harf A and akher harf is H w hrof fl nos
-- %a_ el harf el abl el akheer is A
-- ahm% awelha ahm then hroof random
-- [ahm%] starts with a / h / m
-- [^ahm]% does not start with a / h / m
-- [a-h]% starts with this range of letters
-- [^a-h]% does not start with this range of letters
-- [346]% starts with 3 / 4 / 6
-- %[%] string that have percentage symbol in it's end ____%
-- %[_]% string have undersocre between it ex Ahmed_Ali or Eman_Omar
-- [_]%[_] string have underscore at begining and it's end ex _Ahmed_ or _Ali_


select st_fname,Dept_Id,St_Age
from Student
order by 2 --Dept_id

select st_fname,Dept_Id,St_Age
from Student
order by Dept_Id asc, St_Age desc
--don't oder by student id as it's already ordered by it in db to not extra use the engine




