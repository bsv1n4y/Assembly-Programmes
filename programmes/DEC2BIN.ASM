;i/p bcd/dec o/p in binary on monitor and also in bin at DS,and in AL 
.model small
.data
x db 25d           ;if x db 25d it is in decimal o/p is in binary
bin db 8 dup(0)    ;bin is 8 db  it is in binary in reverse order.
.code
start:mov AX,@data   ;addr of data moved to ax
      mov DS,AX     ; move addr to ds
      mov AL,x     ;number in AL
      mov CL,08h   ;CL counter
      mov BL,02h   ;convert to binary divide by 2
      lea SI,bin    SI pointing to bin
  L1: mov AH,00h    ;to store reminder
      div BL        ;AL/BL
      mov DL,AH      ;reminder in AH move to DL
      add DL,30h     ;convert to ascii for print by adding 30h
      mov [SI],DL     ;store in array pointedto by SI-->bin
      inc SI          ;point to next location
      LOOP L1        ;decrements CX  loop 8 times        
      lea SI,bin      ;si->10011000  si=1(si pointing to 1st bit)
      add SI,08      ;point to last bit at 8th pos si->  00011001
      mov AL,bin     ;
      dec SI         ;since it is array
      mov CL,08
  L2: mov DL,[SI]   ;move  a bit at address of SI to DL for print
      mov AH,02h     ;
      int 21h        ;interrupt to print data in DL on monitor
     dec SI
     dec CL
     jnz L2
     mov ah,4ch   ;to close prog
     int 21h
end start       (out put is 00011001=25d)




