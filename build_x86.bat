CALL %VS_ENV32_SETUP%

CALL build.bat Debug %ENV32_INSTALL%/shapelib
CALL build.bat RelWithDebInfo %ENV32_INSTALL%/shapelib
