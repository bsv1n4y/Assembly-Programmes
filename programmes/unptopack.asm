; unpacked BCD to packed BCD packed means 1 dig. per byte to 2 dig. per byte eg  i/p 4,5 in ascii it is34 and 35 sub 30 from both it is 04,05unpack
DATA SEGMENT          ;shift left 04, 4 times=40 add to 05 
                 
BCD1 DB 1 DUP(0)    ;declare 1st digit un packed one digit per byte 34=04
BCD2 DB 1 DUP(0)    ;          2nd  say 35=05
 bcd3 db 1 dup(0)    ;declare 2 digit packed bcd 2 digit per byte  packed bcd=45
DATA ENDS

CODE SEGMENT
     ASSUME CS:CODE,DS:DATA
     START:MOV AX,DATA
     MOV DS,AX
     mov ah,07h     ;read 1st packed digit in ascii 4 as34
     int 21h
      sub AL,30h    ;convert to un pack  04
    mov bcd1,AL     ;mov toBCD!
    mov ah,07h      ;read 2nd packed digit
   int 21h
   sub AL, 30h       ;convert to unpack
   mov bcd2,AL       ;mov to BCD2
   shl bcd1,04h      ;shift left bcd1 4 times say 4 read as 34,34-30=04<<4=40 
   mov al,bcd1       ;bcd1=35-30=05 
                     ;add 40+bcd2=40+5=45
  add AL,bcd2

     MOV BCD3,AL     ;bcd3=45 packed BCD of 34 and 35
     MOV AH,4CH            ;terminate
     INT 21H

 END START
