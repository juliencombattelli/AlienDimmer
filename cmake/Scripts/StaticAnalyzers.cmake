# Cppcheck was supported in CMake 3.10 but Clang-tidy make it only in 3.12
cmake_minimum_required(VERSION 3.12)

option(ENABLE_CPPCHECK "Enable static analysis with cppcheck" OFF)
if(ENABLE_CPPCHECK)
    find_program(CPPCHECK cppcheck)
    if(CPPCHECK)
        set(CMAKE_CXX_CPPCHECK 
            ${CPPCHECK} 
                --suppress=missingInclude 
                --enable=all
                --inconclusive
        )
    else()
        message(SEND_ERROR "cppcheck requested but executable not found")
    endif()
endif()

option(ENABLE_CLANG_TIDY "Enable static analysis with clang-tidy" OFF)
if(ENABLE_CLANG_TIDY)
    find_program(CLANGTIDY clang-tidy)
    if(CLANGTIDY)
        set(CMAKE_CXX_CLANG_TIDY ${CLANGTIDY})
    else()
        message(SEND_ERROR "clang-tidy requested but executable not found")
    endif()
endif()

