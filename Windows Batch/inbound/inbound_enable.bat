@echo off
chcp 65001 >nul

netsh advfirewall firewall set rule name="minc" new enable=yes

echo 인바운드 규칙이 활성화되었습니다.
pause
