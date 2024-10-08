-- 음식 종류별 즐겨찾기가 가장 많은 식당의 음식 종류, ID, 이름, 즐겨찾기 수 조회
-- 음식 종류 기준 내림차순 정렬

SELECT FOOD_TYPE
     , REST_ID
     , REST_NAME
     , FAVORITES
    FROM REST_INFO
    WHERE (FOOD_TYPE, FAVORITES) IN (
        SELECT FOOD_TYPE
             , MAX(FAVORITES)
            FROM REST_INFO
            GROUP BY FOOD_TYPE
    )
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