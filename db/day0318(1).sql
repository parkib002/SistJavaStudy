--테이블생성
create table sawon (num number(5) constraint sawon_pk_num primary key,
name varchar2(20),gender varchar2(20),
buseo varchar2(20),pay number(10) default 1200000);

--alter로 제약조건 추가가능 (부서명: 개발부, 교육부, 디자인부)
alter table sawon add constraint ck_sawon_buseo check(buseo in('개발부','교육부','디자인부'));

--제약조건추가: 남자, 여자만 가능하다
alter table sawon add constraint ck_sawon_gender check(gender in('남자','여자'));

--새로운 시퀀스
create sequence seq_sawon nocache;

--데이터 추가
insert into sawon values(seq_sawon.nextval,'이승연','남자','교육부',2500000);
insert into sawon values(seq_sawon.nextval,'김민재','남자','디자인부',3100000);
insert into sawon values(seq_sawon.nextval,'수지','여자','개발부',3500000);
insert into sawon values(seq_sawon.nextval,'이지은','여자','디자인부',2800000);
insert into sawon values(seq_sawon.nextval,'박보검','남자','교육부',2600000);
insert into sawon values(seq_sawon.nextval,'이승기','남자','개발부',2500000);
insert into sawon values(seq_sawon.nextval,'이미진','여자','교육부',3100000);
insert into sawon values(seq_sawon.nextval,'유영재','남자','디자인부',2800000);
insert into sawon values(seq_sawon.nextval,'김승지','여자','교육부',2860000);
insert into sawon values(seq_sawon.nextval,'유승호','남자','개발부',2800000);

--수정
update sawon set buseo='교육부';
--다시취소
rollback;

--여러컬럼 수정 30번 부서: 교육부, 2800000
update sawon set buseo='교육부', pay=2800000 where num=30;

update sawon set buseo='교육부' where num=25;

--최종저장
commit;

--그룹함수 사용
--부서별 인원수와 최고급여, 최저급여 조회(제목도 한글로 ..)
select buseo 부서,count(*) 인원수,max(pay) 최고급여,min(pay)최저급여 from sawon group by buseo;

--위의 결과에 화폐단위 붙이고 천단위 구분 기호
select buseo 부서,count(*) 인원수,to_char(max(pay),'l999,999,999') 최고급여,to_char(min(pay),'l999,999,999') 최저급여 
from sawon group by buseo;

--위의 결과에 인원수 뒤에 명 이라고 붙이기
select buseo 부서,count(*) || '명' 인원수,to_char(max(pay),'l999,999,999') 최고급여,to_char(min(pay),'l999,999,999') 최저급여 
from sawon group by buseo;

--성별 인원수와 평균급여, 최고급여, 최저급여를 구하시오
select gender 성별,count(gender) || '명' 인원수,to_char(round(avg(pay),1),'l999,999,999') 평균급여,
to_char(max(pay),'l999,999,999') 최고급여,to_char(min(pay),'l999,999,999') 최저급여 
from sawon group by gender;

--부서별 인원이 4명 이상인 경우에만 출력
select buseo 부서명,count(buseo) 인원수,to_char(round(avg(pay),1),'l999,999,999') 평균급여
from sawon group by buseo having count(buseo)>=4;

--제약조건 제거
--sawon테이블의 sawon_ck_buseo를 제거해보기
alter table sawon drop constraint ck_sawon_buseo;

--다른부서 추가해 보기
insert into sawon values(seq_sawon.nextval,'유승호','남자','홍보부',2800000);

commit;

--sawon에 name 컬럼에 unique제약조건 추가하기(sawon_uk_name)
alter table sawon add constraint sawon_uk_name UNIQUE(name);

--name컬럼에 중복 이름 넣어보기
insert into sawon values(seq_sawon.nextval,'유민지','여자','교육부',2800000);

select * from sawon;

--[JOIN]
--emp와 dept를 조인해서 emp사람들의 이름과 부서를 구하시오
select ename,deptno from emp;

