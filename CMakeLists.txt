cmake_minimum_required(VERSION 3.17)
project(conan-test)

set(CMAKE_MODULE_PATH 
    ${CMAKE_CURRENT_LIST_DIR}/cmake/Scripts
    ${CMAKE_CURRENT_LIST_DIR}/cmake/Modules
    ${CMAKE_MODULE_PATH}
)

include(Doxygen)
include(Sanitizers)
include(StaticAnalyzers)
include(Warnings)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(AlienFX REQUIRED)

if(ENABLE_TESTING)
    add_subdirectory(test)
endif()