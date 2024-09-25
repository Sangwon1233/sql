SELECT 1+1
FROM DUAL --반드시 프롬을 써야함
--WHERE 1=0 --데이터 베이스는 =한개가 비교임
WHERE 'SQL'='SQL   '; --따음표는 문자열

CREATE TABLE EX_TYPE(
	C CHAR(7)
	,V VARCHAR(100)
	,N NUMBER(5,2) --괄호를 안쓰면 나오는거 다쓴다 자릿수 제한 없음이라고 생각 (총숫자 갯수,소수점~자리까지)
);
DROP TABLE EX_TYPE --DROP삭제

SELECT  *
FROM EX_TYPE

INSERT INTO EX_TYPE VALUES('SQL','SQL',999.111111) -- EX타입에 값을 넣는다 

DELETE FROM EX_TYPE;

SELECT  *
FROM EX_TYPE
WHERE C=V || '    '; --하나는 차타입이고 하나는 바차 타입이다. 같다고 만들고 싶을때 위에 공백을 4개 붙이면 같다고 나옴

SELECT 3.14 + 1 FROM DUAL; --데이터 베이스는 숫자 그자체의 타입

SELECT ROWNUM,STUDENT.*,ROWID FROM STUDENT --행 번호 붙이기
--WHERE GRADE = 2;--2학년
WHERE ROWNUM <=5 --위부터 ~까지 보이게 하기(잘라내기)

--현재 시간 정보 조회
SELECT SYSDATE FROM DUAL;--현재 시간을 나타내는 문장


SELECT  * FROM DEPARTMENT d ;--101의 상위는 100번의 학번 공과대학은 상위가 없어서 최고임

SELECT * FROM  EX_TYPE

--학생 테이블에서 1학년 학생의 학번 이름 학과번호 조회
SELECT STUDNO,NAME,DEPTNO,GRADE
FROM STUDENT s 
WHERE GRADE = 1;

--학생 이름 학년 학과번호 몸무게 조회, 단 70KG이상이어야한다.
SELECT STUDNO,NAME,GRADE ,DEPTNO,WEIGHT 
FROM STUDENT s 
WHERE WEIGHT >= 70;

--이름 학년 몸무게 학과번호 70KG이상이면서 1학년 학생
SELECT STUDNO ,GRADE ,WEIGHT ,DEPTNO 
FROM STUDENT s 
WHERE WEIGHT >=70 
	AND GRADE ='1';

--이름 학년 몸무게 학과번호 70KG이상이거나 1학년 학생
SELECT STUDNO ,GRADE ,WEIGHT ,DEPTNO 
FROM STUDENT s 
WHERE WEIGHT >=70 
	OR GRADE ='1';

--학번 이름 몸무게,체중이 50이상 70이하인 사람만
SELECT STUDNO ,NAME ,WEIGHT 
FROM STUDENT s 
WHERE
	WEIGHT BETWEEN 50 AND 70 
	AND GRADE =1;

--학생중 이름, 생년월일 출력, 81년에서 83년 사이에 태어난
SELECT NAME , BIRTHDATE 
FROM  STUDENT s 
WHERE 
	BIRTHDATE BETWEEN '81/01/01'And'83/12/31';

--이름,학년,학과번호 조회,102번,201번 학과만
SELECT NAME ,GRADE ,DEPTNO 
FROM STUDENT s 
WHERE 
	DEPTNO IN(102,201);

--학생중 이름, 생년월일 출력, 81년에서 83년 사이에 태어난 IN을 사용
SELECT TO_CHAR(BIRTHDATE,'YY') yy,s.* --s.*은 학생전체 
FROM  STUDENT s 
WHERE 
	TO_CHAR(BIRTHDATE,'YY') IN(81,82,83);

--이름,학년,학과번호 조회,김씨만
SELECT *
FROM STUDENT s
WHERE 
	NAME LIKE '김__' ; --%는 0개 이상의 문자 김만있어도 출력 %김%은 가운데 있는 김 나옴 
--김__는 김떙떙만 나옴 김_은 김떙만 나옴
	
	SELECT 2/NULL FROM DUAL;

--교수 테이블에서 이름,직급,보직수당 조회
SELECT NAME ,"POSITION" ,COMM 
FROM PROFESSOR p ;

--교수 테이블에서 이름,직급,보직수당 조회 단 수당이 있는 사람만
SELECT NAME ,"POSITION" ,COMM 
FROM PROFESSOR p 
WHERE
	COMM IS NOT NULL;

--교수이름 ,급여 ,수당 ,급여+수당
SELECT NAME ,SAL ,COMM , SAL+COMM SALCOM --SALCOM은 내가 만든 테이블 이름(급여+수당)
FROM PROFESSOR p 

SELECT 
NAME ,SAL ,COMM , SAL+COMM SALCOM, NVL(COMM,0)+SAL --COMM(수당에)0을 넣은것
FROM PROFESSOR p 

SELECT 
NAME ,SAL ,COMM , SAL+COMM SALCOM, NVL(COMM,0)+SAL,NVL2(COMM,SAL+COMM ,SAL) --널 일땐 급여만 아닐땐 합계
FROM PROFESSOR p 

--{1,100,2,3,20}
SELECT *
FROM EX_TYPE
ORDER BY TO_NUMBER() ASC;--N을 아무것도 안쓰면 덧셈 및 오름차순

INSERT INTO EX_TYPE VALUES('1','SQL',1);
INSERT INTO EX_TYPE VALUES('100','SQL',100);
INSERT INTO EX_TYPE VALUES('2','SQL',2);
INSERT INTO EX_TYPE VALUES('3','SQL',3);
INSERT INTO EX_TYPE VALUES('20','SQL',20); -- 숫자가 아닌 문자 넣기

DELETE FROM EX_TYPE;

SELECT *




