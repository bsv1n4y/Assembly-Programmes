;evaluate an expression 3x pow 3+4x+5 if flag=1 else 7x+8 if flag=0
.model small
.data
  flag equ 1
  x dw 0002h         ;x=0002h
  res dw 2 dup(0)    ;res=0025h=37d
.code
start:  mov ax,@data
        mov ds,ax

        if flag       ;if flag=1  evaluate 3*xpow 3+4*x+5
        mov ax,x
        mul x         ; ax*x=x*x
       mul x          ;x*x*x =ax
       mov bx,03
       mul bx         ;ax*bx=3*x pow 3
       mov res,ax
       mov ax,x
       mov bx,4
       mul bx
       add ax,res     ;ax=3x pow 3+4x
       add ax,5       ;ax= 3x pow 3+4x+5
       mov res,ax
  else                     ;if flag=0
    mov bx,07              ; this part 7x+8
    mov ax,x
    mul bx
    add ax,08
    mov res ,ax
 endif
    mov ah,4ch
    int 21h
end start
