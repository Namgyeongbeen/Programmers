-- 2021년 가입 회원 중 구매기록이 있는 회원 수와
-- 2021년에 가입한 전체 회원 중 해당 회원들(=2021년 가입 회원 구매기록이 있는 회원들)의 비율을
-- 년, 월별로 출력. 
-- 비율은 2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수로 계산, 소수점 첫째자리까지만.
-- 전체 결과는 연 기준 오름차순, 월 기준 오름차순 정렬
-- 리텐션 구하는 문제.

WITH N_2021_CUSTOMERS AS (
    SELECT COUNT(USER_ID) AS N_CUSTOMERS
        FROM USER_INFO
        WHERE YEAR(JOINED) = 2021
)

SELECT YEAR(O.SALES_DATE) AS YEAR
     , MONTH(O.SALES_DATE) AS MONTH
     , COUNT(DISTINCT CASE WHEN YEAR(U.JOINED) = '2021' THEN O.USER_ID
                           ELSE NULL
                           END) AS PURCHASED_USERS
     , ROUND(COUNT(DISTINCT CASE WHEN YEAR(U.JOINED) = '2021' THEN O.USER_ID ELSE NULL END) / 
                (SELECT N_CUSTOMERS FROM N_2021_CUSTOMERS), 1) AS PURCHASED_RATIO 
    FROM ONLINE_SALE O
    LEFT JOIN USER_INFO U
        ON U.USER_ID = O.USER_ID
    GROUP BY YEAR, MONTH
    ORDER BY YEAR, MONTH