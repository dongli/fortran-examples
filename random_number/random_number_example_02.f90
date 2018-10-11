! Get system random data as seed.

program random_number_example_02

  implicit none

  integer n
  integer, allocatable :: seed(:)

  call random_seed(n)
  write(*, *) 'Seed size is ', n

  allocate(seed(n))
  call random_seed(get=seed)
  write(*, *) 'Get seed ', seed
  deallocate(seed)

end program random_number_example_02
