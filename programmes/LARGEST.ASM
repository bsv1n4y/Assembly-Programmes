;smallest of 10 byte (use jc for min ,jnc for max)
.model small
.data
array db 63h,45h,78h,12h,99h,29h,11h,22h,69h,88h
min db 1 dup(99)  ;for max declare as max db 1 dup(0)
x dw 5 dup(0)
.code
start:mov ax,@data
       mov ds,ax

       xor di,di         ;di=0 mov di,0000h
       mov CL,0ah
       lea bx,array       ;bx pointing to array
       mov AL,min
   BACK:cmp AL,[bx+di]   ; compare AL with data at bx+di
        Jc  skip         ; if  carry AL<[bx+di]  for min
        mov AL, [bx+di]  ;if no carry jnc AL>[bx+di] for max
  skip:inc di             ;di points to next byte
       dec cL
       Jnz back
       mov min,AL
       mov ah,4ch
       int 21h
end start
