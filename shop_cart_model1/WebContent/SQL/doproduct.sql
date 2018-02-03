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
insert into dogproduct values(dogproduct_seq.nextval, '���', 550000, 'bigle.gif','��Ÿ �� ���� ��...', 0);
insert into dogproduct values(dogproduct_seq.nextval, '�޸��þ�', 500000, 'dalma.gif','��Ÿ �� ���� ��...', 0);
insert into dogproduct values(dogproduct_seq.nextval, '�۱�', 400000, 'pug.gif','��Ÿ �� ���� ��...', 0);
insert into dogproduct values(dogproduct_seq.nextval, '��Ű����', 450000, 'pekiniz.gif','��Ÿ �� ���� ��...', 0);
commit
UPDATE dogproduct SET click=click+1 WHERE name='���';
select * from dogproduct ;
