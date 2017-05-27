INCLUDE(LibFindMacros)

FIND_PATH(LibEvent_INCLUDE_DIR
  NAMES
    event.h
  PATH_SUFFIXES
    include
  PATHS
      $ENV{LibEvent_DIR}
      /usr/
      /usr/local
)

FIND_LIBRARY(LibEvent_LIBRARY
  NAMES
    libevent.a event
  PATH_SUFFIXES
    lib
    lib64
  PATHS
    $ENV{LibEvent_DIR}
    /usr/
    /usr/local
)

SET(LibEvent_PROCESS_INCLUDES LibEvent_INCLUDE_DIR)
SET(LibEvent_PROCESS_LIBS LibEvent_LIBRARY)
LIBFIND_PROCESS(LibEvent)
