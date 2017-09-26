--1
select * from Employee order by salary desc;

select * from Employee order by COMMISSION_PCT desc;
--2
select * from Employee e join Manager m on e.Manager_ID = m.Manager_ID;

select * from Employee where Manager_ID is null;

select max(salary) from Employee 
where Employee.EMP_ID in (select Manager.EMP_ID from Manager);

--select max(nop) from department;
/*select count(*) from Employee 
where DEPARTMENT_ID in (select Department.DEPARTMENT_ID from Department);*/

select count(*) from Employee;

--3
select EMP_ID,extract(year from sysdate)-extract(year from Employee.hire_date) from Employee;

select EMP_ID,12*(extract(year from sysdate)-extract(year from Employee.hire_date))
+extract(month from sysdate)-extract(month from Employee.hire_date) from Employee;










