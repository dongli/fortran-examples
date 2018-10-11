! When no seed is provided, Fortran uses system random data as seed.

program random_number_example_02

  implicit none

  real(8) x

  call random_number(x)
  write(*, *) 'Returned random number is ', x

end program random_number_example_02
