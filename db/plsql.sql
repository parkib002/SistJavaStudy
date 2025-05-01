--형식
--SQL언어에 절차적 언어요소를 추가해서 프로그래밍한것을 PL/SQL이라 한다

--DECLARE
--변수,커서 선언
--BEGIN
--sql구문이나 pl/sql문으로 코딩
--END;
--만약에 스크립트 창에 결과가 출력되도록 하려면 한번만 실행해주면 나온다
--set SERVEROUTPUT ON
--set SERVEROUTPUT OFF

--예제1
DECLARE
v_no NUMBER(4,1); --4자리에 소수점 1자리
BEGIN
v_no :=40.7; --값 대입
dbms_output.put_line(v_no); --출력
END;
/
DECLARE
v_no NUMBER(4);
v_name varchar2(20);
BEGIN
select empno,ename INTO v_no,v_name
FROM my_table
where empno=7900;
dbms_output.put_line(v_no || ' ' ||v_name);
End; --종료

--예제2
DECLARE
vname varchar2(20);
vgrade number(5);
vage number(3);
vsearch varchar2(20) :='김민재';

BEGIN
select stu_name,stu_grade,stu_age
into vname,vgrade,vage
from stuinfo where stu_name=vsearch;

dbms_output.put_line(vname || '님의 학년은 ' || vgrade || '학년이고 나이는 ' || vage || '입니다');
END;
/
DECLARE

vcolor varchar2(20);
vprice number(5);
vsize varchar2(10);
vname varchar2(20) :='요가매트A';

BEGIN
select sname,scolor,sprice,ssize
into vname,vcolor,vprice,vsize
from shop where sname=vname;

dbms_output.put_line('상품명: ' || vname || CHR(10) || '색상: ' || vcolor|| CHR(10) || '가격: ' || vprice || '원' || CHR(10) || '사이즈: ' || vsize);
END;
/

--if문
/*
if 조건문 then
   문장1;
else
   문장2;
end if;
*/
--다중 if문
/*
if 조건문 then
   문장1;
elsif 조건문 then
   문장2......
end if;
*/

--문제 v_num에 15를 초기값으로 준 후 '15는 홀수입니다' 출력
--mod,if

DECLARE
v_num number(5) :=15;
BEGIN
    if mod(v_num,2)=0 then
    dbms_output.put_line(v_num || '는 짝수입니다');
    
    else
    dbms_output.put_line(v_num || '는 홀수입니다');
    
    end if;
END;
/

--태어난 연도로 띠구하기
DECLARE
    v_year number(4) :=1997;
    v_mod number(2) :=mod(v_year,12); --12로 나눈 나머지(0~11)
    v_ddi varchar2(20); --띠저장
BEGIN
    if v_mod=0 then v_ddi :='원숭이';
    elsif v_mod=1 then v_ddi :='닭';
    elsif v_mod=2 then v_ddi :='개';
    elsif v_mod=3 then v_ddi :='돼지';
    elsif v_mod=4 then v_ddi :='쥐';
    elsif v_mod=5 then v_ddi :='소';
    elsif v_mod=6 then v_ddi :='호랑이';
    elsif v_mod=7 then v_ddi :='토끼';
    elsif v_mod=8 then v_ddi :='용';
    elsif v_mod=9 then v_ddi :='뱀';
    elsif v_mod=10 then v_ddi :='말';
    else v_ddi :='양';
    
    end if;
    
    dbms_output.put_line(v_year || '생은 ' || v_ddi || '띠입니다' );
END;
/

--특정테이블 a에서 b라는 컬럼의 타입을 가져오려고 할 때
--a.b%TYPE
--shop테이블에서 scode가 40인 상품명, 가격, 색상, 사이즈 얻어오기
DECLARE
v_num shop.scode%type :=40;
v_name shop.sname%type;
v_price shop.sprice%type;
v_color shop.scolor%type;
v_size shop.ssize%type;

BEGIN
select sname,sprice,scolor,ssize
into v_name,v_price,v_color,v_size
from shop
where scode=v_num;
dbms_output.put_line('상품명: ' || v_name);
dbms_output.put_line('가격: ' || v_price);
dbms_output.put_line('색상: ' || v_color);
dbms_output.put_line('사이즈: ' || v_size);
END;
/

--반복문 loop
/*
loop
명령들...
exit when 조건;
end loop;
*/

--1부터 10까지를 출력해보기

DECLARE
vno number(3) :=0;
BEGIN
loop
vno:=vno+1;
dbms_output.put_line('no: ' || vno);
exit when vno=10; --조건에 맞으면 반복문을 빠져나간다
end loop;
END;
/

--구구단 출력: v_gugu 초기값 7을 지정 후 7단 출력
ACCEPT gugu PROMPT '1~9사이의 숫자를 입력하시오'; --여기 실행시 입력한 숫자가 gugu에 입력

DECLARE
--v_gugu number(2):=7;
v_gugu number(2) :='&gugu';

v_num number(2) :=1;
BEGIN
dbms_output.put_line(v_gugu || '단');
loop
dbms_output.put_line(v_gugu || 'X' || v_num || '= ' || v_gugu*v_num);
v_num :=v_num+1;
exit when v_num=10;
end loop;
END;
/

