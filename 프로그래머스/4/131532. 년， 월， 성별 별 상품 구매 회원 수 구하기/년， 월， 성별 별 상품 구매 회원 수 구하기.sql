-- GENDER 컬럼에서 0은 남자 1은 여자. 비어있을 수도 있음.
-- 연 월 성별로 상품을 "구매한" 회원 수 출력.
-- 연 월 성별 기준 오름차순 정렬, 성별 정보가 없으면 결과에서 제외하기.
-- 회원 정보(=USER_ID)가 중복되는 것 주의할 것. => DISTINCT를 써야 한다는 말임.

SELECT YEAR(SALES_DATE) AS YEAR
     , MONTH(SALES_DATE) AS MONTH
     , GENDER
     , COUNT(DISTINCT O.USER_ID) AS USERS
    FROM USER_INFO U
    JOIN ONLINE_SALE O
        ON U.USER_ID = O.USER_ID
    WHERE GENDER IS NOT NULL
    GROUP BY YEAR, MONTH, GENDER
    ORDER BY YEAR, MONTH, GENDER























# SELECT YEAR(SALES_DATE) AS YEAR
#      , MONTH(SALES_DATE) AS MONTH
#      , U.GENDER
#      , COUNT(DISTINCT O.USER_ID) AS USERS
#     FROM USER_INFO U
#     JOIN ONLINE_SALE O
#         ON U.USER_ID = O.USER_ID
#     WHERE GENDER IS NOT NULL
#     GROUP BY YEAR, MONTH, GENDER
#     ORDER BY YEAR, MONTH, GENDER;