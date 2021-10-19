cmake_minimum_required(VERSION 3.12.0)

project(shapelib)

set(
    ROGII_FOLDER_PATH
    "${CMAKE_CURRENT_LIST_DIR}/rogii"
)
include(${ROGII_FOLDER_PATH}/npm/Include.cmake)
include(${ROGII_FOLDER_PATH}/environment.cmake)

CNPM_PREPARE_PACKAGES(
    DEFAULT_REPOSITORY_URLS
    "$ENV{CNPM_URLS}"
)

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
