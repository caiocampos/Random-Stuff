@echo off
echo cleaning all repositories...
for /D %%G in ("*") do (echo. && echo. && echo cleaning %%G... && echo.) && (cd %%G) && (mvn clean) && (@echo off) && (cd ..)