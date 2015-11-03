cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

set(OPENMP_LLVM_TOOLS_DIR "" CACHE PATH "Path to LLVM tools for testing")

message("Detected Compiler: ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")

if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  if(${CMAKE_CXX_COMPILER_VERSION} VERSION_LESS 4.8)
    message(FATAL_ERROR "Please use GCC 4.8 or newer.")
  endif()
endif()

add_subdirectory(runtime)
