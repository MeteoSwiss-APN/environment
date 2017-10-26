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
export BOOST_ROOT=/project/c14/install/daint/boost/boost_1_64_0/
export LD_LIBRARY_PATH=${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}

export CXX=`which g++`
export CC=`which gcc`
export FC=ftn
