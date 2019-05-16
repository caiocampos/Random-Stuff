@echo off
echo Fetching all repositories...
for /D %%G in ("*") do (
 cd %%G
 if exist .git (
  echo.
  echo.
  echo Fetching %%G...
  echo.
  git fetch -v --progress origin
 )
 cd ..
)