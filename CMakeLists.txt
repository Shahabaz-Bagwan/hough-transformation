# min. version of cmake required for this project
cmake_minimum_required( VERSION 3.10)

# name of the project
project(houghTransformation)

# Required to use vim as cpp ide
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/build/bin)
set(LIBRARY_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/build/lib)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# collect all the .cxx needed for executable 
filE(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)

find_package(OpenCV 4.4.0 REQUIRED)

message(STATUS "OpenCV library status:")
message(STATUS "    config: ${OpenCV_DIR}")
message(STATUS "    version: ${OpenCV_VERSION}")
message(STATUS "    libraries: ${OpenCV_LIBS}")
message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")

option(ENABLE_SANITIZERS ON)

add_subdirectory(example)

# Create library
add_library(${PROJECT_NAME}_shared SHARED ${SOURCES})

target_link_libraries(${PROJECT_NAME}_shared
  PUBLIC
    ${OpenCV_LIBS}
)

target_include_directories( ${PROJECT_NAME}_shared 
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_library(${PROJECT_NAME}_static STATIC ${SOURCES})

target_link_libraries(${PROJECT_NAME}_static
  PUBLIC
    ${OpenCV_LIBS}
)

target_include_directories( ${PROJECT_NAME}_static
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)
