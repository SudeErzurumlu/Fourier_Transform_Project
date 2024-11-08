// Fourier Transform in Rust
// This program calculates the Fourier Transform of a sample signal and 
// prints the frequency spectrum.

use std::f64::consts::PI;

fn main() {
    let fs = 1000;  // Sampling frequency
    let l = 1000;   // Length of signal

    // Generate a signal composed of two sinusoids
    let signal: Vec<f64> = (0..l)
        .map(|i| {
            let t = i as f64 / fs as f64;
            0.7 * (2.0 * PI * 50.0 * t).sin() + (2.0 * PI * 120.0 * t).sin()
        })
        .collect();

    // Compute the Fourier Transform using a simple DFT
    let mut real = vec![0.0; l];
    let mut imag = vec![0.0; l];
    for k in 0..l {
        for n in 0..l {
            real[k] += signal[n] * (2.0 * PI * k as f64 * n as f64 / l as f64).cos();
            imag[k] -= signal[n] * (2.0 * PI * k as f64 * n as f64 / l as f64).sin();
        }
    }

    // Print frequency spectrum (magnitude only)
    for k in 0..l / 2 {
        let magnitude = (real[k].powi(2) + imag[k].powi(2)).sqrt() / l as f64;
        let frequency = (fs as f64 * k as f64) / l as f64;
        println!("Frequency: {:.1} Hz, Magnitude: {:.2}", frequency, magnitude);
    }
}
