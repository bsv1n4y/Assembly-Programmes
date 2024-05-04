;program to check for entered number is odd(0) or even(one) using procedure checkpro which returns 1 or 0 by dividing number by 2 and check reminder in ah reg
data segment
msg1 db 10,13, " EVEN number","$"
msg2 db 10,13, "ODD number","$"
msg3 db "Enter a number only single digit:->","$"
data ends
code segment
        assume cs:code,ds:data
        start:mov ax,data
              mov ds,ax

              lea dx,msg3    ;print message
              mov ah,09h
              int 21h

              mov ah,01h    ;read ascii value of number with echo
              int 21h

              sub AL,30h     ;convert to single dig
              call checkpro  ;call procedure
              cmp AL,00h     ;check return value is '0'
              jz L2          ;if zero  print as odd jmp to L2
              Lea dx,msg2    ;else print as odd  load msg2
             jmp disp        ;jump to disp
            L2:lea dx,msg1   ;load msg1 to dx
         disp:mov ah,09h     ;function to printmesg
              int 21h         ;for DOS operating system
             mov ah,4ch      ;for change to DOS
             int 21h
  checkpro proc
       mov ah,00h
       mov BL,02h          ;div by 2
       div BL
       cmp ah,00h         ;if reminder is '1' it is even ,remainder AH
       jz evennu           ;go to label oddno
      mov AL,0h          ;else if reminder is '0' it is odd
      jmp L1
evennu: mov AL,1h          ;move '0' to AL for display as even
  L1: ret
  checkpro endp
  code ends
  end start

