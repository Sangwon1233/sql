--사용자 아이디가 JUN123인 학생과 같은 학년인 학생의 학번,이름,학년을 조회
SELECT STUDNO ,NAME ,GRADE 
FROM STUDENT
WHERE GRADE=(SELECT GRADE 
FROM STUDENT 
WHERE USERID = 'jun123');

--101번 학과 학생들의 평균 몸무게보다 적은 몸무게를 가진 학생의 학번,학과번호,몸무게를 조회

SELECT STUDNO ,DEPTNO ,WEIGHT 
FROM STUDENT s 
WHERE WEIGHT <
    (SELECT AVG(WEIGHT) 
    FROM STUDENT s
    WHERE DEPTNO = 101);
   
   --20101번 학생과 학년이 같고, 키는 20101번 학생보다 큰 학생의 이름, 학년, 키를 출력하여라
SELECT GRADE
FROM STUDENT s 
WHERE STUDNO = 20101;

SELECT HEIGHT 
FROM STUDENT s 
WHERE STUDNO = 20101;

SELECT NAME, GRADE ,HEIGHT 
FROM STUDENT s 
WHERE GRADE = (SELECT GRADE
                FROM STUDENT s 
                WHERE STUDNO = 20101) 
AND HEIGHT > (SELECT HEIGHT 
                FROM STUDENT s 
                WHERE STUDNO = 20101);

--정보미디어학부에 소속된 학생의 학번,이름,학과번호 조회
SELECT DEPTNO FROM 
DEPARTMENT d 
WHERE COLLEGE =(SELECT DEPTNO 
FROM DEPARTMENT d 
WHERE DNAME ='정보미디어학부');

SELECT STUDNO,NAME,DEPTNO 
FROM STUDENT
WHERE DEPTNO IN (SELECT DEPTNO FROM 
DEPARTMENT d 
WHERE COLLEGE =(SELECT DEPTNO 
FROM DEPARTMENT d 
WHERE DNAME ='정보미디어학부'));

SELECT HEIGHT 
FROM STUDENT 
WHERE GRADE =4;

--any를 사용하여 키 비교
SELECT HEIGHT 
FROM STUDENT s
WHERE HEIGHT < ANY (SELECT HEIGHT  
	FROM STUDENT
	WHERE GRADE =4); 
	
SELECT STUDNO,NAME,DEPTNO 
FROM STUDENT
WHERE DEPTNO = ANY (SELECT DEPTNO FROM 
DEPARTMENT d 
WHERE COLLEGE =(SELECT DEPTNO 
FROM DEPARTMENT d 
WHERE DNAME ='정보미디어학부'));

--min을 이용한 키 비교
SELECT HEIGHT
FROM STUDENT s 
WHERE HEIGHT >(SELECT MIN(HEIGHT) 
FROM STUDENT s 
WHERE GRADE = 4);

--4학년 학생중에서 키가 가장 큰학생보다 큰 학생을 조회,학번 이름 키
SELECT STUDNO ,NAME ,HEIGHT 
FROM STUDENT s 
WHERE Height > all(
	SELECT HEIGHT
	FROM STUDENT s 
	WHERE GRADE =4
);

--max를 이용한 키 비교
SELECT STUDNO ,NAME ,HEIGHT 
FROM STUDENT s
WHERE HEIGHT >(
SELECT MAX(height)
FROM STUDENT s 
WHERE GRADE =4
);

--보직수당을 받는 교수가 존재한다면 교수들의 교수번호,이름,급여,수당,급여+수당을 조회

SELECT PROFNO ,NAME,SAL,COMM ,SAL+NVL(COMM,0) SALCON 
FROM PROFESSOR p 
WHERE EXISTS (
	SELECT *
	FROM PROFESSOR p 
	--WHERE COMM IS NOT NULL
	WHERE  1=1
);

--학년별 체중이 최소인 학생의 이름,학년,체중을 조회
SELECT NAME ,GRADE ,WEIGHT 
FROM STUDENT s 
WHERE (GRADE,WEIGHT) IN(
SELECT GRADE ,MIN(WEIGHT) --다중 비교
FROM STUDENT s 
GROUP BY GRADE 
);

--PAIRWISE 다중 칼럼 서브쿼리
SELECT NAME,GRADE ,WEIGHT 
FROM STUDENT s 
WHERE GRADE IN(
SELECT DISTINCT GRADE
FROM STUDENT s)
AND WEIGHT IN(
	SELECT MIN(WEIGHT)
	FROM STUDENT s 
	GROUP BY GRADE
)
MINUS
SELECT NAME ,GRADE ,WEIGHT 
FROM STUDENT s 
WHERE (GRADE,WEIGHT) IN(
SELECT GRADE ,MIN(WEIGHT) --다중 비교
FROM STUDENT s 
GROUP BY GRADE 
);

