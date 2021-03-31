cmake_minimum_required(VERSION 3.17)
project(conan-test)

set(CMAKE_MODULE_PATH 
    ${CMAKE_SOURCE_DIR}/cmake/Scripts 
    ${CMAKE_CURRENT_LIST_DIR}/cmake/Modules 
    ${CMAKE_MODULE_PATH}
)

include(Conan)
include(Doxygen)
include(InterproceduralOptimization)
include(PrecompiledHeaders)
include(Sanitizers)
include(StaticAnalyzers)
include(Testing)
include(Warnings)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(math src/Math/Factorial.cpp)
target_include_directories(math PUBLIC include)
set_target_properties(math PROPERTIES PUBLIC_HEADER include/Math/Factorial.hpp)

install(
    TARGETS         math
    RUNTIME         DESTINATION bin
    LIBRARY         DESTINATION lib
    ARCHIVE         DESTINATION lib
    PUBLIC_HEADER   DESTINATION include/Math
    PRIVATE_HEADER  DESTINATION include/Math
)

find_package(fmt REQUIRED)
find_package(spdlog REQUIRED)

add_executable(intro src/main.cpp)
target_link_libraries(intro PRIVATE spdlog::spdlog fmt::fmt)

install(
    TARGETS         intro
    RUNTIME         DESTINATION bin
    LIBRARY         DESTINATION lib
    ARCHIVE         DESTINATION lib
)

if(ENABLE_TESTING)
    add_subdirectory(test)
endif()