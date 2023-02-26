cmake_minimum_required(VERSION 3.24)
project(flipbyte)

set(CMAKE_CXX_STANDARD 14)

add_executable(flipbyte main.cpp ByteReverse.h ByteReverse.cpp)

add_custom_command(TARGET flipbyte
        POST_BUILD
        COMMAND /bin/sh ${CMAKE_CURRENT_SOURCE_DIR}/test.sh
        )