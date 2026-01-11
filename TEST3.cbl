       IDENTIFICATION DIVISION.

       PROGRAM-ID. TEST3 .

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-ID-CARD.
           05 WS-LETTER      PIC X(1).
           05 WS-NUM-PART    PIC 9(9).
           05 WS-D1 REDEFINES WS-NUM-PART PIC 9.
           05 WS-D2 REDEFINES WS-NUM-PART PIC 9.
   
           05 WS-DIGITS.
              10 D1 PIC 9.
              10 D2 PIC 9.
              10 D3 PIC 9.
              10 D4 PIC 9.
              10 D5 PIC 9.
              10 D6 PIC 9.
              10 D7 PIC 9.
              10 D8 PIC 9.
              10 D9 PIC 9.

       01  WS-CALC-VARS.
           05 WS-LETTER-NUM  PIC 9(2).
           05 WS-L1          PIC 9.
           05 WS-L2          PIC 9.
           05 WS-SUM         PIC 9(4).
           05 WS-TEMP        PIC 9(4).
           05 WS-REM         PIC 9(2).
           05 WS-CHECK-CODE  PIC 9(1).

       PROCEDURE DIVISION.
           DISPLAY "=== 身分證字號驗證程式 ===".
           DISPLAY "請輸入身分證字號 (例如 A123456789): ".
           ACCEPT WS-ID-CARD.
           
   
           MOVE WS-ID-CARD(2:1) TO D1.
           MOVE WS-ID-CARD(3:1) TO D2.
           MOVE WS-ID-CARD(4:1) TO D3.
           MOVE WS-ID-CARD(5:1) TO D4.
           MOVE WS-ID-CARD(6:1) TO D5.
           MOVE WS-ID-CARD(7:1) TO D6.
           MOVE WS-ID-CARD(8:1) TO D7.
           MOVE WS-ID-CARD(9:1) TO D8.
           MOVE WS-ID-CARD(10:1) TO D9.

      
           EVALUATE WS-LETTER
              WHEN 'A' MOVE 10 TO WS-LETTER-NUM
              WHEN 'B' MOVE 11 TO WS-LETTER-NUM
              WHEN 'C' MOVE 12 TO WS-LETTER-NUM
              WHEN 'D' MOVE 13 TO WS-LETTER-NUM
              WHEN 'E' MOVE 14 TO WS-LETTER-NUM
              WHEN 'F' MOVE 15 TO WS-LETTER-NUM
              WHEN 'G' MOVE 16 TO WS-LETTER-NUM
              WHEN 'H' MOVE 17 TO WS-LETTER-NUM
              WHEN 'I' MOVE 34 TO WS-LETTER-NUM
              WHEN 'J' MOVE 18 TO WS-LETTER-NUM
              WHEN 'K' MOVE 19 TO WS-LETTER-NUM
              WHEN 'L' MOVE 20 TO WS-LETTER-NUM
              WHEN 'M' MOVE 21 TO WS-LETTER-NUM
              WHEN 'N' MOVE 22 TO WS-LETTER-NUM
              WHEN 'O' MOVE 35 TO WS-LETTER-NUM
              WHEN 'P' MOVE 23 TO WS-LETTER-NUM
              WHEN 'Q' MOVE 24 TO WS-LETTER-NUM
              WHEN 'R' MOVE 25 TO WS-LETTER-NUM
              WHEN 'S' MOVE 26 TO WS-LETTER-NUM
              WHEN 'T' MOVE 27 TO WS-LETTER-NUM
              WHEN 'U' MOVE 28 TO WS-LETTER-NUM
              WHEN 'V' MOVE 29 TO WS-LETTER-NUM
              WHEN 'W' MOVE 32 TO WS-LETTER-NUM
              WHEN 'X' MOVE 30 TO WS-LETTER-NUM
              WHEN 'Y' MOVE 31 TO WS-LETTER-NUM
              WHEN 'Z' MOVE 33 TO WS-LETTER-NUM
              WHEN OTHER 
                   DISPLAY "錯誤：無效的英文字首"
                   STOP RUN

           END-EVALUATE.

      
           DIVIDE WS-LETTER-NUM BY 10 GIVING WS-L1 REMAINDER WS-L2.

     
           COMPUTE WS-SUM = (WS-L1 * 1) + (WS-L2 * 9) +
                            (D1 * 8) + (D2 * 7) +
                            (D3 * 6) + (D4 * 5) +
                            (D5 * 4) + (D6 * 3) +
                            (D7 * 2) + (D8 * 1).

    
           DIVIDE WS-SUM BY 10 GIVING WS-TEMP REMAINDER WS-REM.

     
           IF WS-REM = 0
              MOVE 0 TO WS-CHECK-CODE
           ELSE
              COMPUTE WS-CHECK-CODE = 10 - WS-REM
           END-IF.

   
           DISPLAY "-----------------------".
           DISPLAY "計算出的檢查碼: " WS-CHECK-CODE.
           DISPLAY "實際輸入檢查碼: " D9.
           
           IF WS-CHECK-CODE = D9
              DISPLAY "結果: 驗證成功 "
           ELSE
              DISPLAY "結果: 驗證失敗 "

           END-IF.
           STOP RUN.
           