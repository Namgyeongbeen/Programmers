-- 2022년 4월 13일, "취소되지 않은" 흉부외과(CS) 진료 예약 내역 조회
-- APNT_NO, PT_NAME, PT_NO, MCDP_CD, DR_NAME, APNT_YMD
-- 진료예약일시를 기준으로 오름차순 정렬

-- 25.02.13
SELECT A.APNT_NO
     , P.PT_NAME
     , A.PT_NO
     , A.MCDP_CD
     , D.DR_NAME
     , A.APNT_YMD
    FROM APPOINTMENT A
    JOIN PATIENT P
        ON A.PT_NO = P.PT_NO
    JOIN DOCTOR D
        ON A.MDDR_ID = D.DR_ID
    WHERE DATE_FORMAT(A.APNT_YMD, '%Y-%m-%d') = '2022-04-13'
        AND A.APNT_CNCL_YN = 'N'
        AND A.MCDP_CD = 'CS'
    ORDER BY A.APNT_YMD












# SELECT A.APNT_NO
#      , P.PT_NAME
#      , A.PT_NO
#      , D.MCDP_CD
#      , D.DR_NAME
#      , A.APNT_YMD
#     FROM APPOINTMENT A
#     LEFT JOIN PATIENT P
#         ON A.PT_NO = P.PT_NO
#     LEFT JOIN DOCTOR D
#         ON A.MDDR_ID = D.DR_ID
#     WHERE A.APNT_CNCL_YN = 'N'
#         AND A.APNT_YMD BETWEEN '2022-04-13 00:00:00' AND '2022-04-13 23:59:59'
#         AND A.MCDP_CD = 'CS'
#     ORDER BY APNT_YMD


# SELECT A.APNT_NO
#      , P.PT_NAME
#      , A.PT_NO
#      , A.MCDP_CD
#      , D.DR_NAME
#      , A.APNT_YMD
#     FROM APPOINTMENT A
#     LEFT JOIN PATIENT P
#         ON A.PT_NO = P.PT_NO
#     LEFT JOIN DOCTOR D
#         ON A.MDDR_ID = D.DR_ID
#     WHERE A.APNT_YMD BETWEEN '2022-04-13 00:00:00' AND '2022-04-13 23:59:59'
#         AND A.APNT_CNCL_YN = 'N'
#         AND A.MCDP_CD = 'CS'
#     ORDER BY A.APNT_YMD