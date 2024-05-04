;factorial of a numbersay 5=120d=78h
d segment
    n db 5h
    fact dw 1 dup(0)
d ends
c segment
assume cs:c,ds:d
  start:mov ax,d
        mov ds,ax
        mov aL,01
        mov bL,n
    rpt:MUL BL          ;aL*bL->aL 5*4*3*2*1=120d=78h
        dec BL
        jnz rpt
        mov fact ,ax    ;move ax(res of factorial of 5) to fact

        mov ah,4ch
        int 21h
c ends
end start
