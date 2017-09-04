cmake_minimum_required(VERSION 2.8.8)

project(shapelib)

set(CMAKE_DEBUG_POSTFIX "d")
add_definitions(-DSHAPELIB_DLLEXPORT)

add_library(
    shapelib
	SHARED
	shapefil.h
	dbfopen.c
	safileio.c
	shpopen.c
	shptree.c
)
set(INSTALL_POSTFIX "Win32")
if(${CMAKE_SIZEOF_VOID_P} EQUAL 8)
	set(INSTALL_POSTFIX "x64")
endif()

install(TARGETS shapelib
        DESTINATION ${CMAKE_INSTALL_PREFIX}/${INSTALL_POSTFIX}
 )

install(FILES shapefil.h DESTINATION ${CMAKE_INSTALL_PREFIX}/shapelib-1.3.0)