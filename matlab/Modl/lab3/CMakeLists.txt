cmake_minimum_required(VERSION 3.16)

# specified project name will be the title of visual studio tab
project(Kittens_buffer!)

# set configuration types:
set(CMAKE_CONFIGURATION_TYPES Debug Release CACHE STRING INTERNAL FORCE)

# set output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG "${CMAKE_CURRENT_SOURCE_DIR}/bin")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/bin")

# enable folders in visual studio
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

add_subdirectory(cmake)
add_subdirectory(source)

# set startup project for visual studio
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT Kittens_buffer)
