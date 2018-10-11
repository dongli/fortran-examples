program qsort_example

  use sort_mod

  implicit none

  integer seed(33)
  real x0

  ! seed(:) = 4
  call random_seed(put=seed)

  call integer_sort_example()
  call real_sort_example()

contains

  subroutine integer_sort_example()

    integer x(10)
    integer i, j

    do i = 1, size(x)
      call random_number(x0)
      x(i) = 100 * x0
    end do

    if (size(x) <= 20) then
      write(*, *) 'Original array:'
      do i = 1, size(x)
        write(*, '(I5)', advance='no') x(i)
      end do
      write(*, *)
    end if

    call qsort(x)

    ! Verify the result.
    do i = 1, size(x) - 1
      do j = i + 1, size(x)
        if (x(i) > x(j)) then
          write(*, *) '[Error]: Failed to sort! Check the codes.'
        end if
      end do
    end do

    if (size(x) <= 20) then
      write(*, *) 'Sorted array:'
      do i = 1, size(x)
        write(*, '(I5)', advance='no') x(i)
      end do
      write(*, *)
    end if

  end subroutine integer_sort_example

  subroutine real_sort_example()

    real x(10)
    integer i, j

    do i = 1, size(x)
      call random_number(x0)
      x(i) = 100 * x0
    end do

    if (size(x) <= 20) then
      write(*, *) 'Original array:'
      do i = 1, size(x)
        write(*, '(F8.2)', advance='no') x(i)
      end do
      write(*, *)
    end if

    call qsort(x)

    ! Verify the result.
    do i = 1, size(x) - 1
      do j = i + 1, size(x)
        if (x(i) > x(j)) then
          write(*, *) '[Error]: Failed to sort! Check the codes.'
        end if
      end do
    end do

    if (size(x) <= 20) then
      write(*, *) 'Sorted array:'
      do i = 1, size(x)
        write(*, '(F8.2)', advance='no') x(i)
      end do
      write(*, *)
    end if

  end subroutine real_sort_example

end program qsort_example
