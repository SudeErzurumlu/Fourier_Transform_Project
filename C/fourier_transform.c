// Fourier Transform in C
// This program calculates the Fourier Transform of a sample signal and 
// prints the frequency spectrum.

#include <stdio.h>
#include <math.h>

#define PI 3.14159265358979323846
#define FS 1000       // Sampling frequency
#define L 1000        // Length of signal

int main() {
    double signal[L];
    double real[L], imag[L];
    
    // Generate a signal composed of two sinusoids
    for (int i = 0; i < L; i++) {
        double t = (double)i / FS;
        signal[i] = 0.7 * sin(2 * PI * 50 * t) + sin(2 * PI * 120 * t);
        real[i] = 0;
        imag[i] = 0;
    }

    // Compute the Fourier Transform using a simple DFT
    for (int k = 0; k < L; k++) {
        for (int n = 0; n < L; n++) {
            real[k] += signal[n] * cos(2 * PI * k * n / L);
            imag[k] -= signal[n] * sin(2 * PI * k * n / L);
        }
    }

    // Print frequency spectrum (magnitude only)
    for (int k = 0; k < L / 2; k++) {
        double magnitude = sqrt(real[k] * real[k] + imag[k] * imag[k]) / L;
        double frequency = (double)(FS * k) / L;
        printf("Frequency: %.1f Hz, Magnitude: %.2f\n", frequency, magnitude);
    }

    return 0;
}
