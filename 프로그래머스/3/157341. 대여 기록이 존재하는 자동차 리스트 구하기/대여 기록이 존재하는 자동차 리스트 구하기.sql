-- 코드를 입력하세요
-- 10월에 대여 시작한 기록이 있는 세단의 ID 리스트 출력
SELECT DISTINCT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE MONTH(START_DATE) = 10
        AND CAR_ID IN (
            SELECT CAR_ID
                FROM CAR_RENTAL_COMPANY_CAR
                WHERE CAR_TYPE = '세단'
        )
    ORDER BY CAR_ID DESC