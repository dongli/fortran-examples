program mpi_example_04

  use mpi

  implicit none

  integer, parameter :: ping_pong_limit = 10
  integer ierr, num_proc, proc_id, partner_id
  integer :: ping_pong = 0

  call mpi_init(ierr)

  call mpi_comm_size(MPI_COMM_WORLD, num_proc, ierr)

  call mpi_comm_rank(MPI_COMM_WORLD, proc_id, ierr)

  partner_id = merge(0, 1, proc_id == 1)
  do while (ping_pong <= ping_pong_limit)
    if (proc_id == mod(ping_pong, 2)) then
      ping_pong = ping_pong + 1
      call mpi_send(ping_pong, 1, MPI_INT, partner_id, 0, MPI_COMM_WORLD, ierr)
    else
      call mpi_recv(ping_pong, 1, MPI_INT, partner_id, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE, ierr)
      call sleep(1)
      write(*, '("Process ", I0, " recieved ", I0, " from process ", I0, ".")') proc_id, ping_pong, partner_id
    end if
  end do

  call mpi_finalize(ierr)

end program mpi_example_04
