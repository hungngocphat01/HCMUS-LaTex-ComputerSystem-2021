.data
    str db 100, 0, 100 dup('$')  
    endl db 10, 13, 24h          ; endl = "\r\n$"   
.code                 
main proc   
    mov ax, @data       ; Nap data vao data segment
    mov ds, ax
    
    mov ah, 0ah         ; Nhap chuoi
    lea dx, str
    int 21h      
    
    lea dx, endl        ; Xuong dong (\r\n)
    mov ah, 09h
    int 21h
    
    lea dx, str         ; Nap lai dia chi chuoi vao dx
    add dx, 2           ; Noi dung thuc su cua chuoi nam o vi tri [dx + 2]
    mov ah, 09h
    int 21h
endp  

end main