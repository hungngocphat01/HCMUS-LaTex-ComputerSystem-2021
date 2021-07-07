; Bai 2: Viet chuong chuyen chuoi ki tu thanh chu in hoa
.data
    str db "(A.s.S.e.M.b.L.y) @KhO &vCl", 24h

.code                                       
main proc 
    mov ax, @data       ; Nap data vao data segment
    mov ds, ax                                     
    
_for:                   ; for(int i = 0; str[i] != '$'; i++) {               
    cmp str[si], 'a'    ;   if (str[i] < 'a') 
    jl _nextchar        ;       continue;
    cmp str[si], 'z'    ;   if (str[i] > 'z')
    jg _nextchar        ;       continue;
    sub str[si], 32d    ;   str[i] -= 32;                          
_nextchar:              ; 
    inc si              ; Dòng này tương đương với i++ của vòng for  
    cmp str[si], 24h    ; Dòng này tương đương với xét điều kiện dừng của vòng for
    jne _for            ; }  
    
    lea dx, str         ; In lai chuoi do ra man hinh
    mov ah, 09h
    int 21h
     
    mov ah, 4ch         ; return ve DOS
    int 21h
endp 
end main