# Fourier Transform in Python
# This script calculates the Fourier Transform of a sample signal and 
# plots its frequency spectrum.

import numpy as np
import matplotlib.pyplot as plt

# Generate a sample signal
Fs = 1000             # Sampling frequency
T = 1.0 / Fs          # Sampling period
L = 1000              # Length of signal
t = np.arange(0, L) * T  # Time vector

# Create a signal composed of two sinusoids
S = 0.7 * np.sin(2 * np.pi * 50 * t) + np.sin(2 * np.pi * 120 * t)

# Compute the Fourier Transform
Y = np.fft.fft(S)

# Compute the two-sided spectrum P2 and the single-sided spectrum P1
P2 = np.abs(Y / L)
P1 = P2[:L // 2 + 1]
P1[1:-1] = 2 * P1[1:-1]

# Define frequency domain
f = Fs * np.arange((L // 2) + 1) / L

# Plot single-sided amplitude spectrum
plt.plot(f, P1)
plt.title('Single-Sided Amplitude Spectrum of S(t)')
plt.xlabel('Frequency (Hz)')
plt.ylabel('|P1(f)|')
plt.show()
