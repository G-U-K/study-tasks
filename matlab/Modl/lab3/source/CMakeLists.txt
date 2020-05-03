project(Kittens_buffer)

add_subdirectory(include)
add_subdirectory(src)
#add_subdirectory(resources)

# configure Qt
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5 COMPONENTS REQUIRED Core Gui Widgets Charts)

set(CMAKE_AUTOMOC_MOC_OPTIONS ${CMAKE_AUTOMOC_MOC_OPTIONS} "-b" basicdefs.h)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
#-----------------------------

# setup main source and precompiled header
add_executable(${PROJECT_NAME} WIN32 ${sources})

target_link_libraries(${PROJECT_NAME} PRIVATE
	Qt5::Core
	Qt5::Gui
	Qt5::Widgets
	Qt5::Charts
)

target_include_directories(${PROJECT_NAME} PRIVATE include)

# add compile and link options for perfomance optimizations
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME_DEBUG ${PROJECT_NAME}d)

# copy qt5 dll and pdb files to target build dir:
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
	COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:Qt5::Core> $<TARGET_FILE_DIR:${PROJECT_NAME}>
	COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:Qt5::Gui> $<TARGET_FILE_DIR:${PROJECT_NAME}>
	COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:Qt5::Widgets> $<TARGET_FILE_DIR:${PROJECT_NAME}>
	COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:Qt5::Charts> $<TARGET_FILE_DIR:${PROJECT_NAME}> )

target_compile_options(${PROJECT_NAME} PRIVATE /W4 /std:c++17 $<$<CONFIG:Release>:/GL>)
target_link_options(${PROJECT_NAME} PRIVATE $<$<CONFIG:Release>:/LTCG:INCREMENTAL>)
target_precompile_headers(${PROJECT_NAME} PRIVATE include/basicdefs.h)
