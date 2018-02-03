

drop table GUEST;

create table GUEST(guest_no number(10) not null primary key,
		guest_name varchar2(10) not null,
		guest_date date not null,
		guest_email varchar2(50),
		guest_homepage varchar2(50),
		guest_title varchar2(100) not null,
		guest_content varchar2(4000) not null);

create sequence guest_no_seq  increment by 1 start with 1;

insert into GUEST values(guest_no_seq.nextval , '김경호', sysdate, 'guard@naver.com', 'http://', '방명록 사용법', '방명록처럼 사용하시면 됩니다');

commit;
