-- 입양 못 간 동물들 중 가장 오래 보호소에 있던 동물 3마리의 이름과 보호 시작일 조회
-- 보호 시작일 순으로 정렬

-- 입양을 못 갔다 -> ANIMAL_INS에는 있는데 ANIMAL_OUTS에는 없다
-- 25.02.12
SELECT I.NAME
     , I.DATETIME
    FROM ANIMAL_INS I
    LEFT JOIN ANIMAL_OUTS O
        ON I.ANIMAL_ID = O.ANIMAL_ID
    WHERE O.ANIMAL_ID IS NULL
    ORDER BY I.DATETIME
    LIMIT 3











# SELECT I.NAME
#      , I.DATETIME
#     FROM ANIMAL_INS I
#     LEFT JOIN ANIMAL_OUTS O
#         ON I.ANIMAL_ID = O.ANIMAL_ID
#     WHERE O.ANIMAL_ID IS NULL
#     ORDER BY I.DATETIME
#     LIMIT 3