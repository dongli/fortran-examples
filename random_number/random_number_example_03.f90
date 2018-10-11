! When fixed seed is given, the same random number will be returned.

program example_random_number_03

  implicit none

  integer n
  integer, allocatable :: seed(:)
  real(8) x

  call random_seed(n)
  write(*, *) 'Seed size is ', n

  allocate(seed(n))
  seed(:) = 2
  call random_seed(put=seed)
  write(*, *) 'Set seed to ', seed
  deallocate(seed)

  call random_number(x)
  write(*, *) 'Returned random number is ', x

end program example_random_number_03
