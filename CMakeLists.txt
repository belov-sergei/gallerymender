# Copyright ❤️ 2025, Wow Play

# Requires CMake 3.21 or higher for support CMake presets version 3.
cmake_minimum_required(VERSION 3.20)

include("${CMAKE_SOURCE_DIR}/CMake/FileHelpers.cmake")

set(ProjectName "Jigsawville")
project("${ProjectName}")

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(MSVC)
	add_compile_options(/W4 /WX)
else()
	add_compile_options(-Wall -Wextra -Wpedantic -Werror)
endif()

set(TargetType "")
include("${CMAKE_SOURCE_DIR}/CMake/Platforms/${ProjectPlatform}/CMakeLists.txt")

FindFiles(SourceFiles
	"${CMAKE_SOURCE_DIR}/Source/*"
	"!${CMAKE_SOURCE_DIR}/Source/Platforms/*"
	"${CMAKE_SOURCE_DIR}/Source/Platforms/${ProjectPlatform}/*"
)

if("${TargetType}" STREQUAL "STATIC" OR "${TargetType}" STREQUAL "SHARED" OR "${TargetType}" STREQUAL "INTERFACE")
	add_library("${ProjectName}" "${SourceFiles}")
else()
	add_executable("${ProjectName}" "${TargetType}" "${SourceFiles}")
endif()

target_include_directories("${ProjectName}" PRIVATE "${CMAKE_SOURCE_DIR}/Source")
target_include_directories("${ProjectName}" PRIVATE "${CMAKE_SOURCE_DIR}/Source/Platforms/${ProjectPlatform}")

target_precompile_headers("${ProjectName}" PRIVATE "${CMAKE_SOURCE_DIR}/Source/PCH.h")