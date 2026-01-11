IDENTIFICATION DIVISION.
       PROGRAM-ID. MATH-PRACTICE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 INT-NUM1        PIC 9(5).
       01 INT-NUM2        PIC 9(5).

       01 INT-SUM         PIC 9(6).
       01 INT-DIFF        PIC S9(5).
       01 INT-PROD        PIC 9(10).
       01 INT-QUOT        PIC 9(5).


       01 DEC-NUM1        PIC 9(3)V99.
       01 DEC-NUM2        PIC 9(3)V99.
       01 DEC-SUM         PIC 9(4)V99.
       01 DEC-DIFF        PIC S9(3)V99.

       01 DEC-PROD        PIC 9(6)V9999.
       01 DEC-QUOT        PIC 9(4)V99.
       

       01 RES-NO-ROUND    PIC 9(4)V9.
       01 RES-WITH-ROUND  PIC 9(4)V9.

       PROCEDURE DIVISION.

           DISPLAY "=== 整數運算 ===".
           
           DISPLAY "請輸入整數 1 (最高五位): ".
           ACCEPT INT-NUM1.
           
           DISPLAY "請輸入整數 2 (最高五位): ".
           ACCEPT INT-NUM2.

           ADD INT-NUM1 TO INT-NUM2 GIVING INT-SUM.
           SUBTRACT INT-NUM2 FROM INT-NUM1 GIVING INT-DIFF.
           MULTIPLY INT-NUM1 BY INT-NUM2 GIVING INT-PROD.
           DIVIDE INT-NUM1 BY INT-NUM2 GIVING INT-QUOT.

           DISPLAY "----------------Result----------------".
           DISPLAY "+: " INT-SUM.
           DISPLAY "-: " INT-DIFF.
           DISPLAY "*: " INT-PROD.
           DISPLAY "/: " INT-QUOT.
           DISPLAY " ".

           DISPLAY "=== 小數運算 ===".
           
           DISPLAY "請輸入小數 1 (如 10.55): ".
           ACCEPT DEC-NUM1.
           
           DISPLAY "請輸入小數 2 (如 99.88) : ".
           ACCEPT DEC-NUM2.

           COMPUTE DEC-SUM  = DEC-NUM1 + DEC-NUM2.
           COMPUTE DEC-DIFF = DEC-NUM1 - DEC-NUM2.
           COMPUTE DEC-PROD = DEC-NUM1 * DEC-NUM2.
           COMPUTE DEC-QUOT = DEC-NUM1 / DEC-NUM2.

           DISPLAY "----------------Result----------------".
           DISPLAY " +: " DEC-SUM.
           DISPLAY " -: " DEC-DIFF.
           DISPLAY " *: " DEC-PROD.
           DISPLAY " /: " DEC-QUOT.


           DISPLAY " ".
           DISPLAY "--- ROUNDED ---".
           

           COMPUTE RES-NO-ROUND = DEC-NUM1 / DEC-NUM2. *> 無條件捨去
           
           COMPUTE RES-WITH-ROUND ROUNDED = DEC-NUM1 / DEC-NUM2. 
                                   *> 四捨五入

           DISPLAY "原始輸入: " DEC-NUM1 " / " DEC-NUM2.
           DISPLAY "無 (截斷後取1位小數): " RES-NO-ROUND.
           DISPLAY "有 (四捨五入取1位小數): " RES-WITH-ROUND.

           STOP RUN.