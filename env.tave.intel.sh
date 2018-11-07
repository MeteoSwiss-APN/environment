#!/usr/bin/env bash
prgenv=`module list -t 2>&1 | grep 'PrgEnv-'`
if [ -z "${prgenv}" ]; then
    module load PrgEnv-intel
else
    module swap ${prgenv} PrgEnv-intel
fi
module swap intel intel/18.0.2.199
module load gcc # for recent STL
module load cray-mpich

module load /users/jenkins/easybuild/tave/modules/all/CMake/3.12.0

# Boost
export BOOST_ROOT=/scratch/snx2000/jenkins/install/boost/boost_1_67_0
export LD_LIBRARY_PATH=${BOOST_ROOT}/lib:${LD_LIBRARY_PATH}

export FC=ftn
export CC=cc
export CXX=CC

