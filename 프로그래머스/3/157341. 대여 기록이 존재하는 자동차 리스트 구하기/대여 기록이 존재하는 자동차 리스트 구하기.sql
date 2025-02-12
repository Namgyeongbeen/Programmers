-- 10월에 대여 시작한 기록이 있는 '세단'의 ID 리스트 출력

-- 25.02.12
-- 1. START_DATE가 10월 중에 있는 차 조회
-- 2. 그 중 세단만 출력, 자동차 ID 기준 내림차순 정렬

SELECT DISTINCT C.CAR_ID
    FROM CAR_RENTAL_COMPANY_CAR C
    LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY H
        ON C.CAR_ID = H.CAR_ID
    WHERE START_DATE BETWEEN '2022-10-01' AND '2022-10-31'
        AND CAR_TYPE = '세단'
    ORDER BY C.CAR_ID DESC













# SELECT DISTINCT CAR_ID
#     FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
#     WHERE MONTH(START_DATE) = 10
#         AND CAR_ID IN (
#             SELECT CAR_ID
#                 FROM CAR_RENTAL_COMPANY_CAR
#                 WHERE CAR_TYPE = '세단'
#         )
#     ORDER BY CAR_ID DESC