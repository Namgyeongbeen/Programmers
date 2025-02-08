-- 종류별 가장 큰 물고기의 ID, 이름, 길이 출력
-- 종류별 가장 큰 물고기는 1마리 뿐이며, 10cm 이하가 가장 큰 경우는 없음.
-- 물고기 ID 오름차순 정렬

-- 25.02.08

WITH LONGEST_FISH AS (
    SELECT FISH_TYPE
         , MAX(LENGTH) AS MAX_LENGTH
        FROM FISH_INFO
        GROUP BY FISH_TYPE
)

SELECT FI.ID
     , FNI.FISH_NAME
     , FI.LENGTH
    FROM FISH_NAME_INFO FNI
    LEFT JOIN FISH_INFO FI
        ON FNI.FISH_TYPE = FI.FISH_TYPE
    WHERE (FI.FISH_TYPE, FI.LENGTH) IN (SELECT * FROM LONGEST_FISH)
    