;read string-> reverse print both and check for palindrome

.model small
.data
CR EQU 0dh           ; carriage return ,new line
LF EQU 0ah           ;first line,line feed
str1 db 20 dup(20)
rstr db 20 dup(20)
msg1 db CR,LF ,"Enter a string $"  ;string ends with $
msg2 db CR,LF ,"reversed string=$"
msg3 db CR,LF, "input string is a palindrome $"
msg4 db CR,LF, "input string is not a palindrome $"
msg5 db CR,LF,"length of string=  $"
.code
       start: mov ax,@data       ;1.initialise DS,ES
              mov DS,ax          ;DS for str and ES for rstr
              mov ES,ax

            lea dx, msg1         ;2.display msg1(print name)
            mov ah,09h           ;similar to printf("msg1");
            int 21h

          lea dx,str1              ;3.read str (accept name)
          mov ah,0Ah              ;similar to gets(str)
          int 21h
                                 ;4.point si to start of str ie  at str+2
       lea si, str1 +2   ;str+2 has start of string,str+1 has actual length
      mov BL,str1+1      ;5.length of str  ie str+1
      mov bh,00h        ;                                 ----------
      add si,bx         ;6.si points to last character  |5 madam   |
                        ;                                |1-2-------|
      lea di,rstr+2       ;7.di points to rstr+2
      mov cx,bx
      dec si                ;si is decremented by 1 since it is an array
cpnextchar:mov AL,[si]       ;8.copy last char to aL
         mov [di],AL         ;move to (di) -->rstr first position
         inc di
         dec si
         loop cpnextchar      ;repeat till end   or cx!=0

         lea dx,msg2          ;9.print rstr  message
         mov ah,09h
         int 21h

         mov [di],"$"         ;10. add $ at end

         lea dx,rstr+2        ;11. print rstr
         mov ah,09h
         int 21h

         lea di,rstr+2          ;12. go for comparison
         lea si,str1+2
         mov ch,00h
         mov cl,bl
         CLD                ;cld  df=0   si,di both will increment by 1
       repe  cmpsb          ;compare char pointed to by si with di
       jne L1               ;if not same go to label L1
       lea dx,msg3          ; ELSE PRINT msg3
       jmp L2
   L1:lea dx,msg4
   L2:mov ah,09h
      int 21h

     lea dx,msg5
     mov ah,09h
     int 21h

     add BL,'0'         ;add BL,30h TO CONVERT TO ASCII FOR PRINT

     mov dL,bL         ;before print move length to DL
     mov ah,02h
     int 21h

     mov ah,4ch       ;for termination of alp
     int 21h
  end start          ;physical end of program
