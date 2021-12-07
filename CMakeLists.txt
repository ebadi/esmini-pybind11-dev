cmake_minimum_required(VERSION 3.1)
project (pyesmini)

include(ExternalProject)
include(FetchContent)

set(pybind11_SOURCE_DIR esmini)


FetchContent_Declare(
  esmini
  GIT_REPOSITORY https://github.com/ebadi/esmini.git
  GIT_TAG        master
)
FetchContent_GetProperties(esmini)
if(NOT esmini_POPULATED)
  FetchContent_Populate(esmini)
  add_subdirectory(${esmini_SOURCE_DIR})
  message(STATUS "[[UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU]]")
endif()


#execute_process(
#  COMMAND cat cmakepatch.txt >> ${esmini_SOURCE_DIR}/EnvironmentSimulator/CMakeLists.txt
#  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#  OUTPUT_VARIABLE PATCHUNT
#  OUTPUT_STRIP_TRAILING_WHITESPACE
#)

set(CMAKE_BUILD_TYPE "Release") # https://github.com/microsoft/vcpkg/issues/20237?amp=1

add_subdirectory(pybind11)

message(STATUS "[[_______MESSAGE_______]]")
message(STATUS "${esmini_SOURCE_DIR}")


link_directories(${OSG_LIBRARIES_PATH} ${OSI_LIBRARIES_PATH} ${SUMO_LIBRARIES_PATH} ${GTEST_LIBRARIES_PATH} )
add_definitions(-D_USE_OSG)

pybind11_add_module(pyplayerbase "${CMAKE_CURRENT_SOURCE_DIR}/src/playerbase/pyplayerbase.cpp")
include_directories(
  ${SCENARIOENGINE_INCLUDE_DIRS}
  ${ROADMANAGER_INCLUDE_DIR}
  ${VIEWER_BASE_INCLUDE_DIR}
  ${PLAYER_BASE_INCLUDE_DIR}
  ${CONTROLLERS_INCLUDE_DIR}
  ${OSG_INCLUDE_DIR}
  ${SUMO_INCLUDE_DIR}
  ${COMMON_MINI_INCLUDE_DIR}
  ${OSI_INCLUDE_DIR}
  ${PUGIXML_INCLUDE_DIR}
)
# EXAMPLE_VERSION_INFO is defined by setup.py and passed into the C++ code as a
# define (VERSION_INFO) here.
target_link_libraries(pyplayerbase PRIVATE
    ViewerBase ${OSG_LIBRARIES}
    ${SUMO_LIBRARIES}
    ${OSI_LIBRARIES}
    PlayerBase
    ScenarioEngine
    Controllers
    RoadManager
    CommonMini
    ${viewer_libs}
    ${osi_libs}
    ${sumo_libs}
    ${TIME_LIB}
    ${SOCK_LIB}
)

target_compile_definitions(pyplayerbase PRIVATE VERSION_INFO=${EXAMPLE_VERSION_INFO})