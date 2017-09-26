--user
create table batches(
bid number primary key,
batchcode varchar(10)
);

create table students(
stuid number primary key,
userid varchar(20),
pwd varchar(20) default 'abcd',
sname varchar(10),
bid number references batches(bid),
dob date,
gender varchar(5),
email varchar(25),
phone number,
regdate date default sysdate,
age number generated always as (extract(year from regdate)-extract(year from dob))
);

create table admins(
aid number primary key,
userid varchar(20),
pwd varchar(20)
);

--test
create table courses(
cid number primary key,
cname varchar(20)
);

create table questions(
qid number primary key,
cid number references courses(cid),
des varchar(500),
ca varchar(50),
cb varchar(50),
cc varchar(50),
cd varchar(50),
ans varchar(1)
);

create table testfb(
tid number primary key,
cid number references courses(cid),
stuid number references students(stuid),
grades number
);

--feedback
create table trainers(
trid number primary key,
trname varchar(10)
);

create table trainerfb(
tfbid number primary key,
trid number references trainers(trid),
stuid number references students(stuid),
fbdate date default sysdate
);

/*
drop table batches;
drop table students;
drop table admins;
drop table courses;
drop table questions;
drop table testfb;
drop table trainers;
drop table trainerfb;
*/