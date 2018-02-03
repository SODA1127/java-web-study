DROP TABLE board;
DROP SEQUENCE board_sequence;
CREATE TABLE board
 (
    boardno number primary key,
    title varchar2 (100) not null,
    writer varchar2 (20) not null,
    content varchar2 (2000) not null,
    regdate date default (SYSDATE),
    readcount number default (0),
    groupno number not null,
    step number not null,
    depth number default (0)
 );

CREATE SEQUENCE board_sequence;

/*
 * groupno : 최상위글(원글)과 그글의 답글들을 하나의 그룹으로 묶기위한 컬럼
 * step    : 같은그룹내에서의 순서를 가지고있는 컬럼
 * depth   : 답글의 깊이를 가지고있는 컬럼
 */
--새글쓰기(최상위글)
INSERT INTO
board(boardno, title, writer, content,groupno,step,depth) 
VALUES(	board_sequence.nextval,
        '게시판타이틀1',
        '김경호1',
        'content1',
        board_sequence.currval,
        1,
        0);
INSERT INTO
board(boardno, title, writer, content,groupno,step,depth) 
VALUES(	board_sequence.nextval,
        '게시판타이틀3',
        '김경호3',
        'content3',
        board_sequence.currval,
        1,
        0);        

INSERT INTO
board(boardno, title, writer, content,groupno,step,depth) 
VALUES(	board_sequence.nextval,
        'pk=5,groupno=5',
        '김경호5',
        'content5',
        board_sequence.currval,
        1,
        0);        
commit;
--답글쓰기
--원글의 데이타를 기반으로 작업한다.
/*
 * 1. 같은그룹번호들중에서 원글의 step보다큰 step을가진 게시물들의 step을 1씩 증가시킨다.
 */
UPDATE board SET step = step + 1 WHERE step > 1 AND groupno = 3;
commit;
/*
 * 2. 
 * 	  boardno:시퀀스증가
 *    groupno:원글의 groupno
 *    step   :원글의 step+1
 *    depth  :원글의 depth+1
 *    
 */
INSERT INTO board(boardno,
                  title,
                  writer,
                  content,
                  groupno,
                  step,
                  depth) 
              VALUES 
              (
                board_sequence.nextval,
                '1번답글',
                'guard',
                '1번답글컨텐트',
                1,
                2,
                1
              );
                  
INSERT INTO board(boardno,
                  title,
                  writer,
                  content,
                  groupno,
                  step,
                  depth) 
              VALUES 
              (
                board_sequence.nextval,
                '3번답글pk=4',
                'guard3',
                '3번답글컨텐트pk=4',
                3,
                2,
                1
              );
INSERT INTO board(boardno,
                  title,
                  writer,
                  content,
                  groupno,
                  step,
                  depth) 
              VALUES 
              (
                board_sequence.nextval,
                'pk=6,groupno=5',
                'guard6',
                '5번답글',
                5,
                2,
                1
              );                  
commit;

INSERT INTO board(boardno,
                  title,
                  writer,
                  content,
                  groupno,
                  step,
                  depth) 
              VALUES 
              (
                board_sequence.nextval,
                'pk=8,groupno=3',
                'step=2,depth=1',
                '3번답글',
                3,
                2,
                1
              );                  
commit;


--게시판리스트
commit;
select boardno,title,groupno,step,depth 
from board order by groupno desc,step asc;
/*
XXXXX
*/
select boardno,title,groupno,step,depth 
from board where boardno >= 21 and boardno<=30
order by groupno desc,step asc;

