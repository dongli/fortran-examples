program openmp_example_01

  use omp_lib

  integer :: section_count = 0

  call omp_set_dynamic(.false.)
  call omp_set_num_threads(4)

!$omp parallel sections lastprivate(section_count)
!$omp section
  section_count = section_count + 1
  print *, 'section_count', section_count
!$omp section
  section_count = section_count + 1
  print *, 'section_count', section_count
!$omp end parallel sections

  print *, 'section_count', section_count

end program openmp_example_01
