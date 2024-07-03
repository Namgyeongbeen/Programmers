-- 카테고리별 가장 제일 비싼 식품의 카테고리, 가격, 이름 출력
-- 카테고리가 '과자', '국', '김치', '식용유'인 경우만 출력
-- 식품 가격 기준 내림차순 정렬

SELECT CATEGORY
     , PRICE AS MAX_PRICE
     , PRODUCT_NAME
    FROM FOOD_PRODUCT
    WHERE (CATEGORY, PRICE) IN (
        SELECT CATEGORY, MAX(PRICE) AS MAX_PRICE
            FROM FOOD_PRODUCT
            GROUP BY CATEGORY
            HAVING CATEGORY IN ('과자', '국', '김치', '식용유')
    )
    ORDER BY MAX_PRICE DESC