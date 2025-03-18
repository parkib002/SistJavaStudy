--복습
--emp로 연습
--사원번호, 사원명, 직업, 급여를 조회하고 사원명의 오름차순으로 조회하시오
select empno,ename,job,sal from emp order by ename;

--모든열 조회하고 sal의 내림차순 조회하시오
select * from emp order by sal desc;

--job컬럼의 데이터중 중복데이터는 한번만 출력하시오
select distinct job from emp; 

--where절
--산술연산자
select * from emp;
--사원명, 급여, 특별보너스(급여+100)을 조회하시오
select ename 사원명,sal as 급여, sal+100 "특별 보너스" from emp;
--급여가 3000이상인 사람의 이름과 급여를 조회하시오
select ename 이름,sal 급여 from emp where sal>=3000;
--사원명이 스코트인 사람의 사원번호, 급여를 조회하시오
select empno 사원번호,sal 급여 from emp where ename='SCOTT';

--where절 이용 Student테이블
select * from student;
--학생중 키가 170이상인 학생의 학번과 이름과 키를 조회하시오
select studno 학번,name 학생명,height 키 from student where height>=170;
--between(작은것에서 큰것), in(여러개값을 동시 비교해서 일치하는 데이터 얻을 때)
--in연산자
--deptno1이 101 102인 학생명, 학년, deptno1 조회
select name,grade,deptno1 from student where deptno1 in (101,102);
--몸무게가 60~80사이인 학생의 이름, 몸무게 조회
select name,weight from student where weight between 60 and 80;

--Like연산자
--성이 김씨인 학생의 이름과 학년을 조회하시오
select name,grade from student where name like '김%';

--professor에서 보너스가 null값인 교수명만 출력하기
select name,bonus from professor where bonus is Null;

--professor에서 보너스가 null이 아닌 교수명만 출력하기
select name,bonus from professor where bonus is not Null;

--NVL (mysql:IFNULL)
--Null을 0으로 변경
select empno,NVL(comm,0) from emp where deptno=30;

--emp에서 사원명, 급여, 급여*12, 보너스, 급여*12+보너스(총급여)
select ename 사원명,sal 급여,sal*12 연봉,NVL(comm,0) 보너스,sal*12+NVL(comm,0) "총연봉" from emp;

--emp에서 급여가 1500이상 4000이하인 사람의 사원번호, 사원명, 급여 구하시오
select * from emp;
select empno 사원번호,ename 사원명,sal 급여 from emp where sal between 1500 and 4000;
--입사일이  1981/01/01 과 1981/12/31 사이에 입사한 사람의 이름과 급여를 구하시오
select ename 이름,sal 급여 from emp where hiredate>='1981/01/01' AND hiredate<='1981/12/31';
--직업이 MANAGER, ANALYST, CLERK인  사람의 사원명, 직업을 구하시오
select ename 사원명,job 직업 from emp where job in('MANAGER','ANALYST','CLERK');
--학생테이블에서 이름이 수로 끝나는 사람의 이름과 학년을 구하시오
select * from student;
select name 이름,grade 학년 from student where name like '__수%';
--LIKE연산자에서는 여러개의 문자를 대체한다 _ 언더바가 하나의 문자를 대체
--2번째 이름의 철자가 A인사람의 사번, 이름, 입사일, 급여 조회
select empno,ename,hiredate,sal from emp where ename like '_A%';
--3번째 이름의 철자가 N인사람의 사번, 이름, 입사일, 급여 조회
select empno,ename,hiredate,sal from emp where ename like '__N%';

--AND OR
--직업이 MANAGER이고 부서번호가 10번인 사원의 사번, 사원명, 직업, 부서번호를 조회하시오
select * from emp;
select empno,ename,job,deptno from emp where deptno=10 AND job='MANAGER';

--입사일이 1982/01/01 이전에 입사했거나 직업이 MANAGER 사원의 사번, 사원명, 직업, 입사일을 조회하시오
select empno,ename,job,hiredate from emp where hiredate>='1982/01/01' OR job='MANAGER';

--다중정렬
--직업의 오름차순, 급여의 내림차순으로 사원명, 직업, 급여를 구하시오
select ename,job,sal from emp order by job asc,sal desc;
--학생테이블에서 1학년 학생의 이름과 키와 몸무게를 구하시오 단 키는 작은사람부터, 몸무게는 많은 사람부터 정렬출력할 것
select * from student;
select name,height,weight from student where grade=1 order by height,weight desc;

--Q
--학생테이블에서 몸무게가 80이상인 학생명, 학년, 키, 몸무게를 조회하되 4학년부터1학년순서로 조회한 후 몸무게가 적은사람부터 조회할 것
select name,grade,height,weight from student where weight>=80 order by grade desc,weight;
--학생테이블에서 생일이 1975/01/01이후인 학생의 학생명, 학년, 생일을 조회하되 생일의 내림차순 조회하시오
select name,grade,birthday from student where birthday>='1975/01/01' order by birthday desc;

