; Bai 2: Viet chuong trinh nhap chuoi ki tu, chuyen chuoi do thanh chu in hoa
.data
    msgNhapChuoi db "Hay nhap vao mot chuoi ky tu: $"
    str db 100, 0, 100 dup(?)

.code                                       
main proc 
    mov ax, @data       ; Nap data vao data segment
    mov ds, ax                                     
    
    mov ah, 09h         ; In thong bao nhap chuoi
    lea dx, msgNhapChuoi
    int 21h
    
    mov ah, 0ah         ; Nhap chuoi ki tu
    lea dx, str
    int 21h                   
    
    mov cx, 0
    lea si, str                 ; si = offset(str)
    mov cl, byte ptr[si + 1]    ; cx = *(si + 1): kich thuoc chuoi da doc
                                ; do ch = 0 nen cx = cl (o tren da gan cx = 0)  
    add si, 2
    add si, cx              ; si += (cx + 2)
    mov byte ptr[si], '$'   ; Them dau '$' vao cuoi chuoi
    
    mov si, dx              ; si tro den dau vi tri truoc vi tri thuc cua chuoi
    add si, 2
    ; Chuyen thanh chu in hoa:
_while:                     ; do {               
    cmp byte ptr [si], 'a'  ;   if (*si <= 'a') 
    jl _nextchar            ;       goto nextchar;
    cmp byte ptr[si], 'z'   ;   if (*si >= 'z')
    jg _nextchar            ;       goto nextchar;
    sub byte ptr[si], 32d   ;   *si -= 32                          
_nextchar:                  ; #nextchar:
    inc si                  ;   si++;
    dec cx                  ;   cx--;
    cmp cx, 0               ; } while (cx != 0);
    jne _while                
    
    mov ah, 02h             ; cout << end;
    mov dl, 10d             ; print \n
    int 21h
    mov dl, 13d             ; print \r
    int 21h      
    lea dx, str             ; In lai chuoi do ra man hinh
    add dx, 2
    mov ah, 09h
    int 21h
     
    mov ah, 4ch         ; return ve DOS
    int 21h
endp 
end main