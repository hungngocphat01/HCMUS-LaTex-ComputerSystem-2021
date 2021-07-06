; Bai 1: Nhap vao mot ki tu va in ra ki tu lien truoc, lien sau
.data
    msgNhapKiTu db "Hay nhap vao mot ki tu: $"
    msgKiTuLienTruoc db 10,13, "Ki tu lien truoc la: $"
    msgKiTuLienSau db 10, 13, "Ki tu lien sau la: $"    
    ; 10, 13 la ma ASCII cua \r va \n
.code                                       
main proc 
    mov ax, @data       ; Nap data vao data segment
    mov ds, ax                                     
    
    mov ah, 09h
    lea dx, msgNhapKiTu 
    int 21h             ; In thong bao nhap ki tu
    
    mov ah, 01h         ; Nhap ki tu tu ban phim
    int 21h             ; Mac dinh luu vao AL  
    mov bl, al          ; Sap toi se goi int 21h nen ax co the se bi thay doi, nen backup lai                      
       
    mov ah, 09h
    lea dx, msgKiTuLienTruoc
    int 21h             ; In thong bao ki tu lien truoc
    
    mov ah, 02h                       
    mov dl, bl
    dec dl
    int 21h             ; In ki tu lien truoc 
    
    mov ah, 09h
    lea dx, msgKiTuLienSau
    int 21h             ; In thong bao ki tu lien sau
    
    mov ah, 02h                       
    mov dl, bl
    inc dl
    int 21h             ; In ki tu lien sau 
    
    mov ah, 4ch         ; return ve DOS
    int 21h
endp 
end main