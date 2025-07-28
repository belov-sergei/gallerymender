# Copyright ❤️ 2025, Wow Play
include_guard(GLOBAL)

set(CMAKE_OSX_SYSROOT iphoneos)

add_executable(${PROJECT_NAME} MACOSX_BUNDLE)

set_target_properties(${PROJECT_NAME} PROPERTIES
	XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "com.wowplay.gallerymender"
	XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_SOURCE_DIR}/Source/Platforms/IOS/Info.plist"
)

target_compile_options(${PROJECT_NAME} PRIVATE
	-Wall
	-Wextra
	-Wpedantic
	-Werror
)

target_link_libraries(${PROJECT_NAME} PRIVATE
	"-framework Foundation"
	"-framework UIKit"
)