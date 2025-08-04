#!/bin/bash

# Name of the Conda environment
ENV_NAME="AMBERTools24"

# Create the conda environment with Python 3.10
echo "Creating conda environment: $ENV_NAME"
conda create -n $ENV_NAME python=3.10 -y

# Activate the environment
echo "Activating conda environment: $ENV_NAME"
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate $ENV_NAME

# Install dependencies via conda
echo "Installing core dependencies via conda..."
conda install conda-forge::ambertools

echo "Installation complete!"
