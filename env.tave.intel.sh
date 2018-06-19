#!/usr/bin/env bash
prgenv=`module list -t 2>&1 | grep 'PrgEnv-'`
if [ -z "${prgenv}" ]; then
    module load PrgEnv-intel
else
    module swap ${prgenv} PrgEnv-intel
fi
module swap intel intel/18.0.2.199
module load gcc # for recent STL

module load CMake

# Boost
export BOOST_ROOT=/scratch/snx2000/jenkins/install/boost/boost_1_64_0
export LD_LIBRARY_PATH=${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}

# Override C++ and C compiler
export CXX=`which icpc`
export CC=`which icc`
export FC=`which ifort`

# Override flags
flags="-xmic-avx512"
export CXXFLAGS="$flags"
export CFLAGS="$flags"
export FFLAGS="$flags"
