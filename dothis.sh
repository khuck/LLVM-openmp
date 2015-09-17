#!/bin/bash -e

cd runtime
mkdir build
cd build

cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_INSTALL_PREFIX=. ..

make
make install
cd ../..
