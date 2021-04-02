cmake_minimum_required(VERSION 3.13)

function(target_enable_sanitizers TARGET_NAME)
    
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
        set(SUPPORTED_SANITIZERS "address" "memory" "undefined" "thread")
        set(SANITIZE_COMPILE_OPTION "-fsanitize")
        set(SANITIZE_LINK_OPTION "-fsanitize")
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        set(SUPPORTED_SANITIZERS "address")
        set(SANITIZE_COMPILE_OPTION "/fsanitize")
    else()
        set(SUPPORTED_SANITIZERS "")
        message(VERBOSE "Sanitizers not supported for compiler of type ${CMAKE_CXX_COMPILER_ID}")
    endif()

    if (NOT TARGET ${TARGET_NAME})
        message(FATAL_ERROR "${TARGET_NAME} is not a valid target")
    endif()

    set(SANITIZERS "")

    foreach(sanitizer IN LISTS SUPPORTED_SANITIZERS)
        option(${TARGET_NAME}_SANITIZE_${sanitizer} "Enable sanitizer '${sanitizer}' for target ${TARGET_NAME}" OFF)
        if (${TARGET_NAME}_SANITIZE_${sanitizer})
            list(APPEND SANITIZERS "${sanitizer}")
        endif()
    endforeach()
    
    list(JOIN SANITIZERS "," LIST_OF_SANITIZERS)

    if(LIST_OF_SANITIZERS)
        if(NOT "${LIST_OF_SANITIZERS}" STREQUAL "")
            if(SANITIZE_COMPILE_OPTION)
                target_compile_options(${TARGET_NAME} PRIVATE ${SANITIZE_COMPILE_OPTION}=${LIST_OF_SANITIZERS})
            endif()
            if(SANITIZE_LINK_OPTION)
                target_link_options(${TARGET_NAME} PRIVATE ${SANITIZE_LINK_OPTION}=${LIST_OF_SANITIZERS})
            endif()
        endif()
    endif()

endfunction()