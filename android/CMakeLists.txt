# cmake_minimum_required(VERSION 3.4.1) # For example.

# add_library(pow_lib

#   # Sets the library as a shared library.
#   SHARED

#   # Provides a relative path to your source file(s).
#   ../ios/Classes/pow_lib.cpp)









# cmake_minimum_required(VERSION 3.4.1)
# project(pow_lib)

# # Set path to your source files relative to the CMakeLists.txt location
# add_library(pow_lib SHARED
#     ${CMAKE_CURRENT_SOURCE_DIR}/../src/pow_lib.cpp
#     ${CMAKE_CURRENT_SOURCE_DIR}/../src/vendor/blake2/blake2b-ref.cpp
# )

# # Include directories
# target_include_directories(pow_lib PRIVATE
#     ${CMAKE_CURRENT_SOURCE_DIR}/../vendor
# )

# # Set properties
# set_target_properties(pow_lib PROPERTIES
#     CXX_STANDARD 14
#     CXX_STANDARD_REQUIRED YES
#     CXX_EXTENSIONS NO
# )

# # Add compile options
# target_compile_options(pow_lib PRIVATE
#     -fvisibility=hidden
#     -fPIC
# )




cmake_minimum_required(VERSION 3.4.1)
project(pow_lib)

# Set output directories
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../android/src/main/jniLibs/${ANDROID_ABI})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add compiler flags
if(MSVC)
    add_compile_options(/Zp16)
else()
    add_compile_options(-fpack-struct=16)
endif()

# Set source files directory
# set(SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../src)

# # Add source files
# add_library(pow_lib SHARED
#     ${SOURCE_DIR}/pow_lib.cpp
# )

# Source files
set(SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../src)
set(SOURCES
    ${SOURCE_DIR}/pow_lib.cpp
)



if(ANDROID)
    add_library(pow_lib SHARED ${SOURCES})
else()
    add_library(pow_lib SHARED ${SOURCES})
endif()

# Include directories
target_include_directories(pow_lib PRIVATE
    ${SOURCE_DIR}
    ${SOURCE_DIR}/vendor
)

target_link_libraries(pow_lib
    android
    log
)

# Set properties
set_target_properties(pow_lib PROPERTIES
    CXX_STANDARD 14
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
)

# Add compile options
target_compile_options(pow_lib PRIVATE
    -fvisibility=hidden
    -fPIC
)