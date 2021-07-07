; Bai 7: Tinh tong cac chu so trong so nguyen
include 'emu8086.inc'
.data
    str db "12345$"        
    err db 10,13,"Da xay ra loi: trong chuoi co ki tu khong hop le", 24h

.code                                       
main proc 
    mov ax, @data       ; Nap data vao data segment
    mov ds, ax
    mov ax, 0                                                 
_while:                      
    cmp str[si], '$'    ; while (str[i] != '$')
    je _end_sum
    cmp str[si], '1'    ;   if (str[i] < '1') 
    jl _error           ;       goto error;
    cmp str[si], '9'    ;   if (str[i] > '9')
    jg _error           ;       goto error;  
    mov dx, 0           ;   dx = 0;
    mov dl, str[si]     ;   dx = str[i];  // do dh = 0 nen dx = dl
    sub dl, '0'         ;   dx -= '0';
    add ax, dx          ;   ax += dx;                          
    inc si              ;   i++;
    jmp _while          ; } 
                  

_error:                 ; Neu co loi xay ra
   lea dx, err          ;   In thong bao loi
   mov ah, 09h
   int 21h
   jmp _exit            ;   Thoat khoi chuong trinh
    
_end_sum:    
    call PRINT_NUM_UNS
_exit:     
    mov ah, 4ch         ; return ve DOS
    int 21h
endp 
DEFINE_PRINT_NUM_UNS 
end main