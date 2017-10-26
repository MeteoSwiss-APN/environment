#!/usr/bin/env bash
module purge
module load craype-haswell
module load craype-accel-nvidia35
module load PrgEnv-cray/15.10_cuda_7.0
module load cmake/3.1.3
module swap cce/8.4.4
module unload mvapich2_cce
module load cray-libsci_acc/3.3.0
module load mvapich2gdr_gnu/2.1_cuda_7.0
module load cray-netcdf/4.3.2
module load cray-hdf5/1.8.13
module load GCC/4.9.3-binutils-2.25

export LINKER_X86_64=$(which ld)

export LD_LIBRARY_PATH=${CRAY_LD_LIBRARY_PATH}:${LD_LIBRARY_PATH}

# Boost
export BOOST_ROOT=/project/c14/install/kesch/boost/boost_1_64_0/
export LD_LIBRARY_PATH=${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}

# Add an explicit linker line for GCC 4.9.3 library to provide C++11 support
export LDFLAGS="-L$EBROOTGCC/lib64 ${LDFLAGS}"

# Override C++ and C compiler
export CXX=`which g++`
export CC=`which gcc`
export FC=`which ftn`
