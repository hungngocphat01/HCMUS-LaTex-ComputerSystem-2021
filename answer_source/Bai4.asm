; Bai 4: Viet thu tuc convert so sang chuoi
.data
    str db 100 dup('$')

.code 
decimalToString proc  
    mov cx, 0       ; count = 0 
_convert_while: 
    cmp ax, 0       ; while (ax != 0) {
    je _end_while
    mov dl, 10      ;   
    div dl          ;   al = ax/10; ah = ax%10;
    mov dx, 0
    mov dl, ah      ;   dx = ah;
    push dx         ;   push(dx);   // push so du vao stack
    mov ah, 0       ;   ax = al;    // tiep tuc lay thuong de chia
    inc cx          ;   count++; 
    jmp _convert_while
_end_while:         ; }
    ; pop du lieu tu stack ra luu vao chuoi    
    mov si, 0
_convert_for:             ; for(int i = 0; i < count; i++) {
    pop ax                ;     ax = pop();  
    add al, '0'           ;     ax += '0';      // chuyen so sang ma ascii
    mov bx[si], al        ;     str[si] = ax;       // do ah = 0 nen ax = al
    inc si                ;     si++
    loop _convert_for     ; }
_end_for:                            
    ret
endp

; Ham main de chay thu                                      
main proc 
    mov ax, @data       ; Nap data vao data segment
    mov ds, ax                                     
    
    mov ax, 100         ; Thu in so 100 ra man hinh
    lea bx, str         ; Convert 100 sang chuoi va luu vao bien str
    call decimalToString 
    
    mov ah, 09h         ; In bien str ra man hinh
    lea dx, str
    int 21h      
    
    mov ah, 4ch         ; Tro ve DOS
    int 21h
endp 
end main