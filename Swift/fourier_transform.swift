// Fourier Transform in Swift
// This program calculates the Fourier Transform of a sample signal and 
// prints the frequency spectrum.

import Foundation

let Fs = 1000       // Sampling frequency
let L = 1000        // Length of signal

// Generate a sample signal
var signal = [Double](repeating: 0.0, count: L)
for i in 0..<L {
    let t = Double(i) / Double(Fs)
    signal[i] = 0.7 * sin(2 * .pi * 50 * t) + sin(2 * .pi * 120 * t)
}

// Compute Fourier Transform
var real = [Double](repeating: 0.0, count: L)
var imag = [Double](repeating: 0.0, count: L)
for k in 0..<L {
    for n in 0..<L {
        real[k] += signal[n] * cos(2 * .pi * Double(k) * Double(n) / Double(L))
        imag[k] -= signal[n] * sin(2 * .pi * Double(k) * Double(n) / Double(L))
    }
}

// Print frequency spectrum
for k in 0..<L/2 {
    let magnitude = sqrt(real[k] * real[k] + imag[k] * imag[k]) / Double(L)
    let frequency = Double(Fs * k) / Double(L)
    print(String(format: "Frequency: %.1f Hz, Magnitude: %.2f", frequency, magnitude))
}
