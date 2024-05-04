;exchange two 8/16 bit numbers

data segment    ;start data segment
  x db 10h   ; x dw 1234h
  y db 20h   ; y dw 5678h
data ends     ;end of data segment

code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax

        mov aL,x    ;mov ax,x
        mov bL,y    ;mov BX,y
        xchg AL,BL  ;xchg AX,BX
        mov x,AL
        mov y,BL

        mov ah,4ch  ;to terminate or exit for change to dos prompt
        int 21h
code ends
end start
