-- 생산일자 2022년 5월 식품들의 ID,이름, 총 매출 조회
-- 총 매출 기준 내림차순 정렬, 식품 ID 기준 오름차순 정렬

SELECT P.PRODUCT_ID
     , P.PRODUCT_NAME
     , (PRICE * SUM(AMOUNT)) AS TOTAL_SALES
    FROM FOOD_PRODUCT P
    JOIN FOOD_ORDER O
        ON P.PRODUCT_ID = O.PRODUCT_ID
    WHERE O.PRODUCE_DATE BETWEEN '2022-05-01' AND '2022-05-31'
    GROUP BY PRODUCT_ID
    ORDER BY TOTAL_SALES DESC, P.PRODUCT_ID