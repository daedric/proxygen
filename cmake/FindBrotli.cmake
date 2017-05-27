INCLUDE(LibFindMacros)

FIND_PATH(Brotli_INCLUDE_DIR
  NAMES
    brotli/encode.h
  PATH_SUFFIXES
    include
  PATHS
      $ENV{BROTLI_DIR}
      /usr/
      /usr/local
)

FIND_LIBRARY(Brotli_common_LIBRARY
  NAMES
    libbrotlicommon.a brotlicommon
  PATH_SUFFIXES
    lib
    lib64
  PATHS
    $ENV{BROTLI_DIR}
    /usr/
    /usr/local
)

FIND_LIBRARY(Brotli_enc_LIBRARY
    NAMES
      libbrotlienc.a brotlienc
    PATH_SUFFIXES
      lib
      lib64
    PATHS
      $ENV{BROTLI_DIR}
      /usr/
      /usr/local
)

FIND_LIBRARY(Brotli_dec_LIBRARY
    NAMES
      libbrotlidec.a brotlidec
    PATH_SUFFIXES
      lib
      lib64
    PATHS
      $ENV{BROTLI_DIR}
      /usr/
      /usr/local
)

SET(Brotli_PROCESS_INCLUDES Brotli_INCLUDE_DIR)
SET(Brotli_PROCESS_LIBS Brotli_enc_LIBRARY Brotli_dec_LIBRARY Brotli_common_LIBRARY)
LIBFIND_PROCESS(Brotli)
