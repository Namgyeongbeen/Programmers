-- 코드를 입력하세요
-- 파일경로 : /home/grep/src/BOARD_ID
-- 파일 이름 : 파일ID, 파일이름, 파일확장자로 구성됨
-- 조회수가 가장 높은 게시물은 유일함.

SELECT CONCAT('/home/grep/src/', BOARD_ID, '/', FILE_ID, FILE_NAME, FILE_EXT) AS FILE_PATH
    FROM USED_GOODS_FILE
    WHERE BOARD_ID = (
        SELECT BOARD_ID 
            FROM USED_GOODS_BOARD 
            ORDER BY VIEWS DESC
            LIMIT 1
        )
    ORDER BY FILE_ID DESC