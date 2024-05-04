  ;addition of two hexa decimal numbers of 8/16 bit stored in 2 consecutive
  ;location and store result at next location in memory (x+y-->z)
data segment              ;data segment                                             data segment
   x db 34h               ;x db(byte) 65h  dw means define word 4 dig number         --
   y db 48h               ; y db  56h   db  2 digit      data ends                   --
   z db 1 dup(0)          ; z dw 1 dup(0) duplicate z=x+y  ; code segment            data ends
data ends                                                                            code segment
                                                                                      -
                                                                                      -
code segment               ;similar to opening brace { in "c" after main()            code ends
   assume cs:code,ds:data
   start:mov ax,data       ;address of data moved to ax;
         mov ds,ax         ; mov from ax to DS  
         mov aL,x          ;mov AL,x for x db    
         mov bL,y          ;bh+bL,BL=48,BH=65
         add aL,bL         ; result in AX ax+bx-->ax
         mov z,aL          ;store result in ax to z

         mov ah,4ch        ;these two inst.to stop and go back to dos prompt
         int 21h           ;similar to exit() in c program
code ends                  ;similar to closing brace in c }
end start
;---------------------------------------------------------end of program--------------

            ;format of assembly language program (8086)
         ;data segment
            ; put data here
            ; 
         ;data ends
         ;code segment
          ;assume cs:code,ds:data that is linking logical name to physical name
            ;  write instructions
            ;
            ;
         ;code ends
         ;end
