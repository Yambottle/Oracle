--PACKAGE 
--PACKAGE SPECIFICATION
CREATE PACKAGE calculate_sal AS  
PROCEDURE find_sal(eid employee.employee_id%type); 
END 
calculate_sal;         
--PACKAGE BODY
CREATE or replace PACKAGE body calculate_sal  AS  
PROCEDURE find_sal(eid employee.employee_id%type)
is esalary employee.salary%type;
begin
select salary into esalary from employee where employee_id=eid;
dbms_output.put_line('Employee Salary:'||' '||esalary);
end find_sal ;
END calculate_sal;                 
/             
--USING THE PACKAGE TO ACCESS A MEMBER
 DECLARE code employee.employee_id%type := &cc_id; 
BEGIN    
calculate_sal.find_sal (code);
END;      
/

--sample
CREATE PACKAGE employee_data AS  
PROCEDURE add_student(srno student.rno%type,stname student.sname%type);
PROCEDURE delete_student(srno student.rno%type);
PROCEDURE listall_students;
end employee_data;
/
--PACKAGE BODY
CREATE OR REPLACE PACKAGE BODY employee_data
AS
PROCEDURE add_student(srno student.rno%type,
stname student.sname%type) IS
BEGIN
insert into student (rno,stname)
values(srno,stname);
end add_student;
             
PROCEDURE delete_student(srno student.rno%type)
IS
DELETE FROM STUDENT
WHERE rno=srno;
end delete_student;
             
PROCEDURE listall_students is 
cursor c_student is
select stname from student;
type s_list is table of student.stname%type;
name_list s_list := s_list();
counter integer :=0;   
BEGIN       
FOR n IN c_student  LOOP      
counter := counter +1;      
name_list.extend;       
name_list(counter)  := n.stname;   
dbms_output.put_line('Student Name(' ||counter|| ')'||name_list(counter));    
END LOOP;  
END listall_students; 
END employee_data;
/ 
=