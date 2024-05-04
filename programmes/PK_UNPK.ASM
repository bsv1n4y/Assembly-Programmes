;packed BCD to unpacked BCD packed means 2 dig. per byte eg  i/p 29h o/p 2,9
DATA SEGMENT          ;  .data is same as data segment,data ends
BCD DB 29h            ;bin= 00011011,bcd=00101001 (packed bcd)
BCD1 DB 1 DUP(0)      ;bcd1=2(00000010),bcd2=9(00001001) (un packed bcd)
BCD2 DB 1 DUP(0)      ;one digit per byte is unpacked
DATA ENDS
CODE SEGMENT
     ASSUME CS:CODE,DS:DATA
     START:MOV AX,DATA
     MOV DS,AX
     mov ah,00h
     MOV AL,BCD
     CALL CONVERT          ;calling procedure CONVERT

     MOV AH,4CH            ;terminate
     INT 21H

 CONVERT PROC
    mov CL,04h    ;counter 04 in CL to shift digit right by 4 bit      
    MOV AH,AL     ;save AL in AH
    AND AL,0F0H   ;MASK LOWER DIGIT  =9
    SHR AL,CL     ;BRING higher digit TO LOWER POSITION
    MOV BCD1,AL   ;store lower dig. in bcd1
    AND AH,0FH    ;MASK HIGHER DIGIT
    MOV BCD2,AH   ;store higher dig.in BCD2 
    RET
 CONVERT ENDP
CODE ENDS
END START
