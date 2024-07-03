-- 코드를 작성해주세요
-- 3세대 대장균 ID 출력
-- 대장균 ID로 오름차순 정렬

# SELECT D1.ID, D1.PARENT_ID
#      , D2.ID, D2.PARENT_ID
#      , D3.ID, D3.PARENT_ID
#     FROM ECOLI_DATA D1
#     LEFT JOIN ECOLI_DATA D2
#         ON D1.PARENT_ID = D2.ID
#     LEFT JOIN ECOLI_DATA D3
#         ON D2.PARENT_ID = D3.ID
#     LEFT JOIN ECOLI_DATA D4
#         ON D3.PARENT_ID = D4.ID
#     WHERE D3.PARENT_ID IS NULL AND D3.ID IS NOT NULL
#     ORDER BY D1.ID

# 위의 쿼리는 JOIN이 많아서 대용량 데이터 처리 할 때엔 성능이 안좋을 수 있음.
# 재귀쿼리 쓰는게 더 좋음.

WITH RECURSIVE GEN AS(
    SELECT ID, PARENT_ID, 1 AS GENERATION
        FROM ECOLI_DATA
        WHERE PARENT_ID IS NULL     # PARENT_ID가 1인 세대를 1세대로 지정
    
    UNION ALL
    
    SELECT E.ID, E.PARENT_ID, G.GENERATION + 1  # 재귀문
        FROM ECOLI_DATA E
        JOIN GEN G
            ON E.PARENT_ID = G.ID
)

SELECT ID
    FROM GEN
    WHERE GENERATION = 3