#!/bin/bash

#module purge
#module use /projects/community/modulefiles
##module load gcc/10.3.0-pgarias
##module load gcc/11.2/openmpi/4.1.3-kholodvl
##module load gcc/10.2.0-bz186
##module load gcc/10.2.0/openmpi/4.0.5-bz186
##module load gcc/11.2/openmpi/4.1.6-ez82
##module load cmake/3.24.3-sw1088
##module load cuda/12.1.0
#module purge
#module use /projects/community/modulefiles
#module load gcc/10.2.0/openmpi/4.0.5-bz186
#module load cmake/3.19.5-bz186
#module load cuda/11.7.1

module list
gcc --version
g++ --version

AMBERTOOLS="AmberTools24.tar.bz2"
AMBER_VERSION="Amber24.tar.bz2"
current_dir=`pwd`
rm -rf amber24 amber24_src 

##CUDA_HOME="/usr/local/cuda-11.8"
#
tar xvjf ${AMBERTOOLS} # (Extracts into an “amber24_src” directory.)#
tar xvjf ${AMBER_VERSION} # (Only if you have licensed Amber 24!)#
##
####### Install serial pmemd version
cd amber24_src/build
./run_cmake
make install
#current_dir=`pwd`
#source ${current_dir}/amber24/amber.sh
#cd $AMBERHOME
#make test.serial
######

####### Install parallel pmemd.MPI version
cd ${current_dir}/amber24_src/build
echo "y" | ./clean_build
sed -i 's/-DMPI=FALSE/-DMPI=TRUE/' run_cmake 
./run_cmake
make install
##source ${current_dir}/amber24/amber.sh
##cd $AMBERHOME
##export DO_PARALLEL="mpirun -np 4"
##make test.parallel
#
######### Install serial pmemd.cuda version
cd ${current_dir}/amber24_src/build
echo "y" | ./clean_build
sed -i 's/-DMPI=TRUE/-DMPI=FALSE/g' run_cmake
sed -i 's/-DCUDA=FALSE/-DCUDA=TRUE/g' run_cmake
###sed -i "s|-DCUDA=TRUE -DINSTALL_TESTS=TRUE|-DCUDA_TOOLKIT_ROOT_DIR=\"${CUDA_HOME}\" -DCUDA=TRUE -DINSTALL_TESTS=TRUE|g" run_cmake
./run_cmake
make install
###source ${current_dir}/amber24/amber.sh
###cd $AMBERHOME
###cd test/
###export CUDA_VISIBLE_DEVICES=0
###./test_amber_cuda_serial.sh
########
#
####### Install parallel pmemd.cuda.MPI version
cd ${current_dir}/amber24_src/build
echo "y" | ./clean_build
sed -i 's/-DMPI=FALSE/-DMPI=TRUE/g' run_cmake
./run_cmake
make install
###source ${current_dir}/amber24/amber.sh
###cd $AMBERHOME
###cd test/
###export CUDA_VISIBLE_DEVICES=0
###./test_amber_cuda_parallel.sh
########
