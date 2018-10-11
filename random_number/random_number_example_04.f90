! When no seed is provided, Fortran uses system random data as seed.

program random_number_example_02

  implicit none

  integer a, b
  real(8) x

  call random_number(x)
  write(*, *) 'Returned random number is ', x

  a = 0
  b = 100
  write(*, *) 'Scaled random integer number is ', int((b - a) * x + a)

end program random_number_example_02
