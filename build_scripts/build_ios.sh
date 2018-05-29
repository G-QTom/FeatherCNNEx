#!/bin/bash

echo $(xcrun --sdk iphoneos --show-sdk-path)
mkdir -p build-ios
pushd build-ios
mkdir -p arm64 
pushd arm64
cmake -DCMAKE_TOOLCHAIN_FILE=../../build_scripts/ios.toolchain.cmake -DIOS_SDK_PATH=$(xcrun --sdk iphoneos --show-sdk-path) -DIOS_ARCH=arm64 -DFEATHER_ARM=1 ../..
make VERBOSE=1
make install
popd
mkdir -p armv7s
pushd armv7s
cmake -DCMAKE_TOOLCHAIN_FILE=../../build_scripts/ios.toolchain.cmake -DIOS_SDK_PATH=$(xcrun --sdk iphoneos --show-sdk-path) -DIOS_ARCH=armv7s -DFEATHER_ARM=1 ../..
make VERBOSE=1
make install
popd
mkdir -p simulator
pushd simulator
cmake -DCMAKE_TOOLCHAIN_FILE=../../build_scripts/ios.toolchain.cmake -DIOS_SDK_PATH=$(xcrun --sdk iphonesimulator --show-sdk-path) -DIOS_ARCH=x86_64 ../..
make VERBOSE=1
make install
popd
popd
bash ./build_scripts/pack_ios_framework.sh
