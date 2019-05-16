@echo off
echo Pulling all repositories...
for /D %%G in ("*") do (
 cd %%G
 if exist .git (
  echo.
  echo.
  echo Pulling %%G...
  echo.
  git pull --progress -v --no-rebase origin
 )
 cd ..
)