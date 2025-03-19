--join & foreign key 복습

--시퀀스
create sequence seq_board;

--부모테이블
create table board (bno number(3) constraint board_pk_bno primary key,
writer varchar2(30),subject varchar2(50),writeday date);

--게시글 board에 5개의 데이터 insert하자
insert into board values (seq_board.nextval,'오늘도 열심히','안녕하세요 오늘 가입했어요',sysdate);
insert into board values (seq_board.nextval,'둘리','오늘 날씨 왜이래요',sysdate);
insert into board values (seq_board.nextval,'해리포터','오늘 일어나기가 싫어요',sysdate);
insert into board values (seq_board.nextval,'앤','점심 머먹지?',sysdate);
insert into board values (seq_board.nextval,'길동이','여기 진짜 볼거 많네요',sysdate);
insert into board values (seq_board.nextval,'캔디','오늘 합격 기다립니다',sysdate);
commit;

--자식테이블
--부모글 지우면 그 글에 달린 댓글은 자동으로 삭제되도록 설정
create table answer (num number(5) constraint answer_pk_num primary key,
bno number(3) constraint answer_fk_bno references board(bno) on delete cascade,
nickname varchar(30),content varchar2(100));

--원하는 글번호에 댓글 추가
insert into answer values (seq_board.nextval,4,'먹방찍자','오늘은 초밥 먹는 날');
insert into answer values (seq_board.nextval,1,'병아리','반가워요 저도 오늘 가입중');
insert into answer values (seq_board.nextval,3,'나대지마라','오늘도 열심히');
insert into answer values (seq_board.nextval,1,'누나','반가워요~~');
insert into answer values (seq_board.nextval,5,'나나','그쵸~~헤어날 수가 없어요');
insert into answer values (seq_board.nextval,5,'도도','이낙에 삽니다');
commit;

--JOIN으로 출력
--bno(글번호), writer(작성자), subject(제목), nickname(댓글 단 사람), content(댓글 내용), writeday(원글 올린 날짜)
select b.bno 글번호,writer 작성자,subject 제목,nickname "댓글 단 사람",content "댓글 내용",writeday "원글 올린 날짜"
from board b,answer a
where b.bno=a.bno;

select * from board;
select * from answer;



select buseo,avg(pay),to_char(max(pay),'l999,999,999'),to_char(min(pay),'l999,999,999') from sawon group by buseo;

select job,avg(sal),to_char(max(sal),'l999,999,999'),to_char(min(sal),'l999,999,999')
				 from emp group by job;

