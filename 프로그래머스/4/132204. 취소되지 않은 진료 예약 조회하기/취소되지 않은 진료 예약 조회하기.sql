-- 코드를 입력하세요
-- 2022년 4월 13일, 취소되지 않은 흉부외과(CS) 진료 예약 내역 조회
-- APNT_NO, PT_NAME, PT_NO, MCDP_CD, DR_NAME, APNT_YMD
-- 진료예약일시를 기준으로 오름차순 정렬

SELECT A.APNT_NO
     , P.PT_NAME
     , P.PT_NO
     , A.MCDP_CD
     , D.DR_NAME
     , A.APNT_YMD
    FROM PATIENT P
    LEFT JOIN APPOINTMENT A
        ON P.PT_NO = A.PT_NO
    LEFT JOIN DOCTOR D
        ON A.MDDR_ID = D.DR_ID
    WHERE A.MCDP_CD = 'CS'
        AND A.APNT_YMD LIKE '2022-04-13%'
        AND APNT_CNCL_YN = 'N'
    ORDER BY APNT_YMD