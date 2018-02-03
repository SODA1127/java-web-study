drop table userinfo;
create table userinfo(userid varchar2(100) primary key,password varchar2(100),name varchar2(200) ,email varchar2(300));
select * from userinfo;
commit;