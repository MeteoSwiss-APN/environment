#!/usr/bin/env bash
prgenv=`module list -t 2>&1 | grep 'PrgEnv-'`
if [ -z "${prgenv}" ]; then
    module load PrgEnv-gnu
else
    module swap ${prgenv} PrgEnv-gnu
fi

module load craype-accel-nvidia60
module load CMake

# Boost
export BOOST_ROOT=$SCRATCH/../jenkins/install/boost/boost_1_67_0
export LD_LIBRARY_PATH=${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}

export FC=ftn
# We cannot simply use g++ as cuda host compiler, because we require MPI support
export CUDAHOSTCXX=CC
