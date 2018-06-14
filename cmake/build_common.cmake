if(
    NOT DEFINED ROOT
    OR NOT DEFINED ARCH
)
    message(
        FATAL_ERROR
        "Assert: ROOT = ${ROOT}; ARCH = ${ARCH}"
    )
endif()

set(
    BUILD
    0
)

if(DEFINED ENV{BUILD_NUMBER})
    set(
        BUILD
        $ENV{BUILD_NUMBER}
    )
endif()

set(
    TAG
    ""
)

if(DEFINED ENV{TAG})
    set(
        TAG
        "$ENV{TAG}"
    )
endif()

set(
    PACKAGE_NAME
    "shapelib-1.3.0-${ARCH}-${BUILD}$ENV{TAG}"
)

set(
    DEBUG_PATH
    "${CMAKE_CURRENT_LIST_DIR}/../build/debug"
)

file(
    MAKE_DIRECTORY
    "${DEBUG_PATH}"
)

set(
    CMAKE_INSTALL_PREFIX
    ${ROOT}/${PACKAGE_NAME}
)

execute_process(
    COMMAND
        "${CMAKE_COMMAND}" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -G "Ninja" "../.."
    WORKING_DIRECTORY
        "${DEBUG_PATH}"
)

execute_process(
    COMMAND
        "${CMAKE_COMMAND}" --build . --target install
    WORKING_DIRECTORY
        "${DEBUG_PATH}"
)

set(
    RELEASE_PATH
    "${CMAKE_CURRENT_LIST_DIR}/../build/release"
)

file(
    MAKE_DIRECTORY
    "${RELEASE_PATH}"
)

execute_process(
    COMMAND
        "${CMAKE_COMMAND}" -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -G "Ninja" "../.."
    WORKING_DIRECTORY
        "${RELEASE_PATH}"
)

execute_process(
    COMMAND
        "${CMAKE_COMMAND}" --build . --target install
    WORKING_DIRECTORY
        "${RELEASE_PATH}"
)

file(
    REMOVE_RECURSE
    "${CMAKE_CURRENT_LIST_DIR}/../build/"
)

file(
    COPY
        package.cmake
    DESTINATION
        "${ROOT}/${PACKAGE_NAME}"
)

if(UNIX)
    execute_process(
        COMMAND
            ./split_debug_info.sh ${CMAKE_INSTALL_PREFIX}/lib/shapelib.so
        WORKING_DIRECTORY
            "${CMAKE_CURRENT_LIST_DIR}"
    )
endif()

execute_process(
    COMMAND
        "${CMAKE_COMMAND}" -E tar cf "${PACKAGE_NAME}.7z" --format=7zip -- "${PACKAGE_NAME}"
    WORKING_DIRECTORY
        "${ROOT}"
)