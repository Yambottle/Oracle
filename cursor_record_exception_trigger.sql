--cursor
--select * from employee;
declare
eid employee.emp_id%type;
fname employee.first_name%type;
lname employee.last_name%type;
cursor c_emp is select emp_id,first_name,last_name from employee;
begin
open c_emp;
loop fetch c_emp into eid, fname, lname;
--exit when eid = 103;
exit when c_emp%notfound;
dbms_output.put_line(eid||' '||fname||' '||lname);
end loop;
close c_emp;
end;
/

--records:
--table based
--cursor based
declare
cursor employee_cur is select emp_id,first_name,last_name from employee;
employee_data_cur employee_cur%rowtype;
begin
open employee_cur;
loop fetch employee_cur into employee_data_cur;
exit when employee_cur%notfound;
dbms_output.put_line(employee_data_cur.emp_id||' '||employee_data_cur.first_name||' '||employee_data_cur.last_name);
end loop;
end;
/
--user defined:for temp data or as parameter
declare type books is record (
title varchar(20),
book_name varchar(50)
);
book1 books;
book2 books;
begin
book1.title:='pl/sql';
book1.book_name:='learn pl/sql';
book2.title:='c';
book2.book_name:='learn c';
end;
/

--exception
DECLARE
eid employee.employee_id%type := 8;   
ename employee.first_name%type;
begin
select first_name into ename from employee where
employee_id=eid;
dbms_output.put_line('Employee Name:'||' '||ename);
EXCEPTION    WHEN no_data_found THEN  
dbms_output.put_line('No such Employee Exists in the system');
when others then
dbms_output.put_line('Error!');
end;
/
--2 USER DEFINED EXCEPTION
DECLARE 
eid employee.employee_id%type:=&e_id;--prompt an input window
ename employee.first_name%type;
myexception exception;
begin
if eid <=0 then 
raise myexception;
else
select first_name into ename from employee where
employee_id=eid;
dbms_output.put_line('Employee Name:'||' '||ename);
end if;
exception when myexception then 
dbms_output.put_line('ID must be greateer than 0');
when no_data_found then 
dbms_output.put_line('No such employee');
when others then
dbms_output.put_line('Error!');
end;
/

--trigger
CREATE OR REPLACE TRIGGER show_salary
before delete or insert or update
on employee
for each row when (new.employee_id>0)
declare
salary_difference number;
begin
salary_difference:= :new.salary - :old.salary;
dbms_output.put_line('OLD SALARY:' || ' '|| :old.salary);
dbms_output.put_line('NEW SALARY:' || ' '|| :new.salary);
dbms_output.put_line('Salary difference' || ' '||salary_difference);
end;
/
