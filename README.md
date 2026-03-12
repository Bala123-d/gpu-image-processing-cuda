# GPU Accelerated Image Processing using CUDA

## Project Overview
This project demonstrates GPU-based image processing using NVIDIA CUDA.

The program converts a color image into a grayscale image using GPU parallel processing.

## Technologies Used
- CUDA
- C++
- NVIDIA GPU

## How It Works
1. Load RGB image
2. Send image data to GPU
3. Run CUDA kernel
4. Convert RGB to grayscale
5. Save output image

## Run Instructions

Compile the program:

nvcc main.cu -o grayscale

Run the program:

./grayscale input.jpg output.jpg

## Results
The GPU processes image pixels in parallel which speeds up image processing.

## Author
Subbu D  
GPU Specialization Capstone Project
