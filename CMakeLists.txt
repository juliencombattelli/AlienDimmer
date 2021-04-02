cmake_minimum_required(VERSION 3.17)
project(AlienDimmer)

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

add_executable(aliendimmer src/main.cpp)
target_link_libraries(aliendimmer PRIVATE AlienFX::AlienFX)
target_enable_sanitizers(aliendimmer)
