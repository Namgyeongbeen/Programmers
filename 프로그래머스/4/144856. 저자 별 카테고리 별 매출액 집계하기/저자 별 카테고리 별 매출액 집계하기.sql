-- 2022년 1월 기준 저자 별 카테고리 별 매출액을 구한다.
-- 저자 ID, 저자 이름, 카테고리, 매출액 출력.
-- 저자 ID 기준 오름차순, 카테고리 기준 내림차순 정렬

SELECT A.AUTHOR_ID
     , A.AUTHOR_NAME
     , B1.CATEGORY
     , SUM(PRICE * SALES) AS TOTAL_SALES
    FROM BOOK B1
    LEFT JOIN AUTHOR A
        ON B1.AUTHOR_ID = A.AUTHOR_ID
    LEFT JOIN BOOK_SALES B2
        ON B1.BOOK_ID = B2.BOOK_ID
    WHERE YEAR(B2.SALES_DATE) = 2022 AND MONTH(B2.SALES_DATE) = 1
    GROUP BY A.AUTHOR_ID, B1.CATEGORY
    ORDER BY A.AUTHOR_ID, B1.CATEGORY DESC


























# SELECT B.AUTHOR_ID
#      , A.AUTHOR_NAME
#      , B.CATEGORY
#      , SUM(B.PRICE * BS.SALES) AS TOTAL_SALES
#     FROM BOOK B
#     LEFT JOIN AUTHOR A
#         ON B.AUTHOR_ID = A.AUTHOR_ID
#     LEFT JOIN BOOK_SALES BS
#         ON B.BOOK_ID = BS.BOOK_ID
#     WHERE BS.SALES_DATE BETWEEN '2022-01-01' AND '2022-01-31'
#     GROUP BY B.AUTHOR_ID, B.CATEGORY
#     ORDER BY B.AUTHOR_ID, CATEGORY DESC