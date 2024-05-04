;Read a character from KB and echo on monitor
 code segment
  assume cs:code    ;cs physical to logical segment
                    ;since data is from KB mov ax,data
                    ;                      mov ds,ax is not required   

start:  mov ah,07h  ;read a char from kb w/o echo .char goes to AL by default  mov ah,01h with echo
        int 21h     ;int means interrupt (for dos operating system) int 16h for ascii key board,int 10h for monitor

        mov dL,aL   ;put a char in dL before display(accept it goes to AL,before DispLay it should be DL)

       mov ah,02h   ;to display function is 02h
       int 21h      ;display char in dL on monitor printf()

      mov ah,4ch    ;for change to dos prompt  same exit(); in c program
      int 21h
 code ends
end  start 