--between, in, and, or
--급여가 1200~2000사이의 이름, 급여, 보너스를 구하시오(AND)
select * from emp;
select ename,sal,comm from emp where sal>=1200 AND sal<=2000;
--급여가 1200~2000사이의 이름, 급여, 보너스를 구하시오(Between)
select ename,sal,comm from emp where sal between 1200 and 2000;
--Job이 MANAGER,SALESMAN인 사람의 이름과 직업을 구하시오(OR)
select ename,job from emp where job='MANAGER' OR job='SALESMAN';
--Job이 MANAGER,SALESMAN인 사람의 이름과 직업을 구하시오(IN)
select ename,job from emp where job in ('MANAGER','SALESMAN');

--UNION 두 결과값에서 중복된 값 제거 후 출력
--UNIONALL 중복값까지 출력
select name from student where deptno1=103 union  select name from student where deptno2=203;
select name from student where deptno1=103 union All select name from student where deptno2=203;

--교집합 INTERSECT
select name from student where deptno1=101 INTERSECT select name from student where deptno2=201;

--단일함수
--Count
--count(*)는 Null값 포함,count(hpage)는 Null값 제외
select count (*),count(hpage) from professor;

--sum
select count(bonus),sum(bonus)from professor;

--avg
select count(bonus),sum(bonus),avg(bonus) from professor;

--max,min
select max(sal),min(sal) from emp;
select max(hiredate),min(hiredate) from emp;

--그룹함수
select count(*) from emp;
--급여의 평균
select avg(sal) from emp;

select round(avg(sal),2) from emp; --소수점2자리
select round(avg(sal),1) from emp; --소수점1자리
select round(avg(sal),0) from emp; --소수점 없이 반올림

select round(avg(sal),-1) from emp; --10단위
select round(avg(sal),-2) from emp; --100단위

--TO_CHAR ..date형 Number형을 varchar2로 바꿔준다
--현재날짜를 콘솔에 출력 sysdate
select sysdate from dual;

--내일날짜를 콘솔에 출력 sysdate
select sysdate+1 from dual;

--일주일 뒤 날짜를 콘솔에 출력 sysdate
select sysdate+7 from dual;

--날짜에서 월만 추출 3월 ..대소문자 같다
select to_char(sysdate,'month') from dual;

--날짜에서 월만 추출 03 ..대소문자 같다
select to_char(sysdate,'mm') from dual;

--날짜와 시간 출력
alter session set time_zone='Asia/Seoul';
select to_char(sysdate,'yyyy-mm-dd hh-mi-ss') from dual;
select to_char(current_timestamp,'yyyy-mm-dd hh-mi-ss') from dual;

--to_char number형 숫자에도 적용 가능
select to_char(112412,'999,999,999') from dual;
select to_char(54.9,'99999.00') from dual; --9는 값이 없으면 공백으로 나온다

--오전복습문제
--1.emp - 표현식을 이용하여 SMITH(CLERK)로 조회하시오
select * from emp;
select ename || '(' || job || ')' "이름(직업)" from emp;
--2.professor - 이름, 급여, 보너스, 총급여로 조회하시오
select * from professor;
select name 이름,pay 급여,bonus 보너스,(pay+bonus) 총급여 from professor;
--3.gogak - 고객테이블에서 포인트가 50만 이상인 사람의 이름 주민번호 포인트 조회하시오
select * from gogak;
select gname 이름,jumin 주민번호,point 포인트 from gogak where point>=500000;
--4.student - 학생테이블에서 서진수의 학년 전화번호 출력하시오
select * from student;
select grade 학년,tel 전화번호 from student where name like '서진수';
--5.gogak - 고객테이블에서 포인트가 30만~50만 사이인 사람의 이름과 포인트를 출력하고 포인트가 높은순으로 조회하시오
select gname 이름,point 포인트 from gogak where point between 300000 and 500000 order by point desc;
--6.student - 성이 김씨이거나 이씨인 학생의 학번, 학생명, 학년을 조회하시오
select studno 학번,name 학생명,grade 학년 from student where name like '김%' OR name like '이%';
--7.student - 4학년중에서 키가 170보다 작거나 몸무게가 60보다 많은 학생의 이름, 학년, 키, 몸무게를 조회하시오
select name 이름,grade 학년,height 키,weight 몸무게 from student where grade=4 
INTERSECT select name,grade,height,weight from student where height<170 or weight>60;
--8.emp -직업이 MANAGER인 사람의 이름 보너스를 구하되 널값은 0으로 바꾸시오
select ename 이름,NVL(comm,0) 보너스 from emp where job='MANAGER';
--9.emp - 이름, 급여, 연봉(급여*12), 보너스, 총연봉(연봉+보너스)로 출력하되 직업의 오름차순 연봉의 내림차순으로 조회할 것
select ename 이름,job 직업,sal 급여,sal*12 연봉,comm 보너스,sal*12+comm 총연봉 from emp order by job asc, sal*12 desc;
--10.student - 3학년 이름과 키를 출력 단 이름 오름차순
select name 이름,height 키 from student where grade=3 order by name;
--11.emp - 입사일이 5월인 사람만 사원명, 입사일을 출력하시오
--select ename 사원명,hiredate 입사일 from emp where hiredate like '___05%';
select ename,hiredate from emp where to_char(hiredate,'mm')='05';
--12.student - 이름에 '미'를 포함하고 있는 사람의 학생명, 학년을 조회하시오
select name, grade from student where name like '%미%';
--13.emp - 사원명중에 대소문자 관계없이 'N'을 포함하고 있는 데이터 출력(사원명, 직업, 급여)
select ename,job,sal from emp where lower(ename) like '%n%';

