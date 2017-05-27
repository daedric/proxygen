
add_definitions(-g -W -Wall -Wextra -Wno-unused-parameter)
add_definitions(-Wno-missing-field-initializers -Wno-deprecated)
add_definitions(-DLIBMC_FBTRACE_DISABLE)

add_subdirectory(external)
add_subdirectory(lib)
add_subdirectory(httpserver)