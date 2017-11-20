@ECHO OFF

REM
REM The script takes into account two variables: VS_ENV64_SETUP and ENV64_INSTALL.
REM ENV64_INSTALL specifies a prefix of path where to install the compiled library.
REM It is a required parameter for the script.
REM VS_ENV64_SETUP is an optional parameter and specifies a path to a binary/script
REM that will be executed before the compiling.
REM

SET START_TIME=%TIME%

IF DEFINED VS_ENV64_SETUP (
    CALL %VS_ENV64_SETUP%
)

IF NOT DEFINED ENV64_INSTALL (
    ECHO "You have to specify an install path via `ENV64_INSTALL' variable."
    EXIT /B 1
)

SET ARCH=amd64
SET BUILD=0

CALL build.bat Debug %ENV64_INSTALL%/shapelib-1.3.0-%ARCH%-%BUILD%%TAG%
CALL build.bat RelWithDebInfo %ENV64_INSTALL%/shapelib-1.3.0-%ARCH%-%BUILD%%TAG%

pushd %ENV64_INSTALL%
7z a .\shapelib-1.3.0-%ARCH%-%BUILD%%TAG%.7z .\shapelib-1.3.0-%ARCH%-%BUILD%%TAG%
rd /q /s .\shapelib-1.3.0-%ARCH%-%BUILD%%TAG%
popd

SET END_TIME=%TIME%

ECHO Start time = %START_TIME%, end time = %END_TIME%
