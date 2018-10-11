cmake_minimum_required(VERSION 3.0.0)

project(mpi-examples LANGUAGES Fortran)

find_package(MPI)
if (NOT MPI_Fortran_FOUND)
  message(FATAL_ERROR "MPI Fortran library cannot be found!")
else ()
  include_directories(${MPI_Fortran_INCLUDE_PATH})
endif ()

file(GLOB examples *_example_*.F90)
message(${examples})

foreach (example ${examples})
  get_filename_component(exename ${example} NAME_WE)
  add_executable(${exename}.exe ${example})
  target_compile_options(${exename}.exe PRIVATE ${MPI_Fortran_COMPILE_FLAGS})
  target_link_libraries(${exename}.exe ${MPI_Fortran_LIBRARIES} ${MPI_Fortran_LINK_FLAGS})
endforeach ()