DECLARE
v_grade char :='A';
v_msg varchar2(20);
BEGIN
v_msg:=
case V_grade
when 'A' then 'Excellent!!!'
when 'B' then 'Very Good!!!'
when 'C' then 'Good!!!'
else 'Try!!!'
end;

 dbms_output.put_line('평가: ' || v_msg);
 END;
 /
 ACCEPT name PROMPT '이름을 입력하세요';
 
 DECLARE v_name varchar(5) :='&name';
 
 dbms_output.put_line(v_name || '님의 검색결과');
 dbms_output.put_line('주소' || v_addr);
 
 --오라클에서 예외처리 하는 법
 EXCEPTION
 when No_Data_found then
 dbms_output.put_line(v_name || '님은 DB에 없습니다');
 when Too_Many_Rows then
 dbms_output.put_line(v_name || '님은 DB에 여러명입니다')
 when others then
 dbms_output.put_line('어쨋든 익셉션!!!');
 END;
 /
 
 --반복문 for
 /*
 For 변수 IN[REVERSE] 시작값..최종값 LOOP
 문장들....
 END LOOP;
 */
 
 --구구단 출력 이번에는 For문으로 해보기
 accept gugu prompt '1~9까지 숫자를 입력하세요';
 
declare
v_gugu number(2) :='&gugu';
v_num number(2) :=1;

BEGIN
dbms_output.put_line(v_gugu || '단');

for v_num in 1..9 loop
dbms_output.put_line(v_gugu || 'X' || v_num || '=' || v_gugu*v_num);
end loop;
END;
/

--db레코드 데이터를 통째로 가져오는 방법
--계정명.테이블명%rowtype; 행단위로 참조

DECLARE
v_sang mymall.sangpum%type :='상품1';
vmall parkib002.mymall%rowtype; --레코드 단위로 읽기
BEGIN
select * into vmall
from mymall
where sangpum=v_sang;

dbms_output.put_line('번호: ' || vmall.num);
dbms_output.put_line('상품명: ' || vmall.sangpum);
dbms_output.put_line('가격: ' || vmall.price);
dbms_output.put_line('색상: ' || vmall.color);
END;
/

--Cursor:sql문 실행할 때마다 명령이 분석되고 실행되어 결과 보관하기 위한 메모리 영역을
--사용하는데 이 영역을 참조하는 것(select문 에서 사용)

--커서 속성
--sql%rowcount: 실행된 행수반환
--sql%found: 최근의 sql문이 하나이상의 행에 영향을 주었으면 true

--sql%notfound: 결과행이 없으면 true
--sql%isopen: 항상 false(항상 close하기 때문에 항상 false)

/*
 여러 레코드 출력
 
 Cusor 커서명
 is
 select 문장==>select의 결과를 커서에 보관
 
 Cusor출력
 
 loop형식(커서를 open,close해주기)
 loop
    fetch 커서명 into 변수명1,변수명2....
    exit when 커서명%not found; --결과 데이터가 없을 때 true 빠져나감
end loop;

for 형식(Cursor자동open,close)
for 레코드명 in 커서명 loop
  명령...;
end loop;  
*/

--sawon테이블의 모든 데이터를 출력

DECLARE
 CURSOR s1
 is
 select sname,sblood,sbirth from sawon;


vblood sawon.sblood%type;
vname sawon.sname%type;
vbirth sawon.sbirth%type;
BEGIN
dbms_output.put_line('사원명 혈액형 생일');
open s1; --loop로 가지고 올 경우에만 open,close필요
loop
    fetch s1 into vname,vblood,vbirth;
    exit when s1%notfound; --더 이상 데이터가 없으면 빠져나감
    dbms_output.put_line(vname || '  ' || vblood || '  ' || vbirth);
end loop;
dbms_output.put_line('총' || s1%rowcount || '개의 데이터 조회 완료!!');
close s1;
END;
/

DECLARE
CURSOR s1
is
select * from sawon;

BEGIN
  dbms_output.put_line('사원명 혈액형 생일');
for s in s1 loop
exit when s1%notfound;
dbms_output.put_line(s.sname||'  '||s.sblood|| '  '||s.sbirth);
end loop;
END;
/

--프로시져
--반복되는 코드를 프로시져에 저장해 두었다가 호출해서 실행만 해서 쓰는 재사용성이 높은 객체이다
    
/*
형식
create [or replace] procedure 프로시져명
is
변수선언
begin
코드;
end;

호출: exec 프로시져명
*/

--간단 프로시져 1
create or replace procedure hello
is
begin
dbms_output.put_line('첫 프로시져 만들어 봤어요~~');
END;
/
--exec hello;

-- 구구단 숫자를 파라미터로 받아 해당 구구단을 출력하시오
--단2~9가 아니면 오류 메세지 후 종료
create or replace procedure gugu(dan number)
is
begin
if dan<2 or dan>9 then
  dbms_output.put_line('잘못된 값입니다.2~9사이값만 입력!!');
else
  dbms_output.put_line('***' || dan || '***');
  dbms_output.put_line('  ');
  for a in 1..9 loop
    dbms_output.put_line(dan || 'X' || a || '=' || dan*a);
  end loop;
end if;
END;
/
exec gugu(5);