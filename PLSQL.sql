--PL/SQL

DECLARE
SUBTYPE NAME IS CHAR(10);
SUBTYPE MESSAGE IS VARCHAR(100);
--subtype
emp NAME;
des MESSAGE;
BEGIN
 emp := 'Thomas,';
 des := 'good.';
 DBMS_OUTPUT.PUT_LINE(emp||des);
END;
/
--null
--scope of var

--sample1
select * from employee;
DECLARE 
--bind type
elastname employee.LAST_NAME%type;
BEGIN
--into key word
SELECT LAST_NAME INTO elastname FROM EMPLOYEE where FIRST_NAME = 'Thomas';
DBMS_OUTPUT.PUT_LINE(elastname);
END;
/

--circle
DECLARE
R NUMBER ;
PI CONSTANT NUMBER:= 3.1415;
BEGIN
R := 2;
DBMS_OUTPUT.PUT_LINE('CONF='||2*PI*R||'   '||'AREA='||PI*R*R);
END;
/


DECLARE
--special symbol '
R varchar(50):='That''s is it.';
BEGIN
DBMS_OUTPUT.PUT_LINE(R);
END;
/

--array : three kinds of arraies

--procedure
select * from employee;
create or replace procedure new_procedure (idFlag in number)
as
fname varchar(10);
lname varchar(10);
begin
--select first_name into fname,last_name into lname from employee where emp_id = idFlag;
select first_name into fname from employee where emp_id = idFlag;
select last_name into lname from employee where emp_id = idFlag;
dbms_output.put_line(fname||' '||lname);
dbms_output.put_line('123');
end;
/
execute new_procedure(102);

--function

--cursor:two kinds.





















