#!/bin/bash -e

rm -rf build-gcc
mkdir build-gcc
cd build-gcc
cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_INSTALL_PREFIX=. ..
make VERBOSE=1
make install
cd ..

rm -rf build-icpc
mkdir build-icpc
cd build-icpc
cmake -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_INSTALL_PREFIX=. ..
make VERBOSE=1
make install
cd ..

