cmake_minimum_required(VERSION 3.20)

project(AA
	VERSION 0.1.0.0
	DESCRIPTION "A simple game"
	LANGUAGES CXX
	)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

file(GLOB_RECURSE SOURCES "source/*.cpp")
file(GLOB_RECURSE HEADERS "include/*.h")

configure_file(include/config.in.h include/config.h)
set(PROJECT_NAME_LIB ${PROJECT_NAME}_lib)
add_library(${PROJECT_NAME_LIB} ${SOURCES})
target_include_directories(${PROJECT_NAME_LIB} PRIVATE include)
target_include_directories(${PROJECT_NAME_LIB} PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/include)

add_executable(${PROJECT_NAME} source/main.cpp)
target_link_libraries(${PROJECT_NAME} ${PROJECT_NAME_LIB})
target_include_directories(${PROJECT_NAME} PRIVATE include)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/include)


include(gtest.cmake)

enable_testing()
file(GLOB_RECURSE TESTCASE "tests/*.cpp")
set(TEST_PROJECT_NAME ${PROJECT_NAME}_test)
set(CMAKE_CXX_FLAGS --coverage)
add_executable(
	${TEST_PROJECT_NAME}
	${TESTCASE}
	)

target_link_libraries(
	${TEST_PROJECT_NAME}
	GTest::gtest_main
	${PROJECT_NAME_LIB}
	)
target_include_directories(${TEST_PROJECT_NAME} PRIVATE include)
target_include_directories(${TEST_PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/include)

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME}_test)
