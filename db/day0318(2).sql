--시퀀스 생성
create sequence seq_shop;
--shop 테이블
create table shop(num number(5) primary key,
sangpum varchar2(30),color varchar2(20));

--shop에 5개 이상 상품 추가
insert into shop values(seq_shop.nextval,'요가매트','핑크');
insert into shop values(seq_shop.nextval,'아령','블랙');
insert into shop values(seq_shop.nextval,'나시티','블루');
insert into shop values(seq_shop.nextval,'레깅스','블랙');
insert into shop values(seq_shop.nextval,'양말','화이트');
commit;

--cart1: 자식테이블 shop테이블의 num값을 외부키로 지정한다
create table cart1(idx number(5) primary key,
num number(5) constraint cart_fk_num references shop(num),
cnt number(5),guipday date);

--create table cart1(idx number(5) primary key,
--num number(5),
--cnt number(5),guipday date,
--constraint cart_fk_num foreign key(num) references shop(num));

--cart2: 부모테이블의 상품을 지우면 그 상품과 연결된 카트를 자동으로 지워준다
create table cart2(idx number(5) primary key,
num number(5) constraint cart2_fk_num references shop(num) on delete cascade,
cnt number(5),guipday date);

--cart1에 상품추가
insert into cart1 values(seq_shop.nextval,1,2,sysdate); --1번 요가매트
insert into cart1 values(seq_shop.nextval,5,1,sysdate); --5

--shop없는 상품 담았을 경우
--insert into cart1 values(seq_shop.nextval,6,1,sysdate); --무결성 제약조건(PARKIB002.CART_FK_NUM)이 위배되었습니다- 부모 키가 없습니다

--cart2 상품추가
insert into cart2 values(seq_shop.nextval,3,3,sysdate); --3
insert into cart2 values(seq_shop.nextval,2,4,sysdate); --2

--cart1에는 1번, 5번이 추가되었다 이 때 shop의 1번 상품을 삭제해보자
delete from shop where num=1; --무결성 제약조건(PARKIB002.CART_FK_NUM)이 위배되었습니다- 자식 레코드가 발견되었습니다

--cart1에 담기지 않은 shop의 4번 삭제
delete from shop where num=4; --삭제됨

--확인 후 아까우니까 살린다
rollback;

--cart2..3번 2번 상품이 담겼다 3번 삭제될까?
delete from shop where num=3;

--cart1,cart2 각각 5개씩 담아보기
insert into cart1 values(seq_shop.nextval,2,2,sysdate);
insert into cart1 values(seq_shop.nextval,1,2,sysdate);
insert into cart1 values(seq_shop.nextval,5,3,sysdate);

insert into cart2 values(seq_shop.nextval,2,1,sysdate);
insert into cart2 values(seq_shop.nextval,1,2,sysdate);
insert into cart2 values(seq_shop.nextval,5,3,sysdate);
insert into cart2 values(seq_shop.nextval,2,1,sysdate);
insert into cart2 values(seq_shop.nextval,2,6,sysdate);
insert into cart2 values(seq_shop.nextval,1,5,sysdate);

select * from shop;
select * from cart1;
select * from cart2;

--cart1에 담긴 상품을 shop테이블과 join해서 자세히 출력해보기
--방법1
select cart1.idx,shop.num,shop.sangpum,shop.color,cart1.cnt,cart1.guipday
from shop,cart1
where shop.num=cart1.num;

--방법2
select c.idx,s.num,s.sangpum,s.color,c.cnt,c.guipday
from shop s,cart1 c
where s.num=c.num;

--방법3
select idx,s.num,sangpum,color,cnt,guipday
from shop s,cart1 c
where s.num=c.num;

--[과제물_조인,외부키 문제]
create sequence seq_food start with 1 increment by 3 nocache;


create table foodmenu(fno number(5) primary key,food_name varchar2(20),
price varchar2(20),shop_name varchar2(20),loc varchar2(20));

insert into foodmenu values (seq_food.nextval,'파스타',12000,'쏘렌토','서울시 강남구');
insert into foodmenu values (seq_food.nextval,'짜장면',8000,'카니발','서울시 역삼동');
insert into foodmenu values (seq_food.nextval,'치킨',20000,'쏘나타','경기도 용인시');
insert into foodmenu values (seq_food.nextval,'초밥',15000,'렉서스','부산시 사하구');
insert into foodmenu values (seq_food.nextval,'김밥',3000,'아반떼','서울시 강서구');

create sequence seq_food2;

create table foodorder(idx number(5) primary key,
order_name varchar2(20),
fno number(5) constraint fo_fk_fno references foodmenu(fno) on delete cascade,
addr varchar2(20));

insert into foodorder values(seq_food2.nextval,'홍길동',4,'서울시 강남구');
insert into foodorder values(seq_food2.nextval,'손흥민',7,'경기도 성남시');
insert into foodorder values(seq_food2.nextval,'김민재',13,'서울시 동작구');
insert into foodorder values(seq_food2.nextval,'이강인',1,'서울시 역삼동');
insert into foodorder values(seq_food2.nextval,'황희찬',10,'부산시 금정구');

select m.fno 주문번호,order_name 주문자,food_name 음식명,to_char(price,'l999,999,999') 가격,shop_name 상호명,loc 가게위치,addr 주문자주소
from foodmenu m,foodorder o
where m.fno=o.fno
order by order_name asc;



select * from foodmenu;
select * from foodorder;




