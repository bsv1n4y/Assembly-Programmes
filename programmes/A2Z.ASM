       ;print A to Z on monitor  w/o i/p from kb
data segment                   ;segment-->start of segment
                               ;no data from kb
data ends                      ;ends-->end of data segment

code segment
  assume cs:code,ds:data        ;phy to logical linking
      start:mov DL,'A'          ;move start character to DL
           MOV CL,1ah           ;counter for 26d char
     PRINT:MOV AH,02H           ;function number 02 to AH print a char in DL to o/p
           INT 21H              ;dos interrupt to 
           inc DL               ;go to next char ,by incrementing dl
           DEC CL               ;decrement counter
           JNZ PRINT            ;if non zero jump to label PRINT
           MOV AH,4CH           ;if CL=0  go for close
           INT 21H              ;for dos operating system to get prompt
CODE ENDS                      ;phycal end of program
END START
