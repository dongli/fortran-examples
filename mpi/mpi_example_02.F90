program mpi_example_02

  use mpi

  implicit none

  integer ierr, num_proc, proc_id

  call mpi_init(ierr)

  call mpi_comm_size(MPI_COMM_WORLD, num_proc, ierr)

  call mpi_comm_rank(MPI_COMM_WORLD, proc_id, ierr)

  if (proc_id == 0) then
    write(*, '("MPI process number is ", I0)') num_proc
  end if
  write(*, '("MPI process ID is ", I0)') proc_id

  call mpi_finalize(ierr)

end program mpi_example_02
