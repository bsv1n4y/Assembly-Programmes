;  addition of decimal numbers of two digits w/o carry
data segment
   x db 68h
   y db 25h          ;8d h=93 d
   z dw 1 dup(0)     ; z dw 2 dup(0) ;82h= 88d
data ends
code segment
   assume cs:code,ds:data
   start:mov ax,data
         mov ds,ax

         mov aL,x
         mov bL,y
         mov ah,00h   ;initialise ah=00
         mov bh,00h   ;initialise bh=00
         adc ax,bx    ;al has hexadecimal sum
         daa          ;_decimal _adjust After _addition result in AL (decimal)
         mov z,ax     ;move result to z 
         mov ah,4ch
         int 21h
code ends
end start
