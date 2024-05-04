data segment

data ends
code segment
assume cs:code,ds:data
           start:mov DL,'a'
           MOV CL,1ah
     PRINT:MOV AH,02H
           INT 21H
           INC DL

           mov bl,dl

           mov dl,0ah ;mov 0ah to DL to go to next line
           mov ah,02h
           int 21h

           mov dl,bl

           DEC CL
           JNZ PRINT
           MOV AH,4CH
           INT 21H
CODE ENDS
END START
