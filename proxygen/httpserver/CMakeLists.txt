set(SRCS
        HTTPServer.cpp
        HTTPServerAcceptor.cpp
        RequestHandlerAdaptor.cpp
        SignalHandler.cpp
)

add_library(proxygen_httpserver ${SRCS})
target_link_libraries(proxygen_httpserver proxygen_http)

set(ECHO_SRCS
        samples/echo/EchoHandler.cpp
        samples/echo/EchoServer.cpp
)

set(PROXY_SRCS
        samples/proxy/ProxyHandler.cpp
        samples/proxy/ProxyServer.cpp
)

set(PUSH_SRCS
        samples/push/PushRequestHandler.cpp
        samples/push/PushServer.cpp
)

#if (PROXYGEN_BUILD_EXAMPLES)
    add_executable(echo_sample ${ECHO_SRCS})
    target_link_libraries(echo_sample proxygen_httpserver)

    add_executable(proxy_sample ${PROXY_SRCS})
    target_link_libraries(proxy_sample proxygen_httpserver)

    add_executable(push_sample ${PUSH_SRCS})
    target_link_libraries(push_sample proxygen_httpserver)
#endif()