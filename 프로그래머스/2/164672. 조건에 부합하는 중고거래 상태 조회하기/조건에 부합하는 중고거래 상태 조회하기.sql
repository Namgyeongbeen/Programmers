-- 코드를 입력하세요    
# SELECT BOARD_ID
#      , WRITER_ID
#      , TITLE
#      , PRICE
#      , CASE WHEN STATUS = "SALE" then "판매중"
#             WHEN STATUS = "DONE" then "거래완료"
#             WHEN STATUS = "RESERVED" then "예약중"
#             END AS STATUS
#     FROM USED_GOODS_BOARD
#     WHERE CREATED_DATE = "2022-10-05"
#     ORDER BY BOARD_ID desc

# SELECT BOARD_ID
#      , WRITER_ID
#      , TITLE
#      , PRICE
#      , CASE WHEN STATUS = 'SALE' THEN ' 판매중'
#             WHEN STATUS = 'DONE' THEN '거래완료'
#             WHEN STATUS = 'RESERVED' THEN '예약중'
#             END AS STATUS
#     FROM USED_GOODS_BOARD
#     WHERE CREATED_DATE = '2022-10-05'
#     ORDER BY BOARD_ID DESC
SELECT      BOARD_ID
        ,   WRITER_ID
        ,   TITLE
        ,   PRICE
        ,   CASE    STATUS
                WHEN 'SALE'     THEN '판매중'
                WHEN 'RESERVED' THEN '예약중'
                WHEN 'DONE'     THEN '거래완료'
                ELSE 'NONE'
            END AS  STATUS
FROM        USED_GOODS_BOARD
WHERE       CREATED_DATE = '2022-10-05'
ORDER BY    1 DESC;