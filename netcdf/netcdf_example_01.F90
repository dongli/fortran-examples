program netcdf_example_01

  use netcdf

  implicit none

  integer ncid, ierr
  integer lon_dimid
  integer lat_dimid
  integer time_dimid
  integer time_varid
  integer lat_varid
  integer lon_varid
  integer var_varid

  integer, parameter :: num_lon = 360
  integer, parameter :: num_lat = 180
  integer i, j
  real(8) lon(num_lon), lat(num_lat), var(num_lon,num_lat)

  ierr = nf90_create('sample.nc', NF90_CLOBBER, ncid)
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_def_dim(ncid, 'lon', num_lon, lat_dimid)
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_def_dim(ncid, 'lat', num_lat, lat_dimid)
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_def_dim(ncid, 'time', NF90_UNLIMITED, time_dimid)
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_def_var(ncid, 'lon', NF90_DOUBLE, [lon_dimid], lon_varid)
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_put_att(ncid, lon_varid, 'long_name', 'longitude')
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_put_att(ncid, lon_varid, 'units', 'degree_east')
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_def_var(ncid, 'lat', NF90_DOUBLE, [lat_dimid], lat_varid)
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_put_att(ncid, lat_varid, 'long_name', 'latitude')
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_put_att(ncid, lat_varid, 'units', 'degree_north')
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_def_var(ncid, 'time', NF90_INT, [time_dimid], time_varid)
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_put_att(ncid, time_varid, 'long_name', 'time')
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_put_att(ncid, time_varid, 'units', 'days since 1985-03-01')
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_def_var(ncid, 'var', NF90_DOUBLE, [lon_dimid, lat_dimid, time_dimid], var_varid)
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_put_att(ncid, var_varid, 'long_name', 'sample variable')
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_enddef(ncid)
  call handle_errors(ierr, __FILE__, __LINE__)

  do i = 1, num_lon
    lon(i) = i * 360 / num_lon
  end do

  do j = 1, num_lat
    lat(j) = -90 + j * 180 / (num_lat - 1)
  end do

  do j = 1, num_lat
    do i = 1, num_lon
      call random_number(var(i,j))
    end do
  end do

  ierr = nf90_put_var(ncid, lon_varid, lon)
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_put_var(ncid, lat_varid, lat)
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_put_var(ncid, time_varid, 12277)
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_put_var(ncid, var_varid, var, [1, 1, 1], [num_lon, num_lat, 1])
  call handle_errors(ierr, __FILE__, __LINE__)

  ierr = nf90_close(ncid)
  call handle_errors(ierr, __FILE__, __LINE__)

contains

  subroutine handle_errors(ierr, file, line)

    integer, intent(in) :: ierr
    character(*), intent(in) :: file
    integer, intent(in) :: line

    if (ierr /= NF90_NOERR) then
      write(*, '("[Error]: ", A, ":", I0, ": ", A)') trim(file), line, nf90_strerror(ierr)
    end if

  end subroutine handle_errors

end program netcdf_example_01
