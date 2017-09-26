--DATE
select systimestamp from dual;
select sysdate from dual;
select extract(year from sysdate) from dual;
--CONCATENCION(Result calculation)
select first_name || ' ' ||last_name from employee;
select first_name,salary,salary*0.025 "Tax",salary*(1-0.025) "AfterTax" from employee;
--round()
select first_name,salary,salary*0.025 "Tax",round(salary*(1-0.025)) "AfterTax" from employee;
--upper()/initcap()
select upper(first_name) || ' ' ||upper(last_name) from employee;
select initcap(first_name) || ' ' ||last_name from employee;
--compute column
create table comcol(
money number,
quantity int,
total generated always as (money*quantity),
end_date date default systimestamp,
active as (case when end_date is null then 'Y' else 'N' end)
);
insert into comcol(money,quantity) values(10,10);
select * from comcol;
update comcol set end_date = null;
--add calc column
alter table employee add TAX generated always as (0.25*salary);
alter table employee add AFTERTAX generated always as (0.75*salary);
select * from employee;
select * from user_tab_cols;
select virtual_column from user_tab_cols where table_name= 'EMPLOYEE' ;
--PL/SQL
create trigger on salary_check_trg
before insert on employee
begin
  if(salary<3000)salary = 3000;end if;
  if(salary>15000)salary = null;end if;
end;

create trigger on salary_check_trg
before insert on department
begin
  if(department_name not in ('F','S','M'))department_name = null;end if;
end;


