-- 공간을 2군데 이상 등록한 사람 : 헤비유저
-- 헤비유저가 등록한 공간의 정보를 ID순으로 조회.

-- 25.02.12
WITH HEAVY_USERS AS (
    SELECT HOST_ID
        FROM PLACES
        GROUP BY HOST_ID
        HAVING COUNT(HOST_ID) >= 2
)
SELECT ID
     , NAME
     , HOST_ID
    FROM PLACES
    WHERE HOST_ID IN (SELECT * FROM HEAVY_USERS)
    ORDER BY ID











# SELECT ID
#      , NAME
#      , HOST_ID
#     FROM PLACES
#     WHERE HOST_ID IN (
#         SELECT HOST_ID
#             FROM PLACES
#             GROUP BY HOST_ID
#             HAVING COUNT(ID) >= 2
#     )
#     ORDER BY ID


# SELECT ID
#      , NAME
#      , HOST_ID
#     FROM PLACES
#     WHERE HOST_ID IN (
#         SELECT HOST_ID
#             FROM PLACES
#             GROUP BY HOST_ID
#             HAVING COUNT(ID) >= 2
#     )
#     ORDER BY ID