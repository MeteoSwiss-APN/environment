#!/usr/bin/env bash

module load daint-gpu

prgenv=`module list -t 2>&1 | grep 'PrgEnv-'`
if [ -z "${prgenv}" ]; then
    module load PrgEnv-gnu
else
    module swap ${prgenv} PrgEnv-gnu
fi

module swap gcc/5.3.0
module load craype-accel-nvidia60
module load /users/jenkins/easybuild/daint/haswell/modules/all/CMake/3.12.0

# Boost
export BOOST_ROOT=$SCRATCH/../jenkins/install/boost/boost_1_67_0
export LD_LIBRARY_PATH=${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}

export CXX=CC
export CC=cc
export FC=ftn
# We cannot simply use g++ as cuda host compiler, because we require MPI support
export CUDAHOSTCXX=CC
