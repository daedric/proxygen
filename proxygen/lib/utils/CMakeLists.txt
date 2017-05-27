find_package(PythonInterp)

set(GENERATED_SOURCES_ROOT
        ${CMAKE_CURRENT_BINARY_DIR}
)

set(GENERATED_SOURCES
        ${GENERATED_SOURCES_ROOT}/TraceEventType.h
        ${GENERATED_SOURCES_ROOT}/TraceEventType.cpp
        ${GENERATED_SOURCES_ROOT}/TraceFieldType.h
        ${GENERATED_SOURCES_ROOT}/TraceFieldType.cpp
)

add_custom_command(
    OUTPUT
        ${GENERATED_SOURCES}
    COMMAND
        ${PYTHON_EXECUTABLE}
            ${CMAKE_CURRENT_SOURCE_DIR}/gen_trace_event_constants.py
                --output_type=cpp
                --input_files=${CMAKE_CURRENT_SOURCE_DIR}/TraceEventType.txt,${CMAKE_CURRENT_SOURCE_DIR}/TraceFieldType.txt
                --output_scope=proxygen
                --header_path=proxygen/lib/utils
                --install_dir=${CMAKE_CURRENT_BINARY_DIR}
                --fbcode_dir=${CMAKE_CURRENT_BINARY_DIR}
    DEPENDS
        ${CMAKE_CURRENT_SOURCE_DIR}/TraceEventType.txt
        ${CMAKE_CURRENT_SOURCE_DIR}/TraceFieldType.txt
    WORKING_DIRECTORY
        ${CMAKE_CURRENT_BINARY_DIR}
)

#find_package(Brotli REQUIRED)
find_package(ZSTD REQUIRED)

set(SRCS
        ${GENERATED_SOURCES}
        AsyncTimeoutSet.cpp
        Base64.cpp
#        BrotliStreamDecompressor.cpp
        ChromeUtils.cpp
        CryptUtil.cpp
        Exception.cpp
        HTTPTime.cpp
        Logging.cpp
        ParseURL.cpp
        RendezvousHash.cpp
        Time.cpp
        TraceEvent.cpp
        TraceEventContext.cpp
        WheelTimerInstance.cpp
        ZlibStreamCompressor.cpp
        ZlibStreamDecompressor.cpp
        ZstdStreamDecompressor.cpp
)

add_library(proxygen_utils ${SRCS})
target_include_directories(proxygen_utils PUBLIC ${OPENSSL_INCLUDE_DIR})
target_include_directories(proxygen_utils PUBLIC ${Brotli_INCLUDE_DIR})
target_include_directories(proxygen_utils PUBLIC ${ZSTD_INCLUDE_DIR})
target_include_directories(proxygen_utils PUBLIC ${Glog_INCLUDE_DIR})

target_link_libraries(proxygen_utils httpparser ${Brotli_LIBRARIES} ${ZSTD_LIBRARIES} ${PROXYGEN_DEPENDENCIES})