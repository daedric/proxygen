INCLUDE(LibFindMacros)

FIND_PATH(Folly_INCLUDE_DIR
  NAMES
    folly/VersionCheck.h
  PATH_SUFFIXES
    include
  PATHS
      $ENV{Folly_DIR}
      /usr/
      /usr/local
)

FIND_LIBRARY(Folly_LIBRARY
  NAMES
    libfolly.a folly
  PATH_SUFFIXES
    lib
    lib64
  PATHS
    $ENV{Folly_DIR}
    /usr/
    /usr/local
)

SET(Folly_PROCESS_INCLUDES Folly_INCLUDE_DIR)
SET(Folly_PROCESS_LIBS Folly_LIBRARY)
LIBFIND_PROCESS(Folly)
