-- (7월 아이스크림 총 주문량 + 상반기 아이스크림 총 주문량)의 값이 큰 순서대로
-- 상위 3개 맛 조회.
-- "7월에는" 아이스크림 주문량이 많아 같은 아이스크림에 대하여 서로 다른 두 공장에서 아이스크림 가게로 출하를 진행하는 경우가 있습니다. 이 경우 "같은 맛의 아이스크림이라도 다른 출하 번호를 갖게 됩니다."

SELECT FLAVOR
    FROM (
        SELECT * FROM FIRST_HALF
        UNION ALL
        SELECT * FROM JULY) AS BASE
    GROUP BY FLAVOR
    ORDER BY SUM(TOTAL_ORDER) DESC
    LIMIT 3
















# 풀이 1. UNION ALL 사용
# SELECT FLAVOR
#     FROM (
#             SELECT FLAVOR, TOTAL_ORDER FROM FIRST_HALF
#             UNION ALL
#             SELECT FLAVOR, TOTAL_ORDER FROM JULY
#          ) BASE
#     GROUP BY FLAVOR
#     ORDER BY SUM(TOTAL_ORDER) DESC
#     LIMIT 3


# 풀이 2-1. JOIN을 사용한 풀이(1)
# WITH FIRST_HALF_SALES AS (
#     SELECT FLAVOR
#          , SUM(TOTAL_ORDER) AS TOTAL_ORDER
#         FROM FIRST_HALF
#         GROUP BY FLAVOR
# ), JULY_SALES AS (
#     SELECT FLAVOR
#          , SUM(TOTAL_ORDER) AS TOTAL_ORDER
#         FROM JULY
#         GROUP BY FLAVOR
# )

# SELECT J.FLAVOR
#     FROM FIRST_HALF_SALES F
#     LEFT JOIN JULY_SALES J
#         ON F.FLAVOR = J.FLAVOR
#     ORDER BY (F.TOTAL_ORDER + J.TOTAL_ORDER) DESC
#     LIMIT 3


# 풀이 2-2. JOIN을 사용한 풀이(2) => 풀이 2-1의 간소화 버전.
# SELECT F.FLAVOR
#     FROM FIRST_HALF F
#     JOIN JULY J
#         ON F.FLAVOR = J.FLAVOR
#     GROUP BY F.FLAVOR
#     ORDER BY (F.TOTAL_ORDER + SUM(J.TOTAL_ORDER)) DESC
#     LIMIT 3