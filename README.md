# Fourier Transform Project

## Overview
This project implements the **Fourier Transform** algorithm to decompose a signal or function into its frequency components. Fourier Transforms are widely used in **signal processing**, **image processing**, **audio analysis**, and **data compression**. The project demonstrates the mathematical principles of Fourier Transforms and how they can be applied to real-world data.

## Languages & Files
- **Python (`fourier_transform.py`)**: Implements Fourier Transform using **NumPy** and **Matplotlib** for visualization of frequency components.
- **MATLAB (`fourier_transform.m`)**: MATLAB script implementing both **Discrete Fourier Transform (DFT)** and **Fast Fourier Transform (FFT)**.
- **R (`fourier_transform.R`)**: Uses **FFT** function to process time-series data and plots the frequency spectrum.

## Features
- **Mathematical Decomposition**: Breaks down signals into constituent sinusoids.
- **Visualization**: Plots both time-domain signals and their corresponding frequency-domain representations.
- **Multiple Implementations**: Available in **Python**, **MATLAB**, and **R** for broader use cases.

## Installation and Setup
To run the program, make sure you have the appropriate software installed.

### Prerequisites
- **Python**: Install **NumPy** and **Matplotlib** for visualization.
- **MATLAB**: MATLAB environment with built-in FFT functions.
- **R**: Required libraries for signal processing (e.g., `fft` in base R).

### Running the Algorithm
1. **Python**:
   ```bash
   cd Python
   python fourier_transform.py
    ```
2. MATLAB: Run fourier_transform.m in the MATLAB environment.

R:
   ```bash
   Rscript fourier_transform.R
   ```


### Usage
Each script performs the Fourier Transform on a given time-domain signal. The signal is decomposed into its frequency components, and the results are visualized in both time and frequency domains.

### Example Output
- Time-domain Signal: The input signal over time.
- Frequency-domain Representation: Frequency components (amplitude vs frequency).

---


## Contributing
Contributions are welcome! Feel free to fork this repository and submit pull requests for improvements or additional features.

## License
This project is licensed under the MIT License. See the LICENSE file for more information.

---

Happy Transforming! 🎶
