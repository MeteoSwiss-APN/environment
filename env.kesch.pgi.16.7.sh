#!/usr/bin/env bash
module purge
module load craype-haswell
module load GCC/4.9.3-binutils-2.25
module load PrgEnv-pgi/16.7
module load /users/mlukas/easybuild/kesch/modules/all/cmake/3.12.4

# Add an explicit linker line for GCC 4.9.3 library to provide C++11 support
export LDFLAGS="-L$EBROOTGCC/lib64 ${LDFLAGS}"

export LD_LIBRARY_PATH=${CRAY_LD_LIBRARY_PATH}:${LD_LIBRARY_PATH}

# Boost
export BOOST_ROOT=/project/c14/install/kesch/boost/boost_1_67_0/
export LD_LIBRARY_PATH=${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}

# We have gcc for gnu, cray and pgi environments
export CXX=`which g++`
export CC=`which gcc`
export FC=`which mpif90`
export LINKER_X86_64=$(which ld)
