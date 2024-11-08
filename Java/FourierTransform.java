// Fourier Transform in Java
// This program calculates the Fourier Transform of a sample signal and 
// prints the frequency spectrum.

public class FourierTransform {
    public static void main(String[] args) {
        int Fs = 1000;
        int L = 1000;
        double[] signal = new double[L];

        // Generate a signal composed of two sinusoids
        for (int i = 0; i < L; i++) {
            double t = (double)i / Fs;
            signal[i] = 0.7 * Math.sin(2 * Math.PI * 50 * t) + Math.sin(2 * Math.PI * 120 * t);
        }

        // Compute Fourier Transform
        double[] real = new double[L];
        double[] imag = new double[L];
        for (int k = 0; k < L; k++) {
            for (int n = 0; n < L; n++) {
                real[k] += signal[n] * Math.cos(2 * Math.PI * k * n / L);
                imag[k] -= signal[n] * Math.sin(2 * Math.PI * k * n / L);
            }
        }

        // Print frequency spectrum
        for (int k = 0; k < L / 2; k++) {
            double magnitude = Math.sqrt(real[k] * real[k] + imag[k] * imag[k]) / L;
            double frequency = (double)(Fs * k) / L;
            System.out.printf("Frequency: %.1f Hz, Magnitude: %.2f%n", frequency, magnitude);
        }
    }
}
