build:
	nvcc main.cu -o gpu_image

run:
	./gpu_image

clean:
	rm -f gpu_image
