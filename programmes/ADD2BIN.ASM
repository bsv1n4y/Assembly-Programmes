;addition of two binary numbers and display sum in binary 
data segment
bin1 db 10100011b      ;bin1=A3h=163d
bin2 db 01010110b      ;bin2=56h=86d
sum db  00000000b      ;sum=F9h=249d
data ends
code segment
   Assume cs:code,ds:data
          start:mov ax,data       ;initialse data segment
          mov ds,ax
          mov aL,bin1
          add aL,bin2
          mov sum,aL

          call dispinbin        ;calling procedure dispinbin
          mov ah,4ch
          int 21h

   dispinbin  proc             ;definition of procedure start
    lea si,sum
    mov al,sum
L1:mov BL ,02h
   mov ah,00h
   DIV BL               ;AL/BL   quo=AL,rem =AH
   mov [si],ah
   inc si
   cmp al,00h
   jnz L1
   mov [si],al         ;move quotient also to[si]ie last bit
   mov cL,08h
   lea si,sum
   add si,08h
   dec si
L2: mov DL,[si]       ;mov last bit to DL
    add dl,30h        ;convert to ascii for display
    mov ah,02h        ;display on monitor
    int 21h
    dec si            ;go to next bit
   loop L2
   ret
   dispinbin  endp     ;end of procedure
end start     
