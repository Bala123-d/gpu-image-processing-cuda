#!/bin/bash

echo "Cleaning old build..."
make clean

echo "Building CUDA program..."
make build

echo "Running program..."
make run
