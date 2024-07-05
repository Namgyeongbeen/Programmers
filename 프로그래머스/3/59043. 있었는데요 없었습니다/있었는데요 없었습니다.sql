-- 보호소에서 입양을 보내는건데, 보호소 입소일보다 입양일이 더 빠른 동물들이 있다. 찾아라.
-- 동물 ID와 이름 조회. 보호 시작일이 빠른 순으로 조회.


SELECT I.ANIMAL_ID
     , I.NAME
    FROM ANIMAL_OUTS O
    JOIN ANIMAL_INS I
        ON O.ANIMAL_ID = I.ANIMAL_ID
    WHERE I.DATETIME > O.DATETIME
    ORDER BY I.DATETIME