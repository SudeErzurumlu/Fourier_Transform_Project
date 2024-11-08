% Fourier Transform in MATLAB
% This script calculates the Fourier Transform of a sample signal and 
% plots its frequency spectrum.

% Generate a sample signal (sinusoidal)
Fs = 1000;                  % Sampling frequency in Hz
T = 1/Fs;                   % Sampling period
L = 1000;                   % Length of signal
t = (0:L-1)*T;              % Time vector

% Create a signal composed of two sinusoids
S = 0.7 * sin(2 * pi * 50 * t) + sin(2 * pi * 120 * t);

% Compute the Fourier Transform
Y = fft(S);

% Compute the two-sided spectrum P2 and the single-sided spectrum P1
P2 = abs(Y / L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2 * P1(2:end-1);

% Define frequency domain
f = Fs * (0:(L/2)) / L;

% Plot single-sided amplitude spectrum
figure;
plot(f, P1);
title('Single-Sided Amplitude Spectrum of S(t)');
xlabel('Frequency (Hz)');
ylabel('|P1(f)|');
