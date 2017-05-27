INCLUDE(LibFindMacros)

FIND_PATH(ZSTD_INCLUDE_DIR
  NAMES
    zstd.h
  PATH_SUFFIXES
    include
  PATHS
      $ENV{ZSTD_DIR}
      /usr/
      /usr/local
)

FIND_LIBRARY(ZSTD_LIBRARY
  NAMES 
        libzstd.a zstd
  PATH_SUFFIXES
    lib
    lib64
  PATHS
    $ENV{ZSTD_DIR}
    /usr/
    /usr/local
)

SET(ZSTD_PROCESS_INCLUDES ZSTD_INCLUDE_DIR)
SET(ZSTD_PROCESS_LIBS ZSTD_LIBRARY)
LIBFIND_PROCESS(ZSTD)
