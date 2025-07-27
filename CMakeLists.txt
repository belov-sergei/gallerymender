# Copyright ❤️ 2025, Wow Play

# Requires CMake 3.21 or higher for support CMake presets version 3.
cmake_minimum_required(VERSION 3.21)

project(GalleryMender)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include("${CMAKE_SOURCE_DIR}/CMake/FileHelpers.cmake")
include("${CMAKE_SOURCE_DIR}/CMake/Platforms/${PROJECT_PLATFORM}/CMakeLists.txt")

FIND_FILES(SOURCE_FILES
	"${CMAKE_SOURCE_DIR}/Source/*"
	"!${CMAKE_SOURCE_DIR}/Source/Platforms/*"
	"${CMAKE_SOURCE_DIR}/Source/Platforms/${PROJECT_PLATFORM}/*"
	"!${CMAKE_SOURCE_DIR}/Source/*.xml"
	"!${CMAKE_SOURCE_DIR}/Source/*.java"
	"!${CMAKE_SOURCE_DIR}/Source/*.gradle"
)

target_sources(${PROJECT_NAME} PRIVATE "${SOURCE_FILES}")

target_include_directories(${PROJECT_NAME} PRIVATE
	"${CMAKE_SOURCE_DIR}/Source"
	"${CMAKE_SOURCE_DIR}/Source/Platforms/${PROJECT_PLATFORM}"
)

target_precompile_headers(${PROJECT_NAME} PRIVATE "${CMAKE_SOURCE_DIR}/Source/PCH.h")