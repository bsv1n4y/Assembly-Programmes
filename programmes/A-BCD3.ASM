;convert  2 dig ascii to binary
.model small
.data
x dq '45'
;z dw 3 dup(0)
y dw  0000
.code
start:mov ax,@data
      mov ds,ax
      MOV CL,02
      LEA SI, X
      lea di,y
      MOV AH,00H
 L3: MOV AL, [SI]
     SUB AL,30H
     mov [di],al
     INC SI
     inc di
     LOOP L3
     lea di,y
     mov al,[di+1]
     shl al,04h
     mov ah,[di+2]
     add al,ah
     mov [di-1],al
     mov ax,[di-1]
      mov y,ax
     lea SI,y
 call dispbin
 mov ah,4ch
 int 21h

 dispbin proc
 lea si,Y
 mov ax,Y
 L1:MOV BX,0002H
 MOV DX,000H
 DIV BX
 MOV [SI],DL
 INC SI
 CMP AX,0000H
 JNZ L1
 MOV [SI],AX
 MOV CL,08H
 LEA SI,Y
 ADD SI, 08H
 DEC SI
L2: MOV DL,[SI]
 ADD DL,30H
 MOV AH,02H
 INT 21H
 DEC SI
 LOOP L2
 RET
 DISPBIN ENDP

 END START





      Mov ah,4ch
      int 21h
      end start
