program mpi_example_03

  use mpi

  implicit none

  integer ierr, num_proc, proc_id
  integer x

  call mpi_init(ierr)

  call mpi_comm_size(MPI_COMM_WORLD, num_proc, ierr)

  call mpi_comm_rank(MPI_COMM_WORLD, proc_id, ierr)

  if (proc_id == 0) then
    x = 42
    call mpi_send(x, 1, MPI_INT, 1, 0, MPI_COMM_WORLD, ierr)
  else if (proc_id == 1) then
    call mpi_recv(x, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE, ierr)
    write(*, '("Process 1 recieved ", I0, " from process 0.")') x
  end if

  call mpi_finalize(ierr)

end program mpi_example_03
