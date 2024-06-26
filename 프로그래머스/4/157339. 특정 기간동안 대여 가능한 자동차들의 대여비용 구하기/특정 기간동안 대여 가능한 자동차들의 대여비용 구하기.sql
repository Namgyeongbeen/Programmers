-- 할인 가능 대여기간 : 대여 7~29일, 대여 30~89일, 대여 90일 ~
-- 차종 : 세단, SUV
-- 기간 : 2022-11-01 ~ 2022-11-30, 총 30일
-- 대여금액 : 50만원 ~ 199만 9999원
-- 출력 : 대여 가능한 자동차ID, 자동차 종류, 대여금액(컬럼명 : FEE, 정수 형태.)
-- 정렬 : 대여금액 내림차순 차종 오름차순 차ID 내림차순

# SELECT C.CAR_ID, C.CAR_TYPE
#      , ROUND((30 * C.DAILY_FEE * (1-P.DISCOUNT_RATE/100))) AS FEE
#     FROM CAR_RENTAL_COMPANY_CAR C
#     LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY H
#         ON C.CAR_ID = H.CAR_ID
#     LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN P
#         ON C.CAR_TYPE = P.CAR_TYPE
#     WHERE C.CAR_ID NOT IN 
#     (
#         SELECT CAR_ID
#            FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
#                WHERE ('2022-11-01 00:00:00' BETWEEN START_DATE AND END_DATE)
#                   OR ('2022-11-30 23:59:59' BETWEEN START_DATE AND END_DATE)
#     )
#         AND C.CAR_TYPE IN ('세단', 'SUV')
#         AND P.DURATION_TYPE = '30일 이상'
#     GROUP BY C.CAR_ID, C.CAR_TYPE
#     HAVING FEE BETWEEN 500000 AND 2000000
#     ORDER BY FEE DESC, C.CAR_TYPE, C.CAR_ID DESC;
    
    
SELECT C.CAR_ID, C.CAR_TYPE
     , ROUND((30 * C.DAILY_FEE * (1 - P.DISCOUNT_RATE / 100))) AS FEE
FROM CAR_RENTAL_COMPANY_CAR C
JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN P ON C.CAR_TYPE = P.CAR_TYPE AND P.DURATION_TYPE = '30일 이상'
WHERE C.CAR_TYPE IN ('세단', 'SUV')
AND NOT EXISTS (
    SELECT 1
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
    WHERE H.CAR_ID = C.CAR_ID
    AND NOT (H.END_DATE < '2022-11-01' OR H.START_DATE > '2022-11-30')
)
GROUP BY C.CAR_ID, C.CAR_TYPE, P.DISCOUNT_RATE, C.DAILY_FEE
HAVING FEE >= 500000 AND FEE < 2000000
ORDER BY FEE DESC, C.CAR_TYPE, C.CAR_ID DESC;
