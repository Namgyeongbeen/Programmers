-- 2022년 10월 16일에 대여중(반납일이 10월 16일이어도 대여중)이면 '대여중'이라 표시, 아니면 '대여 가능' 표시.
-- ID와 AVAILABILITY 출력
-- ID 기준 내림차순 정렬(중복 제외)

-- 25.02.12
SELECT DISTINCT CAR_ID
     , MAX(CASE WHEN '2022-10-16' BETWEEN START_DATE AND END_DATE THEN '대여중'
                ELSE '대여 가능'
                END) AS AVAILABILITY
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    GROUP BY CAR_ID
    ORDER BY CAR_ID DESC












# 풀이1
# SELECT CAR_ID
#      , MAX(AVAILABILITY) AS AVAILABILITY
#     FROM (
#         SELECT CAR_ID
#              , CASE WHEN '2022-10-16' BETWEEN START_DATE AND END_DATE THEN '대여중'
#                     ELSE '대여 가능'
#                     END AS AVAILABILITY
#             FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
#     ) AS B
#     GROUP BY CAR_ID
#     ORDER BY CAR_ID DESC;

# 풀이2. 더 간단.
# SELECT CAR_ID
#      , MAX(CASE WHEN '2022-10-16' BETWEEN START_DATE AND END_DATE THEN '대여중' 
#                 ELSE '대여 가능' 
#                 END) AS AVAILABILITY
#     FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
#     GROUP BY CAR_ID
#     ORDER BY CAR_ID DESC;


# 참고. 유니코드 비교
# SELECT 
#     ORD(SUBSTRING('대여가능', 3, 1)) AS unicode_value_1,
#     ORD(SUBSTRING('대여중', 3, 1)) AS unicode_value_2;