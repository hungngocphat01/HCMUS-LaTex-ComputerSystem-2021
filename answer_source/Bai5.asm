include 'emu8086.inc'

.data
    n db 255 
.code                 
main proc   
    mov ax, @data
    mov ds, ax
    
    mov ax, 0  
    mov cl, n 
_for:           ; for (int cx = n; cx > 0; cx--) {
    add ax, cx  ;   ax += cx;
    loop _for   ; }        
    
    call PRINT_NUM_UNS  ; Goi ham in gia tri thanh ghi AX
    
    mov ah, 4ch         ; return ve DOS
    int 21h
endp  

DEFINE_PRINT_NUM_UNS 
end main