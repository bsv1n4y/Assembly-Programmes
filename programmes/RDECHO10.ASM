   ;read  9 char from kb and disp on monitor
code segment
  assume cs:code
   start:mov CL,09h      ;counter in CL=9d  (9--> characters or 0Ah for 10 characters in CL)

RDAchar: mov ah,07h        ;AH=07h read w/o echo (kb)-->AL
         int 21h           ;AH=01 read with echo

        mov dL,AL          ;(kb)-->AL when you accept from kb it goes to AL

        mov ah,02h         ; before display a character it should be in DL
        int 21h            :display char on monitor

        dec cL              ;decrement cL
        jnz RDAchar        ;if it non zero go back to label RDAchar

        mov ah,4ch
        int 21h            ;if CL is zero exit;  for dos operating system
code ends
end start  
