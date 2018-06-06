IF DEFINED VS_ENV64_SETUP ( 
    execute_process(
	COMMAND
	"%VS_ENV64_SETUP%"
	)
)
 
execute_process(
    COMMAND
        "${CMAKE_COMMAND}" -E time "${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_LIST_DIR}/cmake/build_amd64.cmake"
)
