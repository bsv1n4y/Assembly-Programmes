;SORT 5 EIGHT BIT(byte) NUMBERS in descending/ascending order bubble
DATA SEGMENT
A Dw 2312H,4345H,1222H,5115H,6014H,1243h ;an array 6 numbers of word
n DW ($-A)/2           ;$ is pointing to byte
X DW 5 DUP(0)
DATA ENDS             ;REG ->AX,BX,CX,DX,SI,DI,IP,SP,BP,CS,DS,ES,SS,FLAG
                     ;reg byte(8bits) AL,AH,BL,BH...
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
    START:  MOV AX,DATA
            MOV DS,AX
            MOV BX,n
            DEC BX              ;bX HAS PASS NUMBER = ( n-1)
   OUTLOOP:MOV CX,BX            ;CX HAS  NUMBER OF COMPARISONS 
           MOV SI,00H           ;for(i=0;i<n-1;i++) pass number
     INLOOP:MOV Ax,A[SI]        ;AL=23,si ->45   for(j=0;j<n-1-i;j++) no.comp
            INC SI
            inc si              ;point si to a[1]
            CMP Ax,A[SI]
            JnC NEXTPASS         ;NO CARRY MEANS 1ST NU>2ND. FOR DESCENDING
            XCHG Ax,A[SI]       ;replace JC in place of JNC for ascending
            MOV A[SI-2],Ax
 NEXTPASS:LOOP  INLOOP          ;GO TO NEXT COMPARISON if cx!=0 CX < CX-1
          DEC bX                ;GO TO NEXT PASS
          JNZ OUTLOOP           ;IF BX!=0 GO TO NEXT PASS
          MOV AH,4CH
          INT 21H
CODE ENDS
END START
