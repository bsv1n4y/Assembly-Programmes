;  addition/multiply of decimal numbers of two digits w/o carry
data segment
   x db 08h
   y db 09h          ;8d h=72 d
   z db 1 dup(0)     ; z dw 2 dup(0) ;82h= 88d
data ends
code segment
   assume cs:code,ds:data
   start:mov ax,data
         mov ds,ax

         mov aL,x
         mov bL,y
         mov ah,00h   ;initialise ah=00
         mov bh,00h   ;initialise bh=00
         mul bL       ;al*bl=al hexadecimal product
         add aL,0h
         daa          ;_decimal _adjust After _addition result in AL (decimal)
         mov z,aL     ;move result to z 
         mov ah,4ch
         int 21h
code ends
end start
