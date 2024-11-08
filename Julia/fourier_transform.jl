# Fourier Transform in Julia
# This script calculates the Fourier Transform of a sample signal and 
# prints the frequency spectrum.

using Printf

Fs = 1000                  # Sampling frequency
L = 1000                   # Length of signal
t = (0:L-1) / Fs           # Time vector

# Generate a signal composed of two sinusoids
signal = 0.7 * sin.(2π * 50 * t) .+ sin.(2π * 120 * t)

# Perform the Fourier Transform
Y = fft(signal)

# Calculate the magnitude spectrum and frequencies
P2 = abs.(Y / L)                  # Normalized two-sided spectrum
P1 = P2[1:div(L, 2)+1]            # Single-sided spectrum
P1[2:end-1] .= 2 .* P1[2:end-1]   # Double values except for DC and Nyquist

f = (0:div(L, 2)) * Fs / L        # Frequency vector

# Print frequency spectrum (magnitude only)
for i in 1:length(P1)
    println( @sprintf("Frequency: %.1f Hz, Magnitude: %.2f", f[i], P1[i]) )
end
