#!/usr/bin/env bash
module purge
module load craype-haswell
module load craype-accel-nvidia35
module load craype-network-infiniband
module use /apps/escha/UES/RH7.3_PE17.02/sandbox-hdf5-17.06-2/modules/all
module load netCDF-Fortran/4.4.4-CrayCCE-17.06
module switch mvapich2_cce/2.2rc1.0.3_cuda80 mvapich2gdr_gnu/2.2_cuda_8.0
module load gcc/5.4.0-2.26
module load cmake/3.9.1

export LD_LIBRARY_PATH=${CRAY_LD_LIBRARY_PATH}:${LD_LIBRARY_PATH}

# Boost
export BOOST_ROOT=/project/c14/install/kesch-test/boost/boost_1_64_0/
export LD_LIBRARY_PATH=${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}

# Add an explicit linker line for GCC to provide C++11 support
export LDFLAGS="-L$EBROOTGCC/lib64 ${LDFLAGS}"

# We have gcc for gnu, cray and pgi environments
export CXX=`which g++`
export CC=`which gcc`
export FC="ftn -D__CRAY_FORTRAN__"
export LINKER_X86_64=$(which ld)