select e.ename,d.dname 
from emp e,dept d
where e.deptno=d.deptno;

--professor+department를 조인하여 다음과 같이 조회
--교수명  학과명  급여를 조회하시오
select name,dname,pay
from professor p,department d
where p.deptno=d.deptno;

--emp에 dept에 없는 deptno를 삽입하거나 null로 인서트 해보자
insert into emp(empno,ename,job,mgr,sal) values(7935,'LEE','MANAGER',7902,1200);

--내부조인
select e.ename,d.dname 
from emp e,dept d
where e.deptno=d.deptno;

--LEE와 KIM이 조인에서 조회가 안된다 만약 null까지 조회하고 싶다면 outer join을 이용해야 한다
select e.ename,d.dname 
from emp e,dept d
where e.deptno=d.deptno(+);
--대상테이블에 값이 없어도 조회가 된다(NULL)로

--학생테이블
--학번  학생이름  학년  제1전공
--1111  서영주   2     컴퓨터공학과
select s.studno,s.name,s.grade,d.dname,p.name
from student s,department d,professor p
where s.deptno1=d.deptno and s.profno=p.profno;

--panname+product
--입고날짜  상품명  상품가격  입고갯수  총가격
--20240101 새우깡  800      3       24000
select p_date 입고날짜,p_name 상품명,p_price 상품가격,p_qty 입고갯수,p_total 총가격
from panmae a,product b
where a.p_code=b.p_code;

--[조인 연습용 테이블 생성하기]
create table food(foodnum number(3)primary key,
foodname varchar2(20),
foodprice number(7),
foodsize varchar2(20));

create table booking(bnum number(3)constraint pk_booking_bnum primary key,
bname varchar2(20) constraint nn_booking_bname not null,
bhp varchar2(20) constraint uq_booking_bhp unique,
foodnum number(3),
bday date, 
constraint fk_foodnum foreign key(foodnum) references food(foodnum));

--food테이블에 메뉴등록
insert into food values(100,'짜장면',9000,'보통');
insert into food values(101,'짬뽕',11000,'곱배기');
insert into food values(102,'탕수육',29000,'대');
insert into food values(103,'유린기',39000,'대');
insert into food values(104,'칠리새우',19000,'소');
insert into food values(105,'해물덮밥',12000,'보통');
insert into food values(106,'울면',9000,'보통');
commit;

--시퀀스 생성
create sequence seq_food start with 10 increment by 10 nocache;

--예약
--메뉴에 없는 foodnum을 넣으면 부모키가 없다는 제약조건위배가 나온다
insert into booking values(seq_food.nextval,'이영지','010-111-2222',100,sysdate);
insert into booking values(seq_food.nextval,'김연지','010-777-8888',100,sysdate);
insert into booking values(seq_food.nextval,'이영돈','010-999-2222',101,sysdate);
insert into booking values(seq_food.nextval,'김혜지','010-888-9999',105,sysdate);
insert into booking values(seq_food.nextval,'이우형','010-444-7845',103,sysdate);

--INNER JOIN으로 예약손님 주문정보 확인
--주문자이름, 주문자전화번호, 음식이름, 음식가격, 음식사이즈, 주문한날짜
select bname,bhp,foodname,foodprice,foodsize,to_char(bday,'yyyy-mm-dd') bday
from food f,booking b
where f.foodnum=b.foodnum;

--outer join을 이용해서 한번도 주문하지 않은 메뉴들을 알아보기
select f.foodnum,bname,foodname,foodprice,foodsize
from food f,booking b
where f.foodnum=b.foodnum(+); --이 때 아무도 주문하지 않은 메뉴는 주문자가 null로 나온다

--위의 sql통해서 주문자 이름 빼고 null인 경우만 출력하면 아무도 주문하지 않은 메뉴만 골라낼 수 있다
select f.foodnum,foodname,foodprice,foodsize
from food f,booking b
where f.foodnum=b.foodnum(+) and bname is null;

