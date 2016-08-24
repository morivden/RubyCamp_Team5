@setlocal

@for /F "delims=" %%I in ("%~dp0Ruby23") do @set devkit_root=%%~fI
@set PATH=%~dp0Ruby23\bin;%devkit_root%\bin;%devkit_root%\mingw\bin;%PATH%

@cd /d %~dp0src
@start %COMSPEC%
