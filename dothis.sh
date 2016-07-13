#!/bin/bash -x
set -e

my_gcc=`which gcc`
if [ ! "x$my_gcc" = "x" ] ; then
    rm -rf build-gcc
    mkdir build-gcc
    cd build-gcc
    cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_INSTALL_PREFIX=/usr/local/packages/LLVM-ompt/power8_gcc-4.9.2 -DCMAKE_BUILD_TYPE=Release ..
    make -j
    make install
    cd ..
    rm -rf build-gcc-debug
    mkdir build-gcc-debug
    cd build-gcc-debug
    cmake -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_INSTALL_PREFIX=/usr/local/packages/LLVM-ompt/power8_gcc-4.9.2_debug -DCMAKE_BUILD_TYPE=Debug ..
    make -j
    make install
    cd ..
fi

my_icc=`which icc`
if [ ! "x$my_icc" = "x" ] ; then
    rm -rf build-icpc
    mkdir build-icpc
    cd build-icpc
    cmake -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_INSTALL_PREFIX=. -DCMAKE_BUILD_TYPE=Release ..
    make VERBOSE=1
    make install
    cd ..

    rm -rf build-icpc-debug
    mkdir build-icpc-debug
    cd build-icpc-debug
    cmake -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_INSTALL_PREFIX=. -DCMAKE_BUILD_TYPE=Debug ..
    make VERBOSE=1
    make install
    cd ..

    machine=`arch`
	if [[ -d /usr/linux-k1om-* ]] && [[ $machine = x86_64 ]] ; then
    	rm -rf build-icpc-mic
    	mkdir build-icpc-mic
    	cd build-icpc-mic
    	cmake -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_INSTALL_PREFIX=. -DLIBOMP_ARCH=mic -DCMAKE_BUILD_TYPE=Release ..
    	make VERBOSE=1
    	make install
    	cd ..

    	rm -rf build-icpc-mic-debug
    	mkdir build-icpc-mic-debug
    	cd build-icpc-mic-debug
    	cmake -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DCMAKE_INSTALL_PREFIX=. -DLIBOMP_ARCH=mic -DCMAKE_BUILD_TYPE=Debug ..
    	make VERBOSE=1
    	make install
    	cd ..
	fi
fi

