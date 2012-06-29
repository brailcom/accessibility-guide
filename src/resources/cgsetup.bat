@ECHO OFF
REM --------------------------------------------------------------------------
REM batch file to automate setup of Cygwin for GTypist

SETLOCAL
  FOR /F %%D in ("%CD%") DO SET DRIVE=%%~dD

SET DFLTSITE=http://mirror.csclub.uwaterloo.ca/cygwin/

  SET DFLTLOCALDIR=%CD%/download
  SET DFLTROOTDIR=%DRIVE%/cygwin

  SET SITE=-s %DFLTSITE%
  SET LOCALDIR=-l %DFLTLOCALDIR%
  SET ROOTDIR=-R %DFLTROOTDIR%

SET PACKAGES=-P gtypist

setup -q -n -D -L %SITE% %LOCALDIR% %PACKAGES%

ECHO Cygwin installation is completed

ENDLOCAL

EXIT /B 0