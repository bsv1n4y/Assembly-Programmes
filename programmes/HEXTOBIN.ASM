;if i/p is in hexadecimal o/p is in binary
.model small
.data
x db 96h          ;if x db 96d it is in decimal o/p is in binary
bin db 8 dup(0)   ;if x db 96d  it is in hexa o/p is each dig in bcd
.code
start:mov AX,@data   ;addr of data moved to ax
      mov DS,AX     ; move addr to ds

      mov AL,x     ;number in AL
      mov CL,08h   ;CL counter
      mov BL,02h   ;convert to bin
      lea SI,bin

  L1: mov AH,00h    ;to store reminder
      div BL        ;AL/BL
      mov DL,AH
      add DL,30h     ;convert to ascii for print
      mov [SI],DL
      inc SI
      LOOP L1        ;decrements CX

      lea SI,bin
      add SI,08      ;point to last bit at 8th pos
      dec SI         ;since it is array
      mov CL,08
  L2: mov DL,[SI]   ;move bit at address of si to DL for print
      mov AH,02h
     int 21h        ;interrupt to print data in DL on monitor

     dec SI
     dec CL
     jnz L2

     mov ah,4ch
     int 21h
end start




