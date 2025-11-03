/*1.	Display the Department id, name and id and the name of its manager.
2.	Display the name of the departments and the name of the projects under its control.
3.	Display the full data about all the dependence associated with the name of the employee they depend on him/her.
4.	Display the Id, name and location of the projects in Cairo or Alex city.
5.	Display the Projects full data of the projects with a name starts with "a" letter.
6.	display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
7.	Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.
8.	Find the names of the employees who directly supervised with Kamel Mohamed.
9.	Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
10.	For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
11.	Display All Data of the mangers
12.	Display All Employees data and the data of their dependents even if they have no dependents
*/

--1
Select Departments.Dnum, Departments.Dname ,Departments.MGRSSN ,Employee.Fname
from Departments inner join Employee
on Departments.MGRSSN = Employee.SSN

--2 
select Departments.Dname , Project.Pname
from Departments inner join Project
on Departments.Dnum = Project.Dnum

--3
Select Dependent.* , Employee.Fname as EmpName
from Dependent inner join employee
on Dependent.ESSN = Employee.SSN

--4
Select P.Pnumber,P.Pname,P.Plocation,p.City
from Project as P
where P.City like 'alex' or p.City='cairo'

--5
select *
from Project p
where p.Pname like 'a%'

--6
select *
from Employee e
where e.Salary between '1000' and '2000' and e.Dno = 30

--7 Retrieve the names of all employees in 
--department 10 who works more than or equal10 hours per week on "AL Rabwah" project.

select e.Fname , w.Hours , P.Pname , d.Dnum
from Employee e 
inner join Departments d
on d.Dnum = 10
inner join Works_for w
on w.Hours >= 10
inner join Project p
on p.Pname like 'al rabwah'
and e.SSN = w.ESSn 
and p.Pnumber = w.Pno


--8
select e.Fname + ' ' + e.Lname as FullName
from Employee e , Employee m
where m.Fname like 'Kamel' and m.Lname like'Mohamed' and e.SSN = m.Superssn

--9
Select e.Fname +' '+ e.Lname as FullName , P.Pname
from Employee e inner join Works_for w
on e.SSN = w.ESSn
inner join Project p
on p.Pnumber = w.Pno
order by p.Pname

--10
/*10.	For each project located in Cairo City , find the project number, 
the controlling department name ,the department manager last name ,address and birthdate. */
select P.Pnumber as ProjID , d.Dname as DeptName, e.Lname as LastName , e.Address , e.Bdate
from Project p inner join Departments d
on p.Dnum = d.Dnum and p.City like 'cairo'
inner join Employee e
on d.MGRSSN = e.SSN

select * from project
select * from Departments

select p.Pnumber ,d.Dname,d.MGRSSN, e.Lname, e.Address,e.Bdate
from project p,Departments d, Employee e
where p.City like 'cairo' and p.Dnum=d.Dnum and d.MGRSSN =e.SSN

--11
select *
from Employee e inner join Departments d
on e.SSN = d.MGRSSN

--12
select *
from Employee e left join Dependent d
on e.SSN = d.ESSN
