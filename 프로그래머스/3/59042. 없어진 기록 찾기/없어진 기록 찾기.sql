-- 입양 간 기록은 있으나 보호소 입소 기록이 없는 동물들의 ID와 이름 조회
-- ID순 정렬

SELECT O.ANIMAL_ID
     , O.NAME
    FROM ANIMAL_OUTS O
    LEFT JOIN ANIMAL_INS I
        ON O.ANIMAL_ID = I.ANIMAL_ID
    WHERE I.ANIMAL_ID IS NULL
    ORDER BY O.ANIMAL_ID