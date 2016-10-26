#!/bin/bash -x
set -e

do_build()
{
    ccompiler=$1
	cxxcompiler=$2
	buildtype=$3
	libomparch=$4
	builddir=build-${ccompiler}-${buildtype}
    rm -rf ${builddir}
    mkdir ${builddir}
    cd ${builddir}
    cmake -DCMAKE_C_COMPILER=${ccompiler} -DCMAKE_CXX_COMPILER=${cxxcompiler} -DCMAKE_INSTALL_PREFIX=.  ${libomparch} -DCMAKE_BUILD_TYPE=${buildtype} ..
    make -j32
    make install
    cd ..
}

do_gcc()
{
	my_gcc=`which gcc`
	if [ ! "x$my_gcc" = "x" ] ; then
		do_build gcc g++ Release ""
		do_build gcc g++ Debug ""
	fi
}

do_icc()
{
	my_icc=`which icc`
	if [ ! "x$my_icc" = "x" ] ; then
		do_build icc icpc Release ""
		do_build icc icpc Debug ""
	fi
}

do_mic()
{
	my_icc=`which icc`
	if [ ! "x$my_icc" = "x" ] ; then
    	machine=`arch`
		if [ -d /usr/linux-k1om-* ] && [ "$machine" = "x86_64" ] ; then
			do_build icc icpc Release "-DLIBOMP_ARCH=mic"
			do_build icc icpc Debug "-DLIBOMP_ARCH=mic"
		fi
	fi
}

do_gcc
#do_icc
#do_mic
