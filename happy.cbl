IDENTIFICATION DIVISION.
PROGRAM-ID. happy.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 USER-NAME        PIC X(20).
01 DATA-DISPLAY.
   05 DATA-1        PIC 9.
   05 DATA-2        PIC 9.
   05 DATA-3        PIC 9.
   05 DATA-4        PIC 9.
   05 DATA-5        PIC 9.
01 CHAR-1           PIC X.
01 INT-1            PIC 9.
01 TEST-DATE.
   05 TEST-YYYY     PIC 9(4).
   05 TEST-MM       PIC 9(2).
   05 TEST-DD       PIC 9(2).

PROCEDURE DIVISION.
    DISPLAY "請輸入你的名字".
    ACCEPT USER-NAME.
    DISPLAY "很高興見到你！" USER-NAME.
    DISPLAY "*********************************".

    DISPLAY "請輸入5位數字".
    ACCEPT DATA-DISPLAY.
    DISPLAY "DATA-DISPLAY =" DATA-DISPLAY.
    DISPLAY "DATA-1" DATA-1.
    DISPLAY "DATA-2" DATA-2.
    DISPLAY "DATA-3" DATA-3.
    DISPLAY "DATA-4" DATA-4.
    DISPLAY "DATA-5" DATA-5.
    DISPLAY "*******************************".

    DISPLAY "請輸入1個字元".
    ACCEPT CHAR-1.
    DISPLAY "請輸入1個數字".
    ACCEPT INT-1.
    ACCEPT TEST-DATE FROM DATE YYYYMMDD.
    DISPLAY "日期:" TEST-DATE.
    
    STOP RUN.

END PROGRAM happy.