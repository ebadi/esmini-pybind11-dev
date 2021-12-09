cmake_minimum_required(VERSION 3.1)
project (pyesmini)

include(ExternalProject)
include(FetchContent)

add_subdirectory(pybind11)
add_subdirectory(esmini)

if(FALSE) # fake a block comment

############## esmini ##############
FetchContent_Declare(
  esmini
  GIT_REPOSITORY https://github.com/esmini/esmini.git
  GIT_TAG        a0a7d1a24a716536abdcd353cb2ded448bb6cbbf
)
FetchContent_GetProperties(esmini)
if(NOT esmini_POPULATED)
  FetchContent_Populate(esmini)
  add_subdirectory(${esmini_SOURCE_DIR})
  message(STATUS "esmini-python: esmini")
endif()

############## pybind11 ##############
FetchContent_Declare(
  pybind11
  GIT_REPOSITORY https://github.com/pybind/pybind11.git
  GIT_TAG        70a58c577eaf067748c2ec31bfd0b0a614cffba6
)
FetchContent_GetProperties(pybind11)
if(NOT pybind11_POPULATED)
  FetchContent_Populate(pybind11)
  add_subdirectory(${pybind11_SOURCE_DIR})
  message(STATUS "esmini-python: pybind11")
endif()

endif()

set(CMAKE_BUILD_TYPE "Release") # https://github.com/microsoft/vcpkg/issues/20237?amp=1

# message(STATUS "[[_______MESSAGE_______]]")
message(STATUS "${esmini_SOURCE_DIR}")


link_directories(${OSG_LIBRARIES_PATH} ${OSI_LIBRARIES_PATH} ${SUMO_LIBRARIES_PATH} ${GTEST_LIBRARIES_PATH} )
add_definitions(-D_USE_OSG)

message(STATUS "esmini-python: pyplayerbase")
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



message(STATUS "esmini-python: pyroadmanager")
pybind11_add_module(pyroadmanager MODULE src/roadmanager/pyroadmanager.cpp ${SCENARIOENGINE_DLL_INCLUDE_DIR}/esminiLib.hpp ${ROADMANAGER_INCLUDE_DIR}/odrSpiral.cpp ${COMMON_MINI_INCLUDE_DIR}/CommonMini.cpp ${COMMON_MINI_INCLUDE_DIR}/buildnr.cpp ${COMMON_MINI_INCLUDE_DIR}/version.cpp ${PUGIXML_INCLUDE_DIR}/pugixml.cpp )

include_directories(${PLAYER_BASE_INCLUDE_DIR} ${SCENARIOENGINE_INCLUDE_DIRS}  ${SCENARIOENGINE_DLL_INCLUDE_DIR} ${ROADMANAGER_DLL_INCLUDE_DIR} ${OSI_INCLUDE_DIR} ${OSG_INCLUDE_DIR} ${COMMON_MINI_INCLUDE_DIR} ${ROADMANAGER_INCLUDE_DIR} ${CONTROLLERS_INCLUDE_DIR} ${VIEWER_BASE_INCLUDE_DIR}   ${PUGIXML_INCLUDE_DIR})
target_link_libraries(pyroadmanager PRIVATE
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
target_compile_definitions(pyroadmanager PRIVATE VERSION_INFO=${EXAMPLE_VERSION_INFO})





message(STATUS "esmini-python: pycontroller")
pybind11_add_module(pycontroller MODULE src/controller/pycontroller.cpp
	${ROADMANAGER_INCLUDE_DIR}/RoadManager.cpp
	${ROADMANAGER_INCLUDE_DIR}/odrSpiral.cpp
	${COMMON_MINI_INCLUDE_DIR}/buildnr.cpp
	${COMMON_MINI_INCLUDE_DIR}/version.cpp
	${PUGIXML_INCLUDE_DIR}/pugixml.cpp)
target_link_libraries(pycontroller PRIVATE
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
target_compile_definitions(pycontroller PRIVATE VERSION_INFO=${EXAMPLE_VERSION_INFO})




message(STATUS "esmini-python: pyscenarioengine")
pybind11_add_module(pyscenarioengine src/scenarioengine/pyscenarioengine.cpp
	${SCENARIO_SRCS}
	${ROADMANAGER_INCLUDE_DIR}/RoadManager.cpp
	${ROADMANAGER_INCLUDE_DIR}/odrSpiral.cpp
	${COMMON_MINI_INCLUDE_DIR}/buildnr.cpp
	${COMMON_MINI_INCLUDE_DIR}/version.cpp
	${PUGIXML_INCLUDE_DIR}/pugixml.cpp)
target_link_libraries(pyscenarioengine PRIVATE
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
${SOCK_LIB} ${TIME_LIB}   ${SUMO_LIBRARIES}   ${OSG_LIBRARIES} ViewerBase PlayerBase Controllers CommonMini RoadManager ScenarioEngine)
target_compile_definitions(pyscenarioengine PRIVATE VERSION_INFO=${EXAMPLE_VERSION_INFO})




message(STATUS "esmini-python: pyviewerbase")
pybind11_add_module(pyviewerbase MODULE src/viewerbase/pyviewerbase.cpp
	${ROADMANAGER_INCLUDE_DIR}/RoadManager.cpp
	${ROADMANAGER_INCLUDE_DIR}/odrSpiral.cpp
	${COMMON_MINI_INCLUDE_DIR}/buildnr.cpp
	${COMMON_MINI_INCLUDE_DIR}/version.cpp
	${PUGIXML_INCLUDE_DIR}/pugixml.cpp)


add_definitions(-D_CRT_SECURE_NO_WARNINGS)
add_definitions(-DOSG_LIBRARY_STATIC ) # -D_SCENARIO_VIEWER


target_link_libraries(pyviewerbase PRIVATE
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
target_compile_definitions(pyviewerbase PRIVATE VERSION_INFO=${EXAMPLE_VERSION_INFO})




message(STATUS "esmini-python: pyesminilib")
pybind11_add_module(pyesminilib MODULE src/esminilib/pyesminilib.cpp )
target_link_libraries(pyesminilib PRIVATE
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
     esminiRMLib esminiLib
    )
target_compile_definitions(pyesminilib PRIVATE VERSION_INFO=${EXAMPLE_VERSION_INFO})




message(STATUS "esmini-python: pyesminirmlib")
pybind11_add_module(pyesminirmlib MODULE src/esminirmlib/pyesminirmlib.cpp   ${SCENARIOENGINE_DLL_INCLUDE_DIR}/esminiLib.hpp   ${ROADMANAGER_DLL_INCLUDE_DIR}/esminiRMLib.hpp )
include_directories(${PLAYER_BASE_INCLUDE_DIR} ${SCENARIOENGINE_INCLUDE_DIRS}  ${SCENARIOENGINE_DLL_INCLUDE_DIR}  ${ROADMANAGER_DLL_INCLUDE_DIR} ${OSI_INCLUDE_DIR} ${OSG_INCLUDE_DIR} ${COMMON_MINI_INCLUDE_DIR} ${ROADMANAGER_INCLUDE_DIR} ${CONTROLLERS_INCLUDE_DIR} ${VIEWER_BASE_INCLUDE_DIR})
target_link_libraries(pyesminirmlib PRIVATE
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
     esminiRMLib esminiLib
    )
target_compile_definitions(pyesminirmlib PRIVATE VERSION_INFO=${EXAMPLE_VERSION_INFO})




