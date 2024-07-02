-- 코드를 작성해주세요
-- PARENT ITEM ID가 없는 ITEM은 ROOT ITEM
-- PARENT ITEM ID에 ID가 등록되지 않은 ITEM은 더 이상 업그레이드가 안 되는 ITEM
-- 희귀도가 RARE인 아이템들의 다음 업그레이드 아이템의 ID, 이름, 희귀도 출력
-- 즉 "RARITY가 'RARE'인 ITEM들의 ID를 PARENT_ITEM_ID로 갖는" ITEM들의 ID, ITEM_NAME, RARITY를 구해야 함.
SELECT T.ITEM_ID
     , I.ITEM_NAME
     , I.RARITY
    FROM ITEM_TREE T
    LEFT JOIN ITEM_INFO I
        ON T.ITEM_ID = I.ITEM_ID
    WHERE PARENT_ITEM_ID IN (
        SELECT ITEM_ID
            FROM ITEM_INFO
            WHERE RARITY = 'RARE'
        )
    ORDER BY ITEM_ID DESC;