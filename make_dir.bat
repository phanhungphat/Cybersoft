@echo off
setlocal enabledelayedexpansion

rem Lặp từ 1 đến 32
for /L %%i in (1,1,32) do (
    rem Định dạng số có 2 chữ số (01, 02, ..., 32)
    set "num=0%%i"
    set "num=!num:~-2!"

    rem Tạo thư mục Buoi_xx
    mkdir "Buoi_!num!"

    rem Tạo thư mục con
    mkdir "Buoi_!num!\de_bai"
    mkdir "Buoi_!num!\bai_lam"

    rem Tạo file README.md
    echo # Buoi_!num! > "Buoi_!num!\README.md"
)

echo Done!
pause
