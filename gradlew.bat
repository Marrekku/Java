@echo off
setlocal

REM Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

REM Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

:checkJava
set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% == 0 goto init
echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.
echo.
goto fail

:init
set PATH=%APP_HOME%\gradle\wrapper;%PATH%
set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.properties

:exec
if not ""%1"" == ""goto addParams
pushd %APP_HOME%
call gradle\wrapper\gradle-wrapper.properties %*
popd
goto end
:addParams
pushd %APP_HOME%
call gradle\wrapper\gradle-wrapper.properties %*
popd
goto end

:end
goto :eof

:fail
exit /b 1
