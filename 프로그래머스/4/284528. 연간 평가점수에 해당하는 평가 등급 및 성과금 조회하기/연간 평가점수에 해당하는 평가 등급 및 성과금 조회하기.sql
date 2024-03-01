# -- 문제에 상/하반기 관련 조건이 없는데, 상하반기 점수의 평균으로 하자.
# -- 썩 좋은 문제는 아닌 듯. 조건이 명확하지 않아 푸는 사람들이 추측하게 하는 문제다.

SELECT S.EMP_NO
     , E.EMP_NAME
     , CASE WHEN S.SCORE >= 96 THEN 'S'
            WHEN S.SCORE >= 90 THEN 'A'
            WHEN S.SCORE >= 80 THEN 'B'
            ELSE 'C'
            END AS GRADE
     , CASE WHEN S.SCORE >= 96 THEN E.SAL*0.2
            WHEN S.SCORE >= 90 THEN E.SAL*0.15
            WHEN S.SCORE >= 80 THEN E.SAL*0.1
            ELSE 0
            END AS BONUS
    FROM (
        SELECT EMP_NO
             , AVG(SCORE) AS SCORE
            FROM HR_GRADE
            GROUP BY EMP_NO
         ) AS S
    LEFT JOIN HR_EMPLOYEES E
        ON S.EMP_NO = E.EMP_NO