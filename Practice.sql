create table student(
enroll_num number primary key,
first_name varchar(10),
last_name varchar(10),
gender varchar(10) check (gender in ('male','female')),
course_maj varchar(20),
dob date not null check( extract(year from dob) >1990),
e_mail varchar(20) unique not null,
mob_num varchar(20) unique not null,
address varchar(50),
province varchar(10),
city varchar(10),
pin number,
qq_id number not null,
national_id number(10) not null,
father_name varchar(10),
father_mob_num number(11),
father_occu varchar(15)
);
insert into student values(
201340704416,'Zhi','Yang','male','CS',sysdate,'99184595@qq.com','+8618363994700','NingxiaRoad',
'Shandong','Qingdao',266000,99184595,86,'YangL',18964808437,'teacher'
);
insert into student values(
102,'Zhi','Yang','male','CS',sysdate,'9918495@qq.com','+8618363994701','NingxiaRoad',
'Shandong','Qingdao',266000,99184595,86,'YangL',18964808437,'teacher'
);

create table subject(
sub_num number primary key,
sub_name varchar(20)
);
insert into subject values(
101,'C Programming'
);

create table semester_result(
res_id number primary key,
enroll_num number references student(enroll_num),
seme_num number,
sub_num number references subject(sub_num),
score_obt number
);
insert into semester_result values(
101,201340704416,1,101,90
);
insert into semester_result values(
102,102,1,101,90
);

create table teacher(
teacher_id number primary key,
first_name varchar(10),
last_name varchar(10),
qualification varchar(10)
);
insert into teacher values(
101,'Shana','Khan','professor'
);

create table usertable(
user_id number,
user_pwd varchar(20),
user_type varchar(10) check (user_type in ('student','teacher','admin'))
);
insert into usertable values(
101,'Shana','teacher'
);
insert into usertable values(
201340704416,'Zhi','student'
);
insert into usertable values(
102,'Zhi','student'
);

select user_type from usertable where user_id = 201340704416 and user_pwd = 'Zhi';