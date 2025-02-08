-- 더 이상 업그레이드할 수 없는 ITEM들의 ID, NAME, RARITY 출력
-- ITEM ID 기준 내림차순 정렬
-- 다른 ITEM의 PARENT가 아닌 ITEM들은 더 이상 업그레이드가 불가능하다.

-- 25.02.08
WITH PARENT_CHILD AS (
    SELECT I1.ITEM_ID PARENT_ITEM
         , I2.ITEM_ID AS CHILD_ITEM
        FROM ITEM_TREE I1
        JOIN ITEM_TREE I2
            ON I1.ITEM_ID = I2.PARENT_ITEM_ID
)
SELECT ITEM_ID
     , ITEM_NAME
     , RARITY
    FROM ITEM_INFO
    WHERE ITEM_ID NOT IN (SELECT PARENT_ITEM FROM PARENT_CHILD)
    ORDER BY ITEM_ID DESC