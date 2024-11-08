// Fourier Transform in JavaScript (Node.js)
// This script calculates the Fourier Transform of a sample signal and 
// prints the frequency spectrum.

const fft = require('fft-js').fft;
const fftUtil = require('fft-js').util;

// Generate a sample signal
const Fs = 1000;  // Sampling frequency
const L = 1000;   // Length of signal
const t = Array.from({ length: L }, (_, i) => i / Fs);

// Create a signal composed of two sinusoids
const signal = t.map(time => 0.7 * Math.sin(2 * Math.PI * 50 * time) + Math.sin(2 * Math.PI * 120 * time));

// Compute the Fourier Transform
const phasors = fft(signal);
const magnitudes = fftUtil.fftMag(phasors);

// Print the frequency spectrum
const frequencies = t.map((_, i) => (Fs * i) / L);
frequencies.slice(0, L / 2).forEach((freq, i) => {
    console.log(`Frequency: ${freq.toFixed(1)} Hz, Magnitude: ${magnitudes[i].toFixed(2)}`);
});
