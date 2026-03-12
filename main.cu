#include <stdio.h>
#include <cuda_runtime.h>

// CUDA kernel to convert RGB to grayscale
__global__ void rgbToGrayscale(unsigned char *input, unsigned char *output, int width, int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    int idx = y * width + x;

    if (x < width && y < height)
    {
        int rgbOffset = idx * 3;

        unsigned char r = input[rgbOffset];
        unsigned char g = input[rgbOffset + 1];
        unsigned char b = input[rgbOffset + 2];

        output[idx] = (unsigned char)(0.299f * r + 0.587f * g + 0.114f * b);
    }
}

int main()
{
    printf("GPU Accelerated Image Processing using CUDA\n");
    printf("Converting RGB image to Grayscale using GPU threads...\n");

    int width = 1024;
    int height = 1024;
    int imageSize = width * height * 3;
    int graySize = width * height;

    unsigned char *h_input = (unsigned char*)malloc(imageSize);
    unsigned char *h_output = (unsigned char*)malloc(graySize);

    for(int i=0;i<imageSize;i++)
        h_input[i] = rand() % 255;

    unsigned char *d_input, *d_output;

    cudaMalloc((void**)&d_input, imageSize);
    cudaMalloc((void**)&d_output, graySize);

    cudaMemcpy(d_input, h_input, imageSize, cudaMemcpyHostToDevice);

    dim3 block(16,16);
    dim3 grid((width+15)/16,(height+15)/16);

    rgbToGrayscale<<<grid,block>>>(d_input,d_output,width,height);

    cudaMemcpy(h_output,d_output,graySize,cudaMemcpyDeviceToHost);

    printf("Image processing completed on GPU.\n");

    cudaFree(d_input);
    cudaFree(d_output);
    free(h_input);
    free(h_output);

    return 0;
}
