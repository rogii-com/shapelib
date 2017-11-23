@ECHO OFF

REM
REM The script takes into account two variables: VS_ENV32_SETUP and ENV32_INSTALL.
REM ENV32_INSTALL specifies a prefix of path where to install the compiled library.
REM It is a required parameter for the script.
REM VS_ENV32_SETUP is an optional parameter and specifies a path to a binary/script
REM that will be executed before the compiling.
REM

SET START_TIME=%TIME%

IF DEFINED VS_ENV32_SETUP (
    CALL %VS_ENV32_SETUP%
)

IF NOT DEFINED ENV32_INSTALL (
    ECHO "You have to specify an install path via `ENV32_INSTALL' variable."
    EXIT /B 1
)

SET ARCH=x86
SET BUILD=0
SET PACKAGE_NAME=shapelib-1.3.0-%ARCH%-%BUILD%%TAG%
SET ROOT=%ENV32_INSTALL%

CALL build.bat Debug %ROOT%\%PACKAGE_NAME%
CALL build.bat RelWithDebInfo %ROOT%\%PACKAGE_NAME%

xcopy /Y .\package.cmake %ROOT%\%PACKAGE_NAME%

pushd %ROOT%

REM fix name
pushd %PACKAGE_NAME%
rename Win32 lib
popd

7z a .\%PACKAGE_NAME%.7z .\%PACKAGE_NAME%
rd /q /s .\%PACKAGE_NAME%
popd

SET END_TIME=%TIME%

ECHO Start time = %START_TIME%, end time = %END_TIME%
