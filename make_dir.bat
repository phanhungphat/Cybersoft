@echo off
setlocal enabledelayedexpansion

rem Lặp qua tất cả thư mục bắt đầu bằng "Buoi_"
for /d %%f in (Buoi_*) do (
    mkdir "%%f\tai_lieu"
)

echo Done!
pause
