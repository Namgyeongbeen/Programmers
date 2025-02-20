-- 우유와 요거트를 동시에 구입한 장바구니의 ID 조회
-- ID순 정렬

-- 25.02.13
SELECT CART_ID
    FROM CART_PRODUCTS
    WHERE NAME IN ('YOGURT', 'MILK')
    GROUP BY CART_ID
    HAVING COUNT(DISTINCT NAME) >= 2
    ORDER BY CART_ID
