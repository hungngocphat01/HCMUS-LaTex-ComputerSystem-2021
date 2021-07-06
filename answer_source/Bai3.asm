; Bai 3: Viet chuong trinh nhap ky tu. Cho biet no la chu hoa, thuong hay so?
.data
    msgNhapKyTu db "Hay nhap vao mot ky tu: $"
    msgKyTuHoa db 10,13, "Ky tu vua nhap la chu hoa.$"
    msgKyTuThuong db 10, 13, "Ky tu vua nhap la chu thuong.$"
    msgKySo db 10, 13, "Ky tu nhap vao la ky so.$"
    msgElse db 10, 13, "Ky tu nhap vao la ky tu khac.$"    
    ; 10, 13 la ma ASCII cua \r va \n
.code                                       
main proc 
    mov ax, @data       ; Nap data vao data segment
    mov ds, ax                                     
    
    mov ah, 09h
    lea dx, msgNhapKyTu 
    int 21h             ; In thong bao nhap ky tu
    
    mov ah, 01h         ; Nhap ky tu tu ban phim
    int 21h             ; Mac dinh luu vao AL  
    mov bl, al          ; Sap toi se goi int 21h nen ax co the se bi thay doi, nen backup lai                      
    
    ; Xem so do thuat toan duoc dinh kem khi nay de hieu ro doan code ben duoi hon 
    cmp bl, 'A'         ; BL >= 'A'?
    jge _ifChuHoa       ; Đ -> kiểm tra BL <= 'Z'?
    jmp _cmpChuThuong   ; S -> bỏ qua, kiểm tra BL >= 'a'?
_ifChuHoa:
    cmp bl, 'Z'         ; BL <= 'Z'?
    jg _cmpChuThuong    ; S -> bỏ qua, kiểm tra BL >= 'a'?
<<<<<<< HEAD
    lea dx, msgKyTuHoa  ; Đ -> BL là chữ hoa
=======
    lea dx, msgKyTuHoa  
>>>>>>> 2fa1882184c95ab05c5016dbda81309218ffa74f
    mov ah, 09h
    int 21h             
    jmp _endif       
_cmpChuThuong:
    cmp bl, 'a'         ; BL >= 'a'?
    jge _ifChuThuong    ; Đ -> kiểm tra BL <= 'z'?
    jmp _cmpKySo        ; S -> bỏ qua, kiểm tra BL >= '1'?
_ifChuThuong:
    cmp bl, 'z'         ; BL <= 'z'?
    jg _cmpKySo         ; S -> bỏ qua, kiểm tra BL >= '1'?    
    lea dx, msgKyTuThuong
    mov ah, 09h         ; Đ -> BL là chữ thường
    int 21h             
    jmp _endif  
_cmpKySo:
    cmp bl, '1'         ; BL >= '1'?
<<<<<<< HEAD
    jge _ifKySo         ; Đ -> kiểm tra BL <= '9'?
=======
    jge _ifKySo         ; Đ -> kiểm tra BL <= 'z'?
>>>>>>> 2fa1882184c95ab05c5016dbda81309218ffa74f
    jmp _else           ; S -> bỏ qua, nhảy đến trg.hợp else
_ifKySo:
    cmp bl, '9'         ; BL <= '9'?
    je _else            ; S -> bỏ qua, nhảy đến trg.hợp else
    lea dx, msgKySo     ; Đ -> BL là ký số
    mov ah, 09h
    int 21h             
    jmp _endif               
_else:    
    lea dx, msgElse
    mov ah, 09h
    int 21h              
_endif:
    mov ah, 4ch         ; return ve DOS
    int 21h
endp 
end main