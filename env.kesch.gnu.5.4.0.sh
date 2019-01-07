#!/usr/bin/env bash
module purge
module load craype-network-infiniband
module load craype-haswell
module load PrgEnv-gnu/17.02
module load craype-accel-nvidia35
module load cray-libsci
module load cudatoolkit/8.0.61
module unload mvapich2
module unload gmvapich2
module load mvapich2gdr_gnu/2.2_cuda_8.0
module load gcc/5.4.0-2.26
module load /users/mlukas/easybuild/kesch/modules/all/cmake/3.12.4
module load netcdf-fortran/4.4.4-gmvolf-17.02
module load hdf5/1.8.18-gmvolf-17.02

export LD_LIBRARY_PATH=${CRAY_LD_LIBRARY_PATH}:${LD_LIBRARY_PATH}

# Boost
export BOOST_ROOT=/project/c14/install/kesch/boost/boost_1_67_0/
export LD_LIBRARY_PATH=${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}

# Add an explicit linker line for GCC to provide C++11 support
export LDFLAGS="-L$EBROOTGCC/lib64 ${LDFLAGS}"

# We have gcc for gnu, cray and pgi environments
export CXX=`which g++`
export CC=`which gcc`
export FC=`which mpif90`
export LINKER_X86_64=$(which ld)
