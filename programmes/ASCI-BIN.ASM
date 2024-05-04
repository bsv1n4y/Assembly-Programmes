.model small
.data
x db 'A'                  ;Ascii value of A is 65d=41h=01000001  o/p
.code
start:mov ax,@data
     mov ds,ax
     mov AL,x
     mov cl,08h       ;8 bit value ascii of any character/digit
     mov ah,00h
 up: shl al,01h        ;to take out last bit(msb)
     mov bl,al         ;store in BL for later use
    mov al,00h
    adc al,30h          ;to convert to ascii
   
   mov dl,al            ;to print a bit available in DL
   mov ah,02h
   int 21h
  
  mov al,bl            ;take back number to AL
   dec cl               ;decrement count
   jnz up               ;if not zero jump to label up
   mov ah,4ch
   int 21h
   end start
