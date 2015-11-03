#!/bin/bash -e

cd runtime
rm -rf build
mkdir build
cd build

cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_INSTALL_PREFIX=`pwd`/../../install ..

make
make install
cd ../..
