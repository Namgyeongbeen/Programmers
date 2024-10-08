-- 코드를 입력하세요
SELECT *
    FROM ( 
        SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE
             , PRODUCT_ID
             , USER_ID
             , SALES_AMOUNT 
            FROM ONLINE_SALE
        UNION ALL
        SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE
             , PRODUCT_ID
             , NULL AS USER_ID
             , SALES_AMOUNT
            FROM OFFLINE_SALE
    ) AS BASE
    WHERE SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
    ORDER BY SALES_DATE, PRODUCT_ID, USER_ID






















# SELECT *
#     FROM 
#     (
#         SELECT DATE_FORMAT(O1.SALES_DATE, '%Y-%m-%d') AS SALES_DATE
#              , O1.PRODUCT_ID, O1.USER_ID, O1.SALES_AMOUNT
#             FROM ONLINE_SALE O1
#         UNION ALL
#         SELECT DATE_FORMAT(O2.SALES_DATE, '%Y-%m-%d') AS SALES_DATE
#              , O2.PRODUCT_ID, NULL AS USER_ID, O2.SALES_AMOUNT
#             FROM OFFLINE_SALE O2
#         ) B
#     WHERE B.SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
#     ORDER BY B.SALES_DATE, B.PRODUCT_ID, B.USER_ID