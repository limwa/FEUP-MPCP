set(CMAKE_TOOLCHAIN_FILE "arm.cmake")

set(CMAKE_HOST_SYSTEM_NAME Linux)
set(CMAKE_HOST_SYSTEM_PROCESSOR x86_64)

cmake_minimum_required(VERSION 3.0.0)
project(exercise-1a VERSION 0.1.0 LANGUAGES C ASM)

include(CTest)
enable_testing()

add_executable(exercise main.c exercise.s)
set(CMAKE_BUILD_TYPE Debug)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