--[복습]
--emp - comm이 null이 아닌 사람 중에서 sal이 1500이상인 사람 출력(사원명, 급여, 커미션)
select ename,sal,comm from emp where comm is not null and sal>=1500;

--emp - 입사일이 1985/01/01 이후에 입사한 사람만 조회(사원명, 입사일, 급여)
select ename,hiredate,sal from emp where hiredate>='85/01/01';

--emp - 이름, 급여, 보너스, 총급여(급여+보너스)
select ename,sal,NVL(comm,0),sal+NVL(comm,0) from emp;

--[서브쿼리]_쿼리안에 또 다른 쿼리문이 담김
--select 컬럼1,컬럼2 
--from emp
--where 조건연산자 (select 컬럼명 from 테이블 where 조건);
--메인쿼리(서브쿼리)

--emp_SMITH보다 급여가 많은 사람의 이름과 급여를 출력하시오
select ename,sal
from emp
where sal>(select sal from emp where ename='SMITH');
--서브쿼리가 먼저 수행이 되어 결과값을 메인쿼리에 전달해 주고 그 값을 받아서 메인쿼리 수행

--student_서진수의 키보다 작은 사람의 학생명, 학년, 키를 출력하시오
select name,grade,height from student where height<(select  height from student where name='서진수');

--student_1전공이 101학과의 평균 몸무게 보다 몸무게가 많은 학생명과 몸무게를 출력하시오
select name,weight from student where weight>(select avg(weight) from student where deptno1='101');

--emp_평균sal보다 많이 받는 사람의 목록 출력
select * from emp where sal>(select avg(sal) from emp);

--emp_ALLEN의 MGR과 동일한 값을 가진 사람의 모든 목록
select * from emp where mgr=(select mgr from emp where ename='ALLEN');

--professor_조교수의 평균 pay보다 급여가 낮은 사람의 번호, 이름, 급여를 구하시오
select profno,name,pay from professor where pay<(select avg(pay) from professor where position='조교수');

--student_1학년의 평균키보다 작은 학생의 이름, 아이디, 키를 조회하시오
select name 이름,id 아이디,height 키 from student where height<(select avg(height) from student where grade='1');

--emp_S로 시작하는 사람과 같은 부서 사람의 부서 번호와 이름을 출력하시오
select deptno, ename from emp where deptno in (select deptno from emp where ename like 'S%');

--문제
--1.emp_ ename이 ADAMS인 사람의 SAL보다 더 많이 받는 사람 출력(ename,job,sal)
select ename,job,sal from emp where sal>(select sal from emp where ename='ADAMS');
--2.emp_ 평균 SAL보다 작은 사람의 전체 컬럼 출력
select * from emp where sal<(select avg(sal) from emp);
--3.emp_ ENAME이 A나 S나 M으로 시작하는 모든 사람 출력(ename,hiredate,sal)
select ename,hiredate,sal from emp where ename in (select ename from emp where ename like 'A%' or ename like 'S%' or ename like 'M%');
select ename,hiredate,sal from emp where ename like 'S%' or ename like 'A%' or ename like 'M%';
--4.emp_ SCOTT의 SAL과 같은 SAL을 받는 사람을 조회하시오(ename,sal)
select ename,sal from emp where sal=(select sal from emp where ename='SCOTT');
--5.emp_ 사원명의 3번째 글자가 R이거나 A인 사람 조회(ename,job)
select ename,job from emp where ename like '__R%' or ename like '__A%';
--6.emp_ ||연산자를 이용하여 다음과 같이 하나의 컬럼으로 출력하시오
--(예) SCOTT의 직업은 CLERK이며 입사년도는 1989년 05월입니다(컬럼명은 자기소개)
select ename || '의 직업은 ' || job || '이며 입사년도는 ' || to_char(hiredate,'yyyy') 
|| '년 ' || to_char(hiredate, 'mm') || '월' || '입니다' 자기소개 from emp;
--7.emp_입사일이 81/11/17인 사람을 조회하시오(ename,job,hiredate,sal)
select ename,job,hiredate,sal from emp where hiredate='81/11/17';















