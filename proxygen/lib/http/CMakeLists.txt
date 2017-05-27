set(GENERATED_SOURCES_ROOT
        ${CMAKE_CURRENT_BINARY_DIR}
)
set(GENERATED_HEADERS
        ${GENERATED_SOURCES_ROOT}/HTTPCommonHeaders.h
)

set(GENERATED_SOURCES
        ${GENERATED_SOURCES_ROOT}/HTTPCommonHeaders.cpp
)

add_custom_command(
    OUTPUT
        ${GENERATED_HEADERS}
    COMMAND
        ${CMAKE_COMMAND} -E env
            FBCODE_DIR=${proxygen_SOURCE_DIR}
            INSTALL_DIR=${CMAKE_CURRENT_BINARY_DIR}
            HEADERS_LIST=${CMAKE_CURRENT_SOURCE_DIR}/HTTPCommonHeaders.txt
            ${CMAKE_CURRENT_SOURCE_DIR}/gen_HTTPCommonHeaders.h.sh
    DEPENDS
        ${CMAKE_CURRENT_SOURCE_DIR}/HTTPCommonHeaders.template.h
        ${CMAKE_CURRENT_SOURCE_DIR}/HTTPCommonHeaders.txt
    WORKING_DIRECTORY
        ${CMAKE_CURRENT_BINARY_DIR}
)

add_custom_command(
    OUTPUT
        ${GENERATED_SOURCES}
    COMMAND
        ${CMAKE_COMMAND} -E env
            FBCODE_DIR=${proxygen_SOURCE_DIR}
            INSTALL_DIR=${CMAKE_CURRENT_BINARY_DIR}
            HEADERS_LIST=${CMAKE_CURRENT_SOURCE_DIR}/HTTPCommonHeaders.txt
            ${CMAKE_CURRENT_SOURCE_DIR}/gen_HTTPCommonHeaders.cpp.sh
    DEPENDS
        ${CMAKE_CURRENT_SOURCE_DIR}/HTTPCommonHeaders.template.gperf
        ${CMAKE_CURRENT_SOURCE_DIR}/HTTPCommonHeaders.txt
    WORKING_DIRECTORY
        ${CMAKE_CURRENT_BINARY_DIR}
)

set(SRCS
        ${GENERATED_HEADERS}
        ${GENERATED_SOURCES}
        ./codec/CodecProtocol.cpp
        ./codec/compress/GzipHeaderCodec.cpp
        ./codec/compress/HeaderTable.cpp
        ./codec/compress/HPACKCodec.cpp
        ./codec/compress/HPACKContext.cpp
        ./codec/compress/HPACKDecodeBuffer.cpp
        ./codec/compress/HPACKDecoder.cpp
        ./codec/compress/HPACKEncodeBuffer.cpp
        ./codec/compress/HPACKEncoder.cpp
        ./codec/compress/HPACKHeader.cpp
        ./codec/compress/Huffman.cpp
        ./codec/compress/Logging.cpp
        ./codec/compress/StaticHeaderTable.cpp
        ./codec/ErrorCode.cpp
        ./codec/FlowControlFilter.cpp
        ./codec/HTTP1xCodec.cpp
        ./codec/HTTP2Codec.cpp
        ./codec/HTTP2Constants.cpp
        ./codec/HTTP2Framer.cpp
        ./codec/HTTPChecks.cpp
        ./codec/HTTPCodecFactory.cpp
        ./codec/HTTPCodecFilter.cpp
        ./codec/HTTPCodecPrinter.cpp
        ./codec/HTTPParallelCodec.cpp
        ./codec/HTTPSettings.cpp
        ./codec/SettingsId.cpp
        ./codec/SPDYCodec.cpp
        ./codec/SPDYConstants.cpp
        ./codec/SPDYUtil.cpp
        ./codec/TransportDirection.cpp
        ./experimental/RFC1867.cpp
        ./HTTPConnector.cpp
        ./HTTPConstants.cpp
        ./HTTPException.cpp
        ./HTTPHeaders.cpp
        ./HTTPMessage.cpp
        ./HTTPMethod.cpp
        ./ProxygenErrorEnum.cpp
        ./RFC2616.cpp
        ./session/ByteEvents.cpp
        ./session/ByteEventTracker.cpp
        ./session/CodecErrorResponseHandler.cpp
        ./session/HTTP2PriorityQueue.cpp
        ./session/HTTPDefaultSessionCodecFactory.cpp
        ./session/HTTPDirectResponseHandler.cpp
        ./session/HTTPDownstreamSession.cpp
        ./session/HTTPErrorPage.cpp
        ./session/HTTPEvent.cpp
        ./session/HTTPSession.cpp
        ./session/HTTPSessionAcceptor.cpp
        ./session/HTTPTransaction.cpp
        ./session/HTTPTransactionEgressSM.cpp
        ./session/HTTPTransactionIngressSM.cpp
        ./session/HTTPUpstreamSession.cpp
        ./session/SimpleController.cpp
        ./session/TransportFilter.cpp
        ./Window.cpp
)

add_library(proxygen_http ${SRCS})
target_include_directories(proxygen_http PUBLIC ${Wangle_INCLUDE_DIR})
target_link_libraries(proxygen_http proxygen_utils)
