cmake_minimum_required(VERSION 3.0.0)

project(openmp-examples LANGUAGES Fortran)

find_package(OpenMP)
if (OPENMP_FOUND)
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${OpenMP_Fortran_FLAGS}")
endif ()

add_executable(openmp_example_01.exe openmp_example_01.F90)
target_link_libraries(openmp_example_01.exe ${OpenMP_EXE_LINKER_FLAGS})

add_executable(openmp_example_02.exe openmp_example_02.F90)
target_link_libraries(openmp_example_02.exe ${OpenMP_EXE_LINKER_FLAGS})
