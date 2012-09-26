@echo off
setlocal

if not exist %* (
    mkdir %*
)