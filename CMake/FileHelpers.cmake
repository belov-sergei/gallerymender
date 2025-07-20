# Copyright ❤️ 2025, Wow Play
include_guard(GLOBAL)

# Finds files based on the provided paths and appends them to the specified output variable.
# Patterns starting with "!" exclude matched files from the final list.
function(FindFiles OutResult)
	set(FoundFiles "")

	foreach(Pattern IN LISTS ARGN)
		set(Exclude FALSE)

		if("${Pattern}" MATCHES "^!")
			set(Exclude TRUE)

			string(SUBSTRING "${Pattern}" 1 -1 Pattern)
		endif()

		file(GLOB_RECURSE MatchedFiles CONFIGURE_DEPENDS "${Pattern}")
		if(Exclude)
			list(REMOVE_ITEM FoundFiles ${MatchedFiles})
		else()
			if(MatchedFiles)
				list(APPEND FoundFiles ${MatchedFiles})
			else()
				message(WARNING "No files matched the pattern '${Pattern}'")
			endif()
		endif()
	endforeach()

	list(APPEND FoundFiles ${${OutResult}})
	list(REMOVE_DUPLICATES FoundFiles)
	list(SORT FoundFiles)

	set(${OutResult} ${FoundFiles} PARENT_SCOPE)
endfunction()
