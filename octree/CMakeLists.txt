cmake_minimum_required(VERSION 3.0.0)

project(octree LANGUAGES Fortran)

if (NOT DISABLE_OPENMP)
  find_package(OpenMP)
  if (OPENMP_FOUND)
	  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${OpenMP_Fortran_FLAGS}")
  endif ()
endif ()

add_library(octree octree_mod.F90)

add_executable(octree_example.exe octree_example.F90)
target_link_libraries(octree_example.exe octree)
