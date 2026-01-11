IDENTIFICATION DIVISION.
PROGRAM-ID. school.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 STUDENT-RECORD.
   05 STU-NAME         PIC X(20).
   05 STU-ID           PIC 9(06).

   05 STU-BIRTH.   *>Group 子群組
      10 BIRTH-YYYY    PIC 9(04).
      10 BIRTH-MM      PIC 9(02).
      10 BIRTH-DD      PIC 9(02).

PROCEDURE DIVISION.
    DISPLAY "請輸入學生姓名 (20字元內)".
    ACCEPT STU-NAME.

    DISPLAY "請輸入學號 (6位數字)".
    ACCEPT STU-ID.

    DISPLAY "請輸入出生年 (西元【四位數字】)".
    ACCEPT BIRTH-YYYY.

    DISPLAY "請輸入出生月 (2位數字)".
    ACCEPT BIRTH-MM.

    DISPLAY "請輸入出生日 (2位數字)".
    ACCEPT BIRTH-DD.

    DISPLAY "*********************************".
    DISPLAY "學生資料建立完成".
    DISPLAY "姓名: " STU-NAME.
    DISPLAY "學號: " STU-ID.
    DISPLAY "生日: " BIRTH-YYYY "-" BIRTH-MM "-" BIRTH-DD.
    DISPLAY "*********************************".

    STOP RUN.

END PROGRAM school.