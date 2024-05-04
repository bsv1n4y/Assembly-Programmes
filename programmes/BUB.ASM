;SORT 5 EIGHT BIT(byte) NUMBERS in descending/ascending order bubble

DATA SEGMENT
A DB 23H,45H,22H,55H,64H,43h ;an array 6 numbers
n DW ($-A)
X DW 5 DUP(0)
DATA ENDS             ;REG ->AX,BX,CX,DX,SI,DI,IP,SP,BP,CS,DS,ES,SS,FLAG

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
    START:  MOV AX,DATA
            MOV DS,AX
            MOV BX,n
            DEC BX              ;bX HAS PASS NUMBER = ( n-1)
   OUTLOOP:MOV CX,BX            ;CX HAS  NUMBER OF COMPARISONS 
           MOV SI,00H           ;for(i=0;i<n-1;i++) pass number
     INLOOP:MOV AL,A[SI]        ;AL=23,si ->45   for(j=0;j<n-1-i;j++) no.comp
            INC SI              ;point si to a[1]
            CMP AL,A[SI]
            JC NEXTPASS         ;NO CARRY MEANS 1ST NU>2ND. FOR DESCENDING
            XCHG AL,A[SI]       ;replace JC in place of JNC for ascending
            MOV A[SI-1],AL
 NEXTPASS:LOOP  INLOOP          ;GO TO NEXT COMPARISON if cx!=0 CX < CX-1
          DEC bX                ;GO TO NEXT PASS
          JNZ OUTLOOP           ;IF BX!=0 GO TO NEXT PASS
          MOV AH,4CH
          INT 21H
CODE ENDS
END START
