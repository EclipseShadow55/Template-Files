@echo off
SETLOCAL
set NLM=^


set NL=^^^%NLM%%NLM%^%NLM%%NLM%
set "ACTIONS="
python --version 2>NUL
if errorlevel 1 goto NoPython

python pip install -r requirements.txt
if errorlevel 1 goto NoPip else set "ACTIONS=%ACTIONS%%NL%Installed requirements using pip"

goto end

:NoPython
echo Python not detected. Please install Python at this url
set /p "INPUT=Do you want this program to open a browser tab to python.org? (y/n): "
set "OPEN=%INPUT:~0,1%"
if %OPEN%==y start "" https://www.python.org/downloads/ else echo https://www.python.org/downloads/
if %OPEN%==y set "ACTIONS=%ACTIONS%, opened python downloads webpage"
goto end 

:NoPip
echo Pip not detected. Please install and configure it with this guide
set /p "INPUT=Do you want this program to open a browser tab to pip.pypa.oi? (y/n): "
set "OPEN=%INPUT:~0,1%"
if %OPEN%==y start "" https://pip.pypa.io/en/stable/installation/ else echo https://pip.pypa.io/en/stable/installation/
if %OPEN%==y set "ACTIONS=%ACTIONS%%NL%Opened pip installation guide webpage"
goto end

:end
echo Setup complete%NL%Actions taken:%actions%
set /p "INPUT=Press Enter to finish setup"
ENDLOCAL
