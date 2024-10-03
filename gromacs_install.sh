#!/bin/bash
# Set GROMACS version
gmx_version="gromacs-2024.2"
wget https://ftp.gromacs.org/gromacs/${gmx_version}.tar.gz

# Purge loaded modules
module purge

# Add community modulefiles path
module use /projects/community/modulefiles

# Load necessary modules
# module load gcc/10.3.0-pgarias
# module load gcc/11.2/openmpi/4.1.3-kholodvl
# module load gcc/11.2/openmpi/4.1.6-ez82
module load gcc/10.2.0-bz186
module load gcc/10.2.0/openmpi/4.0.5-bz186
module load cmake/3.24.3-sw1088
module load cuda/12.1.0

# List loaded modules and check compiler versions
module list
gcc --version
g++ --version

# Remove any existing directory and extract the tarball
rm -rf ${gmx_version}
tar xfz ${gmx_version}.tar.gz

# Change to the GROMACS directory
cd ${gmx_version}

# Create and enter the build directory
mkdir build
cd build

# Update PATH to include custom GCC path
#export PATH=/projects/community/gcc/10.3.0/pgarias/bin:$PATH

# Run CMake with required options
cmake .. \
  -DGMX_BUILD_OWN_FFTW=ON \
  -DREGRESSIONTEST_DOWNLOAD=ON \
  -DGMX_GPU=CUDA \
  -DCMAKE_INSTALL_PREFIX=/home/sp2546/softwares/${gmx_version}_cuda/

# Build, check, and install GROMACS
make
make check
make install

# Source the GROMACS environment
source /home/sp2546/softwares/${gmx_version}_cuda/bin/GMXRC
