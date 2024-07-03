-- 대여 시작일 기준, 22년 8월 ~ 10월까지 대여 횟수가 5회 이상인 차들에 한해서
-- 해당 기간동안 차별 총 대여 횟수 출력.
-- 월 기준 오름차순 정렬, 차 ID 기준 내림차순 정렬
-- 특정 월의 대여횟수가 0이면 결과에서 제외.

# 1. 22년 8월부터 10월까지의 총 대여 횟수가 5회 이상인 CAR_ID를 찾는다
# 2. 해당 CAR_ID에 문제에서 말한 조건을 걸어주어 출력한다.

SELECT MONTH(START_DATE) AS MONTH
     , CAR_ID
     , COUNT(CAR_ID) AS RECORDS
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE CAR_ID IN (
        SELECT CAR_ID
            FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
            WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
            GROUP BY CAR_ID
            HAVING COUNT(CAR_ID) >= 5
        )
        AND START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY MONTH, CAR_ID
    ORDER BY MONTH, CAR_ID DESC