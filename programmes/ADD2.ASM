;addition 2 numbers of 8 bit or two dig. by taking i/p from kb sum<ffh,87&78
.model small          ; code and data in 2 seperate segment
.data                ;.data means data segment and data ends
  msg1 db 10,13,"Enter first no.$"
  msg2 db 10,13,"Enter second no.$"
  msg3 db 10,13,"Addition is:$"

.code            ;.code means code segment ,code ends

 start: mov AX,@data   ;address of data is moved ax
        mov DS,AX          ;from ax move to ds

    Lea dx,msg1          ;address of string in dx
    mov ah,09H           ;to print name
    int 21H

  mov ah,01H          ;for acceptin a char ie first digit
  int 21H              ;char from kb goes by default to-->AL

  sub al,30H           ;convert to ascii to int 
  cmp al,09H           ;check for digit/alpha
  JBE L1               ;if digit
  sub al,07H           ;if alpha sub again by 7

 L1: mov cl,04H
     ROL al,cl
     mov bl,al

     mov ah,01H      ;for accepting 2nd dig
     int 21H

     sub al,30H
     cmp al,09H
     JBE L2
     sub al,07H
  L2:ADD bl,al          ;grouping  1st dig,2nd dig of 1st number 0f two digits

  lea dx,msg2
  mov ah,09H
  int 21H

  mov ah,01H
  int 21H

   sub al,30H
   cmp al,09H
   JBE L3
   sub al,07H
 L3: mov cl,04H
     ROL al,cl
     mov bh,al

     mov ah,01H
     int 21H

     sub al,30H
     cmp al,09H
     JBE L4
     sub al,07H
  L4:ADD bh,al     
     ADD bl,bh   ;first no.in BL,2nd in BH

    lea dx,msg3
    mov ah,09H
    int 21H
    
    mov ch,02H
    mov cl,04H

 L5:ROL bl,cl
    mov bh,bl

    AND bl,0FH
    cmp bl,09H
    JBE L6
    ADD bl,07H
 L6:ADD bl,30H
    mov dl,bl

    mov ah,02H
    int 21H

    mov bl,bh
    dec ch
    JNZ L5

    mov ah,4ch
    int 21H
    end start
