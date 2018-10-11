cmake_minimum_required(VERSION 3.0.0)

project(sort LANGUAGES Fortran)

add_library(sort sort_mod.F90)

add_executable(qsort_example.exe qsort_example.f90)
target_link_libraries(qsort_example.exe sort)
