; prog using 8086 alp to move content x1 to AL,x2 to BL  and 
;then  find larger of both and  store in DL.Also display biggest no. on monitor
data segment
x1 db 98h                 ;x1 byte with value 98h
x2 db 96h
data ends
code segment
assume cs:code,ds:data
   start: mov ax,data
         mov ds,ax
         mov AL,x1        ;mov  x1 to AL
         mov BL,x2        ;mov x2 to BL
         cmp AL,BL        ;compare AL to BL by subtraction AL-BL=01
         ja L1            ;if AL>BL go to labeel L1
         mov DL,BL        ;if bBL>AL move BL to DL
         jmp L2            ;jump to L2
  L1:    mov DL,AL        ;move AL to DL
  L2:   mov CL,DL
        and dL,0f0h       ;for 2 digit
        shr DL,04h
        add DL,30h
        mov ah,02h           ;display dig
        int 21h
        mov dL,cl        
        and dL,0fh
        add DL,30h
        mov ah,02h
        int 21h
        mov ah,4ch          ;terminate
         int 21h
  code ends
 end  start
