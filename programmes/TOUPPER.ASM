;prog to read lower case string from kb
; and convert to UPPER till a zero-0 is entered
.model small
.data
arr db 100 dup(0)
msg1 db "enter a string in lower case end by entering zero'0':","$"
msg2  db 0Dh,0Ah, "UPPER case string is :","$"
.code
start: mov ax,@data
      mov ds,ax

      lea si,arr

      lea dx,msg1     ;print mesag 1
      mov ah,09h
      int 21h

AGAIN: mov ah,01h      ;function to read a char  from kb ah=01h
       int 21h         ; (kb)-->AL

       cmp AL,'0'
       jz STOP
       SUB AL,20h       ;FOR UPPER TO LOWER ADD al,20h
       mov [si],al    ;for converting to upper.(add AL,20h)for to lower  sub 32d a=97,A=65
       inc si
       inc BL          ;BL is counter
       jmp AGAIN
STOP:mov aL,"$"       ;end of string
     mov [si],AL
     lea si, arr          ;mov si to  point arr
     mov cL,bL
    lea dx,msg2
    mov ah,09h
    int 21h
DISP:mov DL,[si]
    mov ah,02h      ;to display a char from DL
    int 21h

   inc si
   loop  DISP
   mov ah,4ch      ;for change to dos promt
   int 21h
code ends
end start
