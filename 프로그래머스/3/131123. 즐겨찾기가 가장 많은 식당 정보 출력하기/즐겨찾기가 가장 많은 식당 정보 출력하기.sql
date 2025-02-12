-- 음식 종류별 즐겨찾기가 가장 많은 식당의 FOOD_TYPE, REST_ID, REST_NAME, FAVORITES 조회
-- 음식 종류 기준 내림차순 정렬

-- 25.02.12
WITH FAVORITES_RANK AS (
    SELECT *
         , DENSE_RANK() OVER(PARTITION BY FOOD_TYPE ORDER BY FAVORITES DESC) AS RANKS
        FROM REST_INFO
)

SELECT FOOD_TYPE
     , REST_ID
     , REST_NAME
     , FAVORITES
    FROM FAVORITES_RANK
    WHERE RANKS = 1
    ORDER BY FOOD_TYPE DESC











# SELECT FOOD_TYPE
#      , REST_ID
#      , REST_NAME
#      , FAVORITES
#     FROM REST_INFO
#     WHERE (FOOD_TYPE, FAVORITES) IN (
#         SELECT FOOD_TYPE
#              , MAX(FAVORITES)
#             FROM REST_INFO
#             GROUP BY FOOD_TYPE
#     )
#     ORDER BY FOOD_TYPE DESC
    




















# SELECT FOOD_TYPE
#      , REST_ID
#      , REST_NAME
#      , FAVORITES
#     FROM REST_INFO
#     WHERE (FOOD_TYPE, FAVORITES) IN (
#         SELECT FOOD_TYPE
#              , MAX(FAVORITES)
#             FROM REST_INFO
#             GROUP BY FOOD_TYPE
#     )
#     ORDER BY FOOD_TYPE DESC