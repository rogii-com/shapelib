
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=%1 -DCMAKE_INSTALL_PREFIX=%2 -G "Ninja" ..
ninja
ninja install
cd ..
rmdir /s /q build