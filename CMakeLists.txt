cmake_minimum_required(VERSION 3.1)
project (pyesmini)

#FetchContent_Declare(
#  esmini
#  GIT_REPOSITORY    https://github.com/esmini/esmini.git
#  GIT_TAG           0d4ff1ea0662f09aefc41382c8003e4617d48a6c
#)
#FetchContent_MakeAvailable(esmini)

#FetchContent_Declare(
#  pybind11
#  GIT_REPOSITORY    https://github.com/pybind/pybind11.git
#  GIT_TAG           70a58c577eaf067748c2ec31bfd0b0a614cffba6
#)
#FetchContent_MakeAvailable(pybind11)

#include(ExternalProject)
#ExternalProject_Add(googletest
#  GIT_REPOSITORY    https://github.com/ebadi/esmini.git
#  GIT_TAG           master
#  SOURCE_DIR        "${CMAKE_BINARY_DIR}/esmini-src"
#  BINARY_DIR        "${CMAKE_BINARY_DIR}/esmini-build"
#  UPDATE_COMMAND
#)

set(esmini_SOURCE_DIR esmini)
set(pybind11_SOURCE_DIR esmini)

add_subdirectory(${esmini_SOURCE_DIR})

set(CMAKE_BUILD_TYPE "Release") # https://github.com/microsoft/vcpkg/issues/20237?amp=1

add_subdirectory(pybind11)

message(STATUS "[[CMAKE_CURRENT_SOURCE_DIR]]")
message(STATUS "${CMAKE_CURRENT_SOURCE_DIR}")


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
