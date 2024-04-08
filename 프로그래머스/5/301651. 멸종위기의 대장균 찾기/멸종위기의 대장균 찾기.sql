-- 코드를 작성해주세요
-- 각 세대별 자식 없는 개체 수(COUNT)와 그 세대(GENERATION)를 출력
-- 세대에 대해 오름차순 정렬.
-- 각 세대별 자식 없는 개체가 적어도 1개체는 존재함

-- 부모 없는 세대 -> 1세대
-- 1세대가 부모인 세대 -> 2세대
-- 2세대가 부모인 세대 -> 3세대
-- ...  => 재귀문 사용!

# WITH RECURSIVE GEN AS (
#     SELECT ID, PARENT_ID, 1 AS GENERATION
#         FROM ECOLI_DATA
#         WHERE PARENT_ID IS NULL
#     UNION ALL
#     SELECT E.ID, E.PARENT_ID, G.GENERATION + 1
#         FROM ECOLI_DATA E
#         JOIN GEN G
#             ON E.PARENT_ID = G.ID
# )       

WITH RECURSIVE GEN AS (
    SELECT ID, PARENT_ID, 1 AS GENERATION
        FROM ECOLI_DATA
        WHERE PARENT_ID IS NULL
    UNION ALL
    SELECT E.ID, E.PARENT_ID, G.GENERATION + 1
        FROM ECOLI_DATA E
        JOIN GEN G 
            ON E.PARENT_ID = G.ID
), GEN_NO_CHILDREN AS (
    SELECT G.ID, G.GENERATION
        FROM GEN G
        LEFT JOIN ECOLI_DATA E 
            ON G.ID = E.PARENT_ID
        WHERE E.ID IS NULL
)

SELECT COUNT(ID) AS COUNT
     , GENERATION
    FROM GEN_NO_CHILDREN
    GROUP BY GENERATION
    ORDER BY GENERATION;