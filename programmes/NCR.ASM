;to find NcR if r=n or r=0, ncr=1. Also if r=1 or r=n-1, ncr=n 
.model small
.data                         ;ncr=n!/((n-r)!*r!)
X DW 5 DUP(0)
n dw 4
r dw 1
ncr dw 1 dup(0)       ;4c2=6=ncr

.code
start: mov ax,@data
       mov ds,ax
       mov ax,n      ;n  is moved to ax
       mov bx,r       ; r to bx
       call ncrpro     ; calling procedure near call
       mov ah,4ch
       int 21h

       ncrpro proc    ;defining procedure by name followed by proc
       cmp bx,ax      ;if r=n
       je RES1        ;if so ncr=1 go to label RES1
       cmp bx,0       ;if r=0
       je RES1        ; if so ncr=1 
       cmp bx,01      ;bx=r
       je RESn        ; if r=1 ncr=n
       dec ax          ;ax=n-1
       cmp bx,ax     ;if r=n-1
       je INCRNCR   ; if so goto label INCRNCR

       push ax
       push bx
       call ncrpro
       pop bx
       pop ax          ;to find Numerator dec n in ax

       dec bx          ;to find denomitor dec r in bx
       push ax
       push bx
       call ncrpro
       pop bx
       pop ax
       ret

   RES1:
      inc ncr
      ret
  INCRNCR:inc ncr
  RESN: add ncr,ax
       ret
ncrpro endp
end
        
