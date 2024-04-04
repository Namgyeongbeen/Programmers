-- 코드를 입력하세요
-- 게시물을 3건 이상 등록한 사용자의
-- ID, 닉네임, 주소, 전화번호 출력
-- 주소는 띄어쓰기로 구분된 전체 주소, 전화번호는 하이픈으로 구분된 전체 전화번호
-- ID 기준 내림차순

# 풀이 1. JOIN 없음, 서브쿼리, INSERT 사용
SELECT USER_ID
     , NICKNAME
     , CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS '전체주소'
     , INSERT(INSERT(TLNO, 8, 0, '-'), 4, 0, '-') AS '전화번호'
    FROM USED_GOODS_USER
    WHERE USER_ID IN (
        SELECT WRITER_ID
            FROM USED_GOODS_BOARD
            GROUP BY WRITER_ID
            HAVING COUNT(BOARD_ID) >= 3
        )
    ORDER BY USER_ID DESC