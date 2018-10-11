program mpi_example_01

  use mpi

  implicit none

  integer ierr, version, subversion

  call mpi_get_version(version, subversion, ierr)

  write(*, '("MPI version is ", I0, ".", I0)') version, subversion

end program mpi_example_01
