IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST4-NO-ARRAY.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-INPUT-CARD     PIC X(16).

       01  WS-VARS.
           05 WS-IDX         PIC 9(2).
           05 WS-CURRENT-NUM PIC 9.
           05 WS-WEIGHT      PIC 9.
           05 WS-PRODUCT     PIC 9(2).
           05 WS-P-TENS      PIC 9.
           05 WS-P-UNITS     PIC 9.
           05 WS-SUM         PIC 9(3).
           05 WS-REM         PIC 9.
           
           05 WS-CALC-CHECK  PIC 9.
           05 WS-REAL-CHECK  PIC 9.

       PROCEDURE DIVISION.
           DISPLAY "=== 信用卡號驗證 ===".
           DISPLAY "請輸入 16 位卡號: ".
           ACCEPT WS-INPUT-CARD.

           MOVE 0 TO WS-SUM.


           PERFORM VARYING WS-IDX FROM 1 BY 1 UNTIL WS-IDX > 15
              
              MOVE WS-INPUT-CARD(WS-IDX:1) TO WS-CURRENT-NUM

              IF FUNCTION MOD(WS-IDX, 2) = 1 THEN
                 MOVE 2 TO WS-WEIGHT
              ELSE
                 MOVE 1 TO WS-WEIGHT
              END-IF

              COMPUTE WS-PRODUCT = WS-CURRENT-NUM * WS-WEIGHT

              IF WS-PRODUCT > 9 THEN
                 DIVIDE WS-PRODUCT BY 10 GIVING WS-P-TENS 
                                         REMAINDER WS-P-UNITS
                 COMPUTE WS-PRODUCT = WS-P-TENS + WS-P-UNITS
              END-IF

              ADD WS-PRODUCT TO WS-SUM

           END-PERFORM.


           DIVIDE WS-SUM BY 10 GIVING WS-P-TENS REMAINDER WS-REM.

           IF WS-REM = 0 THEN
              MOVE 0 TO WS-CALC-CHECK
           ELSE
              COMPUTE WS-CALC-CHECK = 10 - WS-REM
           END-IF.

           MOVE WS-INPUT-CARD(16:1) TO WS-REAL-CHECK.

           DISPLAY "----------------------------".
           DISPLAY "計算檢查碼: " WS-CALC-CHECK.
           DISPLAY "實際檢查碼: " WS-REAL-CHECK.

           IF WS-CALC-CHECK = WS-REAL-CHECK THEN
              DISPLAY ">>> 驗證成功 <<<"
           ELSE
              DISPLAY ">>> 驗證失敗 <<<"
           END-IF.

           STOP RUN.
