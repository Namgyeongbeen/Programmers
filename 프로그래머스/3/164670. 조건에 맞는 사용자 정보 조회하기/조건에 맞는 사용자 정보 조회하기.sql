-- 코드를 입력하세요
-- 게시물을 3건 이상 등록한 사용자의
-- ID, 닉네임, 주소, 전화번호 출력
-- 주소는 띄어쓰기로 구분된 전체 주소, 전화번호는 하이픈으로 구분된 전체 전화번호
-- ID 기준 내림차순

# INSERT(original_string, position, length, new_string)
# original_string은 원본 문자열.
# position은 new_string이 삽입된 후의 위치.
# length는 original_string에서 new_string 삽입 시 제거될 문자 개수.
# new_string은 삽입될 문자열.

-- 25.02.12
-- 1. 게시물 3건 이상 사용한 등록자 찾기
-- 2. 그 사용자의 NICKNAME, 주소, 전화번호 출력

WITH USERS_THREE_TITLE AS (
    SELECT *
        FROM USED_GOODS_BOARD
        GROUP BY WRITER_ID
        HAVING COUNT(BOARD_ID) >= 3
)
SELECT USER_ID
     , NICKNAME
     , CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS "전체주소"
     , INSERT(INSERT(TLNO, 4, 0, '-'), 9, 0, '-') AS "전화번호"
    FROM USED_GOODS_USER
    WHERE USER_ID IN (SELECT WRITER_ID FROM USERS_THREE_TITLE)
    ORDER BY USER_ID DESC







# # 풀이 1. JOIN 없음, 서브쿼리 / INSERT 사용
# SELECT USER_ID
#      , NICKNAME
#      , CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS '전체주소'
#      , INSERT(INSERT(TLNO, 8, 0, '-'), 4, 0, '-') AS '전화번호'
#     FROM USED_GOODS_USER
#     WHERE USER_ID IN (
#         SELECT WRITER_ID
#             FROM USED_GOODS_BOARD
#             GROUP BY WRITER_ID
#             HAVING COUNT(BOARD_ID) >= 3
#         )
#     ORDER BY USER_ID DESC

# # 풀이 2. JOIN 없음, 서브쿼리 / REGEXP_REPLACE 사용 
# SELECT USER_ID
#      , NICKNAME
#      , CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS '전체주소'
#      , REGEXP_REPLACE(TLNO, '(.{3})(.{4})(.{4})', '$1-$2-$3') AS '전화번호'
#     FROM USED_GOODS_USER
#     WHERE USER_ID IN (
#         SELECT WRITER_ID
#             FROM USED_GOODS_BOARD
#             GROUP BY WRITER_ID
#             HAVING COUNT(BOARD_ID) >= 3
#         )
#     ORDER BY USER_ID DESC