-- 보호소에선 암컷/수컷(Intact)이었으나 나갈땐 아니게 된(Spayed, Neutered) 동물들의 ID, 종, 이름 조회
-- ID순으로 정렬

SELECT A2.ANIMAL_ID
     , A2.ANIMAL_TYPE
     , A2.NAME
    FROM ANIMAL_INS A1
    LEFT JOIN ANIMAL_OUTS A2
        ON A1.ANIMAL_ID = A2.ANIMAL_ID
    WHERE A1.SEX_UPON_INTAKE != A2.SEX_UPON_OUTCOME
    ORDER BY ANIMAL_ID























# SELECT I.ANIMAL_ID
#      , I.ANIMAL_TYPE
#      , I.NAME
#     FROM ANIMAL_INS I
#     LEFT JOIN ANIMAL_OUTS O
#         ON I.ANIMAL_ID = O.ANIMAL_ID
#     WHERE I.SEX_UPON_INTAKE != O.SEX_UPON_OUTCOME