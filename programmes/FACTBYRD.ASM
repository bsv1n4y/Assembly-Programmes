;factorial of a number say 5= 5*4*3*2*1=120d=78h by reading i/p from kb o/p at DS
d segment
    msg db "enter a number","$"
    n db 00h
    fact dw 1 dup(0)
d ends
c segment
assume cs:c,ds:d
  start:mov ax,d
        mov ds,ax

        lea dx,msg                ;display message
        mov ah,09h
        int 21h

        mov ah,07h               ;accept i/p from kb in ascii with echo
        int 21h

        sub AL,30h               ;convert to integer
        mov n,AL                 ;store at n  ,BL
        mov bL,AL
        mov AL,01h               ;initialise AL to 1 since factorial of 0=1
      rpt:mul BL                 ;aL*bL->aL   ;repeat fact[n]=n*n-1*n-2*.....*1 n in BL
          dec BL                 ;n=n-1
          jnz rpt                ;till BL is 0
        L1:mov fact ,ax          ;move ax(res of fact(5)) to fact
          mov ah,4ch
          int 21h
c ends
end start
