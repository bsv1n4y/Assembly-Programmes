;sum and avg of 3 numbers in memory
data segment
   x db 10h         ;x=16d   
   y db 12h         ;y=18d
   z db 15h         ;z=21d
   sum db 1 dup(0)  ;sum=37h=55d
   avg db 1 dup(0)  ;avg=18d=012h
   rem db 1 dup(0)  ;rem=1
   n db 3
data ends

code segment
assume cs:code,ds:data
   start:mov ax,data     ;address of data moved to AX 
         mov ds,ax       

         mov AL,x     ;x is moved to AL
         mov BL,y
         add AL,BL
         adc AL,z
         mov sum,AL   ;mov x+y+z  to sum
         
         mov BL,n     ;n=3
         mov ah,00h   ;before div make ah=0 to store reminder
         div bL       ; divide al(sum) by 3
         mov avg,AL   ; AL=average(quotient),AH=reminder
         mov rem,AH

         mov aH,4ch
         int 21h
code ends
end start
