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

add_executable(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE include)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/include)

include(gtest.cmake)

enable_testing()
file(GLOB_RECURSE TESTCASE "tests/*.cpp")
set(TEST_PROJECT_NAME ${PROJECT_NAME}_test)
add_executable(
	${TEST_PROJECT_NAME}
	${TESTCASE}
	)

target_link_libraries(
	${TEST_PROJECT_NAME}
	GTest::gtest_main
	)

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME}_test)
