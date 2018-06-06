if(TARGET ShapeLib::library)
    return()
endif()

add_library(
    ShapeLib::library
    SHARED
    IMPORTED
)

set_target_properties(
    ShapeLib::library
    PROPERTIES
	if (MSVC)
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelib.dll"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelibd.dll"
        IMPORTED_IMPLIB
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelib.lib"
        IMPORTED_IMPLIB_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelibd.lib"
	else
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelib.so"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelibd.so"
	endif()
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/shapelib-1.3.0"
)
