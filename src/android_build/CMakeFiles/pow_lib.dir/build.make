# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.29.3/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.29.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/fosse/dev/nanopow/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/fosse/dev/nanopow/src/android_build

# Include any dependencies generated for this target.
include CMakeFiles/pow_lib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/pow_lib.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/pow_lib.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/pow_lib.dir/flags.make

CMakeFiles/pow_lib.dir/pow_lib.cpp.o: CMakeFiles/pow_lib.dir/flags.make
CMakeFiles/pow_lib.dir/pow_lib.cpp.o: /Users/fosse/dev/nanopow/src/pow_lib.cpp
CMakeFiles/pow_lib.dir/pow_lib.cpp.o: CMakeFiles/pow_lib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/fosse/dev/nanopow/src/android_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/pow_lib.dir/pow_lib.cpp.o"
	/Users/fosse/Library/Android/sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/Users/fosse/Library/Android/sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/darwin-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/pow_lib.dir/pow_lib.cpp.o -MF CMakeFiles/pow_lib.dir/pow_lib.cpp.o.d -o CMakeFiles/pow_lib.dir/pow_lib.cpp.o -c /Users/fosse/dev/nanopow/src/pow_lib.cpp

CMakeFiles/pow_lib.dir/pow_lib.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/pow_lib.dir/pow_lib.cpp.i"
	/Users/fosse/Library/Android/sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/Users/fosse/Library/Android/sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/darwin-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/fosse/dev/nanopow/src/pow_lib.cpp > CMakeFiles/pow_lib.dir/pow_lib.cpp.i

CMakeFiles/pow_lib.dir/pow_lib.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/pow_lib.dir/pow_lib.cpp.s"
	/Users/fosse/Library/Android/sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang++ --target=aarch64-none-linux-android21 --sysroot=/Users/fosse/Library/Android/sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/darwin-x86_64/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/fosse/dev/nanopow/src/pow_lib.cpp -o CMakeFiles/pow_lib.dir/pow_lib.cpp.s

# Object files for target pow_lib
pow_lib_OBJECTS = \
"CMakeFiles/pow_lib.dir/pow_lib.cpp.o"

# External object files for target pow_lib
pow_lib_EXTERNAL_OBJECTS =

libpow_lib.so: CMakeFiles/pow_lib.dir/pow_lib.cpp.o
libpow_lib.so: CMakeFiles/pow_lib.dir/build.make
libpow_lib.so: CMakeFiles/pow_lib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/fosse/dev/nanopow/src/android_build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libpow_lib.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pow_lib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/pow_lib.dir/build: libpow_lib.so
.PHONY : CMakeFiles/pow_lib.dir/build

CMakeFiles/pow_lib.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/pow_lib.dir/cmake_clean.cmake
.PHONY : CMakeFiles/pow_lib.dir/clean

CMakeFiles/pow_lib.dir/depend:
	cd /Users/fosse/dev/nanopow/src/android_build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/fosse/dev/nanopow/src /Users/fosse/dev/nanopow/src /Users/fosse/dev/nanopow/src/android_build /Users/fosse/dev/nanopow/src/android_build /Users/fosse/dev/nanopow/src/android_build/CMakeFiles/pow_lib.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/pow_lib.dir/depend

