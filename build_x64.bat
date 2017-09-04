CALL %VS_ENV64_SETUP%

CALL build.bat Debug %ENV64_INSTALL%/shapelib
CALL build.bat RelWithDebInfo %ENV64_INSTALL%/shapelib

