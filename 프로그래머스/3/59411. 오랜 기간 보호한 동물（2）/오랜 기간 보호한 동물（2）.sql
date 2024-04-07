-- 코드를 입력하세요
-- 입양 간 동물 중 보호기간이 가장 길었던 동물 2마리의 아이디와 이름 조회
-- 보호기간 긴 순으로 조회
SELECT I.ANIMAL_ID, I.NAME
    FROM ANIMAL_INS I
    JOIN ANIMAL_OUTS O
        ON I.ANIMAL_ID = O.ANIMAL_ID
    ORDER BY TIMESTAMPDIFF(MINUTE, I.DATETIME, O.DATETIME) DESC
    LIMIT 2