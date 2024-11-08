# Fourier Transform in R
# This script calculates the Fourier Transform of a sample signal and 
# plots its frequency spectrum.

# Load necessary libraries
if (!requireNamespace("signal", quietly = TRUE)) install.packages("signal")

# Generate a sample signal
Fs <- 1000            # Sampling frequency
T <- 1 / Fs           # Sampling period
L <- 1000             # Length of signal
t <- seq(0, (L - 1)) * T  # Time vector

# Create a signal composed of two sinusoid
S <- 0.7 * sin(2 * pi * 50 * t) + sin(2 * pi * 120 * t)

# Compute the Fourier Transform
Y <- fft(S)

# Compute the two-sided spectrum P2 and the single-sided spectrum P1
P2 <- Mod(Y / L)
P1 <- P2[1:(L / 2 + 1)]
P1[2:(length(P1) - 1)] <- 2 * P1[2:(length(P1) - 1)]

# Define frequency domain
f <- Fs * (0:(L / 2)) / L

# Plot single-sided amplitude spectrum
plot(f, P1, type = "l", col = "blue",
     main = "Single-Sided Amplitude Spectrum of S(t)",
     xlab = "Frequency (Hz)", ylab = "|P1(f)|")
