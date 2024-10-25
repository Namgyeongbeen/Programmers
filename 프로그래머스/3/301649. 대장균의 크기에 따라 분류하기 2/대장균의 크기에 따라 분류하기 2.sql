-- 코드를 작성해주세요
# SELECT ID
#      , CASE WHEN PERCENT <= 0.25 THEN 'CRITICAL'
#             WHEN PERCENT <= 0.5 THEN 'HIGH'
#             WHEN PERCENT <= 0.75 THEN 'MEDIUM'
#             ELSE 'LOW'
#             END AS COLONY_NAME
#     FROM (
#         SELECT ID
#              , SIZE_OF_COLONY
#              , PERCENT_RANK() OVER(ORDER BY SIZE_OF_COLONY DESC) AS PERCENT
#             FROM ECOLI_DATA
#         ) B
#     ORDER BY ID


SELECT ID
     , CASE WHEN PERCENT <= 0.25 THEN 'CRITICAL'
            WHEN PERCENT <= 0.5 THEN 'HIGH'
            WHEN PERCENT <= 0.75 THEN 'MEDIUM'
            ELSE 'LOW'
            END AS COLONY_NAME
    FROM (
        SELECT ID
             , SIZE_OF_COLONY
             , PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS PERCENT
            FROM ECOLI_DATA
        ) AS B
    ORDER BY ID















#         SELECT ID
#              , SIZE_OF_COLONY
#              , PERCENT_RANK() OVER(ORDER BY SIZE_OF_COLONY DESC) AS PERCENT
#             FROM ECOLI_DATA