/*
- ROWNUM은 쿼리 내에서 사용 가능한 (실제 컬럼이 아닌) 가상 컬럼(pseudocolumn)입니다.
- ROWNUM에는 숫자 1, 2, 3, 4, ... N의 값이 할당됩니다.
   여기서 N 은 ROWNUM과 함께 사용하는 로우의 수를 의미합니다.
- ROWNUM의 값은 로우에 영구적으로 할당되지 않습니다.
   테이블의 로우는 숫자와 연계되어 참조될 수 없습니다.
   따라서 테이블에서 "row 5"를 요청할 수 있는 방법은 없습니다.
   "row 5"라는 것은 존재하지 않기 때문입니다.
- ROWNUM 값은 쿼리의 조건절이 처리되고 난 이후,
   그리고 sort, aggregation이 수행되기 이전에 할당됩니다.
   또 ROWNUM 값은 할당된 이후에만 증가(increment) 됩니다.
   따라서 아래 쿼리는 로우를 반환하지 않습니다.
   ex>select rownum,emp.* from emp where rownum > 1;

   ex>select ..., ROWNUM from emp where group by having order by ;
      이 쿼리는 다음과 같은 순서로 처리됩니다.
	1. FROM/WHERE 절이 먼저 처리됩니다.
	2. ROWNUM이 할당되고 
	   FROM/WHERE 절에서 전달되는 각각의 출력 로우에 대해 증가(increment) 됩니다.
	3. SELECT가 적용됩니다.
	4. GROUP BY 조건이 적용됩니다.
	5. HAVING이 적용됩니다.
	6. ORDER BY 조건이 적용됩니다.
*/
-----------rownum--------------
--XXXX
select rownum,emp.* from emp where rownum >1;

SELECT rownum,board.* FROM board;

SELECT rownum,board.* FROM board ORDER BY groupno DESC,step ASC;
SELECT rownum,board.* FROM board where rownum >= 11 and rownum <= 20;
SELECT rownum,board.* FROM board where rownum >= 11 and rownum <= 20 ORDER BY groupno DESC,step ASC;

SELECT rownum idx, s.*  FROM
				( SELECT * FROM board
					ORDER BY groupno DESC,step ASC
				) s ;
				

SELECT rownum idx, s.*  FROM
				( SELECT * FROM board
					ORDER BY groupno DESC,step ASC
				) s
				where rownum >= 11 and rownum <= 20;
				

SELECT  ss.* FROM
		( SELECT rownum idx, s.*  FROM
				( SELECT * FROM board
					ORDER BY groupno DESC,step ASC
				)  s
		 )  ss ;

SELECT ss.* FROM
		( SELECT rownum idx, s.*  FROM
				( SELECT * FROM board
					ORDER BY groupno DESC,step ASC
				) s
		 ) ss
WHERE ss.idx >= 21 AND ss.idx <= 30 ;
				




-----------------------------------
--게시판리스트 페이지
SELECT * FROM
		( SELECT rownum idx, s.*  FROM
				( SELECT boardno, title, writer,regdate, readcount,groupno, step, depth FROM board
					ORDER BY groupno DESC,step ASC
				) s
		 )
WHERE idx >= ? AND idx <= ? ;

--1.게시판 리스트전체
SELECT 	boardno,
		title,
		writer,
		regdate,
		readcount,
		groupno,
		step,
		depth
FROM board
ORDER BY groupno DESC,step ASC;
--2.게시판 1개 게시물 그룹
SELECT *
FROM board
WHERE groupno = 1  AND depth >= ? AND step >= ?
ORDER BY step, depth ASC;



--게시판 쓰기
INSERT INTO Board ( boardno,title,writer,content,groupno,step) 
VALUES (board_sequence.nextval, '게시판타이틀'||board_sequence.currval, '김경호'||board_sequence.currval, 'content'||board_sequence.currval,board_sequence.currval, 1);

INSERT INTO Board ( boardno,title,writer,content,groupno,step) 
VALUES (board_sequence.nextval, ?, ?, ?,board_sequence.currval, 1);
--게시판 삭제

--게시물답글존재여부확인
SELECT count(*) cnt 
FROM board 
WHERE groupno = ? AND depth >= ? AND step >= ? 
ORDER BY step,depth ASC;




