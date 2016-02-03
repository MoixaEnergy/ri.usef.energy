@echo off

@if not "%ECHO%" == ""  echo %ECHO%
@if "%OS%" == "Windows_NT" setlocal

if "%OS%" == "Windows_NT" (
  set "DIRNAME=%~dp0%"
) else (
  set DIRNAME=.\
)

set USEF_TOOL="target\usef-environment-tool-*-jar-with-dependencies.jar"

rem Get the program name before using shift as the command modify the variable ~nx0
if "%OS%" == "Windows_NT" (
  set "PROGNAME=%~nx0%"
) else (
  set "PROGNAME=standalone.bat"
)

call java -version > nul 2> nul || set JAVA_ERROR=1
if defined JAVA_ERROR (
  echo Java can not be started. It can not be found on the Windows PATH. It looks like it is not installed.
  echo.
  echo If not installed, download and install Java from the website:
  echo.
  echo    http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html#javasejdk
  echo.
)


rem if Maven does not exist, show an error on the screen.
call mvn -version > nul 2> nul || set MVN_ERROR=1
if defined MVN_ERROR (
  echo Maven can not be started. It can not be found on the Windows PATH. It looks like it is not installed.
  echo.
  echo If not installed, download and install Maven from the website:
  echo.
  echo    http://maven.apache.org/download.cgi
  echo.
)

pushd ..\..\usef-build

:buildUSEF
if "%1"=="-skipBuild" goto deploy
echo.
echo ====================================================================================================
echo Building USEF... 
echo ====================================================================================================
echo.

call mvn clean install -DskipTests -P demo %*
if %errorlevel% neq 0 goto error

:deploy
cd .\usef-deployments

cd .\usef-deployment-agr
call mvn wildfly:deploy
if %errorlevel% neq 0 goto error
cd ..\

cd .\usef-deployment-brp
call mvn wildfly:deploy
if %errorlevel% neq 0 goto error
cd ..\

cd .\usef-deployment-dso
call mvn wildfly:deploy
if %errorlevel% neq 0 goto error
cd ..\

cd .\usef-deployment-mdc
call mvn wildfly:deploy
if %errorlevel% neq 0 goto error
cd ..\

cd .\usef-deployment-cro
call mvn wildfly:deploy
if %errorlevel% neq 0 goto error
cd ..\

echo.
echo.
echo.

:error
echo.
echo Something went wrong building the USEF environtment tooling.
echo.
popd
exit /b 1

:end
popd
