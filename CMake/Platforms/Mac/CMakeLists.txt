# Copyright ❤️ 2025, Wow Play
include_guard(GLOBAL)

add_executable(${PROJECT_NAME})
target_compile_options(${PROJECT_NAME} PRIVATE
	-Wall
	-Wextra
	-Wpedantic
	-Werror
)