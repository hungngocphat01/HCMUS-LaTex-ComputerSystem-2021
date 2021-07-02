Mã nguồn LaTeX của tài liệu ôn tập Hợp ngữ 8086 của lớp 19CTT4. 
Soạn vào tháng 07/2021. 

## Hướng dẫn build
Chỉ nên tự build nếu đã *rất quen* với cách compile LaTeX thủ công.
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

### C1: Sử dụng TeX toolchain và một trình soạn thảo TeX 
- Cài đặt một trình soạn thảo TeX như TeX Studio.
- Import file `main.tex` vào trình soạn thảo TeX vừa cài đặt.
- Cài đặt thư mục xuất file pdf là `build` (thay đổi tham số dòng lệnh trong cài đặt của trình soạn thảo).
  - Thay đổi tham số dòng lệnh của recipe `latexmk` và thêm tham số sau vào: `-outdir=build`.
- Build với recipe là `latexmk`.

### C2: Sử dụng TeX toolchain và GNU make
- Cách này được khuyến khích nếu sử dụng Linux hoặc macOS. Trên Windows để cài được python "cho đúng cách" và cái GNU make là cả một niềm đau (fck microsoft).
- Cài đặt GNU make.
  - Trên macOS: cài đặt Homebrew và chạy lệnh `brew install remake`.
  - Linux: cách cài đặt khác nhau tuỳ distro. Tự tham khảo.
- Sử dụng dòng lệnh:
```bash 
$ git clone ...
$ cd LaTex-ComputerSystem-2021
$ make
```
- File sau khi được build xong sẽ nằm trong thư mục `build` với tên `main.pdf`.

## Overleaf
- Không cần cài gì cả.
- Upload hết thư mục trên lên overleaf và nó sẽ tự compile được.
