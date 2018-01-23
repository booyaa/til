@echo off
cls
:: useful for build server
:: usage: by_pass_execution_policy.cmd path/to/script.ps1 arg1..n
powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -File %*