--학과 별 평균키 보다 큰 학생의 ,이름,학과번호 키를 조회
 SELECT NAME ,DEPTNO ,HEIGHT 
 FROM STUDENT S1
 WHERE HEIGHT >(
	SELECT AVG(HEIGHT) 
	FROM STUDENT S2 --전체 평균에서 큰 학생만
	WHERE S2.DEPTNO=S1.DEPTNO
) ;

SELECT DEPTNO,AVG(HEIGHT)
FROM STUDENT
GROUP BY DEPTNO ;
 
SELECT AVG(HEIGHT)
FROM STUDENT
WHERE DEPTNO =101

SELECT AVG(HEIGHT)
FROM STUDENT
WHERE DEPTNO =102

SELECT AVG(HEIGHT)
FROM STUDENT
WHERE DEPTNO =201

--달력만들기
SELECT MAX(sun) ,MIN(mon)  from(
	SELECT 1 sun ,NULL mon,NULL,NULL,NULL,NULL,NULL FROM dual
	union
	SELECT  null,2,NULL,NULL,NULL,NULL,NULL FROM dual
);
SELECT MOD (12,10) FROM DUAL;
SELECT TO_CHAR(TO_DATE('2024-09-1','YYYY-MM-DD'),'W') FROM DUAL; 

SELECT 
	 MAX(DECODE(MOD(RM,7),1,RM)) SUM
	,MAX(DECODE(MOD(RM,7),2,RM)) MON
	,MAX(DECODE(MOD(RM,7),3,RM)) TUE
	,MAX(DECODE(MOD(RM,7),4,RM)) WED
	,MAX(DECODE(MOD(RM,7),5,RM)) THU
	,MAX(DECODE(MOD(RM,7),6,RM)) FRI
	,MAX(DECODE(MOD(RM,7),0,RM)) SAT	
FROM (
	SELECT 
--		ROWNUM-TO_CHAR(TO_DATE('2024-10-01','YYYY-MM-DD'),'D')+1 RN_REAL, 
		ROWNUM RM,  
		TO_CHAR(TO_DATE('2024-09-'||LTRIM(TO_CHAR(ROWNUM,'00'))),'W')WEEK
	FROM  DICT
	WHERE ROWNUM <= TO_CHAR(LAST_DAY(TO_DATE('2024-09','YYYY-MM')),'DD') 
)
GROUP BY WEEK
ORDER BY WEEK;

SELECT TO_CHAR(TO_DATE('2024-10-01','YYYY-MM-DD'),'D')FROM DUAL; 

--DNL


--홍길동 데이터 입력
--학번 :10110,이름 : '홍길동',USERID ,'HONG',GRADE : '1',IDNUM : '8510101010101'
--BIRTHDATE : '85/10/10', 'TEL:047)123-4567',HEIGHT :170,WEIGHT 70,DEPTNO:101, PROFON:9903

INSERT  INTO STUDENT --데이터 학생에 추가하기
VALUES (10110,'홍길동','hong','1','8510101010101','85/10/10','047)123-4567',170,70,101,9903);

SELECT COLUMN_NAME,COLUMN_ID FROM USER_TAB_COLS WHERE TABLE_NAME='STUDENT';

SELECT *FROM DICT WHERE TABLE_NAME LIKE 'USER_%COL%'--페이지 내 정보

SELECT *
FROM STUDENT;

ROLLBACK; --마지막 커밋지점으로 간다 그러니깐 홍길동을 10번 이상 만들었는데 이걸 하게되면 처음 추가 데이터로 감

COMMIT; --데이터 저장

--학과 테이블에 DENPTNO:300,DNAME:생명공학부를 추가

INSERT INTO DEPARTMENT(DEPTNO,DNAME,COLLEGE,LOC) VALUES(300,'생명공학부',NULL,'');--널값은 널이 들어가고 빈공간에도 널이들어간다
SELECT *FROM DEPARTMENT d ;

--US_EN, UK_EN

INSERT  INTO PROFESSOR (PROFNO,NAME,POSITION,HIREDATE,DEPTNO)VALUES(9920,'최윤식','조교수',
	TO_DATE('2006-01-01','YYYY-MM-DD'),102);
INSERT  INTO PROFESSOR (PROFNO,NAME,USERID,POSITION,SAL,HIREDATE,COMM,DEPTNO)VALUES(9905,'권혁일','교수',450,
	TO_DATE('1986-01-08','YYYY-MM-DD'),25,102);

SELECT *FROM PROFESSOR p ;

DELETE PROFESSOR WHERE PROFNO = 9910;


INSERT  INTO PROFESSOR VALUES(9910,'백민선','white','전임강사',200,TRUNC(SYSDATE),10,101);


--학생(student)과 동일한 테이블 생성 단 데이터 없음
CREATE TABLE T_STUDENT AS
SELECT *FROM STUDENT WHERE 1=0;

SELECT *FROM T_STUDENT;

INSERT INTO T_STUDENT --INTSERT ALL을 많이쓰는데 그거 쓰기전에 전초단계
SELECT * FROM STUDENT;

DROP TABLE T_STUDENT;

