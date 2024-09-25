-- 부서 테이블의 모든 정보를 조회
SELECT * FROM DEPARTMENT d;

-- 학생 테이블 설명
DESC STUDENT;

-- 학생 테이블의 모든 정보 조회
SELECT * FROM STUDENT;

-- 부서번호별 학생 수 및 평균 신장 조회
SELECT DEPTNO, COUNT(*) AS STUDENT_COUNT, AVG(HEIGHT) AS AVG_HEIGHT
FROM STUDENT
WHERE DEPTNO < 201
GROUP BY DEPTNO
HAVING COUNT(*) >= 5;

-- 학생 테이블의 학년 및 부서 번호 중복 제거
SELECT DISTINCT GRADE, DEPTNO
FROM STUDENT;

-- 부서 테이블에서 별칭을 사용하여 부서 번호 및 이름 조회SELECT DEPTNO AS "부서번호", DNAME AS "부서이름"
SELECT DNAME 부서이름, DEPTNO AS "부서번호"
FROM DEPARTMENT d;


-- 학생 테이블에서 학번과 이름을 연결하여 STUDENT 라는 별칭을 붙인 결과 조회.
SELECT STUDNO || ' ' || NAME STUDENT,CONCAT(STUDNO,NAME)
FROM STUDENT;

SELECT STUDNO, NAME 
FROM STUDENT s ;

