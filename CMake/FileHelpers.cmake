# Copyright ❤️ 2025, Wow Play
include_guard(GLOBAL)

# Finds files based on the provided paths and appends them to the specified output variable.
# Patterns starting with "!" exclude matched files from the final list.
function(FIND_FILES OUT_RESULT)
	set(FOUND_FILES "")

	foreach(PATTERN IN LISTS ARGN)
		set(EXCLUDE FALSE)

		if("${PATTERN}" MATCHES "^!")
			set(EXCLUDE TRUE)

			string(SUBSTRING "${PATTERN}" 1 -1 PATTERN)
		endif()

		file(GLOB_RECURSE MATCHED_FILES CONFIGURE_DEPENDS "${PATTERN}")
		if(EXCLUDE)
			list(REMOVE_ITEM FOUND_FILES ${MATCHED_FILES})
		else()
			if(MATCHED_FILES)
				list(APPEND FOUND_FILES ${MATCHED_FILES})
			else()
				message(WARNING "No files matched the pattern '${PATTERN}'")
			endif()
		endif()
	endforeach()

	list(APPEND FOUND_FILES ${${OUT_RESULT}})
	list(REMOVE_DUPLICATES FOUND_FILES)
	list(SORT FOUND_FILES)

	set(${OUT_RESULT} ${FOUND_FILES} PARENT_SCOPE)
endfunction()
