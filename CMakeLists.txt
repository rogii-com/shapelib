cmake_minimum_required(VERSION 2.8.8)

project(shapelib)

set(CMAKE_DEBUG_POSTFIX "d")
if(MSVC)
    add_definitions(-DSHAPELIB_DLLEXPORT)
endif()

add_library(
    shapelib
    SHARED
    shapefil.h
    dbfopen.c
    safileio.c
    shpopen.c
    shptree.c
)

set_target_properties(
    ${PROJECT_NAME}
    PROPERTIES
        PREFIX
        ""
)

install(
    TARGETS
        shapelib
    DESTINATION
        ./lib
)

install(
    FILES
        shapefil.h
    DESTINATION
        ./shapelib-1.3.0)
