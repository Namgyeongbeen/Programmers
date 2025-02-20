-- 리뷰를 가장 많이 작성한 회원의 이름, 리뷰 내용, 리뷰 작성일 출력.
-- 리뷰 작성일 오름차순, 리뷰 텍스트 오름차순 정렬

-- 1. 사용자별 리뷰 수 구함
-- 2. 가장 많은 리뷰를 쓴 사용자 구함
-- 3. 해당 사용자의 리뷰 출력
-- 25.02.13
WITH REVIEW_RANKS AS (
    SELECT MEMBER_ID
         , DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS REVIEW_RANK
        FROM REST_REVIEW
        GROUP BY MEMBER_ID
)
SELECT P.MEMBER_NAME, R.REVIEW_TEXT
     , DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
    FROM MEMBER_PROFILE P
    JOIN REST_REVIEW R
        ON P.MEMBER_ID = R.MEMBER_ID
    WHERE P.MEMBER_ID IN (SELECT MEMBER_ID
                            FROM REVIEW_RANKS
                            WHERE REVIEW_RANK = 1)
    ORDER BY REVIEW_DATE, REVIEW_TEXT








# WITH REVIEW_RANKS AS (
# SELECT COUNT(*) AS REVIEW_COUNT
#      , DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS REVIEW_COUNT_RANK
#      , MEMBER_ID
#     FROM REST_REVIEW
#     GROUP BY MEMBER_ID )

# SELECT MEMBER_NAME
#      , REVIEW_TEXT
#      , DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
#     FROM MEMBER_PROFILE M
#     LEFT JOIN REVIEW_RANKS R1
#         ON M.MEMBER_ID = R1.MEMBER_ID
#     LEFT JOIN REST_REVIEW R2
#         ON M.MEMBER_ID = R2.MEMBER_ID
#     WHERE R1.REVIEW_COUNT_RANK = 1
#     ORDER BY REVIEW_DATE, REVIEW_TEXT


































# WITH REVIEW_RANKS AS (
#     SELECT COUNT(*) AS REVIEW_COUNT
#          , MEMBER_ID
#          , DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS RANKS
#         FROM REST_REVIEW
#         GROUP BY MEMBER_ID
# )

# SELECT MEMBER_NAME
#      , REVIEW_TEXT
#      , DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d')
#     FROM MEMBER_PROFILE M
#     JOIN REST_REVIEW R1
#         ON M.MEMBER_ID = R1.MEMBER_ID
#     JOIN REVIEW_RANKS R2
#         ON R1.MEMBER_ID = R2.MEMBER_ID
#     WHERE RANKS = 1
#     ORDER BY REVIEW_DATE, REVIEW_TEXT