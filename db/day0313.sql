--emp테이블 전체 조회
select * from emp;
--emp테이블의 사원명들만 조회
select ename from emp;
--emp테이블의 사원명과 입사일을 조회
select ename,hiredate from emp;
--emp테이블의 사원명 오름차순 정렬
select * from emp order by ename;
--emp테이블의 사원명 내림차순 정렬
select * from emp order by ename desc;
--별명 alias
--emp에서 ename은 사원명, job은 직업으로 조회하시오
select ename "직원 명",job "직업" from emp;
--중복제거
--emp에서 직업을 중복제거하시오
select distinct job from emp;
--표현식 (컬럼이외에 출력을 원하는 내용을 select구문 뒤에 ' ' 사용한다)
select ename, '근무중' from emp;
--연결연산자(합성연산자)로 컬럼을 붙혀서 출력
--professor에서 name님은 position 입니다
select name || '님은' || position || '입니다' from professor;
--emp테이블에서 사원번호, 사원명이라고 별명을 붙혀서 조회하시오
select empno 사원번호,ename as 사원명 from emp;
--student 전체조회
select * from student;
--학생테이블에서 학번, 학생명, 학년이라고 별명을 준 후 조회하시오
select studno 학번,name 학생명,grade as 학년 from student;
--학생테이블에서 이름,학년,키를 조회하되 키가 큰 순으로 정렬하시오
select name "이름",grade "학년",height "신장" from student order by height desc;
--emp테이블에서 모든 열을 조회하되 급여가 낮은 사람부터 조회하시오
select * from emp order by sal;
select * from emp order by sal asc;--asc는 생략가능


--Quiz
--emp에서 사원번호, 사원명, 급여를 조회하시오(별명넣어서)
select empno "사원번호",ename "사원명",sal "급여" from emp;

--dept2에서 AREA를 중복제거하고 출력해보세요
select * from dept2;
select distinct AREA from dept2;

--emp에서 SMITH님의 직업은 CLERK입니다 와 같이 출력해보세요
select * from emp;
select ename || '님의 직업은' || job || '입니다' from emp;

--professor에서 교수명, 급여, 보너스를 별명과 같이 출력하시고 급여가 많은 사람부터 출력하시오
select * from professor;
select name "교수명",pay "급여",bonus "보너스" from professor order by pay desc;



