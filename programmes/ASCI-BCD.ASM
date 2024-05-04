;convert  3 dig ascii to binary
.model small
.data
x dq '345'         ;33h,34h,35h  ascii value for 3,4,5     x dw 3456d result in ascii is 36,35,34,33
;z dw 3 dup(0)
y dw  0000
.code
start:mov ax,@data
      mov ds,ax
      
      MOV CL,03          ; counter for 3numbers.02 for 2 numbers
      LEA SI, X          ;si,di points to x
      lea di,y            
      MOV AH,00H
 L3: MOV AL, [SI]        ;mov content of si to AL
     SUB AL,30H          ;sub 30 to get digit ie 31-30=01
     mov [di],al         ;mov 01 to memory at di
     INC SI              ;go to next number
     inc di              ;next location
     LOOP L3             ;repeat 3 times
     lea di,y            ;load y addr to di
     mov al,[di+1]       ;take 1st dig to AL
     shl al,04h          ;shift left 4 times
     mov ah,[di+2]       ;mov 2nd dig to ah
     add al,ah           ;add 1st ,2nd dig
     mov [di-1],al       ;mov result to previous location
     mov ax,[di-1]       ;store in ax
     mov y,ax            ;store in y also
     lea SI,y            ;si points y
 call dispbin            ;call dispbin procedure
 mov ah,4ch
 int 21h

 dispbin proc
 lea si,Y
 mov ax,Y
 L1:MOV BX,0002H         ;div by 2 to get binary
   MOV DX,000H
   DIV BX               ;AX/BX quo in AX,REm in DX or DL
   MOV [SI],DL          ;mov to address of si
   INC SI
   CMP AX,0000H         ;repeat till ax is zero
   JNZ  L1
   MOV [SI],AX
   MOV CL,0cH          ;08 for 2 numbers
   LEA SI,Y
   ADD SI, 0cH        ;08 for 2 numbers
   DEC SI
L2: MOV DL,[SI]       ;to display on monitor
  ADD DL,30H          ;convert to ascii
  MOV AH,02H
  INT 21H
  DEC SI
  LOOP L2
  RET
 dispbin ENDP

 END START           ;physical end of program 

    