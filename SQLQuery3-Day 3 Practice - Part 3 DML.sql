/*Data Manipulating Language:

1.	Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233, salary=3000.

2.	Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, 
but don’t enter any value for salary or manager number to him.

3.	Upgrade your salary by 20 % of its last value.
*/

select * from Employee

insert into Employee (Fname,Lname,SSN,Bdate,Address,Sex,Salary,Superssn,Dno) 
values ('Andaleeb','Khogli', '102672', '10-18-1996', 'Smouha, Alexandria', 'F','3000','112233','30');

----
insert into Employee (Fname,Lname,SSN,Bdate,Address,Sex,Dno) 
values ('Shorouk','Habib','102660','7-21-1996','Eldabaa, Alexandria','F','30')


update Employee
set Salary = Salary + Salary *0.2
Where Employee.SSN = '102672';

