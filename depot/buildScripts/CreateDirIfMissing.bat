@echo off
if "%verbose%" == "true" echo on
setlocal

if not exist %* (
    mkdir %*
)