-- 완료된 중고거래 총 금액이 70만원 이상인 회원ID, 닉네임, 총 거래금액 조회
-- 총 거래금액 오름차순 정렬

SELECT USER_ID
     , NICKNAME
     , SUM(PRICE) AS TOTAL_SALES
    FROM USED_GOODS_BOARD B
    JOIN USED_GOODS_USER U
        ON B.WRITER_ID = U.USER_ID
    WHERE STATUS = 'DONE'
    GROUP BY B.WRITER_ID
    HAVING TOTAL_SALES >= 700000
    ORDER BY TOTAL_SALES