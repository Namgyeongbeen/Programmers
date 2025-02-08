-- 평균 길이가 33cm 이상인 물고기들 대상으로
-- 종류별 잡은 수, 최대 길이 출력.
-- 물고기 종류 기준 오름차순 정렬.
-- 10cm 이하는 NULL로 되어 있는데, 10cm로 한다.

-- 25.02.08
SELECT COUNT(FISH_TYPE) AS FISH_COUNT
     , MAX(LENGTH) AS MAX_LENGTH
     , FISH_TYPE
    FROM FISH_INFO
    GROUP BY FISH_TYPE
    HAVING AVG(IFNULL(LENGTH, 10)) >= 33
    ORDER BY FISH_TYPE