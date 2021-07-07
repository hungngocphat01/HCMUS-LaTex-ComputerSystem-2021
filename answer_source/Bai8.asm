; Bai 2: Viet chuong trinh nhap chuoi ki tu, chuyen chuoi do thanh chu in hoa
.data
    m db 0
    n db 0
    c db ? 
    endl db 13, 10, 24h ; \r\n
.code                                       
main proc 
    mov ax, @data       ; Nap data vao data segment
    mov ds, ax                                     
    
    mov ah, 01h         ; Doc m
    int 21h
    mov m, al  
    sub m, '0'     
    
    int 21h             ; Doc n
    mov n, al 
    sub n, '0'          
    
    int 21h             ; Doc c
    mov c, al
    
    lea dx, endl        ; Xuong dong
    mov ah, 09h
    int 21h    
    
    mov bh, m           ; bl = m
_while1:
    cmp bh, 0           ; while (bh != 0) {
    je _end_while1 
    mov bl, n           ;   bl = n;
    _while2:            ;   while (bl != 0) {
        cmp bl, 0
        je _end_while2
        mov ah, 02h     ;       print(c);
        mov dl, c
        int 21h  
        dec bl          ;       bl--;
        jmp _while2     ;   }
    _end_while2:        ;
    lea dx, endl        ;   print("\r\n");
    mov ah, 09h
    int 21h
    dec bh              ;   bh--;
    jmp _while1         ; }
_end_while1:            

    mov ah, 4ch         ; return ve DOS
    int 21h
endp 
end main