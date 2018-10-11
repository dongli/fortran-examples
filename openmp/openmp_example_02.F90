program openmp_example_01

  use omp_lib

  implicit none

  integer, parameter :: m = 1000, n = 1000
  integer, parameter :: p = 1000, q = 1000
  real(8), allocatable :: A(:,:)
  real(8), allocatable :: B(:,:)
  real(8), allocatable :: C(:,:)

  character(10) arg
  integer :: num_threads = 4
  integer i, j, k

  if (command_argument_count() == 1) then
    call get_command_argument(1, arg)
    read(arg, *) num_threads
  end if

  call omp_set_dynamic(.false.)
  call omp_set_num_threads(num_threads)

  allocate(A(m,n), B(p,q), C(m,q))

!$omp parallel do collapse(2) default(shared)
  do j = 1, n
    do i = 1, m
      call random_number(A(i,j))
    end do
  end do
!$omp end parallel do

!$omp parallel do collapse(2) default(shared)
  do j = 1, q
    do i = 1, p
      call random_number(B(i,j))
    end do
  end do
!$omp end parallel do

!$omp parallel do collapse(2) default(shared) private(k)
  do j = 1, q
    do i = 1, m
      C(i,j) = 0.0
      do k = 1, n
        C(i,j) = C(i,j) + A(i,k) * B(k,j)
      end do
    end do
  end do
!$omp end parallel do

end program openmp_example_01
