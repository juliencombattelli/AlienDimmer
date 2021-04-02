if(CMAKE_HOST_WIN32)
    find_path(AlienFX_INCLUDE_DIR
        NAMES LFX2.h
        PATHS "[HKEY_LOCAL_MACHINE\\SOFTWARE\\Alienware\\Alienware Command Center;InstallPath]\\AlienFX SDK\\includes"
        DOC "The AlienFX SDK include directory"
        NO_DEFAULT_PATH
    )
endif()

find_path(AlienFX_INCLUDE_DIR
    NAMES LFX2.h
    DOC "The AlienFX SDK include directory"
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(AlienFX
    REQUIRED_VARS 
        AlienFX_INCLUDE_DIR
)

if(AlienFX_FOUND)
    set(AlienFX_INCLUDE_DIRS ${AlienFX_INCLUDE_DIR})
    message(STATUS "Found AlienFX includes: ${AlienFX_INCLUDE_DIRS}")
    if(NOT TARGET AlienFX::AlienFX)
        add_library(AlienFX::AlienFX INTERFACE IMPORTED)
        target_include_directories(AlienFX::AlienFX INTERFACE "${AlienFX_INCLUDE_DIRS}")
    endif()
endif()

mark_as_advanced(AlienFX_INCLUDE_DIR)