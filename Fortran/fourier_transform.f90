! Fourier Transform in Fortran
! This program calculates the Fourier Transform of a sample signal and
! prints the frequency spectrum.

program fourier_transform
  implicit none
  integer, parameter :: L = 1000
  real, parameter :: Fs = 1000.0
  real :: signal(L), real_part(L), imag_part(L)
  integer :: i, j
  real :: freq, t, magnitude

  ! Generate a signal composed of two sinusoids
  do i = 1, L
     t = (i - 1) / Fs
     signal(i) = 0.7 * sin(2.0 * 3.14159 * 50.0 * t) + &
                 sin(2.0 * 3.14159 * 120.0 * t)
  end do

  ! Initialize real and imaginary parts for Fourier Transform
  real_part = 0.0
  imag_part = 0.0

  ! Compute the Fourier Transform using a simple DFT
  do i = 1, L
     do j = 1, L
        real_part(i) = real_part(i) + signal(j) * cos(2.0 * 3.14159 * (i-1) * (j-1) / L)
        imag_part(i) = imag_part(i) - signal(j) * sin(2.0 * 3.14159 * (i-1) * (j-1) / L)
     end do
  end do

  ! Print frequency spectrum (magnitude only)
  do i = 1, L/2
     freq = Fs * (i - 1) / L
     magnitude = sqrt(real_part(i)**2 + imag_part(i)**2) / L
     print *, 'Frequency:', freq, 'Hz, Magnitude:', magnitude
  end do

end program fourier_transform
