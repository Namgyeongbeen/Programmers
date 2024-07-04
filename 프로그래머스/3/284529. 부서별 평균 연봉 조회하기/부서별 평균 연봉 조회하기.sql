-- 부서별 ID, 영문명, 평균연봉 조회
-- 평균연봉은 소수점 첫째자리에서 반올림, 컬럼명은 AVG_SAL
-- 부서별 평균연봉 기준 내림차순 정렬

SELECT E.DEPT_ID
     , D.DEPT_NAME_EN
     , ROUND(AVG(SAL), 0) AS AVG_SAL
    FROM HR_EMPLOYEES E
    LEFT JOIN HR_DEPARTMENT D
        ON E.DEPT_ID = D.DEPT_ID
    GROUP BY E.DEPT_ID
    ORDER BY AVG_SAL DESC