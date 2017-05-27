INCLUDE(LibFindMacros)

FIND_PATH(Glog_INCLUDE_DIR
  NAMES
        glog/logging.h
  PATH_SUFFIXES
    include
  PATHS
      $ENV{Glog_DIR}
      /usr/
      /usr/local
)

FIND_LIBRARY(Glog_LIBRARY
  NAMES
    libglog.a glog
  PATH_SUFFIXES
    lib
    lib64
  PATHS
    $ENV{Glog_DIR}
    /usr/
    /usr/local
)

SET(Glog_PROCESS_INCLUDES Glog_INCLUDE_DIR)
SET(Glog_PROCESS_LIBS Glog_LIBRARY)
LIBFIND_PROCESS(Glog)
