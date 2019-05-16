@echo off
echo Cleaning all repositories...
for /D %%G in ("*") do (
 cd %%G
 if exist pom.xml (
  echo.
  echo.
  echo Cleaning %%G...
  echo.
  mvn clean
  @echo off
 )
 cd ..
)