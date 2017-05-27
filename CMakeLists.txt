project(proxygen C CXX)
cmake_minimum_required(VERSION 3.0)

OPTION(PROXYGEN_BUILD_EXAMPLES ON)

set(CMAKE_MODULE_PATH
        "${CMAKE_MODULE_PATH};${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(Threads REQUIRED)
find_package(Wangle REQUIRED)
find_package(Folly REQUIRED)
find_package(OpenSSL REQUIRED)
find_package(Glog REQUIRED)
find_package(gflags REQUIRED)
find_package(double-conversion REQUIRED)
find_package(ZLIB REQUIRED)
find_package(LibEvent REQUIRED)

#Boost
if (${BUILD_SHARED_LIBS})
    set(Boost_USE_STATIC_LIBS    OFF)
    add_definitions("-DBOOST_ALL_DYN_LINK=1")
ELSE()
    set(Boost_USE_STATIC_LIBS    ON)
endif()

set(Boost_USE_MULTITHREADED  ON)

find_package(Boost 1.54.0
    COMPONENTS
        thread
        system
    REQUIRED
)

SET(PROXYGEN_DEPENDENCIES
        ${Folly_LIBRARIES}
        ${Wangle_LIBRARIES}
        ${Glog_LIBRARIES}
        ${GFLAGS_LIBRARIES}
        ${LibEvent_LIBRARIES}
        ${OPENSSL_LIBRARIES}
        ${double-conversion_LIBRARIES}
        ${ZLIB_LIBRARIES}
        ${BOOST_LIBRARIES}
        ${CMAKE_THREAD_LIBS_INIT})

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${BOOST_INCLUDE_DIR})

set(CMAKE_CXX_STANDARD 14 CACHE STRING "C++ standard for all targets.")
set(CMAKE_CXX_STANDARD_REQUIRED true)


add_subdirectory(proxygen)

target_include_directories(proxygen_httpserver PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
target_include_directories(proxygen_utils PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})
target_include_directories(proxygen_services PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})