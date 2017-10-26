#!/usr/bin/env bash

module purge
module load craype-haswell
module load craype-network-infiniband
module load mvapich2gdr_gnu/2.1_cuda_7.0
module load GCC/4.9.3-binutils-2.25
module load cray-libsci_acc/3.3.0
module load CMake/3.8.1
module use /apps/common/UES/RHAT6/easybuild/modules/all
module use /apps/escha/UES/RH6.7/sandbox-scorep/modules/all
module load Score-P/3.1-gmvapich2-15.11_cuda_7.0_gdr

export LD_LIBRARY_PATH=${CRAY_LD_LIBRARY_PATH}:${LD_LIBRARY_PATH}

# Boost
export BOOST_ROOT=/project/c14/install/kesch/boost/boost_1_64_0/
export LD_LIBRARY_PATH=${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}

export CC=`which gcc`
export CXX=`which g++`
export FC=`which gfortran`

