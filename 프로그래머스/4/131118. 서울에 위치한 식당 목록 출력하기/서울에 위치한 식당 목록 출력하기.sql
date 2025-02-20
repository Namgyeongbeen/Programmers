-- 서울에 위치한 식당들의 식당 ID, 식당 이름, 음식 종류, 즐겨찾기수, 주소, 리뷰 평균 점수를 조회
-- 리뷰 평균점수는 소수점 세 번째 자리에서 반올림, 결과는 평균점수를 기준으로 내림차순 정렬, 평균점수가 같다면 즐겨찾기수를 기준으로 내림차순 정렬

-- 25.02.13
WITH AVG_SCORE AS (
    SELECT REST_ID
         , ROUND(AVG(REVIEW_SCORE), 2) AS SCORE
        FROM REST_REVIEW
        GROUP BY REST_ID
)
SELECT I.REST_ID, I.REST_NAME, I.FOOD_TYPE
     , I.FAVORITES, I.ADDRESS, S.SCORE
    FROM REST_INFO I
    JOIN AVG_SCORE S
        ON I.REST_ID = S.REST_ID
    WHERE ADDRESS LIKE '서울%'
    ORDER BY SCORE DESC, FAVORITES DESC










# SELECT R1.REST_ID
#      , R1.REST_NAME
#      , R1.FOOD_TYPE
#      , R1.FAVORITES
#      , R1.ADDRESS
#      , ROUND(AVG(R2.REVIEW_SCORE), 2) AS SCORE
#     FROM REST_INFO R1
#     JOIN REST_REVIEW R2
#         ON R1.REST_ID = R2.REST_ID
#     WHERE ADDRESS LIKE '서울%'
#     GROUP BY R2.REST_ID
#     ORDER BY SCORE DESC, R1.FAVORITES DESC

# SELECT I.REST_ID, I.REST_NAME
#      , I.FOOD_TYPE, I.FAVORITES, I.ADDRESS
#      , ROUND(AVG(R.REVIEW_SCORE), 2) AS SCORE
#     FROM REST_INFO I
#     JOIN REST_REVIEW R
#         ON I.REST_ID = R.REST_ID
#     WHERE I.ADDRESS LIKE '서울%'
#     GROUP BY I.REST_ID
#     ORDER BY SCORE DESC, I.FAVORITES DESC