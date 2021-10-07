cmake_minimum_required(VERSION 3.17)

project(GPU_Sandbox LANGUAGES CUDA CXX)
set(CMAKE_CXX_STANDARD 14)

find_package(MPI REQUIRED)

include_directories(${MPI_CXX_INCLUDE_PATH})
set(MPI_LIBS ${MPI_CXX_LIBRARIES})

include_directories(${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})

add_executable(GPU_Sandbox main.cpp mykernel.cu)
target_link_libraries(GPU_Sandbox ${MPI_LIBS})