INCLUDE(LibFindMacros)

FIND_PATH(Wangle_INCLUDE_DIR
  NAMES
    wangle/acceptor/Acceptor.h
  PATH_SUFFIXES
    include
  PATHS
      $ENV{Wangle_DIR}
      /usr/
      /usr/local
)

FIND_LIBRARY(Wangle_LIBRARY
  NAMES 
    libwangle.a wangle
  PATH_SUFFIXES
    lib
    lib64
  PATHS
    $ENV{Wangle_DIR}
    /usr/
    /usr/local
)

SET(Wangle_PROCESS_INCLUDES Wangle_INCLUDE_DIR)
SET(Wangle_PROCESS_LIBS Wangle_LIBRARY)
LIBFIND_PROCESS(Wangle)
