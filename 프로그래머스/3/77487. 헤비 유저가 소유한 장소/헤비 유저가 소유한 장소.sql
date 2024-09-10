-- 공간을 둘 이상 등록한 사람 : 헤비유저
-- 헤비유저가 등록한 공간의 정보를 ID순으로 조회.

SELECT ID
     , NAME
     , HOST_ID
    FROM PLACES
    WHERE HOST_ID IN (
        SELECT HOST_ID
            FROM PLACES
            GROUP BY HOST_ID
            HAVING COUNT(ID) >= 2
    )
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