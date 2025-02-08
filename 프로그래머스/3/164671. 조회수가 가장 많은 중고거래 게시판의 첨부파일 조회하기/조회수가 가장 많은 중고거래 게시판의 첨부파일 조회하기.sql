-- 조회수가 가장 높은 중고거래 게시물에 대한 첨부파일 경로 출력, FILE ID 기준 내림차순
-- 파일경로 : /home/grep/src/BOARD_ID
-- 파일 이름 : 파일ID, 파일이름, 파일확장자로 구성됨
-- 조회수가 가장 높은 게시물은 유일함.

-- 25.02.08
SELECT CONCAT('/home/grep/src/', B.BOARD_ID, '/', F.FILE_ID, F.FILE_NAME, F.FILE_EXT) AS FILE_PATH
    FROM USED_GOODS_BOARD B
    LEFT JOIN USED_GOODS_FILE F
        ON B.BOARD_ID = F.BOARD_ID
    WHERE VIEWS = (SELECT MAX(VIEWS) FROM USED_GOODS_BOARD)
    ORDER BY FILE_ID DESC