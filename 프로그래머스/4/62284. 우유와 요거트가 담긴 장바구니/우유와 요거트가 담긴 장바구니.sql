-- 코드를 입력하세요       
SELECT DISTINCT CART_ID
    FROM CART_PRODUCTS
    WHERE NAME ='Yogurt'
        AND CART_ID IN (
            SELECT CART_ID
                FROM CART_PRODUCTS
                WHERE NAME = 'MILK')
    ORDER BY CART_ID