--booking(자식테이블)에 추가된 메뉴를 food(부모테이블)에서 삭제할 수 있을까?
--자식테이블 생성시 on delete cascade 설정을 안했을 경우 못 지운다
delete from food where foodnum=101; --booking테이블에서 주문했으므로 101번은 못 지운다

--아무도 주문하지 않는 104번 지워보자
delete from food where foodnum=104; --삭제됨(자식테이블에서 주문 안했으므로)

--부모테이블 삭제
drop table food; --삭제안됨, 자식테이블을 먼저 삭제해야 부모테이블도 삭제가 가능

--bookinh 먼저 지우고 food 삭제 순으로 가야하낟
drop table booking;
drop table food;

--시퀀스도 삭제
drop sequence seq_food;

--데이터베이스 정규화
--한마디로 DB서버의 메모리를 낭비하지 않기 위해서
--어떤 테이블의 식별자를 가지는 여러개의 테이블로 나누는 과정
--정규화된 테이블은 중복이 최소화되도록 설계하는 데이터베이스

--수업과정
--1.일단 비정규화 테이블 _ 데이터를 추가하고 조회
--2.1번을 2개의 테이블로 나누어서 외부키를 이용해 연결해본다
--3.데이터 삭제시 정규화된 테이블의 경우 문제가 발생
-- cascade연산자를 이용해서 다시 한 번 테이블을 생성해보고 삭제 연습

--비정규화 테이블
--회사직원테이블: companysawon
--회사명 : company 문자열(10)
--회사주소: address 문자열(20)
--회사전화: phone 문자열(15)
--직원명: sawon_name 문자열(15)
--직급: position 문자열(10)
--이메일: email 문자열(20)
--휴대폰: hp 문자열(20)

create table companysawon(company varchar2(10),address varchar2(20),
phone varchar2(15),sawon_name varchar2(15),position varchar2(10),
email varchar2(20),hp varchar2(20));

insert into companysawon values('LG','서울시 강남구','02-124-5555','홍길동','사원','hkd@gmail.com','010-222-3333');
insert into companysawon values('KT','서울시 역삼동','02-258-9999','김선동','대리','kkk@gmail.com','010-111-5555');
--거래처 회사에 대한 정보: 거래처 직원을 추가할 때마다 매번 추가
--메모리 낭비 심하다
--만약 회사 이전 승진 등등 정보가 변경되면 많은 데이터를 한꺼번에 수정해주어야 한다
--정규화된 테이블 정보로 수정이 필요한 것이다

--2.정규화된 데이터 정보로 수정
--회사테이블: company
--회사아이디: company_id number(5) 기본키
--회사명: 
--회사주소:
--회사전화:


--부모테이블
create table company(company_id number(5) primary key,
company varchar2(20),address varchar2(20),phone varchar2(20));

--데이터추가
insert into company values(10,'KT','경기도 분당구','02-777-8888');
insert into company values(20,'LG','서울시 을지로','02-111-2222');
insert into company values(30,'삼성','경기도 용인시','02-333-4444');


--자식테이블
--사원테이블: sawon
--직원명:
--직급:
--이메일:
--휴대폰:
--회사아이디: 외부키
create table sawon2(company_id number(5),
sawon_name varchar2(20),position2 varchar2(20),
email varchar2(20),hp varchar2(20),
constraint sawon_fk_id foreign key(company_id) references company(company_id));

--cascade
create table sawon3(company_id number(5),
sawon_name varchar2(20),position2 varchar2(20),
email varchar2(20),hp varchar2(20),
constraint sawon_fk_id foreign key(company_id) references company(company_id)
on delete cascade);

--on delete cascade: 외부키로 테이블이 연결되었다 하더라도 부모테이블의 데이터를 삭제하면 
--자식테이블의 데이터까지 자동으로 삭제시켜 주는 기능


















