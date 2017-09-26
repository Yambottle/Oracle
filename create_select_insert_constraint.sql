create table employee(
EMP_ID  NUMBER(6) NOT NULL,
FIRST_NAME VARCHAR2(10),
LAST_NAME  VARCHAR2(15) NOT NULL,
EMAIL  VARCHAR2(25) NOT NULL,
PHONE_NUM  VARCHAR2(20) NOT NULL,
HIRE_DATE  DATE NOT NULL,
JOB_ID  VARCHAR2(10) NOT NULL,
SALARY NUMBER(8,2),
COMMISSION_PCT NUMBER(2,2),
MANAGER_ID NUMBER(6),
DEPARTMENT_ID NUMBER(4)
);

--insert
insert into employee values(
101,
'Thomas',
'Travolta',
'thomas@yahoo.com',
'11111',
sysdate,
'HTML Coder',
5000,
0.1,
101,
101);
insert into employee values(
101,
'杨智',
'Travolta',
'thomas@yahoo.com',
'11111',
sysdate,
'HTML Coder',
5000,
0.1,
101,
101);
insert into employee values(
101,
'にほん',
'Travolta',
'thomas@yahoo.com',
'11111',
sysdate,
'HTML Coder',
5000,
0.1,
101,
101);
--select
select * from employee;
--check char set
select * from v$nls_parameters;--显示字符集
--constraint--图形界面添加
create table manager(
manager_id number,
manager_name varchar2(10)
);
create table department(
department_id number,
department_name varchar2(10)
);
select * from manager;
select * from department;
insert into manager values(101,'Yang');
insert into department values(101,'Tech');



