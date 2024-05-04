         ;print ato z with space
data segment

data ends
code segment
assume cs:code,ds:data
           start:mov DL,'a'
           MOV CL,9h
     PRINT:MOV AH,02H   ;display char in aL
           INT 21H      ;
           INC DL

           mov bL,dL    ;save dl in bL

           mov dL,' '  ;with space
           mov ah,02h  ;to display char in DL on monitor
           int 21h     ;interrupt for DOS os

           mov dL,BL   ;take back  from BL to dL

           DEC CL
           JNZ PRINT
           MOV AH,4CH
           INT 21H
CODE ENDS
END START
