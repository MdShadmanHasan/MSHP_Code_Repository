create database st14065601
CREATE TABLE student
(
st_id CHAR(4)PRIMARY KEY CHECK(st_id LIKE'[s][0-9][0-9][0-9]'),
st_name CHAR(15)NOT NULL,
st_age int check(st_age>0),
st_city CHAR(10) DEFAULT 'Rajshahi',
)
drop database st14065601

insert student
(st_id,st_name,st_age,st_city)values ('s001','john',17,'Dhaka')
insert student
(st_id,st_name,st_age,st_city)values ('s002','richard',19,'khulna')
insert student
(st_id,st_name,st_age,st_city)values ('s003','harry',14,'rajshahi')
insert student
(st_id,st_name,st_age,st_city)values ('s004','jack',20,'rajshahi')

--Q1
create proc sp_showStrecords @stu_age int
as
begin
select*from student where st_age<@stu_age
end
exec sp_showStrecords '15'
drop proc sp_showStrecords

alter proc sp_showStrecords @stud_age int
as
begin
select*from student where st_age<@stud_age
end
exec sp_showStrecords '15'
--Q2and3
ALTER PROC  sp_showStrecords @average_age int
AS
BEGIN
select AVG(st_age) as Average_age from student
end
select AVG(st_age) as Average_age from student
ALTER PROC  sp_showStrecords @average_age int

AS
BEGIN
DECLARE @age int
select @age=avg(st_age) from student 
     while @age<@average_age
         BEGIN
             UPDATE student set st_age=st_age+0.1*st_age 
             SELECT @age=AVG(st_age) from student
          END
END
EXEC sp_showStrecords '30'
drop proc sp_showStrecords

select AVG(st_age) as Average_age from student
select*from student
