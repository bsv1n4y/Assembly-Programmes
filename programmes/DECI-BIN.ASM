.model small
.data
x db 25
.code
start:mov ax,@data
     mov ds,ax
     mov AL,x
     mov cl,08h
     mov ah,00h
 up: shl al,01h
    mov bl,al
    mov al,00h
    adc al,30h
   mov dl,al
   mov ah,02h
   int 21h
   mov al,bl
   dec cl
   jnz up
   mov ah,4ch
   int 21h
   end start
