--constraint primary and foreign
--1
create table employee(
EMP_ID  NUMBER(6) NOT NULL primary key,
FIRST_NAME VARCHAR2(10),
LAST_NAME  VARCHAR2(15) NOT NULL,
EMAIL  VARCHAR2(25) NOT NULL,
PHONE_NUM  VARCHAR2(20) NOT NULL,
HIRE_DATE  DATE NOT NULL,
JOB_ID  VARCHAR2(10) NOT NULL,
SALARY NUMBER(8,2),
COMMISSION_PCT NUMBER(2,2),
MANAGER_ID NUMBER(6) references Manager(Manager_id),
DEPARTMENT_ID NUMBER(4),
constraint DEP_FK foreign key (Department_id) references Department(Department_id)
);
--2
alter table Employee add constraint DEP_FK foreign key (Department_id) 
references Department(Department_id);

--add column
alter table Manager drop column Emp_ID;
alter table Manager add(Emp_ID number);
update Manager set Emp_ID = 101 where MANAGER_ID = 101;
--add not null constraint
alter table Manager modify (EMP_ID not null);

