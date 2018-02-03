DROP TABLE board;
DROP SEQUENCE board_sequence;
CREATE TABLE board
 (
    boardno number  primary key,
    title varchar2 (100) not null,
    writer varchar2 (20) not null,
    content varchar2 (2000) not null,
    regdate date default (SYSDATE),
    readcount number default (0),
    groupno number not null,
    step number not null,
    depth number default (0)
 );
/*
 * groupno : 최상위글과 그글의 답글들을 하나의 구룹으로 묶기위한컬럼
 * step    : 같은그룹내에서의 순서를 가지고있는 컬럼
 * depth   : 답글의 깊이를 가지고있는 컬럼
 */
 
 
 
CREATE SEQUENCE board_sequence;
--새글쓰기
INSERT INTO board(boardno, title, writer, content,groupno, step) VALUES(board_sequence.nextval,'게시판타이틀1','김경호1','content1',board_sequence.currval,1);
INSERT INTO board(boardno, title, writer, content,groupno, step) VALUES(board_sequence.nextval,'게시판타이틀2','김경호2','content2',board_sequence.currval,1);
commit;









