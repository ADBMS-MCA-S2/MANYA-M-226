CREATE DEFINER=`root`@`localhost` PROCEDURE `inserts`(id int,name varchar(20),salary int)
BEGIN
declare
incent int;
if(id=110)
then set incent=salary*0.12;
insert into emp(EMPLOYEEID,EMPLOYEENAME,SALARY,INCENTIVE)values(id,name,salary,incent);
end if;
if(id=111)
then set incent=salary*0.12;
insert into emp(EMPLOYEEID,EMPLOYEENAME,SALARY,INCENTIVE)values(id,name,salary,incent);
end if;
if(id=121)
then set incent=salary*0.12;
insert into emp(EMPLOYEEID,EMPLOYEENAME,SALARY,INCENTIVE)values(id,name,salary,incent);
end if;

END
USE employee;
select * from emp;
call inserts(110,"mania",3440);
call inserts(111,"manya",3500);
call inserts(121,"abina",42000);
