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




include(ExternalProject)
ExternalProject_Add(googletest
  GIT_REPOSITORY    https://github.com/esmini/esmini.git
  GIT_TAG           master
  SOURCE_DIR        "${CMAKE_BINARY_DIR}/esmini-src"
  BINARY_DIR        "${CMAKE_BINARY_DIR}/esmini-build"
  UPDATE_COMMAND
)





set(esmini_SOURCE_DIR esmini)
set(pybind11_SOURCE_DIR esmini)

add_subdirectory(${esmini_SOURCE_DIR})



