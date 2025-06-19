#!/bin/bash

# Name of the Conda environment
ENV_NAME="mlcolvar_env"

# Create the conda environment with Python 3.10
echo "Creating conda environment: $ENV_NAME"
conda create -n $ENV_NAME python=3.10 -y

# Activate the environment
echo "Activating conda environment: $ENV_NAME"
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate $ENV_NAME

# Install dependencies via conda
echo "Installing core dependencies via conda..."
conda install -c conda-forge \
    pytorch \
    pytorch-lightning \
    numpy \
    pandas \
    matplotlib \
    scikit-learn \
    tqdm -y

# Install mlcolvar via pip
echo "Installing mlcolvar via pip..."
pip install mlcolvar

# Test the installation
echo "Testing mlcolvar installation..."
python -c 'import mlcolvar; from mlcolvar.utils.io import load_dataframe; print("mlcolvar works!")'

echo "Installation complete!"
