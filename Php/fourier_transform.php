<?php
// Fourier Transform in PHP
// This script calculates the Fourier Transform of a sample signal and 
// prints the frequency spectrum.

define('PI', 3.14159265358979323846);
$Fs = 1000;  // Sampling frequency
$L = 1000;   // Length of signal

// Generate a signal composed of two sinusoids
$signal = [];
for ($i = 0; $i < $L; $i++) {
    $t = $i / $Fs;
    $signal[$i] = 0.7 * sin(2 * PI * 50 * $t) + sin(2 * PI * 120 * $t);
}

// Compute the Fourier Transform using a simple DFT
$real = array_fill(0, $L, 0.0);
$imag = array_fill(0, $L, 0.0);
for ($k = 0; $k < $L; $k++) {
    for ($n = 0; $n < $L; $n++) {
        $real[$k] += $signal[$n] * cos(2 * PI * $k * $n / $L);
        $imag[$k] -= $signal[$n] * sin(2 * PI * $k * $n / $L);
    }
}

// Print frequency spectrum (magnitude only)
for ($k = 0; $k < $L / 2; $k++) {
    $magnitude = sqrt($real[$k] * $real[$k] + $imag[$k] * $imag[$k]) / $L;
    $frequency = ($Fs * $k) / $L;
    printf("Frequency: %.1f Hz, Magnitude: %.2f\n", $frequency, $magnitude);
}
?>
