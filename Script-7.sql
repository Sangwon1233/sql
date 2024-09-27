-- 102번 학과 학생이면서 4학년이거나 1학년
SELECT  DEPTNO ,STUDNO ,NAME ,GRADE 
FROM STUDENT S 
WHERE DEPTNO =102
	AND GRADE IN (1,4);
--		AND (GRADE =4
--		OR	GRADE =1);

--DROP TABLE STUDENT;

CREATE TABLE STUD_HEVY AS --테이블 생성
SELECT *
FROM STUDENT
WHERE WEIGHT >=70 AND GRADE ='1';

CREATE TABLE STUD_101 AS --테이블 생성
SELECT *
FROM STUDENT
WHERE DEPTNO = 101 AND GRADE ='1';

SELECT * FROM  TAB;

SELECT STUDNO,NAME,NULL --직사각형 만들기 위해서 NULL값 추가
FROM STUD_HEVY
UNION -- 두개의 테이블에 속하면서 중복되는 행을 제외 한 집합
SELECT STUDNO,NAME,GRADE
FROM STUD_101 ;


--UNION,UNION ALL 을 활용하여 학번 이름 조회 (대상 테이블 : STUD_HEACY,STUD_101)

SELECT STUDNO ,NAME 
FROM STUD_HEVY --테이블
UNION ALL --중복되는 행을 제외하지 않고 모두 출력
SELECT STUDNO ,NAME 
FROM STUD_101	--테이블
;

SELECT STUDNO,NAME
FROM(
SELECT STUDNO ,NAME 
FROM STUD_HEVY --테이블 박동진 서재진
INTERSECT --교집합
SELECT STUDNO ,NAME 
FROM STUD_101	--테이블 박미경 서재진
);

SELECT STUDNO,NAME
FROM(
SELECT STUDNO ,NAME 
FROM STUD_HEVY --테이블 박동진 서재진
MINUS --차집합
SELECT STUDNO ,NAME 
FROM STUD_101	--테이블 박미경 서재진
);

--학생 테이블에서 이름순으로 정렬 //이름,학년,전화번호 조회
SELECT NAME ,GRADE ,TEL 
FROM STUDENT s 
ORDER BY NAME; --이름순으로 정렬

--학생 테이블에서 이름순으로 역순정렬 //이름,학년,전화번호 조회
SELECT NAME ,GRADE ,TEL 
FROM STUDENT s 
ORDER BY NAME DESC; --이름순으로 역순정렬

--학생 테이블에서 학년을 내림차순으로 정렬//이름,학년,전화번호 조회
SELECT NAME ,GRADE ,TEL 
FROM STUDENT s 
ORDER BY GRADE DESC; --이름순으로 정렬

--학생 테이블에서 학년을 내림차순으로 정렬//같은 학년일 경우 이름으로 정렬

SELECT NAME ,GRADE ,TEL 
FROM STUDENT s 
ORDER BY GRADE DESC,NAME;

SELECT STUDNO ,NAME ,PROFNO 
FROM STUDENT s 
ORDER BY 3 DESC; --PROFNO 3번째 컬럼

SELECT STUDNO ,NAME,
FROM STUDENT s 
ORDER BY PROFNO DESC; --출력에는 안보이지만 교수 번호로 내림차순이 됨

SELECT AVG(SAL)--AVG는 평균값 구하기 그래서 교수 월급 평균 구함
FROM PROFESSOR;

--함수
--학생의 이름,아이디를 조회, 단 아이디의 첫 글자는 대문자로,소문자,모든 글자 대문자로
SELECT NAME ,USERID ,INITCAP(USERID),UPPER(USERID),LOWER(USERID)
FROM STUDENT;

--부서의 이름을 조회하고 이름의 길이와,바이트 갯수를 조회
SELECT DNAME,LENGTH(DNAME),LENGTHB(DNAME)
FROM DEPARTMENT;

-- 1학년 학생들의 생년월일,태어난 달을 조회(주민번호를 통해서)
SELECT STUDNO,IDNUM,SUBSTR(IDNUM, 1,6) 
FROM STUDENT
WHERE GRADE=1;

--학생의 전화번호 조회
--단 마지막 네글자를 *로 변경
SELECT TEL,SUBSTR(TEL,1,INSTR(TEL,'-'))||'****' TEL 
FROM STUDENT;

--부서 테이블에서 부서이름 조회,부서이름 내의'과'글자의 위치를 탐색
SELECT DNAME,INSTR(DNAME,'과',-3,1)
FROM DEPARTMENT;

--교수의 직급의 왼쪽에 +기호를 추가하여 10글자로,아이디의 오른쪽에 +를 추가하여 12글자로 조히
SELECT "POSITION",USERID, LPAD("POSITION", 10,'+'),RPAD(USERID,12,'+') --글자는 2개 문자는 1개(알파벳도 1개임) 
FROM PROFESSOR ;

--SELECT 'xyxxyyyyyyxy',LTRIM('xyxxyyyyyyxy','xy'),RTRIM('xyxxyyyyyyxy','xy')
--FROM DUAL;

--부서 테이블에서 부서이름의 마지막 '과'글자를 제거
SELECT DNAME ,RTRIM(DNAME,'과') 
FROM  DEPARTMENT;

--교수 테이블에서 일급을 계산(1달은 22일)
--일급 각각 소수점 첫째 자리에서,소수점 셋째 자리에서 반올림
--일급 각각 소수점 첫째 자리에서,소수점 셋째 자리에서 자르기
SELECT  SAL
,SAL/22 A
,ROUND(SAL/22) B
,ROUND(SAL/22,2) C
,ROUND(SAL/22,-1) C_1
,TRUNC(SAL/22) D
,TRUNC(SAL/22,2) E
FROM PROFESSOR;

--교수번호 9908교수님의 입사 일,입사 ,입사 30일후일후,입사 60일후 의 날짜를 조회
SELECT HIREDATE ,HIREDATE+30 ,HIREDATE+60 
FROM PROFESSOR
WHERE PROFNO=9908;

--현재 날짜 조회
SELECT SYSDATE FROM DUAL;

SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'97/01/26')) A FROM DUAL; 

--입사한지 120개월 된 교수들을 조회,교수번호,입사일,입사일+6개월후,입사일 부터 현재까지의 개월 계산
SELECT 
	PROFNO 
	,HIREDATE 
	,ADD_MONTHS(HIREDATE,+6) A
	,MONTHS_BETWEEN(SYSDATE,HIREDATE)B
FROM PROFESSOR
WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE) <320;

-- 오늘이 속한 달의 마지막 날짜, 다가오는 일요일을 조회
SELECT 
	SYSDATE 
	,LAST_DAY(SYSDATE)
	,NEXT_DAY(SYSDATE,7)	
FROM DUAL;

--오늘을 조회, 반올림, 절삭처리
SELECT 
	SYSDATE-4/24 --4시간 전
	,ROUND(SYSDATE-4/24)--4시간 뺸 시간이 정오보다 전이면 오늘로 표기됨
	,TRUNC(SYSDATE)
FROM DUAL;


--오늘을 반올림,날짜,월,연으로 반올림 ,시, 분 반올림
SELECT 
	SYSDATE
	,ROUND(SYSDATE,'DD')DAY
	,ROUND(SYSDATE,'MM')MONTH
	,ROUND(SYSDATE,'YY')YEAR
	,ROUND(SYSDATE,'HH')HOUR
	,ROUND(SYSDATE,'MI')MINUTE
	
FROM DUAL;

--4학년 학생 조회
SELECT *
FROM STUDENT
WHERE GRADE =4;






