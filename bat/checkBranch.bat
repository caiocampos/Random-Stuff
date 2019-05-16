@echo off
echo Verifying all repositories...
set GITCOMMAND='git rev-parse --abbrev-ref HEAD'
set OK=1
for /D %%G in ("*") do (
 cd %%G
 if exist .git (
  for /f %%i in (%GITCOMMAND%) do (
   if not %%i == develop (
    set OK=0
    echo '%%G' is in branch '%%i'
   )
  )
 )
 cd ..
)
echo.
if %ok% == 1 (
 echo All repositories are ok
) else (
 echo Please check the list above
)
pause