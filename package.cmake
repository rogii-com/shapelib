if(TARGET ShapeLib::library)
    return()
endif()

add_library(
    ShapeLib::library
    SHARED
    IMPORTED
)

if(MSVC)
    set_target_properties(
	ShapeLib::library
	PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelib.dll"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelibd.dll"
        IMPORTED_IMPLIB
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelib.lib"
        IMPORTED_IMPLIB_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelibd.lib"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/shapelib-1.3.0"
    )
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set_target_properties(
    	ShapeLib::library
    	PROPERTIES
        IMPORTED_LOCATION
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelib.so"
        IMPORTED_LOCATION_DEBUG
            "${CMAKE_CURRENT_LIST_DIR}/lib/shapelibd.so"
        INTERFACE_INCLUDE_DIRECTORIES
            "${CMAKE_CURRENT_LIST_DIR}/shapelib-1.3.0"
    )
endif()

install(
    FILES
	$<TARGET_FILE:ShapeLib::library>
    DESTINATION
        .
    COMPONENT
        CNPM_RUNTIME
)

