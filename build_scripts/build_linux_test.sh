#!/bin/bash

aarch64-linux-gnu-g++ ./test/test.cpp -I./build-linux-aarch64/install/feather/include/ -L ./build-linux-aarch64/install/feather/lib/ -lfeather -fopenmp -O3 -o feather_benchmark
