drop table dogproduct;
create table dogproduct(
	id number primary key,
	name varchar2(12),
	price number,
	image varchar2(20),
	des varchar2(400),
	click number(5)
);

drop sequence dogproduct_seq;
CREATE SEQUENCE dogproduct_seq START WITH 1 NOCACHE;
insert into dogproduct values(dogproduct_seq.nextval, '비글', 550000, 'bigle.gif','기타 상세 정보 등...', 0);
insert into dogproduct values(dogproduct_seq.nextval, '달마시안', 500000, 'dalma.gif','기타 상세 정보 등...', 0);
insert into dogproduct values(dogproduct_seq.nextval, '퍼그', 400000, 'pug.gif','기타 상세 정보 등...', 0);
insert into dogproduct values(dogproduct_seq.nextval, '페키니즈', 450000, 'pekiniz.gif','기타 상세 정보 등...', 0);
commit
UPDATE dogproduct SET click=click+1 WHERE name='비글';
select * from dogproduct ;
