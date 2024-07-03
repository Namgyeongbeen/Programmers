-- 사번, 성명, 평가등급, 성과금 조회.
-- 평가등급은 GRADE, 성과금은 BONUS
-- 문제에 상/하반기 관련 조건이 없는데, 상하반기 점수의 평균으로 하자.
-- 썩 좋은 문제는 아닌 듯. 조건이 명확하지 않아 푸는 사람들이 추측하게 하는 문제다.
    
SELECT E.EMP_NO
     , E.EMP_NAME
     , CASE WHEN G.SCORE < 80 THEN 'C'
            WHEN G.SCORE >= 80 AND G.SCORE < 90 THEN 'B'
            WHEN G.SCORE >= 90 AND G.SCORE < 96 THEN 'A'
            ELSE 'S'
            END AS GRADE
     , CASE WHEN G.SCORE < 80 THEN 0
            WHEN G.SCORE >= 80 AND G.SCORE < 90 THEN E.SAL * 0.1
            WHEN G.SCORE >= 90 AND G.SCORE < 96 THEN E.SAL * 0.15
            ELSE E.SAL * 0.2
            END AS BONUS
    FROM (
        SELECT EMP_NO, AVG(SCORE) AS SCORE
            FROM HR_GRADE
            GROUP BY EMP_NO
    ) AS G
    LEFT JOIN HR_EMPLOYEES E
        ON G.EMP_NO = E.EMP_NO