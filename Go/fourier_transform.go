// Fourier Transform in Go
// This program calculates the Fourier Transform of a sample signal and 
// prints the frequency spectrum.

package main

import (
	"fmt"
	"math"
)

const Fs = 1000
const L = 1000

func main() {
	signal := make([]float64, L)

	// Generate a signal composed of two sinusoids
	for i := 0; i < L; i++ {
		t := float64(i) / Fs
		signal[i] = 0.7*math.Sin(2*math.Pi*50*t) + math.Sin(2*math.Pi*120*t)
	}

	// Compute Fourier Transform
	real := make([]float64, L)
	imag := make([]float64, L)
	for k := 0; k < L; k++ {
		for n := 0; n < L; n++ {
			real[k] += signal[n] * math.Cos(2*math.Pi*float64(k)*float64(n)/L)
			imag[k] -= signal[n] * math.Sin(2*math.Pi*float64(k)*float64(n)/L)
		}
	}

	// Print frequency spectrum
	for k := 0; k < L/2; k++ {
		magnitude := math.Sqrt(real[k]*real[k]+imag[k]*imag[k]) / L
		frequency := float64(Fs*k) / L
		fmt.Printf("Frequency: %.1f Hz, Magnitude: %.2f\n", frequency, magnitude)
	}
}
