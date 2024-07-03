-- 종류별 가장 큰 물고기의 ID, 이름, 길이 출력
-- 종류별 가장 큰 물고기는 1마리 뿐이며, 10cm 이하가 가장 큰 경우는 없음.
-- 물고기 ID 오름차순 정렬

SELECT ID, FISH_NAME, LENGTH
    FROM FISH_NAME_INFO NI
    LEFT JOIN FISH_INFO I
        ON NI.FISH_TYPE = I.FISH_TYPE
    WHERE (FISH_NAME, LENGTH) IN (
        
        SELECT FISH_NAME, MAX(LENGTH)
            FROM FISH_NAME_INFO NI
            LEFT JOIN FISH_INFO I
                ON NI.FISH_TYPE = I.FISH_TYPE
            GROUP BY FISH_NAME, I.FISH_TYPE
        
    )
    ORDER BY ID