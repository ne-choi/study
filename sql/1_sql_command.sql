-- 1. SELECT 명령은 "SELECT 필드명 FROM 테이블명" 형식으로 필드 전체나 일부를 검색함

SELECT *
FROM TB_CUSTOMER;

SELECT CUSTOMER_CD,
CUSTOMER_NM,
PHONE_NUMBER,
EMAIL
FROM TB_CUSTOMER;

SELECT CUSTOMER_CD AS 고객코드,
CUSTOMER_NM AS 고객명,
PHONE_NUMBER AS 전화번호,
EMAIL AS 이메일
FROM TB_CUSTOMER;

-- 2. WHERE 구문은 SELECT 명령을 이용해 지정한 테이블에서 조건에 맞는 데이터 검색 시 사용
-- "WHERE KOR=100" 결과는 KOR 필드의 값이 100인 데이터

SELECT *
FROM TB_CUSTOMER
WHERE MW_FLG = 'M';

-- 3. AND 구문은 지정한 테이블에서 나열한 조건을 모두 만족하는 데이터를 검색하고, 하나라도 만족하지 않으면 검색하지 않음
-- "WHERE CLASS_CD='A' AND KOR=100"의 결과는 CLASS_CD 필드 값이 A면서 KOR 항목 값이 100인 데이터

SELECT *
FROM TB_CUSTOMER
WHERE CUSTOMER_CD > '2019000'
AND MW_FLG = 'W';

SELECT *
FROM TB_CUSTOMER
WHERE BIRTH_DAY < '19900101'
AND MW_FLG = 'M';

-- 4. OR 구문은 지정한 테이블에서 나열한 조건에 하나라도 만족하는 데이터를 검색하고, 모두 만족하지 않으면 검색하지 않음
-- "WHERE CLASS_CD='A' OR KOR=100"의 결과는
-- CLASS_CD 필드 값이 'A'거나 KOR 필드 값이 '8'이면서 KOR 필드 값이 100인 데이터도 검색되고, CLASS_CD 필드 값이 'A'면서 KOR 필드 값이 90인 데이터도 검색

SELECT *
FROM TB_CUSTOMER
WHERE BIRTH_DAY >= '19900101'
OR TOTAL_POINT >= 20000;

SELECT * 
FROM TB_CUSTOMER
WHERE MW_FLG = 'M'
AND (BIRTH_DAY < '19700101'
OR TOTAL_POINT >= 20000);

