# CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(pow_lib)

# Platform-specific settings
if(IOS)
    set(CMAKE_OSX_ARCHITECTURES "arm64")
    set(CMAKE_OSX_DEPLOYMENT_TARGET "11.0" CACHE STRING "Minimum iOS deployment version")
    set(CMAKE_XCODE_ATTRIBUTE_ENABLE_BITCODE NO)
    set(CMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH NO)
    set(CMAKE_IOS_INSTALL_COMBINED YES)
elseif(ANDROID)
    # Android specific settings
    set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add compiler flags
if(MSVC)
    add_compile_options(/Zp16)
else()
    add_compile_options(-fpack-struct=16)
endif()

# Source files
set(SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(SOURCES
    ${SOURCE_DIR}/pow_lib.cpp
)

# Library type based on platform
if(ANDROID)
    add_library(pow_lib SHARED ${SOURCES})
else()
    add_library(pow_lib SHARED ${SOURCES})
endif()

# Include directories
target_include_directories(pow_lib PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/vendor
)

# Platform-specific properties
if(IOS)
    set_target_properties(pow_lib PROPERTIES
        FRAMEWORK TRUE
        MACOSX_FRAMEWORK_IDENTIFIER com.yourcompany.pow_lib
        MACOSX_FRAMEWORK_SHORT_VERSION_STRING "1.0.0"
        MACOSX_FRAMEWORK_BUNDLE_VERSION "1"
        XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer"
    )
elseif(ANDROID)
    target_link_libraries(pow_lib
        android
        log
    )
endif()