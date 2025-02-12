-- 1. 22년 5월 1일 출고여부 조회
-- 2. 5월 1일 이전부터 5월 1일까지의 기간에 출고되면 출고 완료, 그 외에는 출고미정
-- 3. ORDER_ID, PRODUCT_ID, OUT_DATE, 출고여부 출력, 출고 미정은 OUT_DATE 비워두기
-- 4. 주문 ID 기준 오름차순 정렬

-- 25.02.12
SELECT ORDER_ID
     , PRODUCT_ID
     , DATE_FORMAT(OUT_DATE, '%Y-%m-%d') AS OUT_DATE
     , CASE WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
            WHEN OUT_DATE > '2022-05-01' THEN '출고대기'
            ELSE '출고미정'
            END AS '출고여부'
    FROM FOOD_ORDER
    ORDER BY ORDER_ID












# SELECT ORDER_ID
#      , PRODUCT_ID
#      , DATE_FORMAT(OUT_DATE, '%Y-%m-%d') AS OUT_DATE
#      , CASE WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
#             WHEN OUT_DATE > '2022-05-01' THEN '출고대기'
#             ELSE '출고미정'
#             END AS '출고여부'
#     FROM FOOD_ORDER
#     ORDER BY ORDER_ID





















# SELECT ORDER_ID
#      , PRODUCT_ID
#      , DATE_FORMAT(OUT_DATE, '%Y-%m-%d') AS OUT_DATE
#      , CASE WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
#             WHEN OUT_DATE > '2022-05-01' THEN '출고대기'
#             ELSE '출고미정'
#             END AS 출고여부
#     FROM FOOD_ORDER
#     ORDER BY ORDER_ID