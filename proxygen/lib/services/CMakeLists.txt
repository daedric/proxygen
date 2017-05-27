set(SRCS
        RequestWorker.cpp
        Service.cpp
        WorkerThread.cpp
)

add_library(proxygen_services ${SRCS})
target_include_directories(proxygen_services PUBLIC ${Wangle_INCLUDE_DIR})
target_include_directories(proxygen_services PUBLIC ${OPENSSL_INCLUDE_DIR})

target_link_libraries(proxygen_services ${Wangle_LIBRARIES})
target_link_libraries(proxygen_services ${OPENSSL_LIBRARIES})