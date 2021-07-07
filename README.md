Mã nguồn LaTeX của tài liệu ôn tập Hợp ngữ 8086 của lớp 19CTT4. 
Soạn vào tháng 07/2021. 

## Hướng dẫn build
Chỉ nên tự build nếu đã *rất quen* với cách compile LaTeX thủ công (đặc biệt là xử lý các lỗi liên quan đến path như của thằng package `minted`).  
Có rất nhiều cách build khác nhau, nhưng tốt nhất nên sử dụng TeX Studio cùng với recipe latexmk. Lệnh để compile đã được đóng gói trong `makefile`.
- Clone về.
- Cài đặt một bộ toolchain để compile LaTeX như TeX Live, MikTeX hay MacTeX (trên macOS/OS X).
- Cài đặt Python (một cách thích hợp) và cài `pygmentize` từ `pip`:
```bash
# Lệnh của Windogs:
C:\Windoze\System32> pip install pygmentize
```

```bash
# Lệnh trên Linux và macOS
$ pip3 install pygmentize
```
- Cài đặt GNU make.
  - macOS: cài đặt Homebrew và chạy lệnh `brew install remake`.
  - Linux: cách cài đặt khác nhau tuỳ distro. Tự tham khảo.
  - Windows: cài MinGW.
- Sử dụng dòng lệnh:
```bash 
$ git clone ...
$ cd LaTex-ComputerSystem-2021
$ make
```
- File sau khi được build xong sẽ nằm trong thư mục `build` với tên `main.pdf`.

