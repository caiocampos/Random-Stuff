@echo off
echo fetching all repositories...
for /D %%G in ("*") do (echo. && echo. && echo fetching %%G... && echo.) && (cd %%G) && (git fetch -v --progress origin) && (cd ..)